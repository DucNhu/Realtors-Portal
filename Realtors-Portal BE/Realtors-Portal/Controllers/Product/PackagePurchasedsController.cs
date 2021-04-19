using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Realtors_Portal.Data;
using Realtors_Portal.Models.Customer;

namespace Realtors_Portal.Controllers.Product
{
    [Route("api/[controller]")]
    [ApiController]
    public class PackagePurchasedsController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly IConfiguration _configuration;

        public PackagePurchasedsController(Realtors_PortalContext context, IConfiguration configuration, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this._hostEnvironment = hostEnvironment;
            _configuration = configuration;
        }

        // GET: api/PackagePurchaseds
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PackagePurchased>>> GetPackagePurchased()
        {
            return await _context.PackagePurchased.ToListAsync();
        }

        // GET: api/PackagePurchaseds/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PackagePurchased>> GetPackagePurchased(int id)
        {
            var packagePurchased = await _context.PackagePurchased.FindAsync(id);

            if (packagePurchased == null)
            {
                return NotFound();
            }

            return packagePurchased;
        }



        [Route("getPackageByUserID/user/{id}")]
        [HttpGet]
        public JsonResult getPackageByUserID(int id)
        {
            string query = @"select * from PackagePurchased  inner join  package on PackagePurchased.PackageID = Package.PackageID  where USERID =" + id;

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

        // Get Max year => Max Month => Max day of package by User sold
        [Route("DayMaxOfMonthMaxOfYearMax/user/{id}")]
        [HttpGet]
        public JsonResult DayMaxOfMonthMaxOfYearMax(int id)
        {
            string query = @"
select 
max(YEAR(EndDate)) as YearMax, 
max(MONTH(EndDate)) as MonthMaxOfYearMax, 
max(DAY(EndDate)) as DayMaxOfMonthMaxOfYearMax
from PackagePurchased where UserID = " + id + @" and 
MONTH(EndDate) = (select max(MONTH(EndDate)) 
from PackagePurchased where UserID = " + id + @" and 
YEAR(EndDate) = (select max(YEAR(EndDate)) 
from PackagePurchased where UserID = " + id + @"))";

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
   

        // PUT: api/PackagePurchaseds/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPackagePurchased(int id, PackagePurchased packagePurchased)
        {
            if (id != packagePurchased.ppID)
            {
                return BadRequest();
            }

            _context.Entry(packagePurchased).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PackagePurchasedExists(id))
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

        [Route("PostPackagePurchased/user/{id}/{duration}")]
        [HttpPost]
        public JsonResult PostPackagePurchased(int id, int duration)
        {
            string query = @"
insert into PackagePurchased values
(1, " + id + @", GETDATE(), GETDATE() + " + duration + @")";

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
        // DELETE: api/PackagePurchaseds/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePackagePurchased(int id)
        {
            var packagePurchased = await _context.PackagePurchased.FindAsync(id);
            if (packagePurchased == null)
            {
                return NotFound();
            }

            _context.PackagePurchased.Remove(packagePurchased);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PackagePurchasedExists(int id)
        {
            return _context.PackagePurchased.Any(e => e.ppID == id);
        }
    }
}
