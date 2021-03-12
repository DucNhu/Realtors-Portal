using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Models.Customer
{
    public class PackageBuy
    {
        //[Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PackageID { get; set; }
        //[Required]
        public int SellerID { get; set; }
        //[Required]
        public int AgentID { get; set; }
        public int PromotionPrice { get; set; }
        //[Required]
        public DateTime PackageDateBegin { get; set; }
        //[Required]
        public DateTime PackageDateExpiry { get; set; }
    }
}
