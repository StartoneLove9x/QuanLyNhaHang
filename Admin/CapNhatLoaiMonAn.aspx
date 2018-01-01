<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatLoaiMonAn.aspx.cs" Inherits="Admin_CapNhatLoaiMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Cập nhật loại món ăn"></asp:Label>
    </div>
    <asp:SqlDataSource ID="dataCapNhatLoaiMonAn" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [LOAIMONAN] WHERE [MALOAI] = @MALOAI" InsertCommand="INSERT INTO [LOAIMONAN] ([MALOAI], [TENLOAI]) VALUES (@MALOAI, @TENLOAI)" SelectCommand="SELECT * FROM [LOAIMONAN]" UpdateCommand="UPDATE [LOAIMONAN] SET [TENLOAI] = @TENLOAI WHERE [MALOAI] = @MALOAI" OnSelecting="dataCapNhatLoaiMonAn_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="MALOAI" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MALOAI" Type="String" />
            <asp:Parameter Name="TENLOAI" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENLOAI" Type="String" />
            <asp:Parameter Name="MALOAI" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MALOAI" DataSourceID="dataCapNhatLoaiMonAn" ForeColor="#333333" GridLines="None" Width="389px" AllowPaging="True" PageSize="30">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate><%#Container.DataItemIndex +1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MALOAI" HeaderText="MÃ LOẠI" ReadOnly="True" SortExpression="MALOAI" />
            <asp:BoundField DataField="TENLOAI" HeaderText="TÊN LOẠI" SortExpression="TENLOAI" />
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

