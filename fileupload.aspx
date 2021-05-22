<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="fileupload.aspx.cs" Inherits="YardımProjesi.Admin.fileupload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="tablo">
        <tr>
            <td style="background-color: #009999; font-family: 'DejaVu Sans Mono';color:white; ;text-align:center;">Dosya Yükleme</td>
        </tr>
        <tr>
            <td><div class="satir">
                <label>Ders Kategori:</label>
                <asp:DropDownList ID="ddl_kategoriler" runat="server" DataTextField="Isim" DataValueField="ID" AppendDataBoundItems="true" CssClass="formcontrol">
                    <asp:ListItem Value="-1">Kategori Seçiniz...</asp:ListItem>
                </asp:DropDownList>
            </div></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Dosya Seç :
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Dosya Adı :
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               <asp:Button ID="Button1" runat="server" Text="Yükle" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" Width="462px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <HeaderStyle BackColor="#FFCCFF" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("FileName") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    
</asp:Content>
