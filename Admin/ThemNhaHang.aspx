<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemNhaHang.aspx.cs" Inherits="Admin_QLNhaHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <style type="text/css">
        .textbox {
            display: block;
            margin-left: 50px;
        }

        .auto-style3 {
            width: 142px;
            height: 25px;
          
        }
        .auto-style4 {
            height: 25px;
        }
        .main-table{
             height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   

        <asp:Label ID="Label1" runat="server" Text="Thêm nhà hàng" Font-Size="30px"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="dataNhaHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [NHAHANG]" DeleteCommand="DELETE FROM [NHAHANG] WHERE [MANH] = @MANH" InsertCommand="INSERT INTO [NHAHANG] ([MANH], [TENNH], [DIENTHOAI], [EMAIL], [THOIGIANPHUCVU], [THOIGIANGIAOHANG], [URLHINHANH]) VALUES (@MANH, @TENNH, @DIENTHOAI, @EMAIL, @THOIGIANPHUCVU, @THOIGIANGIAOHANG, @URLHINHANH)" UpdateCommand="UPDATE [NHAHANG] SET [TENNH] = @TENNH, [DIENTHOAI] = @DIENTHOAI, [EMAIL] = @EMAIL, [THOIGIANPHUCVU] = @THOIGIANPHUCVU, [THOIGIANGIAOHANG] = @THOIGIANGIAOHANG, [URLHINHANH] = @URLHINHANH WHERE [MANH] = @MANH">
            <DeleteParameters>
                <asp:Parameter Name="MANH" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtMa" Name="MANH" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtTen" Name="TENNH" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtDienThoai" Name="DIENTHOAI" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtEmail" Name="EMAIL" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtThoiGianPhucVu" Name="THOIGIANPHUCVU" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtThoiGianGiaoHang" Name="THOIGIANGIAOHANG" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="URLHINHANH" SessionField="urlhinhanh" Type="String" />
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
     
    &nbsp;<table>
              <tr class="main-table">
                   <td class="auto-style3">Mã</td>
                     <td class="auto-style4">

                        <asp:TextBox ID="txtMa" runat="server" OnTextChanged="txtMa_TextChanged"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMa" ErrorMessage="Chưa nhập mã nhà hàng" ForeColor="Red">(*)</asp:RequiredFieldValidator>

                    </td>

                </tr>
                <tr class="main-table">
                    <td class="auto-style3">Tên</td>
               <td class="auto-style4">
                        <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTen" ErrorMessage="Chưa nhập tên nhà hàng" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                    </td>

                </tr>
               <tr class="main-table">
                    <td class="auto-style3">Điện thoại</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtDienThoai" runat="server"></asp:TextBox>
                    </td>

                </tr>
               <tr class="main-table">
                    <td class="auto-style3">Email</td>
                     <td class="auto-style4">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                 
                </tr>
               <tr class="main-table">
                    <td class="auto-style3">Thời gian phục vụ</td>
                     <td class="auto-style4">
                        <asp:TextBox ID="txtThoiGianPhucVu" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr class="main-table">
                   <td class="auto-style3">Thời gian giao hàng</td>
                     <td class="auto-style4">
                        <asp:TextBox ID="txtThoiGianGiaoHang" runat="server"></asp:TextBox>
                    </td>

                </tr>
                
               <tr class="main-table">
                    <td class="auto-style3">Hình ảnh</td>
                     <td class="auto-style4">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />
                        <asp:Image ID="Image1" runat="server" Width="150px" />
                    </td>

                </tr>
              <tr class="main-table">
                   <td class="auto-style3">&nbsp;</td>
                     <td class="auto-style4">
                        <asp:Button ID="cmdLuu" runat="server" OnClick="Luu_Click" Text="Lưu" />
                        <asp:Button ID="cmdReset" runat="server" OnClick="Reset_Click" Text="Reset" />
                    </td>

                </tr>

            </table>

            <br />

            <asp:Label ID="lbThongBao" runat="server" Font-Italic="True" ForeColor="Black"></asp:Label>

            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            <br />

</asp:Content>

