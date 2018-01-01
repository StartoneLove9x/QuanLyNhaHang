<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Capnhat_Nguoidung.aspx.cs" Inherits="Admin_Capnhat_Nguoidung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [KHACHHANG] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [KHACHHANG] ([USERNAME], [TENKH], [PASSWORD], [DIENTHOAI], [EMAIL]) VALUES (@USERNAME, @TENKH, @PASSWORD, @DIENTHOAI, @EMAIL)" SelectCommand="SELECT * FROM [KHACHHANG]" UpdateCommand="UPDATE [KHACHHANG] SET [TENKH] = @TENKH, [PASSWORD] = @PASSWORD, [DIENTHOAI] = @DIENTHOAI, [EMAIL] = @EMAIL WHERE [USERNAME] = @USERNAME">
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
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="USERNAME" DataSourceID="SqlDataSource1" PageSize="50">
    <Columns>
        <asp:TemplateField HeaderText="STT">
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate><%#Container.DataItemIndex +1 %></ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" ReadOnly="True" SortExpression="USERNAME" />
        <asp:BoundField DataField="TENKH" HeaderText="TENKH" SortExpression="TENKH" />
        <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
        <asp:BoundField DataField="DIENTHOAI" HeaderText="DIENTHOAI" SortExpression="DIENTHOAI" />
        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
    </Columns>
</asp:GridView>
</asp:Content>

