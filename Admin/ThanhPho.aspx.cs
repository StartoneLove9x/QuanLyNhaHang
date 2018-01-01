using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ThanhPho : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Insert();
            lbThongBao.Text = "Lưu thành công !";
        }
        catch (Exception ex)
        {
            lbThongBao.Text = ex.ToString();

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txtMaLoai.Text = "";
        txtTenLoai.Text = "";
    }
}