<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatQuangCao.aspx.cs" Inherits="Admin_CapNhatQuangCao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .hinhanh{
            width:160px;
        }
        .hinhanh image {
              width:160px;
        }
        .header {
            text-align:center;
            vertical-align:central;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <div class="main-lable">
        <asp:Label ID="Label1" runat="server" CssClass="main-lable" Text="Cập nhật quảng cáo"></asp:Label>
    </div>
    <asp:SqlDataSource ID="dataCapNhatQuangCao" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [QUANGCAO] WHERE [MAQC] = @MAQC" InsertCommand="INSERT INTO [QUANGCAO] ([MAQC], [URLHINHANH], [LIENKET], [MOTA]) VALUES (@MAQC, @URLHINHANH, @LIENKET, @MOTA)" SelectCommand="SELECT * FROM [QUANGCAO]" UpdateCommand="UPDATE [QUANGCAO] SET [URLHINHANH] = @URLHINHANH, [LIENKET] = @LIENKET, [MOTA] = @MOTA WHERE [MAQC] = @MAQC">
        <DeleteParameters>
            <asp:Parameter Name="MAQC" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MAQC" Type="String" />
            <asp:Parameter Name="URLHINHANH" Type="String" />
            <asp:Parameter Name="LIENKET" Type="String" />
            <asp:Parameter Name="MOTA" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="URLHINHANH" Type="String" />
            <asp:Parameter Name="LIENKET" Type="String" />
            <asp:Parameter Name="MOTA" Type="String" />
            <asp:Parameter Name="MAQC" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="MAQC" DataSourceID="dataCapNhatQuangCao" Width="888px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MAQC" HeaderText="MÃ QUẢNG CÁO" ReadOnly="True" SortExpression="MAQC" HeaderStyle-HorizontalAlign="Center" >
            
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
            
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="MOTA" HeaderText="MÔ TẢ" SortExpression="MOTA" HeaderStyle-HorizontalAlign="Center" >

            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>

            <asp:BoundField DataField="LIENKET" HeaderText="LIÊN KẾT" SortExpression="LIENKET" />
            <asp:ImageField DataImageUrlField="URLHINHANH" HeaderText="HÌNH ẢNH" ControlStyle-CssClass="hinhanh">
<ControlStyle CssClass="hinhanh"></ControlStyle>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="hinhanh" />
            </asp:ImageField>
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

