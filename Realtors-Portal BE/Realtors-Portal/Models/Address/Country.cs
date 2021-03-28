using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Address
{
    public class Country
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CountryID { get; set; }
        [MaxLength(100)]
        public string CountryName { get; set; }
        [MaxLength(1)]
        public string CountryLetter { get; set; }
        [MaxLength(100)]
        public string Avatar { get; set; }

        public int LocationID { get; set; }

        public int Active { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
