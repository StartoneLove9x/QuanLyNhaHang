<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="KhuVuc.aspx.cs" Inherits="Admin_KhuVuc" %>

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
      
    <asp:SqlDataSource ID="dataKhuVuc" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [KHUVUC] WHERE [MAKV] = @MAKV" InsertCommand="INSERT INTO [KHUVUC] ([MAKV], [MATP], [TENKV]) VALUES (@MAKV, @MATP, @TENKV)" SelectCommand="SELECT * FROM [KHUVUC] WHERE ([MATP] = @MATP)" UpdateCommand="UPDATE [KHUVUC] SET [MATP] = @MATP, [TENKV] = @TENKV WHERE [MAKV] = @MAKV">
        <DeleteParameters>
            <asp:Parameter Name="MAKV" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtMa" Name="MAKV" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="MATP" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtTen" Name="TENKV" PropertyName="Text" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="MATP" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MATP" Type="String" />
            <asp:Parameter Name="TENKV" Type="String" />
            <asp:Parameter Name="MAKV" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="main-lable">
      
    <asp:SqlDataSource ID="dataThanhPho" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [THANHPHO]">
    </asp:SqlDataSource>

        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Thêm khu vực"></asp:Label>
    </div>




    <table >
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label5" runat="server" Text="Mã thành phố : " Font-Bold="True" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dataThanhPho" DataTextField="TENTP" DataValueField="MATP">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa chọn mã thành phố" Text="(*)" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Mã khu vực  : " Font-Bold="True" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:TextBox ID="txtMa" runat="server" CssClass="texbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mã khu vực" Text="(*)" ControlToValidate="txtMa" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
       <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="Tên khu vực : " Font-Bold="True" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập tên khu vực" Text="(*)" ControlToValidate="txtTen" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr class="main-table">
            <td class="auto-style2" colspan="2">
                <asp:Button ID="cmdLuu" runat="server" OnClick="Button2_Click" Text="Lưu" />
                <asp:Button ID="cmdReset" runat="server" OnClick="Button3_Click" Text="Reset" /></td>
            <td></td>
        </tr>
        <tr class="main-table">
            <td class="auto-style1" colspan="2">
                <asp:Label ID="lbThongBao" runat="server" Font-Italic="True"></asp:Label>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Width="270px" />
            </td>
        </tr>

    </table>


     
    <div class="main-lable">
        <asp:Label ID="Label4" runat="server" CssClass="main-lable" Text="Cập nhật khu vực"></asp:Label>
    </div>
    <asp:SqlDataSource ID="dataCapNhat" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [KHUVUC] WHERE [MAKV] = @MAKV" InsertCommand="INSERT INTO [KHUVUC] ([MAKV], [MATP], [TENKV]) VALUES (@MAKV, @MATP, @TENKV)" SelectCommand="SELECT * FROM [KHUVUC]" UpdateCommand="UPDATE [KHUVUC] SET [MATP] = @MATP, [TENKV] = @TENKV WHERE [MAKV] = @MAKV">
        <DeleteParameters>
            <asp:Parameter Name="MAKV" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MAKV" Type="String" />
            <asp:Parameter Name="MATP" Type="String" />
            <asp:Parameter Name="TENKV" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MATP" Type="String" />
            <asp:Parameter Name="TENKV" Type="String" />
            <asp:Parameter Name="MAKV" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="MAKV" DataSourceID="dataCapNhat" Width="514px" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MATP" HeaderText="MÃ THÀNH PHỐ" SortExpression="MATP" HeaderStyle-HorizontalAlign="Center" >
            
            </asp:BoundField>
            <asp:BoundField DataField="MAKV" HeaderText="MÃ KHU VỰC" SortExpression="MAKV" HeaderStyle-HorizontalAlign="Center" ReadOnly="True" >

            </asp:BoundField>
            <asp:BoundField DataField="TENKV" HeaderText="TÊN KHU VỰC" SortExpression="TENKV" />
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

