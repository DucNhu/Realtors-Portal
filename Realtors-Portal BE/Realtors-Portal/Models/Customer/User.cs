using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Http;
namespace Realtors_Portal.Models.Customer
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Column(TypeName = "nvarchar(MAX)")]
        public string Name { get; set; }

        [EmailAddress(ErrorMessage = "pass is required")]
        public string Email { get; set; }

        public string Password { get; set; }

        [Column(TypeName = "nvarchar(MAX)")]
        public string Title { get; set; }
        [Column(TypeName = "nvarchar(MAX)")]
        public string Description { get; set; }

        public string NetWorkID { get; set; }

        //[Required]
        [Column(TypeName = "nvarchar(MAX)")]
        public string Location { get; set; }

        //[Required]
        [Column(TypeName = "nvarchar(MAX)")]
        public string Country { get; set; }

        //[Required]  
        [Column(TypeName = "nvarchar(MAX)")]
        public string City { get; set; }

        //[Required]
        [Column(TypeName = "nvarchar(MAX)")]
        public string District { get; set; }

        //[Required]
        [Column(TypeName = "nvarchar(MAX)")]
        public string Are { get; set; }

        [Phone]
        public string Phone { get; set; }
        
        public string Avatar { get; set; }

        public int Active { get; set; }

        public int PackageID { get; set; }

        public int ppID { get; set; }

        public string User_type { get; set; }

    }
}
