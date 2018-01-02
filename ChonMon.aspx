<%@ Page Title="" Language="C#" MasterPageFile="~/ChonMon.master" AutoEventWireup="true" CodeFile="ChonMon.aspx.cs" Inherits="ChonMon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-reset col-md-8">
        <div class="row res-retail">
            <div class="lable-main">
                <asp:Label ID="Label3" runat="server" Text="Thực đơn"></asp:Label>
            </div>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="menu-food">
                    <div class="list-menu-food">




                        <asp:SqlDataSource ID="dataMonAn" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT NHAHANG.MANH, MONAN.GIA, MONAN.TENMONAN, MONAN.MAMONAN, MONAN.URLHINHANH, MONAN.NGUYENLIEU FROM NHAHANG INNER JOIN MONAN ON NHAHANG.MANH = MONAN.MANH INNER JOIN LOAIMONAN ON MONAN.MALOAI = LOAIMONAN.MALOAI WHERE (MONAN.MANH = @MANH)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="MANH" QueryStringField="rq_MANH" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DataList ID="MonAn" runat="server" DataKeyField="MANH" DataSourceID="dataMonAn" Width="574px" CellPadding="4" ForeColor="#333333">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                <table class="nav-justified">
                                    <tr style="padding: 5px 5px 5px 5px;">
                                        <td style="vertical-align: middle; padding: 5px 5px 5px 5px;">
                                            <div class="danhmuc">
                                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="18px" Text='<%# Eval("TENMONAN") %>' ForeColor="#F3AE3B" Font-Names="Times New Roman"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label8" runat="server" Font-Size="14px" Text='<%# Eval("NGUYENLIEU") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td style="width: 80px; vertical-align: middle; padding: 5px 5px 5px 5px;">
                                            <div class="danhmuc">
                                                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="#FFCC00" Text='<%# Eval("GIA") %>' Font-Size="15px"></asp:Label>
                                            </div>
                                        </td>
                                        <td style="width: 70px; vertical-align: middle; padding: 5px 5px 5px 5px;">
                                            <div class="danhmuc">
                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Session["URLChonNhaHang"].ToString()+"&action=add&"+string.Format("id={0}&name={1}&price={2}",Eval ("MAMONAN"),Eval("TENMONAN"),Eval ("GIA")) %>' Font-Bold="True" ImageUrl="~/Images/icons/icon-collapse-square.png">Thêm</asp:HyperLink>
                                            </div>
                                        </td>
                                    </tr>
                                </table>

                                <br />
                                <br />

                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>



                        <br />
                        <br />



                        <p>
                            &nbsp;
                        </p>




                    </div>
                </div>


            </div>



        </div>
    </div>

    <%-- GIỏ hàng--%>
    <div class="col-reset col-md-8" style="display: block; width: 285px; float: right;">

        <div class="lable-main">
            <asp:Label ID="Label5" runat="server" Text="Giỏ hàng"></asp:Label>
        </div>
        <div style="width: 270px; margin-top: 10px; margin-bottom: 10px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="100%" ShowHeader="False" ForeColor="#333333" GridLines="None" Font-Size="14px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:BoundField DataField="Name" HeaderText="Tên Sản Phẩm">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                    <asp:BoundField DataField="Price" HeaderText="Giá Tiền">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Chức Năng">

                        <ControlStyle BorderStyle="None" />
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Wrap="True" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

        </div>
        <div class="lable-main">
            <asp:Label ID="txtTong" runat="server" Text="0"></asp:Label><asp:Label ID="Label4" runat="server" Text=" đồng"></asp:Label>
        </div>
        <div style="margin-right: auto; margin-left: 75px; margin-top: 10px">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="button" NavigateUrl="~/DatHang.aspx">Đặt hàng</asp:HyperLink>

        </div>
    </div>




</asp:Content>

