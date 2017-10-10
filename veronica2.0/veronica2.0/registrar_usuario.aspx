<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="registrar_usuario.aspx.cs" Inherits="veronica2._0.registrar_usuario" %>
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
                    <br />
                    REGISTRO DE USUARIOS</span></td>
                <td rowspan="5" style="vertical-align: middle">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/images/usuario1.png" />
                </td>
            </tr>
            <tr>
                <td class="auto-style19">
                    <asp:Image ID="Image1" runat="server" Height="30px" ImageUrl="~/imagenes/usuario.png" />
                    <asp:TextBox ID="tb1" runat="server" Width="160px" EnableViewState="False"  type="text" name="user" value="Nombre" size="15" onfocus="if(this.value=='Nombre') this.value=''" onblur="if(this.value=='') this.value='Nombre'" Height="28px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    <br />
                </td>
                <td class="auto-style20">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/usuario.png" />
                    &nbsp;
                    <asp:TextBox ID="tb2" runat="server" Width="160px" type="text" name="user" value="Apellido" size="15" onfocus="if(this.value=='Apellido') this.value=''" onblur="if(this.value=='') this.value='Apellido'" Height="30px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/imagenes/email.png" />
                    &nbsp;<asp:TextBox ID="tb3" runat="server" Width="160px" type="text" name="user" value="E-mail" size="15" onfocus="if(this.value=='E-mail') this.value=''" onblur="if(this.value=='') this.value='E-mail'" Height="30px"></asp:TextBox>
                    <br />
                </td>
                <td class="auto-style23">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/imagenes/oficina.png" />
                    <asp:TextBox ID="tb4" runat="server" Width="160px" type="text" name="user" value="Direccion/Oficina" size="15" onfocus="if(this.value=='Direccion/Oficina') this.value=''" onblur="if(this.value=='') this.value='Direccion/Oficina'" Height="30px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style36">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/imagenes/cedula.png" Height="29px" Width="34px" />
                    <asp:TextBox ID="tb5" runat="server" Width="160px" type="text" name="user" value="Cedula" size="15" onfocus="if(this.value=='Cedula') this.value=''" onblur="if(this.value=='') this.value='Cedula'" Height="30px"></asp:TextBox>
                </td>
                <td class="auto-style37">
                    &nbsp;
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/imagenes/usuario.png" />
                    <asp:TextBox ID="tb6" runat="server" Width="160px" type="text" name="user" value="Usuario" size="15" onfocus="if(this.value=='Usuario') this.value=''" onblur="if(this.value=='') this.value='Usuario'" Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style38">
                    <asp:Image ID="Image7" runat="server" ImageUrl="~/imagenes/clave.png" />
                    &nbsp; <asp:TextBox ID="tb7" runat="server" Width="160px" type ="text" name="user" value="Clave" size="15" onfocus="if(this.value=='Clave') this.value=''" onblur="if(this.value=='') this.value='Clave'" Height="30px"></asp:TextBox>
                &nbsp;</td>
                <td class="auto-style39" style="text-align: center; color: #FFFFFF; font-size: x-large; ">
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/imagenes/tlf.png" />
                    &nbsp;<asp:TextBox ID="tb9" runat="server" Width="160px" type="text" name="user" value="Telefono" size="15" onfocus="if(this.value=='Telefono') this.value=''" onblur="if(this.value=='') this.value='Telefono'" Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/imagenes/clave.png" />
                    &nbsp;<asp:TextBox ID="tb8" runat="server" Width="160px" type="text" name="user" value="Confirmar clave" size="15" onfocus="if(this.value=='Confirmar clave') this.value=''" onblur="if(this.value=='') this.value='Confirmar clave'" Height="30px"></asp:TextBox>
                </td>
                <td class="auto-style26">
                    <asp:Image ID="Image11" runat="server" ImageUrl="~/imagenes/usuario.png" />
                    &nbsp;<asp:TextBox ID="tb10" runat="server" Width="160px" type="text" name="user" value="Area" size="15" onfocus="if(this.value=='Area') this.value=''" onblur="if(this.value=='') this.value='Area'" Height="30px"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style2">
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style2">
                    <br />
                    <table style="width: 99%;">
                        <tr>
                            <td class="auto-style32">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/GUARDAR.png" ToolTip="GUARDAR" Width="87px" OnClick="ImageButton1_Click" />
                            </td>
                            <td class="auto-style35">
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/editar.png" ToolTip="EDITAR" Width="87px" OnClick="ImageButton2_Click" />
                            </td>
                            <td class="auto-style34">
                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/buscar.png" ToolTip="BUSCAR" Width="87px" OnClick="ImageButton3_Click" />
                            </td>
                        </tr>
                    </table>
                    </table>


   <div class="body2" style="text-align: center">
    <br />
    <asp:UpdatePanel ID="u_panel" runat="server">
        <ContentTemplate>
    <asp:Panel ID="panel1" runat="server" HorizontalAlign="Center" ScrollBars="Auto" Width="1226px">
        <table style="width: 1203px; text-align: center; " dir="rtl">
            <tr>
                <td class="auto-style3">

                </td>
                <td class="auto-style6" dir="auto">
        <asp:ScriptManager ID="s_manager" runat="server"></asp:ScriptManager>
        <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False"
            OnRowCancelingEdit="gv_data_RowCancelingEdit"
            OnRowEditing="gv_data_RowEditing"
            OnRowUpdating="gv_data_RowUpdating"
            OnRowDeleting="gv_data_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" Height="174px" Width="968px" Visible="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="editar" runat="server" text="Editar" CommandName="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btn_atualizar" runat="server" Text="Actualizar" CommandName="Update" />
                        <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" CommandName="Cancel" />
                        <asp:Button ID="btn_eliminar" runat="server" OnClientClick="return confirm('¿Desea eliminar el registro?');" Text="Eliminar" CommandName="Delete" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cédula">
                    <ItemTemplate>
                        <asp:Label ID="lbl_cedula" runat="server" Text='<%#Eval("id_user") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <asp:Label ID="lbl_user" runat="server" Text='<%#Eval("nom_user") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_user" runat="server" Text='<%#Eval("nom_user") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ape" runat="server" Text='<%#Eval("ape_user") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_ape" runat="server" Text='<%#Eval("ape_user") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <ItemTemplate>
                        <asp:Label ID="lbl_usuario" runat="server" Text='<%#Eval("user_name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_usuario" runat="server" Text='<%#Eval("user_name") %>'></asp:TextBox>
                    </EditItemTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Clave">
                    <ItemTemplate>
                        <asp:Label ID="lbl_pass" runat="server" textmode="Password" Text='<%#Eval("pass_user") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_pass" runat="server" Text='<%#Eval("pass_user") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Area">
                    <ItemTemplate>
                        <asp:Label ID="lbl_area" runat="server" Text='<%#Eval("area") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lbl_area" runat="server" Text='<%#Eval("area") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>
            
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            
        </asp:GridView>
                    </td>
                <td dir="rtl">

                </td>
                </tr>
            </table>
    </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    
</div>

</asp:Content>
