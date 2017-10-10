<%@ Page Title="" Language="C#" MasterPageFile="~/loguin.Master" AutoEventWireup="true" CodeBehind="loguin.aspx.cs" Inherits="veronica2._0.loguin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <table style="width:100%; height: 198px;">
        <tr>
            <td style="width: 171px">&nbsp;</td>
                <td style="width: 306px">
                    <br />
                    <br />
                    <asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate" FailureText="Usuario o Contraseña inválidos.">
                    </asp:Login>
                </td>
        </tr>
    </table>

</asp:Content>
