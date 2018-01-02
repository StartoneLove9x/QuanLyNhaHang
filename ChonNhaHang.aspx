<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChonNhaHang.aspx.cs" Inherits="ChonNhaHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Chọn nhà hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <asp:SqlDataSource ID="SqlDataSourceNhaHang" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT CHITIETNHAHANG.MAKV, CHITIETNHAHANG.DIACHI AS diaChi, NHAHANG.MANH, NHAHANG.TENNH, NHAHANG.DIENTHOAI, NHAHANG.EMAIL, NHAHANG.THOIGIANPHUCVU, NHAHANG.THOIGIANGIAOHANG, NHAHANG.URLHINHANH FROM CHITIETNHAHANG INNER JOIN NHAHANG ON CHITIETNHAHANG.MANH = NHAHANG.MANH WHERE (CHITIETNHAHANG.MAKV = @MAKV)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MAKV" QueryStringField="rq_MAKV" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataListNhaHang" runat="server" DataSourceID="SqlDataSourceNhaHang" Width="844px">
            <ItemTemplate>

                <div class="row">
                    <div class="list-restaurants">
                        <div class="item" style="margin-bottom: 10px;">
                            <span class="icon-status-res "></span>
                            <div class="row item-header" style="margin-left: 0px; margin-right: 0px;">
                                <div class="col-reset col-md-8">
                                    <h2 class="red" style="font-size: x-large;">
                                        <asp:Label ID="Label1" runat="server" CssClass="red" Text='<%# Eval("TENNH") %>'></asp:Label>
                                    </h2>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("diaChi") %>'></asp:Label>
                                </div>
                                <div class="col-reset col-md-4 text-right">
                                </div>
                            </div>
                            <div class="row item-body">
                                <div class="col-md-2 thumb" style="margin-left: 10px; margin-bottom: -3px;">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("URLHINHANH") %>' />
                                </div>
                                <div class="col-md-6 quick-info col-reset">
                                    <ul>
                                        <li><i class="icon-res time"></i>Thời gian giao hàng: <strong>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("THOIGIANPHUCVU") %>'></asp:Label>
                                        </strong></li>
                                        <!--li><i class="icon-res free"></i> <strong>Giao món miễn phí</strong></li-->
                                        <li><i class="icon-res limit"></i>Giao hàng khoảng :<strong>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("THOIGIANGIAOHANG") %>'></asp:Label></strong></li>
                                    </ul>
                                </div>
                                <div class="col-md-4 text-right" style="margin-right: 45px;">


                                    <asp:HyperLink ID="HyperLink1" CssClass="button" runat="server" NavigateUrl='<%# string.Format("ChonMon.aspx?rq_MANH={0}&rq_MAKV={1}", Eval("MANH"), Eval("MAKV")) %>'>Xem menu</asp:HyperLink>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

