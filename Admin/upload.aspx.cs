using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    bool CheckFileType(string fileName)
    {

        string ext = Path.GetExtension(fileName);
        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && FileUpload1.HasFile)
        {

          
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    string pathFile= Server.MapPath("~/Images/NhaHang/") + filename;
                    FileUpload1.SaveAs(pathFile);
                    Label2.Text = "Upload status: File uploaded!";
                    Image1.ImageUrl = "~/Images/NhaHang/" + filename;
                 
                }
                catch (Exception ex)
                {
                   
                }
          


        
        }
    }
}