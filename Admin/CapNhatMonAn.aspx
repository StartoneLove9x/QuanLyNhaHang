<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatMonAn.aspx.cs" Inherits="Admin_CapNhatMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Cập nhật món ăn</title>
    <style>

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    
    <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Cập nhật  món ăn"></asp:Label>
    </div>
    <asp:SqlDataSource ID="dataCapNhatMonAn" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [MONAN] WHERE [MAMONAN] = @MAMONAN" InsertCommand="INSERT INTO [MONAN] ([MAMONAN], [MALOAI], [MANH], [TENMONAN], [URLHINHANH], [NGUYENLIEU], [GIA]) VALUES (@MAMONAN, @MALOAI, @MANH, @TENMONAN, @URLHINHANH, @NGUYENLIEU, @GIA)" SelectCommand="SELECT * FROM [MONAN]" UpdateCommand="UPDATE [MONAN] SET [MALOAI] = @MALOAI, [MANH] = @MANH, [TENMONAN] = @TENMONAN, [URLHINHANH] = @URLHINHANH, [NGUYENLIEU] = @NGUYENLIEU, [GIA] = @GIA WHERE [MAMONAN] = @MAMONAN">
        <DeleteParameters>
            <asp:Parameter Name="MAMONAN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MAMONAN" Type="String" />
            <asp:Parameter Name="MALOAI" Type="String" />
            <asp:Parameter Name="MANH" Type="String" />
            <asp:Parameter Name="TENMONAN" Type="String" />
            <asp:Parameter Name="URLHINHANH" Type="String" />
            <asp:Parameter Name="NGUYENLIEU" Type="String" />
            <asp:Parameter Name="GIA" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MALOAI" Type="String" />
            <asp:Parameter Name="MANH" Type="String" />
            <asp:Parameter Name="TENMONAN" Type="String" />
            <asp:Parameter Name="URLHINHANH" Type="String" />
            <asp:Parameter Name="NGUYENLIEU" Type="String" />
            <asp:Parameter Name="GIA" Type="Double" />
            <asp:Parameter Name="MAMONAN" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MAMONAN" DataSourceID="dataCapNhatMonAn" ForeColor="#333333" GridLines="None" Width="890px" AllowPaging="True" PageSize="30">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate><%#Container.DataItemIndex +1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MAMONAN" HeaderText="Mã món ăn" ReadOnly="True" SortExpression="MAMONAN" />
            <asp:BoundField DataField="MALOAI" HeaderText="Mã loại" SortExpression="MALOAI" />
            <asp:BoundField DataField="MANH" HeaderText="Mã nhà hàng" SortExpression="MANH" />
            <asp:BoundField DataField="TENMONAN" HeaderText="Tên món ăn" SortExpression="TENMONAN" />
            <asp:BoundField DataField="NGUYENLIEU" HeaderText="Nguyên liệu" SortExpression="NGUYENLIEU" >
            <ItemStyle Width="240px" />
            </asp:BoundField>
            <asp:BoundField DataField="GIA" HeaderText="Giá" SortExpression="GIA" />
            <asp:ImageField DataImageUrlField="URLHINHANH" HeaderText="Hình ảnh" ControlStyle-Width="100px">
<ControlStyle Width="100px"></ControlStyle>
            </asp:ImageField>
            <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" InsertText="Mới" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
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

