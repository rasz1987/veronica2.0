<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="solicitud.aspx.cs" Inherits="veronica2._0.solicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; vertical-align: middle; text-align: center;">
        <tr>
            <td style="width: 368px">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/inicio.aspx">Menú Principal</asp:LinkButton>
            </td>
            <td style="width: 262px">
                <br />
                
            </td>
            <td>Sesión iniciada por:
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr> 
    </table>
        <br />
        <br />
    <table style="width:100%; vertical-align: middle; text-align: center;">
        <tr>
            <td style="width: 298px"></td>
            <td style="width: 366px">
                <asp:Label ID="Label2" runat="server" Text="Describa su requerimiento:"></asp:Label>
                <br />
            </td>
            <td></td>
        </tr> 
        <tr>
            <td style="width: 298px"></td>
            <td style="width: 366px">
                <asp:TextBox ID="tb1" runat="server" Height="105px" Width="390px" TextMode="MultiLine" style="margin-left: 2px; margin-right: 0px"></asp:TextBox>
                <br />
                <br />
                <br />
            </td>
            <td></td>
        </tr> 
        <tr>
            <td style="width: 298px"></td>
            <td style="width: 366px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/GUARDAR.png" Width="87px" OnClick="ImageButton1_Click" />
            </td>
            <td></td>
        </tr>
    </table>


</asp:Content>
