<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DatHang.aspx.cs" Inherits="ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        .container {
            margin-right: auto;
            margin-left: auto;
            padding-left: 15px;
            padding-right: 15px;
        }

        .wapper-register {
            width: 750px;
            margin-right: auto;
            margin-left: auto;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 30px 50px 50px 50px;
            background-color: #eee;
            border-radius: 10px;
        }

        .label-register {
            font-size: 17px;
            margin-bottom: 10px;
        }

        .login-lable {
            font-size: 25px;
            padding-bottom: 20px;
            text-align: center;
        }

        .register {
            margin-bottom: 6px;
            margin-top: 6px;
        }

        .button-register {
            background-color: #5cb85c;
        }

        .gridview-textheader {
            padding-top: 12px;
            padding-bottom: 10px;
            padding-left: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [DONDATHANG] WHERE [SOHOADON] = @SOHOADON" InsertCommand="INSERT INTO [DONDATHANG] ([SOHOADON], [NGAYDATHANG], [USERNAME], [NGUOINHANHANG], [SODIENTHOAI], [DIADIEM], [XULI], [GHICHU]) VALUES (@SOHOADON, @NGAYDATHANG, @USERNAME, @NGUOINHANHANG, @SODIENTHOAI, @DIADIEM, @XULI, @GHICHU)" SelectCommand="SELECT * FROM [DONDATHANG]" UpdateCommand="UPDATE [DONDATHANG] SET [NGAYDATHANG] = @NGAYDATHANG, [USERNAME] = @USERNAME, [NGUOINHANHANG] = @NGUOINHANHANG, [SODIENTHOAI] = @SODIENTHOAI, [DIADIEM] = @DIADIEM, [XULI] = @XULI, [GHICHU] = @GHICHU WHERE [SOHOADON] = @SOHOADON">
        <DeleteParameters>
            <asp:Parameter Name="SOHOADON" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SOHOADON" Type="String" />
            <asp:Parameter Name="NGAYDATHANG" Type="DateTime" />
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="NGUOINHANHANG" Type="String" />
            <asp:Parameter Name="SODIENTHOAI" Type="String" />
            <asp:Parameter Name="DIADIEM" Type="String" />
            <asp:Parameter Name="XULI" Type="Boolean" />
            <asp:Parameter Name="GHICHU" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NGAYDATHANG" Type="DateTime" />
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="NGUOINHANHANG" Type="String" />
            <asp:Parameter Name="SODIENTHOAI" Type="String" />
            <asp:Parameter Name="DIADIEM" Type="String" />
            <asp:Parameter Name="XULI" Type="Boolean" />
            <asp:Parameter Name="GHICHU" Type="String" />
            <asp:Parameter Name="SOHOADON" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dataChiTietHoaDon" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [CHITIETDATHANG] WHERE [SOHOADON] = @SOHOADON AND [MAMONAN] = @MAMONAN" InsertCommand="INSERT INTO [CHITIETDATHANG] ([SOHOADON], [MAMONAN], [SOLUONG]) VALUES (@SOHOADON, @MAMONAN, @SOLUONG)" SelectCommand="SELECT * FROM [CHITIETDATHANG]" UpdateCommand="UPDATE [CHITIETDATHANG] SET [SOLUONG] = @SOLUONG WHERE [SOHOADON] = @SOHOADON AND [MAMONAN] = @MAMONAN">
        <DeleteParameters>
            <asp:Parameter Name="SOHOADON" Type="String" />
            <asp:Parameter Name="MAMONAN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SOHOADON" Type="String" />
            <asp:Parameter Name="MAMONAN" Type="String" />
            <asp:Parameter Name="SOLUONG" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SOLUONG" Type="Int32" />
            <asp:Parameter Name="SOHOADON" Type="String" />
            <asp:Parameter Name="MAMONAN" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dataDonDatHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [DONDATHANG] WHERE [SOHOADON] = @SOHOADON" InsertCommand="INSERT INTO [DONDATHANG] ([SOHOADON], [NGAYDATHANG], [USERNAME], [NGUOINHANHANG], [SODIENTHOAI], [DIADIEM], [XULI], [GHICHU]) VALUES (@SOHOADON, @NGAYDATHANG, @USERNAME, @NGUOINHANHANG, @SODIENTHOAI, @DIADIEM, @XULI, @GHICHU)" SelectCommand="SELECT * FROM [DONDATHANG]" UpdateCommand="UPDATE [DONDATHANG] SET [NGAYDATHANG] = @NGAYDATHANG, [USERNAME] = @USERNAME, [NGUOINHANHANG] = @NGUOINHANHANG, [SODIENTHOAI] = @SODIENTHOAI, [DIADIEM] = @DIADIEM, [XULI] = @XULI, [GHICHU] = @GHICHU WHERE [SOHOADON] = @SOHOADON">
        <DeleteParameters>
            <asp:Parameter Name="SOHOADON" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="SOHOADON" SessionField="sohoadon" Type="String" />
            <asp:SessionParameter Name="NGAYDATHANG" SessionField="ngaydathang" Type="DateTime" />
            <asp:SessionParameter DefaultValue="" Name="USERNAME" SessionField="UserID" Type="String" />
            <asp:ControlParameter ControlID="txtHoTen" Name="NGUOINHANHANG" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtSoDienThoai" Name="SODIENTHOAI" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtDiaDiem" Name="DIADIEM" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CheckBox1" Name="XULI" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="TextBox2" Name="GHICHU" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NGAYDATHANG" Type="DateTime" />
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="NGUOINHANHANG" Type="String" />
            <asp:Parameter Name="SODIENTHOAI" Type="String" />
            <asp:Parameter Name="DIADIEM" Type="String" />
            <asp:Parameter Name="XULI" Type="Boolean" />
            <asp:Parameter Name="GHICHU" Type="String" />
            <asp:Parameter Name="SOHOADON" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:CheckBox ID="CheckBox1" runat="server" Visible="False" />
    <br />
    <br />
    <div class="container">
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        <div class="wapper-register">
            <div>
                <div class="login-lable">
                    <asp:Label ID="Label6" runat="server" Text="Đơn đặt hàng" CssClass="login-lable register"></asp:Label>
                </div>
                <asp:Label ID="Label1" runat="server" Text="Họ tên người nhận" CssClass="label-register register"></asp:Label>
                &nbsp;<asp:Label ID="Label8" runat="server" ForeColor="#CC0000" Text="(*)"></asp:Label>
&nbsp;<asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control register"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Số điện thoại" CssClass="label-register register"></asp:Label>
                <asp:Label ID="Label9" runat="server" ForeColor="#CC0000" Text="(*)"></asp:Label>
                <asp:TextBox ID="txtSoDienThoai" runat="server" CssClass="form-control register"></asp:TextBox>

                <asp:Label ID="Label4" runat="server" Text="Địa điểm nhận hàng" CssClass="label-register register"></asp:Label>
                <asp:Label ID="Label10" runat="server" ForeColor="#CC0000" Text="(*)"></asp:Label>
                <asp:TextBox ID="txtDiaDiem" runat="server" CssClass="form-control register"></asp:TextBox>

                <br />
                <asp:Label ID="ThongBao" runat="server"></asp:Label>
                <br />
                <br />

                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="650px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" ShowFooter="True" CssClass="label-register register">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:BoundField DataField="Name" HeaderText="Tên Sản Phẩm" ControlStyle-CssClass="gridview-textheader">
                            <ControlStyle CssClass="gridview-textheader"></ControlStyle>

                            <HeaderStyle HorizontalAlign="Left" CssClass="label-register register gridview-textheader" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridview-textheader" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Số Lượng" ControlStyle-CssClass="gridview-textheader">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                            </ItemTemplate>
                            <ControlStyle BorderStyle="None" Width="40px" />
                            <HeaderStyle HorizontalAlign="Left" CssClass="gridview-textheader" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridview-textheader" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Price" HeaderText="Giá Tiền" ControlStyle-CssClass="gridview-textheader">
                            <ControlStyle CssClass="gridview-textheader"></ControlStyle>

                            <HeaderStyle HorizontalAlign="Left" CssClass="gridview-textheader" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridview-textheader" />
                        </asp:BoundField>
                        <asp:TemplateField ControlStyle-CssClass="gridview-textheader text-center">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">Cập nhật</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CommandName="delete" OnClientClick="return confirm(&quot;Are u sure ?&quot;)">Xóa</asp:LinkButton>
                            </ItemTemplate>
                            <ControlStyle BorderStyle="None" />
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridview-textheader" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#FAA61A" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#FAA61A" Font-Bold="True" ForeColor="White" Wrap="True" CssClass="label-register register" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" Height="30px" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>




                <asp:Label ID="Label7" runat="server" Font-Size="20px" ForeColor="Maroon" Text="Tổng thành tiền :   "></asp:Label>




                <asp:Label ID="txtThongBao" runat="server" Font-Size="20px" ForeColor="Maroon"></asp:Label>




                &nbsp;




                <asp:Label ID="txtThongBao0" runat="server" Font-Size="20px" ForeColor="Maroon">đồng</asp:Label>




                <br />
                <br />




                <br />
                
                    <div style="  margin-left: 30px;" >
                        <asp:Button ID="cmdDathang" runat="server" Text="Đặt hàng" BackColor="#FAA61A" OnClick="cmdDathang_Click" Width="289px" CssClass="button" Font-Bold="False" Font-Size="19px" />
                        <asp:Button ID="Button1" runat="server" Text="Xóa giỏ hàng" BackColor="#FAA61A" Width="289px" OnClick="Button1_Click" CssClass="button" Font-Size="19px" />
                    </div>
              
                <br />
                <asp:Label ID="lblThongBao" runat="server" CssClass="label-register register"></asp:Label>
                <br />

            </div>


        </div>
    </div>




    <br />
    <br />
    <br />




</asp:Content>

