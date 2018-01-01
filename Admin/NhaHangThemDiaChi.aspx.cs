using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_NhaHangThemDiaChi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            dataChiTietNhaHang.Insert();
            lbThongBao.Text = "Thêm thành công !";
        }
        catch (Exception ex)
        {
            lbThongBao.Text = "<font color=red>Lỗi " + ex.ToString() + "</font>";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txtDiaChi.Text = ""; 
    }
}