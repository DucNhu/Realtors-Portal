using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Address
{
    public class Location
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int LocationID { get; set; }

        [MaxLength(100)]
        public string LocationName { get; set; }

        [MaxLength(1)]
        public string LocationLetter { get; set; }

        [MaxLength(100)]
        public string Avatar { get; set; }

        public int Active { get; set; }

        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
