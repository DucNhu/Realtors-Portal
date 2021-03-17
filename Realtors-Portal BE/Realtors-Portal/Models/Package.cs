﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Customer
{
    //[Table("Package")]
    public class Package
    {
        //[Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PackageID { get; set; }
        //[Required]
        public string PackageName { get; set; }
        //[Required]   
        public decimal Price { get; set; }
        public decimal PromotionPrice { get; set; }
        
        public string PackageTitle { get; set; }
        public string PackageDesciption { get; set; }
        public int NumberOfAds { get; set; }

        public string PackageAvatar { get; set; }
        public int NumberOfMember { get; set; } 
        public int NumberOfMonth { get; set; }
    }
}