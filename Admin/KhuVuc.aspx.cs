using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_KhuVuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            dataKhuVuc.Insert();
            lbThongBao.Text = "Lưu thành công !";
        }
        catch (Exception ex)
        {
            lbThongBao.Text = ex.ToString();

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txtMa.Text = "";
        txtTen.Text = "";
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}