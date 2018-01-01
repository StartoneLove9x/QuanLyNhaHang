<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatChiTietDonHang.aspx.cs" Inherits="Admin_CapNhatChiTietDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Cập nhật chi tiết đơn hàng"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Số hóa đơn"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="SoHoaDon" runat="server" DataSourceID="dataDonDatHang" DataTextField="SOHOADON" DataValueField="SOHOADON" Width="130px" AutoPostBack="True">
</asp:DropDownList>
    <br />
    <br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SOHOADON,MAMONAN" DataSourceID="dataChiTietDonHang" Width="473px" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="SOHOADON" HeaderText="Số hóa đơn" ReadOnly="True" SortExpression="SOHOADON" />
        <asp:BoundField DataField="MAMONAN" HeaderText="Mã món ăn" ReadOnly="True" SortExpression="MAMONAN" />
        <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" SortExpression="SOLUONG" />
        <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" NewText="Mới" SelectText="Chọn" ShowDeleteButton="True" ShowSelectButton="True" UpdateText="Cập nhật" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
    <br />
<asp:SqlDataSource ID="dataDonDatHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [DONDATHANG]"></asp:SqlDataSource>
<asp:SqlDataSource ID="dataChiTietDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [CHITIETDATHANG] WHERE [SOHOADON] = @SOHOADON AND [MAMONAN] = @MAMONAN" InsertCommand="INSERT INTO [CHITIETDATHANG] ([SOHOADON], [MAMONAN], [SOLUONG]) VALUES (@SOHOADON, @MAMONAN, @SOLUONG)" SelectCommand="SELECT * FROM [CHITIETDATHANG] WHERE ([SOHOADON] = @SOHOADON)" UpdateCommand="UPDATE [CHITIETDATHANG] SET [SOLUONG] = @SOLUONG WHERE [SOHOADON] = @SOHOADON AND [MAMONAN] = @MAMONAN">
    <DeleteParameters>
        <asp:Parameter Name="SOHOADON" Type="String" />
        <asp:Parameter Name="MAMONAN" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="SOHOADON" Type="String" />
        <asp:Parameter Name="MAMONAN" Type="String" />
        <asp:Parameter Name="SOLUONG" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="SoHoaDon" Name="SOHOADON" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="SOLUONG" Type="Int32" />
        <asp:Parameter Name="SOHOADON" Type="String" />
        <asp:Parameter Name="MAMONAN" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

