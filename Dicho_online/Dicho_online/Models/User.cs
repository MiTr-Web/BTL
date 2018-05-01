using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    [Table("User")]
    public class User
    {
        [Key]
        public string email { get; set; }
        [Display(Name = "Customer ID")]
        public string customerid { get; set; }
        public int privilege { get; set; }
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Display(Name = "Mobile phone")]
        public string MobilePhone { get; set; }
        [Display(Name = "Join date")]
        public DateTime JoinDate { get; set; }
        [Display(Name = "Last Name")]
        public string MembershipTitle { get; set; }
    }
}