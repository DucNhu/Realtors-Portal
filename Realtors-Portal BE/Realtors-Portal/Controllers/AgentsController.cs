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
    public class AgentsController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _env;

        public AgentsController(IConfiguration context, IWebHostEnvironment env)
        {
            _configuration = context;
            _env = env;
        }

        // GET: api/Agents
        [HttpGet]
        public JsonResult Get()
        {
            string query = "select * from agent";
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
            string query = "select * from agent where AgentID = " + id;
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
        public JsonResult Post(Agent agent)
        {
            string query = "insert into agent values ('"
                + agent.AgentName + "', '"
                + agent.AgentAddress + "', '"
                + agent.AgentPhone + "', '"
                + agent.AgentEmail + "', '"
                + agent.AgentActive + "', '"
                + agent.AgentAvatar + "', '"
                + agent.AgentDateCreate + "', '"
                + agent.PackageID + "')";
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
        public JsonResult Put(Agent agent)
        {
            string query = "update agent set AgentName = '"
                + agent.AgentName + "', AgentAddress ='"
                + agent.AgentAddress + "', AgentPhone ='"
                + agent.AgentPhone + "', AgentEmail ='"
                + agent.AgentEmail + "', AgentActive ='"
                + agent.AgentActive + "', AgentAvatar ='"
                + agent.AgentAvatar + "', AgentDateCreate ='"
                + agent.AgentDateCreate + "', PackageID="
                + agent.PackageID + " where AgenID = " + agent.AgentID;

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
            string query = "delete from agent " +
              @"where AgentID = " + id;
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
