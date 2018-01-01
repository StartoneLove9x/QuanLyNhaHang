<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemLoaiMonAn.aspx.cs" Inherits="Admin_ThemMoiLoaiMonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thêm loại món ăn</title>
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
            width: 74px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [LOAIMONAN] WHERE [MALOAI] = @MALOAI" InsertCommand="INSERT INTO [LOAIMONAN] ([MALOAI], [TENLOAI]) VALUES (@MALOAI, @TENLOAI)" SelectCommand="SELECT * FROM [LOAIMONAN]" UpdateCommand="UPDATE [LOAIMONAN] SET [TENLOAI] = @TENLOAI WHERE [MALOAI] = @MALOAI">
        <DeleteParameters>
            <asp:Parameter Name="MALOAI" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtMaLoai" Name="MALOAI" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtTenLoai" Name="TENLOAI" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENLOAI" Type="String" />
            <asp:Parameter Name="MALOAI" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Thêm loại món ăn"></asp:Label>
    </div>




    <table >
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Mã loại : " Font-Bold="False" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:TextBox ID="txtMaLoai" runat="server" CssClass="texbox" OnTextChanged="txtMaLoai_TextChanged1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mã loại" Text="(*)" ControlToValidate="txtMaLoai" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
       <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="Tên loại : " Font-Bold="False" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTenLoai" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập tên loại" Text="(*)" ControlToValidate="txtTenLoai" ForeColor="Red"></asp:RequiredFieldValidator>
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















    <div class="main-row">
    </div>
    <div class="main-row">
    </div>
    <div class="main-row">
    </div>
    <div class="main-row">
    </div>

</asp:Content>

