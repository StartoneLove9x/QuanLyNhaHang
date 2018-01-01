<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThemTaiKhoanAdmin.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng kí tài khoản</title>
    <link href="CSS/adminstyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 34px;
            background-color: #5f9ae0;
            font-size: 16px;
            font-weight: bold;
        }
        td
        {
            border: 0px;
        }
        .style2
        {
            width: 370px;
        }
        .style3
        {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <table cellpadding="0" cellspacing="0" border="1px" class="style2">
                <tr>
                    <td colspan="2" class="style1" align="center">
                        Đăng kí tài khoản
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 30px" align="center">
                        <asp:SqlDataSource ID="dataAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [ADMIN] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [ADMIN] ([USERNAME], [PASSWORD]) VALUES (@USERNAME, @PASSWORD)" SelectCommand="SELECT * FROM [ADMIN]" UpdateCommand="UPDATE [ADMIN] SET [PASSWORD] = @PASSWORD WHERE [USERNAME] = @USERNAME">
                            <DeleteParameters>
                                <asp:Parameter Name="USERNAME" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtUserName" Name="USERNAME" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPassword2" Name="PASSWORD" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="PASSWORD" Type="String" />
                                <asp:Parameter Name="USERNAME" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 10px; line-height: 28px; width: 40%;">
                        Tên đăng nhập
                    </td>
                    <td align="left" style="line-height: 28px; padding-left: 3px;">
                        <asp:TextBox ID="txtUserName" runat="server" Width="88%" CssClass="style3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập" ControlToValidate="txtUserName">(*)</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 10px; line-height: 28px">
                        Mật khẩu
                    </td>
                    <td align="left" style="line-height: 28px; padding-left: 3px;">
                        <asp:TextBox ID="txtPassword" runat="server" Width="88%" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu " ControlToValidate="txtPassword">(*)</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td align="left" style="padding-left: 10px; line-height: 28px">
                       Nhập lại mật khẩu
                    </td>
                    <td align="left" style="line-height: 28px; padding-left: 3px;">
                        <asp:TextBox ID="txtPassword2" runat="server" Width="88%" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn chưa nhập lại mật khẩu" ControlToValidate="txtPassword2">(*)</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 38px" colspan="2" align="left" >
                        <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>
                        <asp:Button ID="btDangNhap" runat="server" Text="Đăng kí" OnClick="btDangKi_Click" />
                        <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>
                    </td>
            
                </tr>
                <tr>
                    </td><td align="center" style="padding-left: 10px; line-height: 28px" colspan="2">
                        <asp:Label ID="lblthongbao" runat="server" Font-Bold="true" Font-Size="12" ForeColor="Red" ></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />
                    </td>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
