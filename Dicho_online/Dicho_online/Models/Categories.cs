using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    [Table("Categories")]
    public class Categories
    {
        [Key]
        [Display(Name ="ID")]
        public string CategoryID { get; set; }
        [Display(Name ="Category name")]
        public string CategoryName { get; set; }
        [Display(Name = "Thumbnail")]
        public string PhotoPath { get; set; }
    }
}