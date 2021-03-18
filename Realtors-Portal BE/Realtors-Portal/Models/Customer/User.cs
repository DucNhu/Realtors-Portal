using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Customer
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required(ErrorMessage = "pass is required")]
        public string Password { get; set; }

        [Required(ErrorMessage = "chung minh thu is required")]
        [MaxLength(12)]

        public string IndentificationNumber { get; set; }

        public string Address { get; set; }

        [Phone]
        [Required(ErrorMessage = "phone is required")]

        public string Phone { get; set; }
        [Required(ErrorMessage = "email is required")]

        

        public string Avatar { get; set; }

        [Required(ErrorMessage = "ACtive is required")]
        public int Active { get; set; }

        public int ProductID { get; set; }
        public int ppID { get; set; }

        public string User_type { get; set; }

    }
}
