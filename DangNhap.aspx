<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Đăng nhập</title>
    <style>
        .login-title {
            color: #555;
            font-size: 18px;
            font-weight: 400;
            display: block;
        }

        .padding1 {
            margin-top: 15px;
        }

        .login {
            font-size: 21px;
            margin-top: 5px;
            max-width: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap-login {
            padding: 50px 20px 50px 20px;
            margin: 50px auto 50px auto;
            max-width: 350px;
            border-radius: 13px;
            background-color: #eee;
        }

        .login-lable {
            font-size: 25px;
            padding-bottom: 20px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="wrap-login">

            <div class="login-lable">
                <asp:Label ID="Label1" runat="server" Text="Đăng nhập" CssClass="login-lable"></asp:Label>
            </div>
            <%--<label for="inputEmail login" class="sr-only">Tài khoản</label>--%>
            <asp:TextBox ID="txtUserName" runat="server" Width="96%" CssClass="form-control login"></asp:TextBox>


            <asp:TextBox ID="txtPassword" runat="server" Width="96%" TextMode="Password" CssClass="form-control login"></asp:TextBox>
            <asp:Button ID="btDangNhap" runat="server" Text="Đăng nhập" OnClick="btDangNhap_Click" CssClass="btn btn-lg btn-primary btn-block login" />


            <asp:Label ID="txtThongBao" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>

</asp:Content>

