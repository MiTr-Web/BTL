using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    public class ViewModel
    {
        public IEnumerable<Categories> Categories { get; set; }
        public IEnumerable<Suppliers> Suppliers { get; set; }
        public IPagedList<Products> Products { get; set; }
    }
}