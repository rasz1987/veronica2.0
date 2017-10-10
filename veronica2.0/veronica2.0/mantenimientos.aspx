<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="mantenimientos.aspx.cs" Inherits="veronica2._0.mantenimientos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; vertical-align: middle; text-align: center;">
        <tr>
            <td style="width: 360px">
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
    </table>

    <table style="width: 95%; text-align: center; height: 459px;">
            <tr>
                <td class="auto-style1" colspan="2"><span class="auto-style31" style="font-size: x-large; color: #FFFFFF;">
                    <br />
                    MANTENIMIENTOS<br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Activo Fijo"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="activo_fijo" DataValueField="id_equipo">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:veronicaConnectionString2 %>" SelectCommand="SELECT [id_equipo], [activo_fijo] FROM [equipo]"></asp:SqlDataSource>
                    &nbsp;</span></td>
                <td rowspan="6" style="vertical-align: middle">
                    <br />
                    <br />
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/equipo.png" />
                    <br />
                </td>
            </tr>
            <tr>
                
                <td class="auto-style19" colspan="2">
                    <span class="auto-style31" style="font-size: x-large; color: #FFFFFF;">
                    <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Descripción del Mantenimiento"></asp:Label>
                    </span>
                    <br />
                    <asp:TextBox ID="tb1" runat="server" Width="282px" EnableViewState="False"  type="text" name="user" value="Descripción del mantenimiento" size="15" onfocus="if(this.value=='Descripción del mantenimiento') this.value=''" onblur="if(this.value=='') this.value='Descripción del mantenimiento'" Height="42px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="2">
                    <span class="auto-style31" style="font-size: x-large; color: #FFFFFF;">
                    <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="Falla Presentada"></asp:Label>
                    </span>
                    <br />
                    <asp:TextBox ID="tb3" runat="server" Width="280px" type="text" name="user" value="Falla presentada" size="15" onfocus="if(this.value=='Falla presentada') this.value=''" onblur="if(this.value=='') this.value='Falla presentada'" Height="50px" TextMode="MultiLine" OnTextChanged="tb3_TextChanged"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style36" colspan="2">
                    <span class="auto-style31" style="font-size: x-large; color: #FFFFFF;">
                    <asp:Label ID="Label5" runat="server" Font-Size="Medium" Text="Fecha del mantenimiento"></asp:Label>
                    </span>
                    <br />
                    <asp:TextBox ID="tb5" runat="server" Width="160px" type="text" name="user" value="AAAA/MM/DD" size="15" onfocus="if(this.value=='AAAA/MM/DD') this.value=''" onblur="if(this.value=='') this.value='AAAA/MM/DD'" Height="16px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style38" colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25" colspan="2">
                    <br />
                </td>
            </tr>
            <!--tr>
                <td class="auto-style1">
                    </td>
                <td class="auto-style1">
                    </td>
                <td class="auto-style1">
                    </td>
            <tr-->
              
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <table style="width: 95%; text-align: center; height: 86px;">
                        <tr>
                            <td class="auto-style32">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/GUARDAR.png" OnClick="ImageButton1_Click" ToolTip="GUARDAR EQUIPO" Width="87px" />
                            </td>
                        </tr>
                    </table>
                    </table>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div class="body2" style="text-align: center">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
   
           
            <asp:UpdatePanel ID="U_Panel" runat="server">
        <ContentTemplate>
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Panel ID="Panel" runat="server" Direction="RightToLeft" Height="204px" Width="1483px" ScrollBars="Auto">
                <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False" 
                                CellPadding="6" ForeColor="#333333" GridLines="None" Width="1328px" HorizontalAlign="Center" DataSourceID="SqlDataSource2" DataKeyNames="nro_mantenimiento">
                                <AlternatingRowStyle BackColor="White" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="tipo_equipo" HeaderText="EQUIPO" SortExpression="tipo_equipo" />
                                    <asp:BoundField DataField="dir_area" HeaderText="DIR/AREA" SortExpression="dir_area" />
                                    <asp:BoundField DataField="fecha" HeaderText="FECHA DEL MANTENIMIENTO" SortExpression="fecha" />
                                    <asp:BoundField DataField="desc_mantenimiento" HeaderText="DESCRIPCIÓN DEL MANTENIMIENTO" SortExpression="desc_mantenimiento" />
                                    <asp:BoundField DataField="falla_presentada" HeaderText="FALLA PRESENTADA" SortExpression="falla_presentada" />
                                    <asp:BoundField DataField="nro_mantenimiento" HeaderText="ID MANTENIMIENTO" ReadOnly="True" SortExpression="nro_mantenimiento" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" VerticalAlign="Middle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" VerticalAlign="Middle" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:veronicaConnectionString2 %>" SelectCommand="SELECT B.tipo_equipo, B.dir_area, A.fecha, A.desc_mantenimiento, A.falla_presentada, A.nro_mantenimiento FROM mant_correctivo AS A INNER JOIN equipo AS B ON A.id_equipo = B.id_equipo"></asp:SqlDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    
</div>
</asp:Content>
