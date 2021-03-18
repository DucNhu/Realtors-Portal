using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models
{

    public class Seller
    {
        //[Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        //[Required]
        public string Name { get; set; }
        //[Rkequired]
        //public string Address { get; set; }
        //[Required]
        //public string Phone { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required(ErrorMessage = "pass is required")]
        public string Password { get; set; }
        //[Required]
        //public int erActive { get; set; }
        //public string Avatar { get; set; }
        //public DateTime DateCreate { get; set; }
        //public int PackageID { get; set; }
        //public int AgentID { get; set; }
    }
}
