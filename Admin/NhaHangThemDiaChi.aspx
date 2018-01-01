<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="NhaHangThemDiaChi.aspx.cs" Inherits="Admin_NhaHangThemDiaChi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thêm địa điểm</title>
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
            width: 115px;
            height: 25px;
        }

        .auto-style4 {
            height: 25px;
        }

        .main-table {
            height: 40px;
        }
    .auto-style5 {
        width: 115px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:SqlDataSource ID="dataChiTietNhaHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [CHITIETNHAHANG] WHERE [MANH] = @MANH AND [MAKV] = @MAKV" InsertCommand="INSERT INTO [CHITIETNHAHANG] ([MANH], [MAKV], [DIACHI], [NGAYTHEM]) VALUES (@MANH, @MAKV, @DIACHI, @NGAYTHEM)" SelectCommand="SELECT * FROM [CHITIETNHAHANG]" UpdateCommand="UPDATE [CHITIETNHAHANG] SET [DIACHI] = @DIACHI, [NGAYTHEM] = @NGAYTHEM WHERE [MANH] = @MANH AND [MAKV] = @MAKV">
        <DeleteParameters>
            <asp:Parameter Name="MANH" Type="String" />
            <asp:Parameter Name="MAKV" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="MaNhaHang" Name="MANH" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="MaKhuVuc" Name="MAKV" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtDiaChi" Name="DIACHI" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Calendar1" Name="NGAYTHEM" PropertyName="SelectedDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DIACHI" Type="String" />
            <asp:Parameter Name="NGAYTHEM" Type="DateTime" />
            <asp:Parameter Name="MANH" Type="String" />
            <asp:Parameter Name="MAKV" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dataNhaHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [MANH], [TENNH] FROM [NHAHANG]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dataKhuVuc" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [MAKV], [MATP], [TENKV] FROM [KHUVUC]"></asp:SqlDataSource>

    <div class="main-lable" title="Thêm địa điểm">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Thêm  địa điểm"></asp:Label>
    </div>




    <table>
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Nhà hàng : " Font-Bold="True" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:DropDownList ID="MaNhaHang" runat="server" DataSourceID="dataNhaHang" DataTextField="TENNH" DataValueField="MANH"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa chọn nhà hàng" Text="(*)" ControlToValidate="MaNhaHang" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="Khu vực : " Font-Bold="True" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="MaKhuVuc" runat="server" DataSourceID="dataKhuVuc" DataTextField="TENKV" DataValueField="MAKV"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa chọn khu vực" Text="(*)" ControlToValidate="MaKhuVuc" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label4" runat="server" Text="Địa chỉ : " Font-Bold="true" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>


                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập địa chỉ" Text="(*)" ControlToValidate="txtDiaChi" ForeColor="Red"></asp:RequiredFieldValidator>


            </td>
        </tr>
         <tr class="main-table">
                   <td class="auto-style3">Ngày Nhập</td>
                     <td class="auto-style4">
                         <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </td>

                </tr>
        <tr class="main-table">
            <td class="auto-style2" colspan="2">
                <asp:Button ID="cmdLuu" runat="server" OnClick="Button2_Click" Text="Lưu" />
                <asp:Button ID="cmdReset" runat="server" OnClick="Button3_Click" Text="Reset" /></td>

        </tr>
        <tr class="main-table">
            <td class="auto-style1" colspan="2">
                <asp:Label ID="lbThongBao" runat="server" Font-Italic="True"></asp:Label>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Width="270px" />
            </td>
        </tr>

    </table>




</asp:Content>

