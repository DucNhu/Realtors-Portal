using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models
{
    public class ImageLib
    {
        public int ImageID { get; set; }

        public string ProductID { get; set; }
        public string Name { get; set; }

        //[NotMapped]
        //public IFormFile ImageFile { get; set; }
    }
}
