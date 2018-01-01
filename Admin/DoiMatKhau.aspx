<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DoiMatKhau.aspx.cs" Inherits="DoiMatKhauq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .textbox {
            display: block;
            margin-left: 50px;
        }

        .main-table {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:SqlDataSource ID="dataAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [ADMIN] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [ADMIN] ([USERNAME], [PASSWORD]) VALUES (@USERNAME, @PASSWORD)" SelectCommand="SELECT * FROM [ADMIN] WHERE (([USERNAME] = @USERNAME) AND ([PASSWORD] = @PASSWORD))" UpdateCommand="UPDATE [ADMIN] SET [PASSWORD] = @PASSWORD WHERE [USERNAME] = @USERNAME">
        <DeleteParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUserName" Name="USERNAME" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtpassmoi" Name="PASSWORD" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtpassmoi" Name="PASSWORD" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtUserName" Name="USERNAME" PropertyName="Text" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Đổi mật khẩu" Font-Size="30px"></asp:Label>
    <table cellpadding="0" cellspacing="0" width="400px">
       
        </tr>
        <tr class="main-table">
            <td style="width: 40%;" class="theten">Tên đăng nhập
            </td>
            <td class="dieukhien" style="margin-left: 1px; padding-left: 1px;">
                <asp:TextBox ID="txtUserName" runat="server" Width="97%"></asp:TextBox>
            </td>
        </tr>
        <tr class="main-table">
            <td style="width: 40%" class="theten">Mật khẩu
                        cũ</td>
            <td class="dieukhien">
                <asp:TextBox ID="txtPasswordcu" runat="server" Width="97%" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr class="main-table">
            <td style="width: 40%" class="theten">Mật khẩu mới
            </td>
            <td class="dieukhien">
                <asp:TextBox ID="txtpassmoi" runat="server" Width="97%" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr class="main-table">
            <td class="theten">Nhập lại mật khẩu mới</td>
            <td class="dieukhien">
                <asp:TextBox ID="txtnhappassmoi" runat="server" Width="97%" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr class="main-table">
            <td style="height: 38px; font-size: 16px; border: 0px; padding-top: 5px;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btDoiMK" runat="server" Text="Đổi mật khẩu"
                            OnClick="btDoiMK_Click" Width="116px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       
                       <div style="text-align: center; margin-top: 10px">
                           <asp:Label ID="lblThongbao" runat="server" CssClass="LabelThongbao" ForeColor="Red"></asp:Label>
                </div>
                &nbsp;&nbsp;
            </td>

        </tr>
        <%-- <tr>
                    </td><td align="center" style="padding-left: 10px; line-height: 28px" colspan="2">
                        <asp:Label ID="lblthongbao" runat="server" Font-Bold="true" Font-Size="12" ForeColor="Red" ></asp:Label>
                        <asp:HyperLink ID="hplQuenMK" runat="server" NavigateUrl="#href=abc">Quên 
                    mật khẩu?</asp:HyperLink>
                    </td>
                </tr>--%>
    </table>
    </>
</asp:Content>

