using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Realtors_Portal.Data;
using Realtors_Portal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class productsController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly IConfiguration _configuration;

        public productsController(Realtors_PortalContext context, IConfiguration configuration, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this._hostEnvironment = hostEnvironment;
            _configuration = configuration;
        }
        // GET: api/projects
        [HttpGet]
        
        public async Task<ActionResult<IEnumerable<product>>> Getproject()
        {
            return await _context.project.ToListAsync();
        }

        // GET: api/projects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<product>> Getproject(int id)
        {
            var project = await _context.project.FindAsync(id);

            if (project == null)
            {
                return NotFound();
            }

            return project;
        }

        //Get by CountryID  (Admin)
        [Route("getProjectByFK")]
        [HttpGet]
        public JsonResult Get()
        {
            string query = @"SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price, project.UserID,
  [User].Name, [User].Avatar, [User].Email, [User].Phone, [User].User_type, 


  project.Location, project.Country, project.City, project.District, project.CategoryID, project.Are,
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName
  FROM project
INNER JOIN [User] ON [User].ID = project.UserID
  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("RealtorsConnect");
            SqlDataReader myRender;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myRender = myCommand.ExecuteReader();
                    table.Load(myRender);
                    myRender.Close(); myCon.Close();
                }
            }
            return new JsonResult(table);
        }


        [Route("getCountProductByUserID/user/{id}")]
        [HttpGet]
        public JsonResult getProductByUserID(int id)
        {
            string query = @"SELECT count(project.UserID) as 'count' FROM project where project.UserID = " + id;

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("RealtorsConnect");
            SqlDataReader myRender;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myRender = myCommand.ExecuteReader();
                    table.Load(myRender);
                    myRender.Close(); myCon.Close();
                }
            }
            return new JsonResult(table);
        }


        // PUT: api/projects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Putproject(int id,product project)
        {
            if (id != project.ID)
            {
                return BadRequest();
            }

            _context.Entry(project).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!projectExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/projects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<product>> Postproject(product project)
        {
            project.ImageBannerName = project.ImageBannerName;
            _context.project.Add(project);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Getproject", new { id = project.ID }, project);
        }

        // DELETE: api/projects/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Deleteproject(int id)
        {
            var project = await _context.project.FindAsync(id);
            if (project == null)
            {
                return NotFound();
            }
            _context.project.Remove(project);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool projectExists(int id)
        {
            return _context.project.Any(e => e.ID == id);
        }

        //SaveFile Image
        [Route("savefile")]
        [HttpPost]
        public JsonResult SaveFile()
        {
            try
            {
                var httpRequest = Request.Form;
                var postedFile = httpRequest.Files[0];
                string filename = postedFile.FileName;
                var physicalPath = _hostEnvironment.ContentRootPath + "/Images/Products/Banner/" + filename;
                using (var stream = new FileStream(physicalPath, FileMode.Create))
                {
                    postedFile.CopyTo(stream);
                }
                return new JsonResult(filename);
            }

            catch (Exception)
            {
                return new JsonResult("Save image");
            }
        }
    }
}
