using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DangKi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btDangNhap_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtMatKhau.Equals(txtMatKhau2))
            {
                SqlDataSource1.Insert();
                txtThongBao.Text = "Bạn đã đăng kí thành công !";
            }
            else
            {txtThongBao.Text="Mật khẩu không trùng nhau";
                txtMatKhau.Text="";
                txtMatKhau2.Text="";
            }

        }
        catch (Exception ex)
        {
            txtThongBao.Text = ex.ToString();
        }

    }
}