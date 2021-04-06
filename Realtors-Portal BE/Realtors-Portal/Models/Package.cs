using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Customer
{
    //[Table("Package")]
    public class Package
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PackageID { get; set; }
        //[Required]
        public string PackageName { get; set; }
        //[Required]   
        public int Price { get; set; }
        
        public string PackageTitle { get; set; }

        public string PackageDesciption { get; set; }

        public int Duration { get; set; }

        public int Active { get; set; }

        public string TypeDuration { get; set; }

    }
}
