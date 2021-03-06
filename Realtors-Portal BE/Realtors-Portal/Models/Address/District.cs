using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Address
{
    public class District
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DistrictID { get; set; }

        [MaxLength(100)]
        public string DistrictName { get; set; }

        [MaxLength(1)]
        public string DistrictLetter { get; set; }

        [MaxLength(100)]
        public string Avatar { get; set; }

        public int CityID { get; set; }

        public int Active { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
