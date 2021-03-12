using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models.Customer
{
    //[Table("User")]
    public class User
    {
        //[Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserID { get; set; }
        //[Required]
        public string UserName { get; set; }
        //[Rkequired]
        public string UserAddress { get; set; }
        //[Required]
        public string UserPhone { get; set; }
        //[Required]
        public string UserEmail { get; set; }

        //[Required]
        public int UserActive { get; set; }

        public string UserAvatar { get; set; }
    }
}
