<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="veronica2._0.admin" %>
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
                 <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Font-Size="X-Large" PostBackUrl="~/registrar_usuario.aspx">Registrar Usuario</asp:LinkButton>
                 <br />
                 <br />
             </td>
             <td style="height: 44px"></td>
         <tr>
             <td style="width: 352px; height: 44px;"></td>
             <td style="width: 262px; vertical-align: middle; height: 44px;" aria-orientation="horizontal">
                 <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton2_Click" Font-Size="X-Large" PostBackUrl="~/registrar_equipo.aspx">Registrar Equipo</asp:LinkButton>
                 <br />
                 <br />
             </td>
             <td style="height: 44px"></td>
        </tr>
         <tr>
             <td style="width: 352px; height: 44px;"></td>
             <td style="width: 262px; vertical-align: middle; height: 44px;" aria-orientation="horizontal">
                 <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton2_Click" Font-Size="X-Large" PostBackUrl="~/servicio_generales.aspx">Servicios Generales</asp:LinkButton>
                <br />
                <br />
             </td>
             <td style="height: 44px"></td>
        </tr>
         <tr>
             <td style="width: 352px; height: 44px;"></td>
             <td style="width: 262px; vertical-align: middle; height: 44px;" aria-orientation="horizontal">
                 <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton2_Click" Font-Size="X-Large" PostBackUrl="~/mantenimientos.aspx">Mantenimientos</asp:LinkButton>
                 <br />
                 <br />
             </td>
             <td style="height: 44px"></td>
        </tr>
         <tr>
             <td style="width: 352px; height: 44px;"></td>
             <td style="width: 262px; vertical-align: middle; height: 44px;" aria-orientation="horizontal">
                 <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton2_Click" Font-Size="X-Large" PostBackUrl="~/desin_equipo.aspx">Desincorporación de Equipos</asp:LinkButton>
             </td>
             <td style="height: 44px"></td>
        </tr>
    </table>

</asp:Content>
