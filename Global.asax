<%@ Application Language="C#" %>
<%@ Import Namespace="DatMonOnline" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        AuthConfig.RegisterOpenAuth();
        RouteConfig.RegisterRoutes(RouteTable.Routes);
       
        
    }
    
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }
    void Session_Start(object sender, EventArgs e)
    {
        Session.Timeout = 30;
        Session.Add("Login", "false");
        Session.Add("them", "0");
        Session.Add("UserLogin", "false");
        Session.Add("UserID", "");
        Session.Add("UserName", "");
        Session.Add("them", "0");
        Session.Add("urlTrangTruoc", "TrangChu.aspx");
        Session.Add("returnurl", "TrangChu.aspx");
        Session["cart"] = null;
        Session.Add("URLPageChonMon", "");
       
    
        
    
    }
    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
</script>
