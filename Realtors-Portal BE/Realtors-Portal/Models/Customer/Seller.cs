using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Realtors_Portal.Models
{
    [Table("Seller")]

    public class Seller
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SellID { get; set; }
        //[Required]
        public string SellName { get; set; }
        //[Rkequired]
        public string SellAddress { get; set; }
        //[Required]
        public string SellPhone { get; set; }
        //[Required]
        public string SellEmail { get; set; }
        //[Required]
        public int SellerActive { get; set; }
        public string SellAvatar { get; set; }
        public DateTime SellDateCreate { get; set; }
        public int PackageID { get; set; }
        public int AgentID { get; set; }
    }
}
