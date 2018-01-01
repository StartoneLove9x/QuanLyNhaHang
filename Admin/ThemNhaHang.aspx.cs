using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QLNhaHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Luu_Click(object sender, EventArgs e)
    {
      

        try
        {
            Session["urlhinhanh"] = "../Images/NhaHang/" + FileUpload1.FileName;
           
            dataNhaHang.Insert();
            lbThongBao.Text = "Lưu thành công !";
            uploadImage();
        }
        catch (Exception ex)
        {
            lbThongBao.Text = "Lỗi "+ex.ToString();
        }
    }

    private void uploadImage()
    {
        if (Page.IsValid && FileUpload1.HasFile)
        {


            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string pathFile = Server.MapPath("~/Images/NhaHang/") + filename;
                FileUpload1.SaveAs(pathFile);
                
                Image1.ImageUrl = "~/Images/NhaHang/" + filename;

            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Lỗi " + ex.ToString();
            }




        }
    }


    protected void Reset_Click(object sender, EventArgs e)
    {
        txtDienThoai.Text = "";
        txtEmail.Text = "";
        txtMa.Text = "";
        txtTen.Text = "";
        txtThoiGianGiaoHang.Text = "";
        txtThoiGianPhucVu.Text = "";
    }
    protected void txtMa_TextChanged(object sender, EventArgs e)
    {
        txtMa.Text = txtMa.Text.ToUpper();

    }
}