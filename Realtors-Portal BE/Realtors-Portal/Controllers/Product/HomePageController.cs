using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Realtors_Portal.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Controllers.Product
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomePageController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly IConfiguration _configuration;

        public HomePageController(Realtors_PortalContext context, IConfiguration configuration, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this._hostEnvironment = hostEnvironment;
            _configuration = configuration;
        }
        //Get by CountryID
        [Route("getCategoryActive")]
        [HttpGet]
        public JsonResult getCategoryActive()
        {
            string query = @"select * from Category where Active = 1";

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

        //Get by CountryID
        [Route("getProductViewHome")]
        [HttpGet]
        public JsonResult getProductViewHome()
        {
            string query = @"SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName
  FROM project
  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID where LevelActive = 2";

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

        


            ////Get by CountryID
            [Route("getProductActive")]
            [HttpGet]
            public JsonResult getProductActive()
            {
                string query = @"SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName
  FROM project
  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID where LevelActive > 0";

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
