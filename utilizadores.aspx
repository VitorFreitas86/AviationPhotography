<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="utilizadores.aspx.cs" Inherits="sweptwings.utilizadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="Panel2" runat="server" BackColor="WhiteSmoke" Visible="true">
          <table cellpadding="4" cellspacing="0" style="border-collapse:collapse; width:100%; ">
                    <tr>
                        <td style="vertical-align:top;">
                            <table cellpadding="0" style="width:100%;"  >
                               
                                <tr>
                                    <td align="center" colspan="4" style="color:White;background-color:#507CD1;font-size:0.9em;font-weight:bold;">Novo Utilizador</td>
                                </tr>
                                 <tr>
                                    <td colspan="4"></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                     
                                </tr>
                                <tr>
                                      <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="4">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Text="Adicionar" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                    </td>
                                </tr>
                            </table>
                            </td>
                        <td style="vertical-align:top;">
                            <div style="float:right;">
                             <asp:GridView ID="GridView_user" runat="server" DataKeyNames="idutilizador" AutoGenerateColumns="False" CellPadding="4" GridLines="None" ForeColor="#333333" OnRowCancelingEdit="GridView_user_RowCancelingEdit" OnRowCommand="GridView_user_RowCommand" OnRowDataBound="GridView_user_RowDataBound" OnRowEditing="GridView_user_RowEditing" OnRowUpdating="GridView_user_RowUpdating">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate >
                 <p style="font-size:0.9em"> Nome Utilizador</p>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_nome" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_nome" runat="server"  Text='<%# Eval("nome") %>' MaxLength="21"></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <p style="font-size:0.9em"> Palavra-Chave</p>  
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_pass" runat="server" Text='<%# Bind("pass") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_pass" runat="server"  Text='<%# Eval("pass") %>' MaxLength="21"></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="True" ValidationGroup="alterar" UpdateText="Atualizar" EditText="Acesso" CancelText="Cancelar" CausesValidation="true"
                                        ButtonType="Image" EditImageUrl="~/images/edit.png" CancelImageUrl="~/images/cancel_edit.png" UpdateImageUrl="~/images/confirm_edit.png" />
                 <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="apagar_btn" runat="server" CommandName="apagar" CausesValidation="false"
                        ImageUrl="~/images/delete.png" Width="24px" Height="24" ToolTip="Apagar" />
                            </ItemTemplate>
                <HeaderStyle></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                                </div>
                        </td>
                        </tr>
              </table>
    </asp:Panel>
</asp:Content>
