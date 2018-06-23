using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Data;

namespace Dicho_online.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginAction()
        {
            string username = Request.Form["username"];
            string pw = Request.Form["password"];
            string salt;
            int privilege = -1;
            string CustomerID = "";

            string connectionString = ConfigurationManager.ConnectionStrings["FoodMarketEntities"].ConnectionString;
            try
            {
                DataTable dtSalt = new DataTable();
                DataTable dtCustomer = new DataTable();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //getSalt
                    SqlCommand getSalt = connection.CreateCommand();
                    getSalt.CommandText = "exec getSalt @username";
                    getSalt.Parameters.Add("@username", SqlDbType.VarChar, 256).Value = username;

                    connection.Open();

                    getSalt.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(getSalt);
                    da.Fill(dtSalt);
                    salt = dtSalt.Rows[0]["Salt"].ToString();

                    connection.Close();
                    //
                    /*hash the goddamn password + salt :)*/
                    byte[] bytes = Encoding.Unicode.GetBytes(pw + salt);
                    SHA256Managed hashstring = new SHA256Managed();
                    byte[] hash = hashstring.ComputeHash(bytes);
                    string hashString = BitConverter.ToString(hash).Replace("-", "");

                    //
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandText = "exec Login @username, @hashstring";
                    cmd.Parameters.Add("@username", SqlDbType.VarChar, 256).Value = username;
                    cmd.Parameters.Add("@hashstring", SqlDbType.VarChar, 65).Value = hashString;

                    connection.Open();
                    cmd.ExecuteNonQuery();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dtCustomer);
                    connection.Close();

                    if (dtCustomer.Rows.Count == 1)
                    {
                        CustomerID = dtCustomer.Rows[0]["CustomerID"].ToString();
                        privilege = int.Parse(dtCustomer.Rows[0]["Privilege"].ToString());
                    }
                    else
                    {
                        TempData["AlertMsg1"] = "Username or password does not match.";
                        TempData["AlertMsg2"] = "Please try again.";
                        return View("Index");
                    }
                }
            }
            catch (Exception e)
            {
                //do sth
            }
            Session["username"] = username;
            Session["customerid"] = CustomerID;
            Session["privilege"] = privilege;
            if (privilege == 0)
            {
                return RedirectToAction("Index", "Admin");
            }
            return RedirectToAction("LoggedIn", "Home");
        }
        public ActionResult RegisterAction()
        {
            string username = Request.Form["reg_username"];
            string pw = Request.Form["reg_password"];
            string con_pw = Request.Form["reg_confirm_password"];
            string salt;

            /*gen salt*/
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                // Buffer storage.
                byte[] data = new byte[8];
                // Fill buffer.
                rng.GetBytes(data);
                salt = BitConverter.ToString(data).Replace("-", "");
            }
            //
            /*hash the goddamn password + salt :)*/
            byte[] bytes = Encoding.Unicode.GetBytes(pw + salt);
            SHA256Managed hashstring = new SHA256Managed();
            byte[] hash = hashstring.ComputeHash(bytes);
            string hashString = BitConverter.ToString(hash).Replace("-", "");

            //

            string connectionString = ConfigurationManager.ConnectionStrings["FoodMarket"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandText = "exec Register @username, @hashstring, @salt";
                    cmd.Parameters.Add("@username", SqlDbType.VarChar, 256).Value = username;
                    cmd.Parameters.Add("@hashstring", SqlDbType.VarChar, 65).Value = hashString;
                    cmd.Parameters.Add("@salt", SqlDbType.VarChar, 64).Value = salt;

                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception e)
            {
                //do sth
            }
            return View("RegisterSuccess");
        }

        public ActionResult LogOut()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Abandon();
            return RedirectToAction("Index","Home");
        }
    }
}