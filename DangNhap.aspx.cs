using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DangNhap : System.Web.UI.Page
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
        SqlCommand execute = new SqlCommand("Select * From KHACHHANG", dbconnt);
        SqlDataReader reader = execute.ExecuteReader();
        DataTable table = new DataTable();
        table.Load(reader);
        foreach (DataRow dr in table.Rows)
        {
            if ((txtUserName.Text) == dr["USERNAME"].ToString() && txtPassword.Text == dr["PASSWORD"].ToString())
            {
                Session["UserLogin"] = true;
                Session["UserName"] = dr["TENKH"].ToString();
                Session["UserID"] = dr["USERNAME"].ToString();
                Response.Redirect(Session["returnurl"].ToString(), false);            
               
            }
            else
                txtThongBao.Text = "Bạn đã nhập sai tên đăng nhập hoặc tài khoản !";
           

        }
        try
        {
            dbconnt.Close();


        }
        catch
        {

        }

    }
    
    
}