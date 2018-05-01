using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Dicho_online.Models
{
    public class DB_Context : DbContext
    {
        public DB_Context() : base("name=FoodMarket") { }
        public DbSet<Categories> Categories { get; set; }
        public DbSet<Products> Products { get; set; }
        public DbSet<Suppliers> Suppliers { get; set; }
    }
}