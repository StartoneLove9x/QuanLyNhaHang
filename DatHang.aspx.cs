using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThanhToan : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //NẾu khách hàng chưa đăng nhập 
        if (bool.Parse(Session["UserLogin"].ToString()) == false)
            Response.Redirect("DangNhap.aspx");

        if (!IsPostBack)
        {
            DataTable cart = new DataTable();
            if (Session["cart"] == null)
            {
                //Nếu chưa có giỏ hàng, tạo giỏ hàng thông qua DataTable với 4 cột chính
                //ID (Mã sản phẩm), Name (Tên sản phẩm)
                //Price (Giá tiền), Quantity (Số lượng)

                cart.Columns.Add("ID");
                cart.Columns.Add("Name");
                cart.Columns.Add("Price");
                cart.Columns.Add("Quantity");
                //Sau khi tạo xong thì lưu lại vào session
                Session["cart"] = cart;
            }
            else
            {
                //Lấy thông tin giỏ hàng từ Session["cart"]
                cart = Session["cart"] as DataTable;
            }
            if (!String.IsNullOrEmpty(Request.QueryString["action"]))
            {
                if (Request.QueryString["action"] == "add")
                {
                    string id = Request.QueryString["id"];
                    string name = Request.QueryString["name"];
                    string price = Request.QueryString["price"];
                    //Kiểm tra xem đã có sản phẩm trong giỏ hàng chưa ?
                    //Nếu chưa thì thêm bản ghi mới vào giỏ hàng với số lượng Quantity là 1
                    //Nếu có thì tăng quantity lên 1
                    bool isExisted = false;
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["ID"].ToString() == id)
                        {
                            dr["Quantity"] = int.Parse(dr["Quantity"].ToString()) + 1;
                            isExisted = true;
                            break;
                        }
                    }
                    if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                    {
                        DataRow dr = cart.NewRow();
                        dr["ID"] = id;
                        dr["Name"] = name;
                        dr["Price"] = price;
                        dr["Quantity"] = 1;
                        cart.Rows.Add(dr);
                    }
                    //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                    Session["cart"] = cart;
                    //Quay lai trang chu
                    Response.Redirect(Session["URLPageChonMon"].ToString());
                }
            }

            //Hiện thị thông tin giỏ hàng
            GridView1.DataSource = cart;
            GridView1.DataBind();
            tinhtong(cart);
        }


    }

    private void tinhtong(DataTable cart)
    {
        int tong = 0;
        foreach (DataRow dr in cart.Rows)
        {

            tong = tong + (int.Parse(dr["Quantity"].ToString()) * int.Parse(dr["Price"].ToString()));


        }
        txtThongBao.Text = tong.ToString();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //Sửa thông tin giỏ hàng
        string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
        TextBox quantity = GridView1.Rows[e.NewSelectedIndex].Cells[2].FindControl("txtQuantity")
            as TextBox;
        //Duyệt qua Giỏ hàng và tăng số lượng
        DataTable cart = Session["cart"] as DataTable;
        foreach (DataRow dr in cart.Rows)
        {
            //Kiểm tra mã sản phẩm phù hợp để gán số lượng khách hàng mua
            if (dr["ID"].ToString() == id)
            {
                dr["Quantity"] = int.Parse(quantity.Text);
                break;
            }
        }

        //Lưu lại vào Session
        Session["cart"] = cart;
        //Hiển thị giỏ hàng với thông tin mới
        GridView1.DataSource = cart;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Xóa sản phẩm khỏi giỏ hàng
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        //Duyệt qua Giỏ hàng và xóa sản phẩm phù hợp
        DataTable cart = Session["cart"] as DataTable;
        foreach (DataRow dr in cart.Rows)
        {
            //Kiểm tra mã sản phẩm phù hợp để tăng số lượng
            if (dr["ID"].ToString() == id)
            {
                dr.Delete();
                break;
            }
        }
        //Lưu lại vào Session
        Session["cart"] = cart;
        //Hiển thị giỏ hàng với thông tin mới
        GridView1.DataSource = cart;
        GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable cart = new DataTable();
        cart = Session["cart"] as DataTable;
        tinhtong(cart);
    }



    private int laySoHoaDon()
    {
        string strconm = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        SqlConnection dbconnt = new SqlConnection(strconm);
        try
        {
            dbconnt.Open();


        }
        catch
        {

        }
        SqlCommand execute = new SqlCommand("Select SOHOADON From DONDATHANG ", dbconnt);
        SqlDataReader reader = execute.ExecuteReader();
        DataTable table = new DataTable();
        table.Load(reader);
        int max = 0;
        foreach (DataRow dr in table.Rows)
        {

            if (max < int.Parse(dr["SOHOADON"].ToString()))
                max = int.Parse(dr["SOHOADON"].ToString());
        }
        return max + 1;
        try
        {
            dbconnt.Close();


        }
        catch
        {

        }
        return 0;

    }

    protected void cmdDathang_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtHoTen.Text != "" & txtDiaDiem.Text != "" & txtSoDienThoai.Text != "")
            {
                Session["ngaydathang"] = DateTime.Now.ToString();
                Session["sohoadon"] = laySoHoaDon();
                dataDonDatHang.Insert();
                ThemChiTietHoaDon(int.Parse(Session["sohoadon"].ToString()));
                lblThongBao.Text = "Đặt hàng thành công !";
            }
            else
                lblThongBao.Text = "Không thể đặt hàng bạn nhập thiếu thông tin !";
        }
        catch (Exception ex)
        {
        }
    }




    private void ThemChiTietHoaDon(int i)
    {
        string strconm = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        SqlConnection dbconnt = new SqlConnection(strconm);
        try
        {
            dbconnt.Open();
            int r = 0;
            DataTable cart = Session["cart"] as DataTable;
            SqlCommand execute = null;
            foreach (DataRow dr in cart.Rows)
            {
                r++;
                execute = new SqlCommand("INSERT INTO [CHITIETDATHANG] ([SOHOADON], [MAMONAN], [SOLUONG]) VALUES ('" + i + "','"
+ dr["ID"].ToString() + "','" + dr["Quantity"].ToString() + "')", dbconnt);
                execute.CommandType = CommandType.Text;
                execute.ExecuteNonQuery();


            }

            dbconnt.Close();
        }
        catch
        {

        }


    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["cart"] = null;
        Response.Redirect(Request.Url.AbsolutePath);
    }
}