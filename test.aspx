<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [KHUVUC] WHERE ([MATP] = @MATP)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="MATP" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [THANHPHO]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TENTP" DataValueField="MATP" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="TENKV" DataValueField="MAKV" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DataList ID="DataList1" runat="server" BorderColor="Black" BorderWidth="1px" CellPadding="1" DataKeyField="MAKV" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Both" Width="226px">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" />
            <ItemStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                MAKV:
                <asp:Label ID="MAKVLabel" runat="server" Text='<%# Eval("MAKV") %>' />
                <br />
                MATP:
                <asp:Label ID="MATPLabel" runat="server" Text='<%# Eval("MATP") %>' />
                <br />
                TENKV:
                <asp:Label ID="TENKVLabel" runat="server" Text='<%# Eval("TENKV") %>' />
                <br />
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
    
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT NHAHANG.MANH, MONAN.MAMONAN, MONAN.TENMONAN, MONAN.GIA, MONAN.URLHINHANH FROM NHAHANG INNER JOIN MONAN ON NHAHANG.MANH = MONAN.MANH WHERE (MONAN.MANH = @MANH)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MANH" QueryStringField="rq_MANH" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList2" runat="server" DataKeyField="MANH" datasourceid="SqlDataSource3">
            <ItemTemplate>
                MANH:
                <asp:Label ID="MANHLabel" runat="server" Text='<%# Eval("MANH") %>' />
            <br />
                MAMONAN:
                <asp:Label ID="MAMONANLabel" runat="server" Text='<%# Eval("MAMONAN") %>' />
            <br />
                TENMONAN:
                <asp:Label ID="TENMONANLabel" runat="server" Text='<%# Eval("TENMONAN") %>' />
            <br />
                GIA:
                <asp:Label ID="GIALabel" runat="server" Text='<%# Eval("GIA") %>' />
            <br />
                URLHINHANH:
                <asp:Label ID="URLHINHANHLabel" runat="server" Text='<%# Eval("URLHINHANH") %>' />
            <br />
<br />
            </ItemTemplate>
        </asp:DataList>
    
    </div>
    </form>
</body>
</html>
