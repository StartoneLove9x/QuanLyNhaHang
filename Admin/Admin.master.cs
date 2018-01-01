using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Boolean.Parse(Session["Login"].ToString())== false)
        {
            Session["Login"] = false;
            Response.Redirect("Login.aspx", false);
        }


    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["Login"] = false;
        Response.Redirect("Login.aspx", false);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["Login"] = false;
        Response.Redirect("~/TrangChu.aspx", false);
    }
}
