using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Realtors_Portal.Data;
using Realtors_Portal.Models.Address;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Controllers.address
{
    [Route("api/[controller]")]
    [ApiController]
    public class AreController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly IConfiguration _configuration;

        public AreController(Realtors_PortalContext context, IConfiguration configuration, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this._hostEnvironment = hostEnvironment;
            _configuration = configuration;
        }

        // GET: api/Are
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Are>>> GetAre()
        {
            return await _context.Are.ToListAsync();
        }

        // GET: api/Are/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Are>> GetAre(int id)
        {
            var are = await _context.Are.FindAsync(id);

            if (are == null)
            {
                return NotFound();
            }

            return are;
        }


        //Get by DítrictID
        [Route("getAreByDistrictID")]
        [HttpGet]
        public JsonResult Get()
        {
            string query = @"SELECT 
                            Are.AreName, 
                            Are.Active, 
                            Are.Avatar, 
                            Are.AreID, 
                            Are.AreLetter, 
                            Are.DistrictID, 
                            District.DistrictName 
                            FROM Are INNER JOIN District ON District.DistrictID = Are.DistrictID";

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



        // PUT: api/Are/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAre(int id, Are are)
        {
            if (id != are.AreID)
            {
                return BadRequest();
            }

            _context.Entry(are).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AreExists(id))
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

        // POST: api/Are
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Are>> PostAre(Are are)
        {
            _context.Are.Add(are);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAre", new { id = are.AreID }, are);
        }

        // DELETE: api/Are/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAre(int id)
        {
            var are = await _context.Are.FindAsync(id);
            if (are == null)
            {
                return NotFound();
            }

            _context.Are.Remove(are);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AreExists(int id)
        {
            return _context.Are.Any(e => e.AreID == id);
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
                var physicalPath = _hostEnvironment.ContentRootPath + "/Images/Address/Ares/" + filename;
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
