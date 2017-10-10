<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="servicios.aspx.cs" Inherits="veronica2._0.servicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; vertical-align: middle; text-align: center;">
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/inicio.aspx">Menú Principal</asp:LinkButton>
            </td>
            <td style="width: 262px">
                <br />
                <br />
                <br />
            </td>
            <td>Sesión iniciada por:
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>

        </tr> 
        <tr>
             <td style="width: 352px; height: 44px;"></td>
             <td style="width: 262px; vertical-align: middle; height: 44px;" aria-orientation="horizontal">
                 <asp:ImageButton ID="ImageButton1" runat="server" BorderStyle="Solid" CssClass="body2" Height="72px" ImageUrl="~/images/SG.png" PostBackUrl="~/solicitud.aspx" Width="300px" />
                 <br />
             </td>
             <td style="height: 44px"></td>
        </tr>
    </table>
</asp:Content>
