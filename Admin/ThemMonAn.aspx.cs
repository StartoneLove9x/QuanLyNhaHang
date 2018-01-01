using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MonAn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void uploadImage()
    {
        if (Page.IsValid && FileUpload1.HasFile)
        {


            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string pathFile = Server.MapPath("~/Images/MonAN/") + filename;
                FileUpload1.SaveAs(pathFile);

                Image1.ImageUrl = "~/Images/MonAn/" + filename;

            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Lỗi " + ex.ToString();
            }




        }
    }


    protected void txtMa_TextChanged(object sender, EventArgs e)
    {
        txtMa.Text = txtMa.Text.ToUpper();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        txtMa.Text = "";
        txtTen.Text = "";
        txtNguyenLieu.Text = "";

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.FileName == "../Images/MonAn/")
                Session["urlhinhanh"] = "../Images/icons/icon-food.png";
            else Session["urlhinhanh"] = "../Images/MonAn/" + FileUpload1.FileName;
            SqlDataMonAn.Insert();
            lbThongBao.Text = "Lưu thành công !";
            uploadImage();
        }
        catch (Exception ex)
        {
            lbThongBao.Text = "Lỗi " + ex.ToString();
        }
    }
}


