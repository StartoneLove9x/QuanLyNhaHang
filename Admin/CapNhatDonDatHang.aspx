<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatDonDatHang.aspx.cs" Inherits="Admin_CapNhatDonDatHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Cập nhật đơn hàng"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [DONDATHANG] WHERE [SOHOADON] = @SOHOADON" InsertCommand="INSERT INTO [DONDATHANG] ([SOHOADON], [NGAYDATHANG], [USERNAME], [NGUOINHANHANG], [SODIENTHOAI], [DIADIEM], [XULI], [GHICHU]) VALUES (@SOHOADON, @NGAYDATHANG, @USERNAME, @NGUOINHANHANG, @SODIENTHOAI, @DIADIEM, @XULI, @GHICHU)" SelectCommand="SELECT * FROM [DONDATHANG]" UpdateCommand="UPDATE [DONDATHANG] SET [NGAYDATHANG] = @NGAYDATHANG, [USERNAME] = @USERNAME, [NGUOINHANHANG] = @NGUOINHANHANG, [SODIENTHOAI] = @SODIENTHOAI, [DIADIEM] = @DIADIEM, [XULI] = @XULI, [GHICHU] = @GHICHU WHERE [SOHOADON] = @SOHOADON">
            <DeleteParameters>
                <asp:Parameter Name="SOHOADON" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SOHOADON" Type="String" />
                <asp:Parameter Name="NGAYDATHANG" Type="DateTime" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="NGUOINHANHANG" Type="String" />
                <asp:Parameter Name="SODIENTHOAI" Type="String" />
                <asp:Parameter Name="DIADIEM" Type="String" />
                <asp:Parameter Name="XULI" Type="Boolean" />
                <asp:Parameter Name="GHICHU" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NGAYDATHANG" Type="DateTime" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="NGUOINHANHANG" Type="String" />
                <asp:Parameter Name="SODIENTHOAI" Type="String" />
                <asp:Parameter Name="DIADIEM" Type="String" />
                <asp:Parameter Name="XULI" Type="Boolean" />
                <asp:Parameter Name="GHICHU" Type="String" />
                <asp:Parameter Name="SOHOADON" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SOHOADON" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"   Width="888px" AllowPaging="True" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CheckBoxField DataField="XULI" HeaderText="Xử lí" SortExpression="XULI" />
            <asp:BoundField DataField="SOHOADON" HeaderText="Số Hóa Đơn" ReadOnly="True" SortExpression="SOHOADON" />
            <asp:BoundField DataField="NGAYDATHANG" HeaderText="Ngày đặt hàng" SortExpression="NGAYDATHANG" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
            <asp:BoundField DataField="NGUOINHANHANG" HeaderText="Người nhận hàng" SortExpression="NGUOINHANHANG" />
            <asp:BoundField DataField="SODIENTHOAI" HeaderText="Số điện thoại" SortExpression="SODIENTHOAI" />
            <asp:BoundField DataField="DIADIEM" HeaderText="Địa điểm nhận" SortExpression="DIADIEM" >
            <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="GHICHU" HeaderText="Ghi chú" SortExpression="GHICHU" >
            <ItemStyle Width="120px" />
            </asp:BoundField>
            <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" NewText="Mới" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
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

