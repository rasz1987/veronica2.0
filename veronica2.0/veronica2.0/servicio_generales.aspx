<%@ Page Title="" Language="C#" MasterPageFile="~/usuario.Master" AutoEventWireup="true" CodeBehind="servicio_generales.aspx.cs" Inherits="veronica2._0.servicio_generales" %>
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


<table style="width: 100%; text-align: center; height: 448px; empty-cells: show;">
            <tr>
                <td class="auto-style4" colspan="2"><span class="auto-style31" style="font-size: x-large; color: #FFFFFF; width: 956px;">
                    <br />
                    <br />
                    Área de Servicios Generales</span></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    
                    <asp:UpdatePanel ID="Panel1"  runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="panel2" runat="server" Height="331px" ScrollBars="Vertical" Width="949px">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                    
                                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="10000" >
                                </asp:Timer>
                            <asp:GridView ID="gv_data" runat="server" AutoGenerateColumns="False" 
                                OnRowCancelingEdit="gv_data_RowCancelingEdit"
                                OnRowEditing="gv_data_RowEditing"
                                OnRowUpdating="gv_data_RowUpdating" CellPadding="6" ForeColor="#333333" GridLines="None" Width="945px">
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
                                    <asp:TemplateField HeaderText="Número de Servicio">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_num_ser" runat="server" Text='<%#Eval("num_ser") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha de Solicitud">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_fec_sol" runat="server" Text='<%#Eval("fecha", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Descripción del Servicio">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_desc_ser" runat="server" Text='<%#Eval("desc_ser") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Usuario">
                                        <ItemTemplate>
                                            <asp:Label ID="usuario" runat="server" Text='<%#Eval("nom_user") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Estatus">
                                        <ItemTemplate>
                                            <asp:Label ID="estatus" runat="server" Text='<%#Eval("estatus") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="estatus" runat="server" Text='<%#Eval("estatus") %>'></asp:TextBox>
                                        </EditItemTemplate>                                   
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha de Atención">
                                        <ItemTemplate>
                                            <asp:Label ID="fec_fin" runat="server" Text='<%#Eval("fecha_fin", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
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
                    
                </td>
                <td style="vertical-align: middle">
                    &nbsp;</td>
            </tr>
                    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
