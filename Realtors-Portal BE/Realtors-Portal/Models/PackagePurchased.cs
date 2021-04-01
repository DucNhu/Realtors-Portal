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
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ppID { get; set; }
        //[Required]
        public int PackageID { get; set; }
        //[Required]
        public string UserID { get; set; }
        //[Required]
        public DateTime StartDate { get; set; }
        //[Required]
        public DateTime EndDate { get; set; }
    }
}
