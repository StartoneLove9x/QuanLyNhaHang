<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemQuangCao.aspx.cs" Inherits="Admin_QLQuangCao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="margin-left: 40px; margin-right: 40px; margin-top: 30px; max-width: 500px; padding 10px 10px 10px 10px;">
        <asp:Label ID="Label1" runat="server" Text="Nhập quảng cáo" Font-Size="30px"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [QUANGCAO] WHERE [MAQC] = @MAQC" InsertCommand="INSERT INTO [QUANGCAO] ([MAQC], [URLHINHANH], [LIENKET], [MOTA]) VALUES (@MAQC, @URLHINHANH, @LIENKET, @MOTA)" SelectCommand="SELECT * FROM [QUANGCAO]" UpdateCommand="UPDATE [QUANGCAO] SET [URLHINHANH] = @URLHINHANH, [LIENKET] = @LIENKET, [MOTA] = @MOTA WHERE [MAQC] = @MAQC">
            <DeleteParameters>
                <asp:Parameter Name="MAQC" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtMaQC" Name="MAQC" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="URLHINHANH" SessionField="urlhinhanh" Type="String" />
                <asp:ControlParameter ControlID="txtLienKet" Name="LIENKET" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtMoTa" Name="MOTA" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="URLHINHANH" Type="String" />
                <asp:Parameter Name="LIENKET" Type="String" />
                <asp:Parameter Name="MOTA" Type="String" />
                <asp:Parameter Name="MAQC" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <br />

        <table>
            <tr class="main-table">
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Mã quảng cáo : " Font-Bold="False" CssClass="main-control-label"></asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtMaQC" runat="server" Style="margin-left: 0px" OnTextChanged="txtMaQC_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMaQC" ErrorMessage="Mã quảng cáo không được trống" Font-Italic="True" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="main-table">
                <td class="auto-style5">
                    <asp:Label ID="Label3" runat="server" Text="Mô tả : " Font-Bold="False" CssClass="main-control-label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMoTa" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="main-table">
                <td class="auto-style5">
                    <asp:Label ID="Label5" runat="server" Text="Liên kết : " Font-Bold="False" CssClass="main-control-label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLienKet" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập liên kết" Text="(*)" ControlToValidate="txtLienKet" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="main-table">
                <td class="auto-style5">
                    <asp:Label ID="Label6" runat="server" Text="Hình ảnh : " Font-Bold="False" CssClass="main-control-label"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Image ID="Image1" runat="server" Width="150px" />
                </td>
            </tr>
            <tr class="main-table">
                <td class="auto-style2" colspan="2">
                    <asp:Button ID="cmdLuu" runat="server" OnClick="Button2_Click" Text="Lưu" />
                    <asp:Button ID="cmdReset" runat="server" OnClick="Button3_Click" Text="Reset" />
                    <br />
                    <asp:Label ID="lbThongBao" runat="server" ForeColor="#333333"></asp:Label>
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />
                    <br />
                    <td></td>
            </tr>
            <tr class="main-table">
                <td class="auto-style1" colspan="2">
                    <br />
                </td>
            </tr>

        </table>













 
     
    </div>
</asp:Content>

