using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QLQuangCao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            Session["urlhinhanh"] = "../Images/QuangCao/" + FileUpload1.FileName;


            uploadImage();
            SqlDataSource1.Insert();
            lbThongBao.Text = "Lưu thành công !";
           
        }
        catch (Exception ex)
        {
            lbThongBao.Text = "Lỗi !" + ex.Message;
        }
    }

    protected void txtMaQC_TextChanged(object sender, EventArgs e)
    {

        txtMaQC.Text = txtMaQC.Text.ToUpper();

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txtMaQC.Text = "";
        txtLienKet.Text = "";
        txtMoTa.Text = "";
        Image1.ImageUrl = "";
        lbThongBao.Text = "";

    }
    private void uploadImage()
    {
        if (Page.IsValid && FileUpload1.HasFile)
        {


            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string pathFile = Server.MapPath("~/Images/QuangCao/") + filename;
                FileUpload1.SaveAs(pathFile);

                Image1.ImageUrl = "~/Images/QuangCao/" + filename;

            }
            catch (Exception ex)
            {
                lbThongBao.Text = ex.ToString();
            }

        }
    }
}