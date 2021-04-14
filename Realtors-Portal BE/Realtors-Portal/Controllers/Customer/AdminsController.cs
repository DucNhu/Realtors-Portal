using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Realtors_Portal.Configuration;
using Realtors_Portal.Data;
using Realtors_Portal.Models.Customer;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace Realtors_Portal.Controllers
{
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]

    [Route("api/[controller]")]
    [ApiController]
    public class AdminsController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly JwtConfig _jwtConfig;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly IConfiguration _configuration;

        public AdminsController(Realtors_PortalContext context, IConfiguration configuration, UserManager<IdentityUser> userManager,
            IOptionsMonitor<JwtConfig> optionsMonitor,
            IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _userManager = userManager;
            _jwtConfig = optionsMonitor.CurrentValue;
            this._hostEnvironment = hostEnvironment;
            _configuration = configuration;

        }

        //--count acc active Not Admin
        [Route("getDataDashBoard-accActiveNotAd")]
        [HttpGet]
        public JsonResult getDataDashBoardAccActiveNotAd()
        {

            string query = @"
select count(*) as accActiveNotAd from [User] where Active = 1 and not User_type = 'admin'
";

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

        //--count acc agent
        [Route("getDataDashBoard-accAgentActive")]
        [HttpGet]
        public JsonResult getDataDashBoardAccagentActive()
        {

            string query = @"select count(User_type) as accAgentActive from [User] where User_type = 'agent'";

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

        //--count seller
        [Route("getDataDashBoard-accSellerActive")]
        [HttpGet]
        public JsonResult getDataDashBoardAccSellerActive()
        {

            string query = @"select count(User_type) as accSellerActive from [User] where User_type = 'seller'";

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

        //--count product

        [Route("getDataDashBoard-countProductActive")]
        [HttpGet]
        public JsonResult getDataDashBoardCountProductActive()
        {

            string query = @"select count(*) as countProductActive from project where LevelActive > 0";

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

        //--count package đã mua
        [Route("getDataDashBoard-packagePurchased")]
        [HttpGet]
        public JsonResult getDataDashBoardPackagePurchased()
        {

            string query = @"select count(*) as PackagePurchased from PackagePurchased";

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

        @"select DISTINCT count(project.CategoryID) as 'product count',  Category.CategoryName as 'category count' from project inner join Category on Category.CategoryID = project.CategoryID

group by Category.CategoryName"



        // Update LevelActive product
        [Route("LevelActiveProduct/productID/{productID}/LevelActive/{LevelActive}")]
        [HttpPut]
        public JsonResult LevelActiveProduct(int productID, int LevelActive)
        {
            string query = @"update project set LevelActive = " + LevelActive + " from project where project.ID = " + productID;

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


        
    }
}
