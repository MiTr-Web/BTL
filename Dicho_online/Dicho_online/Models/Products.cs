using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    [Table("View_Product")]
    public class Products
    {
        [Key]
        [Display(Name ="ID")]
        public string ProductID { get; set; }
        [Display(Name ="Product name")]
        public string ProductName { get; set; }
        [Display(Name = "Supplier name")]
        public string CompanyName { get; set; }
        [Display(Name = "Category name")]
        public string CategoryName { get; set; }
        [Display(Name = "Quantity per unit")]
        public int QuantityPerUnit { get; set; }
        [Display(Name = "Unit price")]
        public decimal UnitPrice { get; set; }
        [Display(Name = "In stock")]
        public int InStock { get; set; }
        [Display(Name = "OnOrder")]
        public int OnOrder { get; set; }
        [Display(Name = "Discontinue")]
        public bool Discontinue { get; set; }        
    }
}