<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="registrar_equipo.aspx.cs" Inherits="veronica2._0.registrar_equipo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:95%; vertical-align: middle; text-align: center;">
        <tr>
            <td style="width: 304px">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/inicio.aspx">Menú Principal</asp:LinkButton>
            </td>
            <td style="width: 285px">
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
                    REGISTRO DE EQUIPOS<br />
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="0">Seleccione el Tipo de Equipo</asp:ListItem>
                        <asp:ListItem Value="1">Lamparas</asp:ListItem>
                        <asp:ListItem Value="2">Faros</asp:ListItem>
                        <asp:ListItem Value="3">Aire Acondicionado</asp:ListItem>
                        <asp:ListItem Value="4">Tomas de Corriente</asp:ListItem>
                        
                    </asp:DropDownList>
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
                
                <td class="auto-style19">
                    <asp:TextBox ID="tb1" runat="server" Width="160px" EnableViewState="False"  type="text" name="user" value="Amp" size="15" onfocus="if(this.value=='Amp') this.value=''" onblur="if(this.value=='') this.value='Amp'" Height="16px" ToolTip="Amp del Equipo"></asp:TextBox>
                    <br />
                </td>
                <td>
                    <asp:TextBox ID="tb2" runat="server" Width="160px" type="text" name="user" value="Marca" size="15" onfocus="if(this.value=='Marca') this.value=''" onblur="if(this.value=='') this.value='Marca'" Height="16px" ToolTip="Marca del Equipo"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <asp:TextBox ID="tb3" runat="server" Width="160px" type="text" name="user" value="Modelo" size="15" onfocus="if(this.value=='Modelo') this.value=''" onblur="if(this.value=='') this.value='Modelo'" Height="16px" ToolTip="Modelo del Equipo"></asp:TextBox>
                    <br />
                </td>
                <td>
                    <asp:TextBox ID="tb4" runat="server" Width="160px" type="text" name="user" value="Corriente" size="15" onfocus="if(this.value=='Corriente') this.value=''" onblur="if(this.value=='') this.value='Corriente'" Height="16px" ToolTip="Tipo de Corriente"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style36">
                    <asp:TextBox ID="tb5" runat="server" Width="160px" type="text" name="user" value="Activo Fijo" size="15" onfocus="if(this.value=='Activo Fijo') this.value=''" onblur="if(this.value=='') this.value='Activo Fijo'" Height="16px" ToolTip="Activo Fijo Asignado al Equipo"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb10" runat="server" Width="160px" type="text" name="user" value="Dir/Area" size="15" onfocus="if(this.value=='Dir/Area') this.value=''" onblur="if(this.value=='') this.value='Dir/Area'" Height="16px" ToolTip="Dirección o Área del equipo"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style38">
                    <asp:TextBox ID="tb7" runat="server" Width="160px" type ="text" name="user" value="btu" size="15" onfocus="if(this.value=='btu') this.value=''" onblur="if(this.value=='') this.value='btu'" Height="16px" ToolTip="btu del equipo"></asp:TextBox>
                </td>
                <td style="text-align: center; color: #FFFFFF; font-size: x-large; ">
                    <asp:TextBox ID="tb6" runat="server" Width="160px" type="text" name="user" value="Tipo de bombillo" size="15" onfocus="if(this.value=='Tipo de bombillo') this.value=''" onblur="if(this.value=='') this.value='Tipo de bombillo'" Height="16px" ToolTip="Tipo del Bombillo"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:TextBox ID="tb8" runat="server" Width="160px" type="text" name="user" value="Refrigerante" size="15" onfocus="if(this.value=='Refrigerante') this.value=''" onblur="if(this.value=='') this.value='Refrigerante'" Height="16px" ToolTip="Refrigerante"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb9" runat="server" Width="160px" type="text" name="user" value="Voltios" size="15" onfocus="if(this.value=='Voltios') this.value=''" onblur="if(this.value=='') this.value='Voltios'" Height="16px" ToolTip="Voltaje del Equipo"></asp:TextBox>
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
   
           
            <asp:UpdatePanel ID="U_Panel" runat="server">
        <ContentTemplate>
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Panel ID="Panel" runat="server" Height="204px" Width="1483px" ScrollBars="Auto" Direction="RightToLeft">
                <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False" 
                                OnRowCancelingEdit="gv_data_RowCancelingEdit"
                                OnRowEditing="gv_data_RowEditing"
                                OnRowUpdating="gv_data_RowUpdating" CellPadding="6" ForeColor="#333333" GridLines="None" Width="1328px" HorizontalAlign="Center">
                                <AlternatingRowStyle BackColor="White" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btn_edit" runat="server" Text="Editar" CommandName="Edit"/>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="btn_update" runat="server" Text="Actualizar" CommandName="Update" />
                                            <asp:Button ID="btn_cancel" runat="server" Text="Cancelar" CommandName="Cancel" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id. Equipo">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_id_equipo" runat="server" Text='<%#Eval("id_equipo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Equipo">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_equipo" runat="server" Text='<%#Eval("tipo_equipo") %>'></asp:Label>
                                        </ItemTemplate>
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Corriente">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_corriente" runat="server" Text='<%#Eval("corriente") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="lbl_corriente" runat="server" Text='<%#Eval("corriente") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Refrigerante">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_refrigerante" runat="server" Text='<%#Eval("refrigerante") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="lbl_refrigerante" runat="server" Text='<%#Eval("refrigerante") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marca">
                                        <ItemTemplate>
                                            <asp:Label ID="marca" runat="server" Text='<%#Eval("marca") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="marca" runat="server" Text='<%#Eval("marca") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modelo">
                                        <ItemTemplate>
                                            <asp:Label ID="modelo" runat="server" Text='<%#Eval("modelo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="modelo" runat="server" Text='<%#Eval("modelo") %>'></asp:TextBox>
                                        </EditItemTemplate>                                   
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BTU">
                                        <ItemTemplate>
                                            <asp:Label ID="btu" runat="server" Text='<%#Eval("btu") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="btu" runat="server" Text='<%#Eval("btu") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Activo Fijo">
                                        <ItemTemplate>
                                            <asp:Label ID="act_fij" runat="server" Text='<%#Eval("activo_fijo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="act_fij" runat="server" Text='<%#Eval("activo_fijo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dir/Area">
                                        <ItemTemplate>
                                            <asp:Label ID="dir_area" runat="server" Text='<%#Eval("dir_area") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="dir_area" runat="server" Text='<%#Eval("dir_area") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
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
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    
</div>
</asp:Content>
