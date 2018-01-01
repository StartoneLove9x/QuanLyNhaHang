<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DonHangChuaXuLi.aspx.cs" Inherits="Admin_DonHangChuaXuLi" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            margin-left: -126px;
            margin-top: 20px;
        }

        .auto-style2 {
            height: 35px;
        }

        .auto-style6 {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="22px" Text="Đơn đặt hàng"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SOHOADON" DataSourceID="dataDonDatHang" CellPadding="4" ForeColor="#333333" GridLines="None" Width="888px" AllowPaging="True" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="STT" ItemStyle-Height="35px">
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate><%#Container.DataItemIndex +1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SOHOADON" HeaderText="Số HĐ" ReadOnly="True" SortExpression="SOHOADON" />
            <asp:BoundField DataField="NGAYDATHANG" HeaderText="Ngày đặt hàng" SortExpression="NGAYDATHANG" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="USERNAME" HeaderText="Người dùng" SortExpression="USERNAME" />
            <asp:BoundField DataField="NGUOINHANHANG" HeaderText="Người nhận" SortExpression="NGUOINHANHANG" />
            <asp:BoundField DataField="SODIENTHOAI" HeaderText="Số điện thoại" SortExpression="SODIENTHOAI" />
            <asp:BoundField DataField="DIADIEM" HeaderText="Địa điểm" SortExpression="DIADIEM" />
            <asp:HyperLinkField DataNavigateUrlFields="SOHOADON" DataNavigateUrlFormatString="DonHangChuaXuLi.aspx?rq_SOHOADON={0}" DataTextField="SOHOADON" DataTextFormatString="Chi tiết" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="dataDonDatHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DONDATHANG.SOHOADON, DONDATHANG.NGAYDATHANG, DONDATHANG.USERNAME, KHACHHANG.TENKH, KHACHHANG.DIENTHOAI, KHACHHANG.EMAIL, DONDATHANG.NGUOINHANHANG, DONDATHANG.SODIENTHOAI, DONDATHANG.DIADIEM, DONDATHANG.XULI FROM DONDATHANG INNER JOIN KHACHHANG ON DONDATHANG.USERNAME = KHACHHANG.USERNAME where xuli=0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dataChiTietHoaDon" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT NHAHANG.TENNH, NHAHANG.DIENTHOAI, CHITIETDATHANG.MAMONAN, MONAN.TENMONAN, MONAN.GIA, CHITIETDATHANG.SOLUONG, CHITIETDATHANG.SOLUONG * MONAN.GIA AS THANHTIEN FROM CHITIETDATHANG INNER JOIN MONAN ON CHITIETDATHANG.MAMONAN = MONAN.MAMONAN INNER JOIN NHAHANG ON MONAN.MANH = NHAHANG.MANH WHERE (CHITIETDATHANG.SOHOADON = @SOHOADON)">
        <SelectParameters>
            <asp:QueryStringParameter Name="SOHOADON" QueryStringField="rq_SOHOADON" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dataDonDatHang2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DONDATHANG.SOHOADON, DONDATHANG.NGAYDATHANG, DONDATHANG.USERNAME, KHACHHANG.TENKH, KHACHHANG.DIENTHOAI, KHACHHANG.EMAIL, DONDATHANG.NGUOINHANHANG, DONDATHANG.SODIENTHOAI, DONDATHANG.DIADIEM, DONDATHANG.XULI, DONDATHANG.GHICHU FROM DONDATHANG INNER JOIN KHACHHANG ON DONDATHANG.USERNAME = KHACHHANG.USERNAME where SOHOADON=@SOHOADON">
        <SelectParameters>
            <asp:QueryStringParameter Name="SOHOADON" QueryStringField="rq_SOHOADON" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dataXuLiDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [DONDATHANG] WHERE [SOHOADON] = @SOHOADON" InsertCommand="INSERT INTO [DONDATHANG] ([XULI], [SOHOADON]) VALUES (@XULI, @SOHOADON)" SelectCommand="SELECT [XULI], [SOHOADON] FROM [DONDATHANG] WHERE ([SOHOADON] = @SOHOADON)" UpdateCommand="UPDATE [DONDATHANG] SET [XULI] = @XULI WHERE [SOHOADON] = @SOHOADON">
        <DeleteParameters>
            <asp:Parameter Name="SOHOADON" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="XULI" Type="Boolean" />
            <asp:Parameter Name="SOHOADON" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="SOHOADON" SessionField="rq_SOHOADON" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="CheckBox1" DefaultValue="" Name="XULI" PropertyName="Checked" Type="Boolean" />
            <asp:QueryStringParameter DefaultValue="" Name="SOHOADON" QueryStringField="rq_SOHOADON" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Visible="False" />
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="22px" Text="Chi tiết đặt hàng"></asp:Label>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="SOHOADON" DataSourceID="dataDonDatHang2" Width="888px" HorizontalAlign="Center" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Số hóa đơn"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("SOHOADON") %>'></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Người nhận"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("NGUOINHANHANG") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label5" runat="server" Text="Ngày đặt hàng"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("NGAYDATHANG", "{0:d}") %>'></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        <asp:Label ID="Label7" runat="server" Text="Số điện thoại"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("SODIENTHOAI") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label10" runat="server" Text="Tài khoản"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("USERNAME") %>'></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label8" runat="server" Text="Địa điểm nhận"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("DIADIEM") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label11" runat="server" Text="Tên khách hàng"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("TENKH") %>'></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label9" runat="server" Text="Ghi chú"></asp:Label>
                    </td>
                    <td rowspan="3">
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("GHICHU") %>' Height="90px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label12" runat="server" Text="Điện thoại"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("DIENTHOAI") %>'></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label13" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Eval("EMAIL") %>'></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:Button ID="cmdXuLi" runat="server" BackColor="#0066FF" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="45px" OnClick="cmdXuLi_Click" Text="Đã xử lí" Width="154px" />
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dataChiTietHoaDon" Width="888px" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" OnRowDataBound="gvEmp_RowDataBound" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TENNH" HeaderText="Tên nhà hàng" SortExpression="TENNH">
                <ItemStyle Height="35px" />
            </asp:BoundField>
            <asp:BoundField DataField="DIENTHOAI" HeaderText="Điện thoại" SortExpression="DIENTHOAI" />
            <asp:BoundField DataField="MAMONAN" HeaderText="Mã món ăn" SortExpression="MAMONAN" />
            <asp:BoundField DataField="TENMONAN" HeaderText="Tên món ăn" SortExpression="TENMONAN" />
            <asp:BoundField DataField="GIA" HeaderText="Giá" SortExpression="GIA" />
            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" SortExpression="SOLUONG" />
            <asp:BoundField  DataField="THANHTIEN" HeaderText="Thành tiền"/>
           

        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    
    <asp:Label ID="txtTongThanhTien" runat="server" Font-Size="Large" ForeColor="#CC0000" Text="Tổng thành tiền : "></asp:Label>
    <asp:Label ID="txtThanhTien" runat="server" Font-Size="Large" ForeColor="#CC0000" Text="0"></asp:Label>
    &nbsp;
    <asp:Label ID="tx" runat="server" Font-Size="Large" ForeColor="#CC0000" Text="  đồng"></asp:Label>
    <br />
</asp:Content>

