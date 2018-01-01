<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatNhaHang.aspx.cs" Inherits="Admin_CapNhatNhaHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        .hinhanh{
            width:120px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Cập nhật nhà hàng"></asp:Label>
    </div>
    <asp:SqlDataSource ID="dataCapNhatNhaHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [NHAHANG] WHERE [MANH] = @MANH" InsertCommand="INSERT INTO [NHAHANG] ([MANH], [TENNH], [DIENTHOAI], [EMAIL], [THOIGIANPHUCVU], [THOIGIANGIAOHANG], [URLHINHANH]) VALUES (@MANH, @TENNH, @DIENTHOAI, @EMAIL, @THOIGIANPHUCVU, @THOIGIANGIAOHANG, @URLHINHANH)" SelectCommand="SELECT * FROM [NHAHANG]" UpdateCommand="UPDATE [NHAHANG] SET [TENNH] = @TENNH, [DIENTHOAI] = @DIENTHOAI, [EMAIL] = @EMAIL, [THOIGIANPHUCVU] = @THOIGIANPHUCVU, [THOIGIANGIAOHANG] = @THOIGIANGIAOHANG, [URLHINHANH] = @URLHINHANH WHERE [MANH] = @MANH">
        <DeleteParameters>
            <asp:Parameter Name="MANH" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MANH" Type="String" />
            <asp:Parameter Name="TENNH" Type="String" />
            <asp:Parameter Name="DIENTHOAI" Type="Int32" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="THOIGIANPHUCVU" Type="String" />
            <asp:Parameter Name="THOIGIANGIAOHANG" Type="String" />
            <asp:Parameter Name="URLHINHANH" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENNH" Type="String" />
            <asp:Parameter Name="DIENTHOAI" Type="Int32" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="THOIGIANPHUCVU" Type="String" />
            <asp:Parameter Name="THOIGIANGIAOHANG" Type="String" />
            <asp:Parameter Name="URLHINHANH" Type="String" />
            <asp:Parameter Name="MANH" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MANH" DataSourceID="dataCapNhatNhaHang" ForeColor="#333333" GridLines="None" Width="900px" AllowPaging="True" BorderStyle="None" PageSize="30">
        <AlternatingRowStyle BackColor="White" BorderStyle="None" />
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate><%#Container.DataItemIndex +1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MANH" HeaderText="MÃ" ReadOnly="True" SortExpression="MANH"  HeaderStyle-CssClass="text-center" >
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="TENNH" HeaderText="TÊN" SortExpression="TENNH" HeaderStyle-CssClass="text-center"  >
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />

<HeaderStyle CssClass="text-center"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DIENTHOAI" HeaderText="ĐIỆN THOẠI" SortExpression="DIENTHOAI" HeaderStyle-CssClass="text-center"  >
<HeaderStyle CssClass="text-center"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" HeaderStyle-CssClass="text-center" >
<HeaderStyle CssClass="text-center"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="THOIGIANPHUCVU" HeaderText="THỜI GIAN PHỤC VỤ" SortExpression="THOIGIANPHUCVU" HeaderStyle-CssClass="text-center"  >
<HeaderStyle CssClass="text-center"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="THOIGIANGIAOHANG" HeaderText="THỜI GIAN GIAO HÀNG" SortExpression="THOIGIANGIAOHANG" HeaderStyle-CssClass="text-center"  >
<HeaderStyle CssClass="text-center"></HeaderStyle>
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="URLHINHANH" HeaderText="HÌNH ẢNH" ControlStyle-CssClass="hinhanh" HeaderStyle-CssClass="text-center" >
<ControlStyle CssClass="hinhanh"></ControlStyle>

<HeaderStyle CssClass="text-center"></HeaderStyle>
            </asp:ImageField>
            <asp:CommandField CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" InsertText="Thêm" NewText="Mới" SelectText="Chọn" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" UpdateText="Cập nhật">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" BorderStyle="None" />
        <EmptyDataRowStyle BorderStyle="None" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BorderStyle="None" />
        <RowStyle BorderStyle="None" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>

