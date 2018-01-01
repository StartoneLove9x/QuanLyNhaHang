<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="KhachHang.aspx.cs" Inherits="Admin_KhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .textbox {
            display: block;
            margin-left: 50px;
        }

        .auto-style1 {
        }
        .auto-style2 {
            width: 101px;
        }
        .auto-style3 {
            width: 113px;
            height: 25px;
        }
        .auto-style4 {
            height: 25px;
        }
        .auto-style5 {
            width: 74px;
        }
        .main-table{
             height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Cập nhật khách hàng"></asp:Label>
    </div>
    <asp:SqlDataSource ID="dataCapNhatKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [KHACHHANG] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [KHACHHANG] ([USERNAME], [TENKH], [PASSWORD], [DIENTHOAI], [EMAIL]) VALUES (@USERNAME, @TENKH, @PASSWORD, @DIENTHOAI, @EMAIL)" SelectCommand="SELECT * FROM [KHACHHANG]" UpdateCommand="UPDATE [KHACHHANG] SET [TENKH] = @TENKH, [PASSWORD] = @PASSWORD, [DIENTHOAI] = @DIENTHOAI, [EMAIL] = @EMAIL WHERE [USERNAME] = @USERNAME">
        <DeleteParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="TENKH" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="DIENTHOAI" Type="Int32" />
            <asp:Parameter Name="EMAIL" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENKH" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="DIENTHOAI" Type="Int32" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="USERNAME" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="USERNAME" DataSourceID="dataCapNhatKhachHang" ForeColor="#333333" GridLines="None" Width="900px" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="USERNAME" HeaderText="TÀI KHOẢN" ReadOnly="True" SortExpression="USERNAME" />
            <asp:BoundField DataField="TENKH" HeaderText="HỌ VÀ TÊN" SortExpression="TENKH" />
            <asp:BoundField DataField="PASSWORD" HeaderText="MẬT KHẨU" SortExpression="PASSWORD" />
            <asp:BoundField DataField="DIENTHOAI" HeaderText="ĐIỆN THOẠI" SortExpression="DIENTHOAI" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" InsertText="Thêm" NewText="Mới" SelectText="Chọn" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" UpdateText="Cập nhật">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>

