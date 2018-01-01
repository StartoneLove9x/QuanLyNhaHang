<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="Admin_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    
        <strong>FILE UPLOAD<br />
        </strong>
    
    </div>
        <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px" />
&nbsp;
        <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="27px" OnClick="btnUpload_Click" />
    &nbsp;<br />
        <br />
      
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" Display="None" ErrorMessage="Bạn cần chọn một tệp ảnh trước khi ấn nút &quot;Upload&quot;"></asp:RequiredFieldValidator>
                    
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    <asp:Image ID="Image1" runat="server" Width="150px" />
     

        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
     

</asp:Content>

