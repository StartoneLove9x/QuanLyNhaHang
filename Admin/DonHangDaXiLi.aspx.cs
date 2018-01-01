using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DonHangDaXiLi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtThanhTien.Text = total.ToString();
    }
    int total = 0;
    protected void gvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            total += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "THANHTIEN"));
        }
        else string.Format("{0:0,000}", txtThanhTien.Text = total.ToString());
    }
    protected void cmdXuLi_Click(object sender, EventArgs e)
    {
        try
        {
            Session["xuli"] = false;
            dataXuLiDonHang.Update();
            Response.Redirect(Request.Url.AbsolutePath);
        }

        catch (Exception ex)
        {

        }
    }
}