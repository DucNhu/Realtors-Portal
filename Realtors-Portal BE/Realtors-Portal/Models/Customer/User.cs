using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Customer
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        public string Name { get; set; }

        [EmailAddress(ErrorMessage = "pass is required")]
        public string Email { get; set; }

        public string Password { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string NetWorkID { get; set; }

        //[Required]
        public int LocationID { get; set; }

        //[Required]
        public int CountryID { get; set; }

        //[Required]
        public int CityID { get; set; }

        //[Required]
        public int DistrictID { get; set; }

        //[Required]
        public int AreID { get; set; }

        [Phone]
        public string Phone { get; set; }
        
        public string Avatar { get; set; }

        public int Active { get; set; }

        public int ProductID { get; set; }

        public int PackageID { get; set; }

        public int ppID { get; set; }

        public string User_type { get; set; }

    }
}
