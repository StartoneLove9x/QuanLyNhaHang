using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
             
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // luu duong dan trang hiện tại khi nhấn nút đăng kí
        if (Request.UrlReferrer != null && Request.Url.PathAndQuery != ("/DangNhap.aspx"))
           Session["returnurl"] = Request.Url.AbsoluteUri;
        //Kiem tra xem khách hàng đăng nhập hay chưa
        if (Boolean.Parse(Session["UserLogin"].ToString()) == true)
        {
            hlDangKi.Visible = false;
            hlDangNhap.Visible = false;
            hlUser.Text = Session["UserName"].ToString();
            hlUser.NavigateUrl = "KhachHang?rq_USERNAME="+Session["UserID"].ToString();
            cmdLogout.Visible = true;

        }
        else hlUser.Visible = false;
            

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["UserLogin"] = false;
        Session["UserName"] = "";
        Session["UserID"] = "";
        hlDangKi.Visible = true;
        hlDangNhap.Visible = true;
        cmdLogout.Visible = false;
        hlUser.Visible = false;
        Response.Redirect(Request.Url.AbsoluteUri, false);
    }
}