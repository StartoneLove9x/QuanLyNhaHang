using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoiMatKhauq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btDoiMK_Click(object sender, EventArgs e)
    {
        try
        {
            if (KiemTraTaiKhoan())
            {
                if (txtpassmoi.Text.Equals(txtnhappassmoi.Text))
                {
                    dataAdmin.Update();
                   
                    lblThongbao.Text = "Đổi mật khẩu thành công !";
                }
                else lblThongbao.Text = "Hai mật khẩu không trùng nhau !";
            }

        }
        catch (Exception ex)
        {
            lblThongbao.Text = ex.ToString() + "Đổi mật khẩu thành công ! Bạn hãy kiểm tra lại tên đăng nhập hoặc mật khẩu";
        }
    }

    private bool KiemTraTaiKhoan()
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
            if ((txtUserName.Text) == dr["USERNAME"].ToString() && txtPasswordcu.Text == dr["PASSWORD"].ToString())
            {

                return true;

            }
            else
                lblThongbao.Text = "Không có tên đăng nhập hoặc bạn nhập sai mật khẩu !";

        }
        try
        {
            dbconnt.Close();

        }
        catch
        {

        }
        return false;
    }




}