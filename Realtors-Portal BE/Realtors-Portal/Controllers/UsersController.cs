using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Data;
using Realtors_Portal.Models.Customer;
namespace Realtors_Portal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _env;

        public UsersController(IConfiguration context, IWebHostEnvironment env)
        {
            _configuration = context;
            _env = env;
        }

        // GET: api/Users
        [HttpGet]
        public JsonResult Get()
        {
            string query = "select * from auser";
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

        // Get by ID
        [Route("{id}")]
        [HttpGet]
        public JsonResult Get(int id)
        {
            string query = "select * from auser where UserID = " + id;
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

        // POst
        [HttpPost]
        public JsonResult Post(User User)
        {
            string query = "insert into auser values ('"
                + User.UserName + "', '"
                + User.UserAddress + "', '"
                + User.UserPhone + "', '"
                + User.UserEmail + "', '"
                + User.UserActive + "', '"
                + User.UserAvatar + "')";
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

        // put
        [HttpPut]
        public JsonResult Put(User User)
        {
            string query = "update auser set UserName = '"
                + User.UserName + "', UserAddress ='"
                + User.UserAddress + "', UserPhone ='"
                + User.UserPhone + "', UserEmail ='"
                + User.UserEmail + "', UserActive ="
                + User.UserActive + ", UserAvatar ='"
                + User.UserAvatar + "' where UserID = " + User.UserID;

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

        // Delete
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = "delete from auser " +
              @"where UserID = " + id;
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
