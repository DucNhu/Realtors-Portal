using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Models
{
    public class home
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        //[Required]
        public int CategoryID { get; set; }
        //[Required]
        public int SellerID { get; set; }

        //[Required]
        [MaxLength(100)]
        public string ProjectName { get; set; }
        
        //[Required]
        public string Title { get; set; }

        //[Required]
        public string Description { get; set; }

        //[Required]
        [MaxLength(100)]
        public string Location { get; set; }

        //[Required]
        [MaxLength(100)]
        public string Country { get; set; }
        
        //[Required]
        [MaxLength(100)]
        public string City { get; set; }

        //[Required]
        [MaxLength(100)]
        public string District { get; set; }

        //[Required]
        [MaxLength(100)]
        public string Are { get; set; }

        //[Required]
        public int Price { get; set; }

        //[Required]
        public float Sqft { get; set; }

        //[Required]
        public int ImageLibID { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }

        //[Required]
        [MaxLength(100)]
        public string ImageBannerName { get; set; }

        //[Required]
        [NotMapped]
        public string ImageBannerSrc { get; set; }

        //[Required]
        public int LevelActive { get; set; }

        //INFORs another

    }
}
