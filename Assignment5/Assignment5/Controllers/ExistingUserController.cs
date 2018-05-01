using Assignment5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Assignment5.Controllers
{
    public class ExistingUserController : Controller
    {
        // GET: ExistingUser
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult loginCheck()
        {
            if (Request["login"] == null || Request["Password"]==null)
            {
                Session["message2"] = "Cannot accept empty values";
                return Redirect("~/ExistingUser/Login");
            }
            string login=Request["login"];
            string pass = Request["Password"];
            Utility b = new Utility();
            if(b.isValidUserExist(login,pass))
            {
                    UserDTO u = b.getUser(login);
                    Session["image"] = u.imageName;
                    Session["name"] = u.name;
                    Session["user"] = u;
                    Session["message2"] = "";
                    return Redirect("~/NewUser/Home");
                
            }
            Session["message2"] = "User Doesn't Exist";
            return Redirect("~/ExistingUser/Login");

        }

        public ActionResult ResetPass()
        {
            if (Request["email"]==null)
            {
                Session["message3"] = "Cannot accept empty values ";
                return Redirect("~/ExistingUser/Login");
            }
            string email = Request["email"];
            Utility b = new Utility();
            if (b.isUserExist("", "", email))
            {
                Random r = new Random();
                int c = r.Next(10000, 900000);
                String code = c.ToString();
                if (b.sendEmail(email, "Recovery Code", "Your recovery code is " + code))
                {
                    UserDTO user = new UserDTO();
                    user = b.getUserByEmail(email);
                    Session["code"] = code;
                    Session["user"] = user;
                    Session["message3"] = "";
                    return Redirect("~/ExistingUser/Reset");
                }
            }
            Session["message3"] = "Email doesn't exist.";
            return Redirect("~/ExistingUser/Login");
        }

        public ActionResult ExistingUser()
        {
            return View();
        }


        public ActionResult CodeVerify()
        {
            string code = Request["code"];
            string orgCode = Session["code"].ToString();

            if(code==orgCode)
            {
                Session["message4"] = "";
                return Redirect("~/ExistingUser/updatePass");
            }

            Session["message4"] = "Invalid Code";
            return Redirect("~/ExistingUser/Reset");
        }

        public ActionResult updatePassword()
        {
            string pass = Request["password"];
            UserDTO user = new UserDTO();
             user = (Assignment5.Models.UserDTO)Session["user"];
            user.password = pass;
            Session["user"] = user;
            Utility b = new Utility();
            
            if (b.UpdateUser(user,b.getUserId(user.login)))
            {
                Session["image"] = user.imageName;
                Session["name"] = user.name;
                return Redirect("~/NewUser/Home");
            }

            return Redirect("~/NewUser/updatePass");
        }

        public ActionResult Reset()
        {
            return View();
        }

        public ActionResult updatePass()
        {
            return View();
        }
    }
}