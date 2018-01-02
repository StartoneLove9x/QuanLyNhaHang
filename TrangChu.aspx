<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TrangChu.aspx.cs" Inherits="TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
   <title>Trang chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="banner-top row-fluid">
        <ul class="banner-slides">
            <li>
                <img src="../Images/top-banner.jpg" />
            </li>
        </ul>
        <div class="container">
            <div class="panel">
                <div class="row">
                    <div class="panel-text">
                        Chọn nơi bạn muốn nhận đồ ăn?
                    </div>
                </div>
            </div>
            <div class="panel panel-input">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [KHUVUC] WHERE ([MATP] = @MATP)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="MATP" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [THANHPHO]"></asp:SqlDataSource>


                <div class="row">
                    <div id="HeaderForm">

                        <div class="col-sm-4">
                            <div class="province_selector" id="search_select" style="height: 39px">

                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="select province" BackColor="White" DataSourceID="SqlDataSource2" DataTextField="TENTP" DataValueField="MATP">
                                </asp:DropDownList>

                                <%--  <asp:DropDownList ID="DropDownListThanhPho" runat="server" CssClass="select province" BackColor="White"></asp:DropDownList>--%>
                            </div>

                        </div>
                        <div class="col-sm-4">
                            <div class="province_selector" id="search_select" style="height: 39px">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" CssClass="select province" BackColor="White" DataTextField="TENKV" DataValueField="MAKV">
                                </asp:DropDownList>
                                <%-- <asp:DropDownList ID="DropDownListKhuVuc" runat="server" CssClass="select province" BackColor="White" DataSourceID="SqlDataSourceKhuVuc" DataTextField="TENKV" DataValueField="MAKV"></asp:DropDownList>--%>
                            </div>
                        </div>
                        <div class="col-sm-3">

                            <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="Tìm nhà hàng" />



                        </div>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="row">
                    <div class="panel-text pull-left footer text-left">
                        <i class="glyphicon glyphicon-ok"></i>Giao hàng và thu tiền tận nơi hoặc qua hình thức chuyển khoản<br />
                        <i class="glyphicon glyphicon-ok"></i>Hỗ trợ đặt hàng trực tuyến và qua điện thoại<br />
                        <i class="glyphicon glyphicon-ok"></i>Hệ thống tích lũy điểm hấp dẫn, dành riêng cho khách hàng
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div id="frm_spec_menu" class="frame_block">
        <div class="chonmon_block">
            <div class="chonmon_block_padding">
                <div class="chonmon_block_heading">
                    <h3 class="left">Thực đơn nhà hàng <span class="lbl_res_name"></span></h3>
                    <div class="right close_button" onclick="return set_menu.hide_restaurant_menu();"></div>
                </div>
                <div class="chonmon_block_content">
                </div>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="container">
            <div class="product-feature">
                <div class="row">

                    <div class="col-md-12" style="margin-left: auto; margin-right: auto;">
                        <div class="wrap-item">
                            <div style="margin-left: auto; margin-right: auto;  font-size: 20px;
  font-family: sans-serif;">
                                <h2 class="title" >Khám phá địa điểm mới</h2>
                                <asp:SqlDataSource ID="dataDiaDiemHot" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT TOP (3) CHITIETNHAHANG.MANH, NHAHANG.TENNH, NHAHANG.DIENTHOAI, NHAHANG.EMAIL, NHAHANG.THOIGIANPHUCVU, NHAHANG.THOIGIANGIAOHANG, NHAHANG.URLHINHANH, CHITIETNHAHANG.DIACHI, CHITIETNHAHANG.NGAYTHEM FROM NHAHANG INNER JOIN CHITIETNHAHANG ON NHAHANG.MANH = CHITIETNHAHANG.MANH ORDER BY CHITIETNHAHANG.NGAYTHEM DESC"></asp:SqlDataSource>

                                <asp:DataList ID="DataList1" runat="server" DataKeyField="MANH" DataSourceID="dataDiaDiemHot" RepeatColumns="3" RepeatDirection="Horizontal" Width="810px">
                                    <ItemTemplate>
                                        
                                        <div class="item"style="margin-left: auto; margin-right: auto;">
                                             <asp:HyperLink ID="HyperLink2" runat="server"  NavigateUrl='<%# string.Format("ChonMon.aspx?rq_MANH={0}&rq_MAKV=HADONG",Eval("MANH")) %>' >
                                             <div class="img">
                                              
                                                
                                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("URLHINHANH") %>' />
                                               

                                            </div>
                                                  </asp:HyperLink>
                                            <div class="info">
                                                <p class="name">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TENNH") %>'></asp:Label><a href="/shifu"></a>
                                                </p>
                                                <p class="address">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("DIACHI") %>'></asp:Label>
                                                   
                                                </p>

                                            </div>
                                        </div>
                                       
                                    </ItemTemplate>
                                </asp:DataList>

                                <div class="clearfix">
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [QUANGCAO]"></asp:SqlDataSource>
                                    <asp:DataList ID="DataList2" runat="server" DataKeyField="MAQC" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("LIENKET") %>' ImageUrl='<%# Eval("URLHINHANH") %>' ToolTip='<%# Eval("MOTA") %>'>
                                            </asp:HyperLink>
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




            </div>
        </div>




    </div>
</asp:Content>

