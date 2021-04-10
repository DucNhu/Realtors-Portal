using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Realtors_Portal.Data;
using Realtors_Portal.Models;

namespace Realtors_Portal.Controllers.Product
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageLibsController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly IConfiguration _configuration;

        public ImageLibsController(Realtors_PortalContext context, IConfiguration configuration, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this._hostEnvironment = hostEnvironment;
            _configuration = configuration;
        }
        // GET: api/ImageLibs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ImageLib>>> GetImageLib()
        {
            return await _context.ImageLib.ToListAsync();
        }

        // GET: api/ImageLibs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ImageLib>> GetImageLib(int id)
        {
            var imageLib = await _context.ImageLib.FindAsync(id);

            if (imageLib == null)
            {
                return NotFound();
            }

            return imageLib;
        }

        // PUT: api/ImageLibs/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutImageLib(int id, ImageLib imageLib)
        {
            if (id != imageLib.ImageLibID)
            {
                return BadRequest();
            }

            _context.Entry(imageLib).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ImageLibExists(id))
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



        //Get by ProductID
        [Route("getImageLibByProductID")]
        [HttpGet]
        public JsonResult Get()
        {
            string query = @"SELECT ImageLib.ImageLibID, Name, ProductID 
                    FROM ImageLib
                    INNER JOIN project ON project.ID = ImageLib.ProductID ";

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



        // POST: api/ImageLibs
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ImageLib>> PostImageLib(ImageLib imageLib)
        {
            _context.ImageLib.Add(imageLib);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetImageLib", new { id = imageLib.ImageLibID }, imageLib);
        }

        // DELETE: api/ImageLibs/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteImageLib(int id)
        {
            var imageLib = await _context.ImageLib.FindAsync(id);
            if (imageLib == null)
            {
                return NotFound();
            }

            _context.ImageLib.Remove(imageLib);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ImageLibExists(int id)
        {
            return _context.ImageLib.Any(e => e.ImageLibID == id);
        }

        //SaveFile Image
        [Route("savefile")]
        [HttpPost]
        public JsonResult SaveFile()
        {
            try
            {
                var httpRequest = Request.Form;
                
                for(int i = 0; i < 100; i++) {
                    var postedFile = httpRequest.Files[i];
                    string filename = postedFile.FileName;
                    var physicalPath = _hostEnvironment.ContentRootPath + "/Images/Products/ImageLibs/" + filename;
                    using (var stream = new FileStream(physicalPath, FileMode.Create))
                    {
                        postedFile.CopyTo(stream);
                    }
                }

                return new JsonResult("Save image");
            }

            catch (Exception)
            {
                return new JsonResult("Save image");
            }
        }
    }
}
