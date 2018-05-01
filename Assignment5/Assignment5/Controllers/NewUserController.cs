using Assignment5.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Assignment5.Controllers
{
    public class NewUserController : Controller
    {
        // GET: NewUser
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NewUser()
        {
            var d= new UserDTO(); 
            if (Session["user"] == null)
            {
                Session.Clear();
                ModelState.Clear();
                return View(d);
            }

            Utility b = new Utility();
            var u =(Assignment5.Models.UserDTO) Session["user"];
            Session["uid"] = b.getUserId(u.login);
            Session["editUser"] = u;
            return View(u);
       }

        public ActionResult Home()
        {
           
            return View();
        }

        public ActionResult Login()
        {
            if (Request["name"]==null || Request["login"]==null || Request["password"]==null || Request["address"]==null || Request["nic"]==null)
            {
                Session["message"] = "Cannot accept Empty values ";
                return Redirect("~/NewUser/NewUser");

            }

            if (Request.Files["image"] != null)
            {
                var file = Request.Files["image"];
                if (file.FileName != "")
                {
                    var ext = System.IO.Path.GetExtension(file.FileName);
                    var uniqueName = Guid.NewGuid().ToString() + ext;
                    var rootPath = Server.MapPath("~/Images");
                    var fileSavePath = System.IO.Path.Combine(rootPath, uniqueName);
                    file.SaveAs(fileSavePath);
                    Session["image"] = uniqueName;
                }
            }
            UserDTO u = new UserDTO();
            u.name = Request["name"];
            u.login = Request["login"];
            u.password = Request["password"];
            u.address = Request["address"];
            u.age = Convert.ToInt32(Request["age"]);
            var n = DateTime.Now;
            u.createdOn = n.ToString("yyyy-MM-dd'T'HH:mm:ssZ");

            u.email = Request["email"];
            u.dob= Request["date"];
           
            //u.dob = Convert.ToDateTime(Request["date"]);
            if (Request["chess"] != null)
                u.chess = 1;
            else
                u.chess = 0;
            if (Request["hockey"] != null)
                u.hockey = 1;
            else
                u.hockey = 0;
            if (Request["cricket"] != null)
                u.cricket = 1;
            else
                u.cricket = 0;
            u.nic = Request["nic"];
            u.gender =Convert.ToChar( Request["gender"]);
            if (Session["image"] != null)
            { u.imageName = Session["image"].ToString(); }
            else
                u.imageName = "";
            Utility b = new Utility();

            if (Session["editUser"] == null)
            {
                if (b.isUserExist(u.login, u.nic, u.email))
                {
                    Session["message"] = "User Already Exist";
                    return Redirect("~/NewUser/NewUser");
                }


                b.saveUser(u);

                Session["name"] = Request["name"];
                Session["user"] = u;
                return Redirect("~/NewUser/Home");
            }

            else
            {
                UserDTO editUser = (Assignment5.Models.UserDTO)Session["editUser"];
                int f = 1;
                if (u.login != editUser.login)
                {
                    if (b.isUserExist(u.login, "", ""))
                    {
                        f = 0;
                        Session["message"] = "User Already Exist";
                        return Redirect("~/NewUser/NewUser");
                    }
                }

                else if (u.nic != editUser.nic && f == 1)
                {
                    if (b.isUserExist("", u.nic, ""))
                    {
                        f = 0;
                        Session["message"] = "User Already Exist";
                        return Redirect("~/NewUser/NewUser");
                    }
                }
                else if (u.email != editUser.email && f == 1)
                {
                    if (b.isUserExist("", "", u.email))
                    {
                        f = 0;
                        Session["message"] = "User Already Exist";
                        return Redirect("~/NewUser/NewUser");
                    }
                }

                if (f == 1)
                {
                    int uid =Convert.ToInt32(Session["uid"]);
                    if (b.UpdateUser(u,uid))
                    {
                        Session["message"] = "Updated";
                        string AdminFlag="";
                        if (Session["AdminFlag"] != null)
                            AdminFlag = "1";
                        else
                            AdminFlag = "0";

                        if (AdminFlag == "1")
                        {
                            List<UserDTO> user = new List<UserDTO>();
                            user = b.GetUsersGrid();
                            Session["userGrid"] = user;
                            return Redirect("~/Admin/AdminHome");
                        }
                        else
                        {
                            Session["name"] = u.name;
                            Session["user"] = u;
                            return Redirect("~/NewUser/Home");
                        }
                    }
                    else
                    {
                        Session["message"] = "Not Updated";
                    }
                }
            }
            return Redirect("~/NewUser/NewUser");
        }


        public ActionResult Logout()
        {
           
            string AdminFlag = "";
            if (Session["AdminFlag"] != null)
                AdminFlag = "1";
            else
                AdminFlag = "0";
            if(AdminFlag=="1")
            {
                List<UserDTO> user = new List<UserDTO>();
                Utility b = new Utility();
                user = b.GetUsersGrid();
                Session["userGrid"] = user;
                return Redirect("~/Admin/AdminHome");
            }
            Session.Clear();
            ModelState.Clear();
            return Redirect("~/Home/Index");
        }
    }
}