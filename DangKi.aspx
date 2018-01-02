<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DangKi.aspx.cs" Inherits="DangKi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Đăng kí</title>
    <style>
        .container {
            margin-right: auto;
            margin-left: auto;
            padding-left: 15px;
            padding-right: 15px;
        }

        .wapper-register {
            width: 500px;
            margin-right: auto;
            margin-left: auto;
            margin-top: 100px;
            margin-bottom: 100px;
            padding: 30px 50px 50px 50px;
            background-color: #eee;
            border-radius: 10px;
        }

        .label-register {
            font-size: 17px;
            margin-bottom: 10px;
        }

        .login-lable {
            font-size: 25px;
            padding-bottom: 20px;
            text-align: center;
        }

        .register {
            margin-bottom: 6px;
            margin-top: 6px;
        }

        .button-register {
            background-color: #5cb85c;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="wapper-register">
            <div>
                <div class="login-lable">
                    <asp:Label ID="Label6" runat="server" Text="Đăng kí" CssClass="login-lable register"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [KHACHHANG] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [KHACHHANG] ([USERNAME], [TENKH], [PASSWORD], [DIENTHOAI], [EMAIL]) VALUES (@USERNAME, @TENKH, @PASSWORD, @DIENTHOAI, @EMAIL)" SelectCommand="SELECT * FROM [KHACHHANG]" UpdateCommand="UPDATE [KHACHHANG] SET [TENKH] = @TENKH, [PASSWORD] = @PASSWORD, [DIENTHOAI] = @DIENTHOAI, [EMAIL] = @EMAIL WHERE [USERNAME] = @USERNAME">
                        <DeleteParameters>
                            <asp:Parameter Name="USERNAME" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtTaiKhoan" Name="USERNAME" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtTen" Name="TENKH" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtMatKhau" Name="PASSWORD" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDienThoai" Name="DIENTHOAI" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="TextBox1" Name="EMAIL" PropertyName="Text" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TENKH" Type="String" />
                            <asp:Parameter Name="PASSWORD" Type="String" />
                            <asp:Parameter Name="DIENTHOAI" Type="Int32" />
                            <asp:Parameter Name="EMAIL" Type="String" />
                            <asp:Parameter Name="USERNAME" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <asp:Label ID="Label1" runat="server" Text="Họ và tên" CssClass="label-register register"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTen" ErrorMessage="Bạn chưa nhập họ tên" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
                &nbsp;<asp:TextBox ID="txtTen" runat="server" CssClass="form-control register"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Tài khoản" CssClass="label-register register"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTaiKhoan" ErrorMessage="Bạn chưa nhập tài khoản" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTaiKhoan" runat="server" CssClass="form-control register"></asp:TextBox>

                <asp:Label ID="Label4" runat="server" Text="Mật khẩu" CssClass="label-register register"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMatKhau" ErrorMessage="Bạn chưa nhập mật khẩu" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control register" TextMode="Password"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" Text="Nhập lại mật khẩu" CssClass="label-register register" TextMode="Password"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMatKhau2" ErrorMessage="Bạn chưa nhập lại mật khẩu" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtMatKhau2" runat="server" CssClass="form-control register" TextMode="Password"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" Text="Điện thoại" CssClass="label-register register"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDienThoai" ErrorMessage="Bạn chưa nhập số điện thoại" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control register"></asp:TextBox>
                <asp:Label ID="Label7" runat="server" Text="Email" CssClass="label-register register"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control register"></asp:TextBox>
                <asp:Button ID="btDangNhap" runat="server" Text="Đăng kí" OnClick="btDangNhap_Click" CssClass="btn btn-lg btn-primary btn-block login button-register register" />

                <br />
                <asp:Label ID="txtThongBao" runat="server"></asp:Label>
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />

            </div>


        </div>
    </div>
</asp:Content>

