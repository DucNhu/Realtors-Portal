using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

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
    }
}
