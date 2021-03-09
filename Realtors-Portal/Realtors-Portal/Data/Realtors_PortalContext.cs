using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Realtors_Portal.Models;

namespace Realtors_Portal.Data
{
    public class Realtors_PortalContext : DbContext
    {
        public Realtors_PortalContext (DbContextOptions<Realtors_PortalContext> options)
            : base(options)
        {
        }

        public DbSet<Realtors_Portal.Models.test> test { get; set; }
    }
}
