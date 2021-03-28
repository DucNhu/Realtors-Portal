using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Address
{
    public class Are
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int AreID { get; set; }
        [MaxLength(100)]
        public string AreName { get; set; }

        [MaxLength(1)]
        public string AreLetter { get; set; }

        [MaxLength(100)]
        public string Avatar { get; set; }

        public int DistrictID { get; set; }

        public int Active { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
