using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Realtors_Portal.Models;
using System.Data;

namespace Realtors_Portal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SellersController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _env;

        public SellersController(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _env = env;
        }

        // GET: api/Sellers
        [HttpGet]
        public JsonResult Get()
        {
            string query = "select * from seller";
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
                    myRender.Close();
                    myCon.Close();
                }
            }
            return new JsonResult(table);
        }

        // GET: api/Sellers/5
        [HttpGet("{id}")]
        public JsonResult Get(int id)
        {
            string query = "select * from seller where SellID = " + id;
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
                    myRender.Close();
                    myCon.Close();
                }
            }
            return new JsonResult(table);
        }

        // POST: api/Sellers
        [HttpPost]
        public JsonResult post(Seller seller)
        {
            string query = "insert into seller values ('"
               + seller.SellName + "', '"
               + seller.SellAddress + "', '"
               + seller.SellPhone + "', '"
               + seller.SellEmail + "', '"
               + seller.SellerActive + "', '"
               + seller.SellAvatar + "', '"
               + seller.SellDateCreate + "', "
               + seller.PackageID + ", "
               + seller.AgentID 
               + ")";
            DataTable table = new DataTable();

            string sqlDataSource = _configuration.GetConnectionString("RealtorsConnect");
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }
            return new JsonResult(table);
        }

        [HttpPut]
        public JsonResult put(Seller seller)
        {
            string query = @"update seller set
                        SellName = '" + seller.SellName + @"', " +
                        @"SellPhone = '" + seller.SellPhone + @"', " +
                        @"SellEmail = '" + seller.SellEmail + @"', " +
                        @"SellAvatar = '" + seller.SellAvatar + @"', " +
                        @"SellAddress = '" + seller.SellAddress + @"', " +
                        @"SellDateCreate = '" + seller.SellDateCreate + @"', " +
                        @"AgentID = " + seller.AgentID + @", " +
                        @"PackageID = " + seller.PackageID + @", " +
                        @"SellerActive = " + seller.SellerActive + @" " +
                        @"where SellID = " + seller.SellID + @"";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("RealtorsConnect");
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }
            return new JsonResult(table);
        }

        //DELETE: api/Sellers/5
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = "delete from seller " +
              @"where SellID = " + id;
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("RealtorsConnect");
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }
            return new JsonResult(table);
        }

    }
}
