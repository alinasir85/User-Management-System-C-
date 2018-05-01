using Assignment5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Assignment5.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult AdminLogin()
        {
            return View();
        }

        public ActionResult Admin()
        {
            return View();
        }

        public ActionResult AdminHome()
        {
           
            if (Request["login"]!=null)
            {
                string login = Request["login"];
                string password = Request["password"];

               Utility b = new Utility();

                if (b.isAdminExist(login, password))
                {
                    List<UserDTO> user = new List<UserDTO>();
                    user = b.GetUsersGrid();
                    Session["userGrid"] = user;
                    return View(user);
                }
                Session["message2"] = "Admin not exist";
                return Redirect("~/Admin/AdminLogin");
            }
            List<UserDTO> u = new List<UserDTO>();
            return View(u);
        }

        public ActionResult Logout()
        {
            ModelState.Clear();
            Session.Clear();
            return Redirect("~/Home/Index");
        }

        public ActionResult edit()
        {
          string login= Request["uid"];
            UserDTO u = new UserDTO();
            Utility b = new Utility();
            u = b.getUser(login);
            Session["AdminFlag"] = "1";
            Session["image"] = u.imageName;
            Session["name"] = u.name;
            Session["user"] = u;
            return Redirect("~/NewUser/Home");
        }


    }
}