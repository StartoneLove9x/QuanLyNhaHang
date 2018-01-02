<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="NhaHang.aspx.cs" Inherits="NhaHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Nhà hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <style type="text/css">
        .auto-style6 {
            height: 70px;
        }

        .auto-style7 {
            width: 85px;
            height: 45px;
        }

        .auto-style8 {
            width: 269px;
            height: 45px;
        }

        .auto-style9 {
            height: 45px;
            width: 155px;
        }

        .auto-style10 {
            width: 85px;
            height: 35px;
        }

        .auto-style11 {
            width: 269px;
            height: 35px;
        }

        .auto-style12 {
            height: 35px;
            width: 155px;
        }

        .auto-style13 {
            width: 85px;
            height: 37px;
        }

        .auto-style14 {
            width: 269px;
            height: 37px;
        }

        .auto-style15 {
            height: 37px;
            width: 155px;
            text-align: left;
        }

        .auto-style16 {
            height: 70px;
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <%--<center> 
   
    <table cellpadding="0" cellspacing="0" >
    <tr>
        <td class="auto-style6" colspan="2"> <asp:Label ID="Label2" runat="server" ClientIDMode="Static" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" Text="Thêm mới loại món ăn" ></asp:Label>
   
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
           
        &nbsp;</td>
        <td class="auto-style16">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style13">
            <asp:Label ID="Label3" runat="server" Text="Mã loại"></asp:Label>
        </td>
        <td class="auto-style14">
            <asp:TextBox ID="txtMaLoai" runat="server" AutoPostBack="True" OnTextChanged="txtMaLoai_TextChanged"></asp:TextBox>
        </td>
        <td class="auto-style15" style="max-width:200px">
            <asp:Label ID="lbLoi" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style10">
            <asp:Label ID="Label4" runat="server" Text="Tên loại"></asp:Label>
        </td>
        <td class="auto-style11">
            <asp:TextBox ID="txtTenLoai" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
        </td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style7">
            <br />
        </td>
        <td class="auto-style8">
            <asp:Button ID="Button2" runat="server" Height="25px" OnClick="Button2_Click" Text="Lưu" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Reset" />
            <br />
        </td>
        <td class="auto-style9"></td>
    </tr>
</table>
        </center>--%>
</asp:Content>

