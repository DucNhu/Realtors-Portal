using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Realtors_Portal.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
//using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Realtors_Portal.Models;
using Realtors_Portal.Data;
using Microsoft.EntityFrameworkCore;

namespace Realtors_Portal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class testController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _env;
        private readonly Realtors_PortalContext _context;

        private readonly UserManager<IdentityUser> _userManager;
        private readonly JwtConfig _jwtConfig;
        //private readonly TokenValidationParameters _tokenValidationParams;
        //private readonly ApiDbContext _apiDbContext;
        public testController(
            UserManager<IdentityUser> userManager,
            IOptionsMonitor<JwtConfig> optionsMonitor)
            //TokenValidationParameters tokenValidationParams,
            //ApiDbContext apiDbContext)
        {
            _userManager = userManager;
            _jwtConfig = optionsMonitor.CurrentValue;
            //_tokenValidationParams = tokenValidationParams;
            //_apiDbContext = apiDbContext;
        }
        public testController(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _env = env;
        }

        //Get
        [HttpGet]
        public JsonResult Get()
        {
            string query = "select * from test";
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

        // TEST TOKEN
        //[HttpPost]
        //public async Task<IActionResult> Post(test _userData)
        //{

        //    if (_userData != null && _userData.Name != null && _userData.password != null)
        //    {
        //        var user = await GetUser(_userData.Name, _userData.password);

        //        if (user != null)
        //        {
        //            //create claims details based on the user information
        //            var claims = new[] {
        //            new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
        //            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        //            new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
        //            new Claim("id", user.id.ToString()),
        //            new Claim("name", user.Name),
        //            new Claim("username", user.UserName),
        //           };

        //            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

        //            var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        //            var token = new JwtSecurityToken(_configuration["Jwt:Issuer"], _configuration["Jwt:Audience"], claims, expires: DateTime.UtcNow.AddDays(1), signingCredentials: signIn);

        //            return Ok(new JwtSecurityTokenHandler().WriteToken(token));
        //        }
        //        else
        //        {
        //            return BadRequest("Invalid credentials");
        //        }
        //    }
        //    else
        //    {
        //        return BadRequest();
        //    }
        //}

        //private async Task<test> GetUser(string email, string password)
        //{
        //    return await _context.test.FirstOrDefaultAsync(u => u.UserName == email && u.password == password);
        //}
    }
}
