using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KhachHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cmdCapNhat_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource2.Update();
            txtThongBao0.Text = "Cập nhật thành công !";
            Response.Redirect(Request.Url.PathAndQuery);
        }
        catch (Exception ex)
        {
            txtThongBao0.Text = ex.ToString();
        }
    }
   
    protected void cmdDoiMatKhau_Click(object sender, EventArgs e)
    {
        try
        {
            //So sánh 2 mật khẩu
            if (txtMatKhau.Equals(txtMatKhau2))
            {
              
                    dataDoiMatKhau.Update();
                    txtThongBao.Text = "Đổi mật khẩu thành công !";
                    Response.Redirect(Request.Url.PathAndQuery);
                
            }
            else txtThongBao.Text = "Hai mật khẩu không khớp nhau";
        }
        catch (Exception ex)
        {
            txtThongBao.Text = ex.ToString();
        }
    }
}