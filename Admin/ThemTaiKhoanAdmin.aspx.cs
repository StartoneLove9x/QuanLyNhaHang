using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.SessionState;
using System.Data.SqlClient;
public partial class Admin_Login : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btDangNhap_Click(object sender, EventArgs e)
    {
        CheckLogin();
    }
    private void CheckLogin()
    {
        string strconm = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        SqlConnection dbconnt = new SqlConnection(strconm);
        try
        {
            dbconnt.Open();


        }
        catch
        {

        }
        SqlCommand execute = new SqlCommand("Select * From ADMIN", dbconnt);
        SqlDataReader reader = execute.ExecuteReader();
        DataTable table = new DataTable();
        table.Load(reader);
        foreach (DataRow dr in table.Rows)
        {
            if ((txtUserName.Text) == dr["USERNAME"].ToString() && txtPassword.Text == dr["PASSWORD"].ToString())
            {
                Session["Login"] = true;
                Response.Redirect("~/Admin/Admin.aspx", false);

            }
            else
                lblthongbao.Text = "Bạn đã nhập sai tên đăng nhập hoặc tài khoản !";

        }
        try
        {
            dbconnt.Close();


        }
        catch
        {

        }
      
    }










    //if (string.IsNullOrEmpty(txtUserName.Text.Trim()) || (string.IsNullOrEmpty(txtPassword.Text.Trim())))
    //{
    //    lblthongbao.Text = "Hãy kiểm tra lại tên đăng nhập và mật khẩu";
    //    return;
    //}
    //var ac = from c in st.Accounts
    //         where c.Username == txtUserName.Text
    //         select c;
    //bool kt = false;
    //foreach (Account account in ac)
    //{
    //    if ((txtUserName.Text == account.Username) && (txtPassword.Text == account.Password) && (account.Decendalization.ToString() == "Admin"))
    //    {
    //        kt = true;
    //        Session["Dangnhap"] = txtUserName.Text.ToString();
    //        Session["MemberID"] = account.MemberID;
    //        Session.Contents["TrangThai"] = "DaDangNhap";
    //        string url = Request.QueryString["url"];
    //        if (!string.IsNullOrEmpty(url))
    //            Response.Redirect(url);
    //        else
    //            Response.Redirect("Default.aspx");
    //    }

    //    if ((txtUserName.Text == account.Username) && (txtPassword.Text == account.Password) && (account.Decendalization.ToString() == "Quản lý chuyên mục"))
    //    {
    //        kt = true;
    //        Session["Dangnhap"] = txtUserName.Text.ToString();
    //        Session.Contents["TrangThai"] = "DaDangNhap";
    //        Session["MemberID"] = account.MemberID;
    //        string url = Request.QueryString["url"];
    //        if (!string.IsNullOrEmpty(url))
    //            Response.Redirect(url);
    //        else
    //            Response.Redirect("Default.aspx");
    //    }
    //    if ((txtUserName.Text == account.Username) && (txtPassword.Text == account.Password) && (account.Decendalization.ToString() == "Viết bài"))
    //    {
    //        kt = true;
    //        Session["Dangnhap"] = txtUserName.Text.ToString();
    //        Session.Contents["TrangThai"] = "DaDangNhap";
    //        Session["MemberID"] = account.MemberID;
    //        string url = Request.QueryString["url"];
    //        if (!string.IsNullOrEmpty(url))
    //            Response.Redirect(url);
    //        else
    //            Response.Redirect("Default.aspx");
    //    }
    //    else
    //    {
    //        if ((txtUserName.Text == account.Username) || (txtPassword.Text == account.Password))
    //        {
    //            lblthongbao.Text = "Bạn đăng nhập không thành công";
    //            hplQuenMK.Visible = false;
    //        }
    //    }



    protected void btDangKi_Click(object sender, EventArgs e)
    {
        try
        {
            if(txtPassword.Text.Equals(txtPassword2.Text))
            { dataAdmin.Insert();
            lblthongbao.Text = "Đăng kí thành công";
            }
            else lblthongbao.Text = "Hai mật khẩu không trùng nhau";
        }
        catch (Exception ex)
            
        {
            lblthongbao.Text = "Đăng kí không thành công";
        }
       
    }
}
