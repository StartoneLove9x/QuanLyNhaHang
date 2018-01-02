<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="KhachHang.aspx.cs" Inherits="KhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Khách hàng</title>
    <style>
        .container {
            margin-right: auto;
            margin-left: auto;
            padding-left: 15px;
            padding-right: 15px;
        }

        .wapper-register {
            width: 500px;
            margin-right: auto;
            margin-left: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 30px 50px 0px 50px;
            background-color: #eee;
            border-radius: 10px;
        }

        .label-register {
            font-size: 17px;
            margin-bottom: 10px;
        }

        .login-lable {
            font-size: 25px;
            padding-bottom: 40px;
            text-align: center;
        }

        .register {
            margin-bottom: 6px;
            margin-top: 6px;
        }

        .button-register {
            background-color: #5cb85c;
        }

        .row-info {
            margin-bottom: 8px;
        }

        .table-info {
            margin-top: 2px;
            margin-bottom: -10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="wapper-register">
            <div>
                <div class="login-lable">
                    <asp:Label ID="Label6" runat="server" Text="Thông Tin" CssClass="login-lable register"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [KHACHHANG] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [KHACHHANG] ([USERNAME], [TENKH], [DIENTHOAI], [EMAIL]) VALUES (@USERNAME, @TENKH, @DIENTHOAI, @EMAIL)" SelectCommand="SELECT [USERNAME], [TENKH], [DIENTHOAI], [EMAIL] FROM [KHACHHANG] WHERE ([USERNAME] = @USERNAME)" UpdateCommand="UPDATE [KHACHHANG] SET [TENKH] = @TENKH, [DIENTHOAI] = @DIENTHOAI, [EMAIL] = @EMAIL WHERE [USERNAME] = @USERNAME">
                        <DeleteParameters>
                            <asp:Parameter Name="USERNAME" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="USERNAME" Type="String" />
                            <asp:Parameter Name="TENKH" Type="String" />
                            <asp:Parameter Name="DIENTHOAI" Type="Int32" />
                            <asp:Parameter Name="EMAIL" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="USERNAME" QueryStringField="rq_USERNAME" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="txtTen" Name="TENKH" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDienThoai" Name="DIENTHOAI" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtEmail" Name="EMAIL" PropertyName="Text" Type="String" />
                            <asp:QueryStringParameter Name="USERNAME" QueryStringField="rq_USERNAME" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [KHACHHANG] WHERE ([USERNAME] = @USERNAME)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="USERNAME" QueryStringField="rq_USERNAME" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <asp:SqlDataSource ID="dataDoiMatKhau" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [KHACHHANG] WHERE [USERNAME] = @USERNAME" InsertCommand="INSERT INTO [KHACHHANG] ([PASSWORD], [USERNAME]) VALUES (@PASSWORD, @USERNAME)" SelectCommand="SELECT [PASSWORD], [USERNAME] FROM [KHACHHANG] WHERE ([USERNAME] = @USERNAME)" UpdateCommand="UPDATE [KHACHHANG] SET [PASSWORD] = @PASSWORD WHERE [USERNAME] = @USERNAME">
                    <DeleteParameters>
                        <asp:Parameter Name="USERNAME" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PASSWORD" Type="String" />
                        <asp:Parameter Name="USERNAME" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="USERNAME" QueryStringField="rq_USERNAME" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtMatKhau" Name="PASSWORD" PropertyName="Text" Type="String" />
                        <asp:QueryStringParameter Name="USERNAME" QueryStringField="rq_USERNAME" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="USERNAME" DataSourceID="SqlDataSource1" Width="360px" CssClass="table-info">
                    <ItemTemplate>
                        <div class="row-info">
                            <asp:Label ID="Label1" runat="server" Text="Tài khoản : " CssClass="label-register register"></asp:Label>
                            <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Eval("USERNAME") %>' CssClass="label-register register" />
                        </div>
                        <div class="row-info">
                            <asp:Label ID="Label2" runat="server" Text="Họ và tên : " CssClass="label-register register"></asp:Label>
                            <asp:Label ID="TENKHLabel" runat="server" Text='<%# Eval("TENKH") %>' CssClass="label-register register" />
                        </div>
                        <div class="row-info">
                            <asp:Label ID="Label8" runat="server" Text="Số điện thoại : " CssClass="label-register register"></asp:Label>
                            <asp:Label ID="DIENTHOAILabel" runat="server" Text='<%# Eval("DIENTHOAI") %>' CssClass="label-register register" />
                        </div>
                        <div class="row-info">
                            <asp:Label ID="Label7" runat="server" Text="Email : " CssClass="label-register register"></asp:Label>
                            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' CssClass="label-register register" />
                        </div>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Cập nhật thông tin" CssClass="label-register register" Font-Size="26px"></asp:Label>
                <br />


                <br />
                <asp:Label ID="Label1" runat="server" CssClass="label-register register" Text="Họ và tên"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTen" ErrorMessage="(Chưa nhập họ tên)" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTen" runat="server" CssClass="form-control register"></asp:TextBox>
                <asp:Label ID="Label10" runat="server" CssClass="label-register register" Text="Điện thoại"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDienThoai" ErrorMessage="(Chưa nhập số điện thoại)" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control register"></asp:TextBox>
                <asp:Label ID="Label7" runat="server" CssClass="label-register register">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control register"></asp:TextBox>
                <asp:Button ID="cmdCapNhat" runat="server" CssClass="btn btn-lg btn-primary btn-block login button-register register" Text="Cập nhật" OnClick="cmdCapNhat_Click" />
                <br />


                <asp:Label ID="txtThongBao0" runat="server" Text=""></asp:Label>


                <br />


                <br />
                <asp:Label ID="Label3" runat="server" Text="Đổi mật khẩu" CssClass="label-register register" Font-Size="26px"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Mật khẩu mới" CssClass="label-register register"></asp:Label>
                &nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtMatKhau" ControlToValidate="txtMatKhau2" ErrorMessage="(Hai mật khẩu không trùng nhau)" ForeColor="#CC0000"></asp:CompareValidator>
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control register" TextMode="Password"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" Text="Nhập lại mật khẩu mới" CssClass="label-register register" TextMode="Password"></asp:Label>
                <asp:TextBox ID="txtMatKhau2" runat="server" CssClass="form-control register" TextMode="Password"></asp:TextBox>

                <asp:Button ID="cmdDoiMatKhau" runat="server" Text="Đổi mật khẩu" CssClass="btn btn-lg btn-primary btn-block login button-register register" OnClick="cmdDoiMatKhau_Click" />

                <br />
                <asp:Label ID="txtThongBao" runat="server"></asp:Label>
                <br />
                <br />

            </div>


        </div>
    </div>
</asp:Content>

