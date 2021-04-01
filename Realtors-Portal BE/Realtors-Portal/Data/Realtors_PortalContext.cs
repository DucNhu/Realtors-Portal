using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Realtors_Portal.Models.Customer;
using Realtors_Portal.Models;
using Realtors_Portal.Models.Address;

namespace Realtors_Portal.Data
{
    public class Realtors_PortalContext : IdentityDbContext
    {
        public Realtors_PortalContext (DbContextOptions<Realtors_PortalContext> options)
            : base(options)
        {
        }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Customer.Admin> Admin { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.product> project { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Category> Category { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Address.Location> Location { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Address.Country> Country { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Address.City> City { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Address.District> District { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Address.Are> Are { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Customer.Package> Package { get; set; }
    


        //public DbSet<Realtors_Portal.Models.Agent> Agent { get; set; }

        //public DbSet<Realtors_Portal.Models.Seller> Seller { get; set; }

        //public DbSet<Realtors_Portal.Models.Customer.User> User { get; set; }

        public DbSet<Realtors_Portal.Models.Customer.PackagePurchased> PackagePurchased { get; set; }
    }
}
