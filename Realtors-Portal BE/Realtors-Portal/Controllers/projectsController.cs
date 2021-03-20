using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Realtors_Portal.Data;
using Realtors_Portal.Models;

namespace Realtors_Portal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class projectsController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        public projectsController(Realtors_PortalContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this._hostEnvironment = hostEnvironment;
        }

        // GET: api/projects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<home>>> Getproject()
        {
            return await _context.project.
                Select(x => new home()
                {
                    
                    ID = x.ID,
                    CategoryID = x.CategoryID,
                    SellerID = x.SellerID,
                    Sqft = x.Sqft,
                    description = x.description,
                    title = x.title,
                    ProjectName = x.ProjectName,
                    Location = x.Location,
                    Country = x.Country,
                    City = x.City,
                    District = x.District,
                    Are = x.Are,
                    Price = x.Price,
                    ImageBannerName = x.ImageBannerName,
                    ImageBannerSrc = String.Format("{0}://{1}{2}/Images/{3}", Request.Scheme, Request.Host, Request.PathBase, x.ImageBannerSrc),
                    levelActive = x.levelActive
                }).ToListAsync();
        }

        // GET: api/projects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<home>> Getproject(int id)
        {
            var project = await _context.project.FindAsync(id);

            if (project == null)
            {
                return NotFound();
            }

            return project;
        }

        // PUT: api/projects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Putproject(int id, [FromForm] home project)
        {
            if (id != project.ID)
            {
                return BadRequest();
            }

            //if (project.ImageFile != null)
            //{
            //    DeleteImage(project.ImageBannerName);
            //    project.ImageBannerName = await SaveImage(project.ImageFile);
            //}
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
        public async Task<ActionResult<home>> Postproject([FromForm] home project)
        {
            //project.ImageBannerName = await SaveImage(project.ImageFile);
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
            if (project.ImageFile != null)
            {
                DeleteImage(project.ImageBannerName);
            }
            _context.project.Remove(project);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool projectExists(int id)
        {
            return _context.project.Any(e => e.ID == id);
        }

        //[NonAction]
        //public async Task<string> SaveImage(IFormFile imageFile)
        //{
        //    string imageName = new string(Path.GetFileNameWithoutExtension(imageFile.FileName).Take(10).ToArray()).Replace(' ', '-');
        //    imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(imageFile.FileName);
        //    var imagePath = Path.Combine(_hostEnvironment.ContentRootPath, "Images", imageName);
        //    using (var fileStream = new FileStream(imagePath, FileMode.Create))
        //    {
        //        await imageFile.CopyToAsync(fileStream);
        //    }
        //    return imageName;
        //}
        [NonAction]
        public void DeleteImage(string imageName)
        {
            var imagePath = Path.Combine(_hostEnvironment.ContentRootPath, "Images", imageName);
            if (System.IO.File.Exists(imagePath))
                System.IO.File.Delete(imagePath);
        }

        //SaveFile
        [Route("savefile")]
        [HttpPost]
        public JsonResult SaveFile()
        {
            try
            {
                var httpRequest = Request.Form;
                var postedFile = httpRequest.Files[0];
                string filename = postedFile.FileName;
                var physicalPath = _hostEnvironment.ContentRootPath + "/Images/" + filename + DateTime.Now.ToString("yymmssfff");
                using (var stream = new FileStream(physicalPath, FileMode.Create))
                {
                    postedFile.CopyTo(stream);
                }
                return new JsonResult(filename);
            }

            catch (Exception)
            {
                return new JsonResult("oh no ");
            }
        }
    }
}
