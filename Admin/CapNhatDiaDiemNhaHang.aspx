<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatDiaDiemNhaHang.aspx.cs" Inherits="Admin_CapNhatDiaDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Quản lí địa điểm"></asp:Label>
<asp:SqlDataSource ID="dataDiaDiemNhaHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [CHITIETNHAHANG] WHERE [MANH] = @MANH AND [MAKV] = @MAKV" InsertCommand="INSERT INTO [CHITIETNHAHANG] ([MANH], [MAKV], [DIACHI], [NGAYTHEM]) VALUES (@MANH, @MAKV, @DIACHI, @NGAYTHEM)" SelectCommand="SELECT * FROM [CHITIETNHAHANG]" UpdateCommand="UPDATE [CHITIETNHAHANG] SET [DIACHI] = @DIACHI, [NGAYTHEM] = @NGAYTHEM WHERE [MANH] = @MANH AND [MAKV] = @MAKV">
    <DeleteParameters>
        <asp:Parameter Name="MANH" Type="String" />
        <asp:Parameter Name="MAKV" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MANH" Type="String" />
        <asp:Parameter Name="MAKV" Type="String" />
        <asp:Parameter Name="DIACHI" Type="String" />
        <asp:Parameter Name="NGAYTHEM" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="DIACHI" Type="String" />
        <asp:Parameter Name="NGAYTHEM" Type="DateTime" />
        <asp:Parameter Name="MANH" Type="String" />
        <asp:Parameter Name="MAKV" Type="String" />
    </UpdateParameters>
    </asp:SqlDataSource>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MANH,MAKV" DataSourceID="dataDiaDiemNhaHang" ForeColor="#333333" GridLines="None" Width="631px" >
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="STT">
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate><%#Container.DataItemIndex +1 %></ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="MANH" HeaderText="Mã nhà hàng" ReadOnly="True" SortExpression="MANH" HeaderStyle-CssClass="text-center"  >
<HeaderStyle CssClass="text-center"></HeaderStyle>
        </asp:BoundField>
        <asp:BoundField DataField="MAKV" HeaderText="Mã khu vực" ReadOnly="True" SortExpression="MAKV" HeaderStyle-CssClass="text-center"  >
<HeaderStyle CssClass="text-center"></HeaderStyle>
        </asp:BoundField>
        <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" SortExpression="DIACHI" HeaderStyle-CssClass="text-center" >
<HeaderStyle CssClass="text-center"></HeaderStyle>
        </asp:BoundField>
        <asp:BoundField DataField="NGAYTHEM" HeaderText="Ngày thêm" SortExpression="NGAYTHEM" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" InsertText="Thêm" NewText="Mới" SelectText="Chọn" />
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
</asp:Content>

