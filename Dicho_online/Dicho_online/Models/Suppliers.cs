using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    [Table("Suppliers")]
    public class Suppliers
    {
        [Key]
        [Display(Name ="ID")]
        public string SupplierID { get; set; }
        [Display(Name = "Company name")]
        public string CompanyName { get; set; }
        [Display(Name = "Address")]
        public string Address { get; set; }
        [Display(Name = "Phone")]
        public string Phone { get; set; }
        [Display(Name = "Homepage")]
        public string Homepage { get; set; }
    }
}