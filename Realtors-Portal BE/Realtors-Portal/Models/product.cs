using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Models
{
    public class product
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
        public int Location { get; set; }

        //[Required]
        public int Country { get; set; }
        
        //[Required]
        public int City { get; set; }

        //[Required]
        public int District { get; set; }

        //[Required]
        public int Are { get; set; }

        //[Required]
        public int Price { get; set; }

        //[Required]
        public float Sqft { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }

        public string ImageBannerName { get; set; }
        //[Required]
        public int LevelActive { get; set; }

        //INFORs another

    }
}
