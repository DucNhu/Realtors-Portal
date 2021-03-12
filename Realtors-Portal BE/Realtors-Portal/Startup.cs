using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Realtors_Portal.Data;
using Realtors_Portal.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Newtonsoft.Json.Serialization;
using Realtors_Portal.Configuration;

namespace Realtors_Portal
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            //  CORS
            services.AddCors(c =>
            {
                c.AddPolicy("AllowOrigin", options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
            });

            //Json Serializer
            services.AddControllersWithViews()
                .AddNewtonsoftJson(options =>
            options.SerializerSettings.ReferenceLoopHandling = Newtonsoft
            .Json.ReferenceLoopHandling.Ignore).
            AddNewtonsoftJson(options => options.SerializerSettings.ContractResolver = new DefaultContractResolver());

            services.AddControllers();
            //services.Configure<JwtConfig>(Configuration.GetSection("JwtConfig"));
            //services.AddDbContext<Realtors_PortalContext>(options =>
            //options.UseSqlite(Configuration.GetConnectionString("RealtorsConnect")));

            // Add Authentication
            //services.AddAuthentication(options =>
            //{
            //    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            //    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            //    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            //})
            //.AddJwtBearer(jwt => {
            //    var key = Encoding.ASCII.GetBytes(Configuration["JwtConfig:Secret"]);

            //    jwt.SaveToken = true;
            //    jwt.TokenValidationParameters = new TokenValidationParameters
            //    {
            //        ValidateIssuerSigningKey = true,
            //        IssuerSigningKey = new SymmetricSecurityKey(key),
            //        ValidateIssuer = false,
            //        ValidateAudience = false,
            //        ValidateLifetime = true,
            //        RequireExpirationTime = false,
            //        ClockSkew = TimeSpan.Zero
            //    };
            // });
            //services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
            //            .AddEntityFrameworkStores<Realtors_PortalContext>();

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Realtors_Portal", Version = "v1" });
            });





            services.AddDbContext<Realtors_PortalContext>(options =>
                    options.UseSqlServer(Configuration.GetConnectionString("RealtorsConnect")));

            


            services.AddDbContext<ApplicationDbContext>(options =>
                    options.UseSqlServer(Configuration.GetConnectionString("RealtorsConnect")));
            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();


            
            // Adding Jwt Bearer
            //.AddJwtBearer(options =>
            //{
            //    options.SaveToken = true;
            //    options.RequireHttpsMetadata = false;
            //    options.TokenValidationParameters = new TokenValidationParameters()
            //    {
            //        ValidateIssuer = true,
            //        ValidateAudience = true,
            //        ValidAudience = Configuration["JWT:ValidAudience"],
            //        ValidIssuer = Configuration["JWT:ValidIssuer"],
            //        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWT:Secret"]))
            //    };
            //});
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Realtors_Portal v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
