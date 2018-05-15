using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    public class HomeViewModel
    {
        public IPagedList<Product> productList { get; set; }
        public IEnumerable<string> priceSort { get; set; }
    }
}