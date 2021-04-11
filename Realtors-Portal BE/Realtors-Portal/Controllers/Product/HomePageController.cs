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

        [Route("maxPirce")]
        [HttpGet]
        public JsonResult maxPirce()
        {
            string query = @"SELECT max(Price) as maxPrice FROM project";

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

        [Route("maxSqft")]
        [HttpGet]
        public JsonResult maxSqft()
        {
            string query = @"SELECT max(Sqft) as maxSqft FROM project";

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


        //Get categories active
        [Route("getCategoryActive")]
        [HttpGet]
        public JsonResult getCategoryActive()
        {
            string query = @"select top 6 * from Category where Active = 1";

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

        //Get products in home page
        [Route("getProductViewHome")]
        [HttpGet]
        public JsonResult getProductViewHome()
        {
            string query = @"
SELECT top 6 project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price,project.UserID,

  [User].Name, [User].Avatar, [User].Email, [User].Phone, [User].User_type,  

  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName 
  FROM project
INNER JOIN [User] ON [User].ID = project.UserID

  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID where LevelActive = 2
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



        //Get Product Detail
        [Route("getProductDetail/id/{id}")]
        [HttpGet]
        public JsonResult getProductDetail(int id)
        {
            string query = @"
SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price,project.UserID,

  [User].Name, [User].Avatar, [User].Email, [User].Phone, [User].User_type,  

  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName 
  FROM project
INNER JOIN [User] ON [User].ID = project.UserID

  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID where project.ID = " + id;

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
        //Get image feature
        [Route("getImageFeatureByProductID/id/{id}")]
        [HttpGet]
        public JsonResult getImageFeatureByProductID(int id)
        {
            string query = @"select * from ImageLib where ProductID = " + id;

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
  project.Description, project.Title, project.Sqft, project.Price, project.UserID,

  [User].Name, [User].Avatar, [User].Email, [User].Phone, [User].User_type,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName
  FROM project
  INNER JOIN [User] ON [User].ID = project.UserID

  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are

	    INNER JOIN Category ON Category.CategoryID = project.CategoryID
		where LevelActive > 0";

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


        //Get package active
        [Route("getPackageActive")]
        [HttpGet]
        public JsonResult getPackageActive()
        {
            string query = @"SELECT * FROM package where Active > 0";

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



        [HttpGet("getDataByAdvancedSearch/{category}/{User_type}/{LocationName}/{CountryName}/{CityName}/{DistrictName}/{AreName}/{sqftMin}/{sqftMax}/{priceMin}/{priceMax}")]
        public JsonResult getDataByAdvancedSearch(string category, string User_type, string LocationName, string CountryName, string CityName, string DistrictName, string AreName, int sqftMin, int sqftMax, int priceMin, int priceMax)
        {
            string query = @"
SELECT project.* FROM project 

inner join [User] on project.UserID = [User].ID
INNER JOIN Category ON Category.CategoryID = project.CategoryID	

INNER JOIN Location ON Location.LocationID = project.Location
INNER JOIN Country ON Country.CountryID = project.Country
INNER JOIN City ON City.CityID = project.City
INNER JOIN District ON District.DistrictID = project.District
INNER JOIN Are ON Are.AreID = project.Are	 

where Category.CategoryName = '" + category + @"' and [User].User_type = '" + User_type + @"'
and Location.LocationName = '" + LocationName + @"'
and Country.CountryName = '" + CountryName + @"'
and City.CityName = '" + CityName + @"' and District.DistrictName = '" + DistrictName + @"'
and Are.AreName = '" + AreName + @"'

and Sqft between " + sqftMin + @" and " + sqftMax + @"
and Price between " + priceMin + @" and " + priceMax + @"
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


        // Get prouct by Category active
//        [Route("getProductByUserIDActive/user/{id}")]
//        [HttpGet]
//        public JsonResult getProductByUserIDActive(int id)
//        {
//            string query = @"
//SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
//  project.Description, project.Title, project.Sqft, project.Price, 

//  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
//  Category.CategoryName,
//Location.LocationID, Country.CountryID , City.CityID, District.DistrictID, Are.AreID,
//  Category.CategoryID 
//  FROM project
//INNER JOIN [User] ON [User].ID = project.UserID 
//  INNER JOIN Location ON Location.LocationID = project.Location
//  INNER JOIN Country ON Country.CountryID = project.Country
//    INNER JOIN City ON City.CityID = project.City
//	  INNER JOIN District ON District.DistrictID = project.District
//	  INNER JOIN Are ON Are.AreID = project.Are	   
//	  INNER JOIN Category ON Category.CategoryID = project.CategoryID
//    where project.LevelActive > 0 and project.UserID = " + id;

//            DataTable table = new DataTable();
//            string sqlDataSource = _configuration.GetConnectionString("RealtorsConnect");
//            SqlDataReader myRender;
//            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
//            {
//                myCon.Open();
//                using (SqlCommand myCommand = new SqlCommand(query, myCon))
//                {
//                    myRender = myCommand.ExecuteReader();
//                    table.Load(myRender);
//                    myRender.Close(); myCon.Close();
//                }
//            }
//            return new JsonResult(table);
//        }

    }
}
