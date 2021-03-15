using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Models.Customer
{
    public class PackagePurchased
    {
        //[Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ppID { get; set; }
        //[Required]
        public int PackagerID { get; set; }
        //[Required]
        public string UserName { get; set; }
        public int PromotionPrice { get; set; }
        //[Required]
        public DateTime ppStartDate { get; set; }
        //[Required]
        public DateTime ppEndDate { get; set; }
    }
}
