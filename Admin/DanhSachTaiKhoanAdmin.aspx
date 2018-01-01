<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DanhSachTaiKhoanAdmin.aspx.cs" Inherits="Admin_DanhSachTaiKhoanAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Danh sách tài khoản Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <br />
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Danh sách tài khoản Admin"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [ADMIN] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [ADMIN] ([USERNAME], [PASSWORD]) VALUES (@USERNAME, @PASSWORD)" SelectCommand="SELECT * FROM [ADMIN]" UpdateCommand="UPDATE [ADMIN] SET [PASSWORD] = @PASSWORD WHERE [USERNAME] = @USERNAME">
        <DeleteParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="USERNAME" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERNAME" DataSourceID="SqlDataSource1" Width="362px">
        <Columns>
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" ReadOnly="True" SortExpression="USERNAME" />
            <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
            <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" InsertText="Thêm" NewText="Mới" SelectText="Chọn" ShowDeleteButton="True" UpdateText="Cập nhật">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>

</asp:Content>

