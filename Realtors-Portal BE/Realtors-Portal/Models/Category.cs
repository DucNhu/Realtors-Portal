using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models
{
    public class Category
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
          public int CategoryID { get; set; }
        [MaxLength(100)]
        public string CategoryName { get; set; }
        [MaxLength(100)]
        public string CategoryTitle { get; set; }
        [MaxLength(100)]
        public string Avatar { get; set; }

        public int Active { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
