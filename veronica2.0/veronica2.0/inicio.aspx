<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="veronica2._0.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table style="width:100%; vertical-align: middle; text-align: center;">
        <tr>
            <td></td>
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
                 <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="X-Large" OnClick="LinkButton1_Click">Cerrar Sesión</asp:LinkButton>
                 <br />
                 <br />
             </td>
             <td style="height: 44px"></td>
        </tr>
        <tr>
             <td style="height: 22px; width: 352px;"></td>
             <td style="width: 262px; height: 22px;">
                 <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="X-Large" PostBackUrl="~/servicios.aspx">Servicios</asp:LinkButton>
                 <br />
                 <br />
             </td>
             <td style="height: 22px"></td>
        </tr>
        <tr>
             <td style="width: 352px"></td>
             <td style="width: 262px">
                 <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="X-Large" Visible="False">Reportes</asp:LinkButton>
                 <br />
                 <br />
             </td>
             <td></td>
        </tr>
        <tr>
             <td style="width: 352px"></td>
             <td style="width: 262px">
                 <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="X-Large" OnClick="LinkButton4_Click" Visible="False" PostBackUrl="~/admin.aspx">Administrador</asp:LinkButton>
                 <br />
                 <br />
                 
             </td>
             <td></td>
        </tr>
            
    </table>
</asp:Content>
