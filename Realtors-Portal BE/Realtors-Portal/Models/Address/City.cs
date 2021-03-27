using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Address
{
    public class City
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CityID { get; set; }

        [MaxLength(100)]
        public string CityName { get; set; }

        [MaxLength(1)]
        public string CityLetter { get; set; }

        [MaxLength(100)]
        public string Avatar { get; set; }
        
        public int CountryID { get; set; }

        public int Active { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
