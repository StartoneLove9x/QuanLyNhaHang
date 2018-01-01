<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThanhPho.aspx.cs" Inherits="Admin_ThanhPho" %>

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
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [THANHPHO] WHERE [MATP] = @MATP" InsertCommand="INSERT INTO [THANHPHO] ([MATP], [TENTP]) VALUES (@MATP, @TENTP)" SelectCommand="SELECT * FROM [THANHPHO]" UpdateCommand="UPDATE [THANHPHO] SET [TENTP] = @TENTP WHERE [MATP] = @MATP">
        <DeleteParameters>
            <asp:Parameter Name="MATP" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtMaLoai" Name="MATP" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtTenLoai" Name="TENTP" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENTP" Type="String" />
            <asp:Parameter Name="MATP" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Thêm thành phố"></asp:Label>
    </div>




    <table >
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Mã  : " Font-Bold="True" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:TextBox ID="txtMaLoai" runat="server" CssClass="texbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mã thành phố" Text="(*)" ControlToValidate="txtMaLoai" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
       <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="Tên thành phố : " Font-Bold="True" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTenLoai" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập tên thành phố" Text="(*)" ControlToValidate="txtTenLoai" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <asp:Label ID="Label4" runat="server" CssClass="main-lable" Text="Cập nhật thành phố"></asp:Label>
    </div>
    <asp:SqlDataSource ID="dataCapNhat" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [THANHPHO] WHERE [MATP] = @MATP" InsertCommand="INSERT INTO [THANHPHO] ([MATP], [TENTP]) VALUES (@MATP, @TENTP)" SelectCommand="SELECT * FROM [THANHPHO]" UpdateCommand="UPDATE [THANHPHO] SET [TENTP] = @TENTP WHERE [MATP] = @MATP">
        <DeleteParameters>
            <asp:Parameter Name="MATP" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MATP" Type="String" />
            <asp:Parameter Name="TENTP" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENTP" Type="String" />
            <asp:Parameter Name="MATP" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="MATP" DataSourceID="dataCapNhat" Width="391px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MATP" HeaderText="MÃ THÀNH PHỐ" ReadOnly="True" SortExpression="MATP" HeaderStyle-HorizontalAlign="Center" >
            
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            
            </asp:BoundField>
            <asp:BoundField DataField="TENTP" HeaderText="TÊN THÀNH PHỐ" SortExpression="TENTP" HeaderStyle-HorizontalAlign="Center" >

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

            </asp:BoundField>
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

