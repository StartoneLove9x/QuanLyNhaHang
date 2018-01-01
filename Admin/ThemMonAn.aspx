<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemMonAn.aspx.cs" Inherits="Admin_MonAn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thêm món ăn</title>
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

        .auto-style5 {
            width: 74px;
        }

        .main-table {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <asp:SqlDataSource ID="SqlDataMonAn" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [MONAN] WHERE [MAMONAN] = @MAMONAN" InsertCommand="INSERT INTO [MONAN] ([MAMONAN], [MALOAI], [MANH], [TENMONAN], [URLHINHANH], [NGUYENLIEU], [GIA]) VALUES (@MAMONAN, @MALOAI, @MANH, @TENMONAN, @URLHINHANH, @NGUYENLIEU, @GIA)" SelectCommand="SELECT * FROM [MONAN] WHERE (([MANH] = @MANH) AND ([MALOAI] = @MALOAI))" UpdateCommand="UPDATE [MONAN] SET [MALOAI] = @MALOAI, [MANH] = @MANH, [TENMONAN] = @TENMONAN, [URLHINHANH] = @URLHINHANH, [NGUYENLIEU] = @NGUYENLIEU, [GIA] = @GIA WHERE [MAMONAN] = @MAMONAN">
        <DeleteParameters>
            <asp:Parameter Name="MAMONAN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtMa" Name="MAMONAN" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownListLoai" Name="MALOAI" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownListNhaHang" Name="MANH" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtTen" Name="TENMONAN" PropertyName="Text" Type="String" />
            <asp:SessionParameter Name="URLHINHANH" SessionField="urlhinhanh" Type="String" />
            <asp:ControlParameter ControlID="txtNguyenLieu" Name="NGUYENLIEU" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtGia" Name="GIA" PropertyName="Text" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListNhaHang" Name="MANH" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownListLoai" Name="MALOAI" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
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


    <asp:SqlDataSource ID="SqlDataLoaiMonAn" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [LOAIMONAN] WHERE [MALOAI] = @MALOAI" InsertCommand="INSERT INTO [LOAIMONAN] ([MALOAI], [TENLOAI]) VALUES (@MALOAI, @TENLOAI)" SelectCommand="SELECT * FROM [LOAIMONAN]" UpdateCommand="UPDATE [LOAIMONAN] SET [TENLOAI] = @TENLOAI WHERE [MALOAI] = @MALOAI">
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


    <asp:SqlDataSource ID="SqlDataNhaHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [MANH], [TENNH] FROM [NHAHANG]"></asp:SqlDataSource>

    <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Thêm món ăn"></asp:Label>
    </div>




    <table>
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label5" runat="server" Text="Nhà hàng : " Font-Bold="False" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownListNhaHang" runat="server" DataSourceID="SqlDataNhaHang" DataTextField="TENNH" DataValueField="MANH"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa chọn nhà hàng" Text="(*)" ControlToValidate="DropDownListNhaHang" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label6" runat="server" Text="Loại món ăn : " Font-Bold="False" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownListLoai" runat="server" DataSourceID="SqlDataLoaiMonAn" DataTextField="TENLOAI" DataValueField="MALOAI"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn loại món ăn" Text="(*)" ControlToValidate="DropDownListLoai" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Mã món ăn : " Font-Bold="False" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:TextBox ID="txtMa" runat="server" CssClass="texbox" OnTextChanged="txtMa_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mã loại" Text="(*)" ControlToValidate="txtMa" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="main-table">
            <td class="auto-style3">
                <asp:Label ID="Label4" runat="server" Text="Tên món ăn : " Font-Bold="False" CssClass="main-control-label"></asp:Label></td>
            <td class="auto-style4">
                <asp:TextBox ID="txtTen" runat="server" CssClass="texbox"></asp:TextBox>
            </td>
        </tr>
        <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="Giá : " Font-Bold="False" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label7" runat="server" Text="Nguyên liệu : " Font-Bold="False" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNguyenLieu" runat="server" Height="216px" TextMode="MultiLine" Width="213px"></asp:TextBox>
            </td>
        </tr>
        <tr class="main-table">
            <td class="auto-style5">
                <asp:Label ID="Label8" runat="server" Text="Hình ảnh : " Font-Bold="False" CssClass="main-control-label"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Image ID="Image1" runat="server" Width="150px"  />
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














</asp:Content>

