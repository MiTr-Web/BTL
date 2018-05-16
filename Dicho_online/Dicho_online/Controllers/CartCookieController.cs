using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dicho_online.Controllers
{
    public class CartCookieController : Controller
    {
        // GET: Cart
        public void AddToCartCookie()
        {           
            
        }

        public void CreateCartCookie()
        {
            HttpCookie cookie = new HttpCookie("cart");
            cookie.Value = "";
            cookie.Expires = DateTime.Now.AddDays(30);
        }

        public void DisableCartCookie()//just make it expire :)
        {
            if (this.ControllerContext.HttpContext.Request.Cookies.AllKeys.Contains("cart"))
            {
                HttpCookie cookie = this.ControllerContext.HttpContext.Request.Cookies["cart"];
                cookie.Expires = DateTime.Now.AddDays(-1);
                this.ControllerContext.HttpContext.Response.Cookies.Add(cookie);
            }
        }
    }
}