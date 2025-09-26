<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="inserir.aspx.cs" Inherits="sweptwings.inserir1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="background-color:whitesmoke;">
          <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Aircraft:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tb_aircraft" runat="server" Width="400px" MaxLength="45"></asp:TextBox>

                        </td><%--\p{L}--%>
                        <td><%-- ^([^\\<>~=,?:*';:@=!*&+$,\/?#[]]|[A-Za-z0-9\-()çÇ])+$ --%>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_aircraft"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                        <br />     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_aircraft" ErrorMessage="Necessário o preenchimento da aeronave"></asp:RequiredFieldValidator>
                             </td>
                    </tr>

                        <tr>
                        <td>
                           <asp:Label ID="Label2" runat="server" Text="Airline:"></asp:Label>
                        </td>
                        <td>
                               <asp:TextBox ID="tb_airline" runat="server" Width="400px" MaxLength="45"></asp:TextBox>
                        </td>
                            <td>
                                 <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_airline"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                  <br />     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_airline" ErrorMessage="Necessário o preenchimento da operadora"></asp:RequiredFieldValidator>
                      
                            </td>
                    </tr>
                      <tr>
                        <td>
                           <asp:Label ID="Label3" runat="server" Text="REG:"></asp:Label>
                        </td>
                        <td>
                               <asp:TextBox ID="tb_reg" runat="server" Width="400px" MaxLength="45"></asp:TextBox>
                        </td>
                            <td>
                                 <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_reg"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                     <br />     <asp:RequiredFieldValidator ID="RequiredFieldValidator424" runat="server" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_reg" ErrorMessage="Necessário o preenchimento do REG"></asp:RequiredFieldValidator>
                      
                            </td>
                    </tr>
                       <tr>
                        <td>
                           <asp:Label ID="Label4" runat="server" Text="MSN:"></asp:Label>
                        </td>
                        <td>
                              <asp:TextBox ID="tb_msn" runat="server" Width="400px" MaxLength="45"></asp:TextBox>
                        </td>
                             <td>
                                 <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_msn"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                   <br /> <br />
                            </td>
                    </tr>
                     <tr>
                        <td>
                           <asp:Label ID="Label5" runat="server" Text="Airport:"></asp:Label>
                        </td>
                        <td>
                               <asp:TextBox ID="tb_airport" runat="server" Width="400px" MaxLength="45"></asp:TextBox>
                        </td>
                           <td>
                                 <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_airport"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                   <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_airport" ErrorMessage="Necessário o preenchimento do aeroporto"></asp:RequiredFieldValidator>
                      
                            </td>
                    </tr>
                       <tr>
                        <td>
                           <asp:Label ID="Label6" runat="server" Text="Date:"></asp:Label>
                        </td>
                        <td>
                               <asp:TextBox ID="tb_data" runat="server" TextMode="Date" MaxLength="45"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           <asp:Label ID="Label7" runat="server" Text="Remark:"></asp:Label>
                        </td>
                        <td>
                               <asp:TextBox ID="tb_remark" runat="server" TextMode="MultiLine" Height="72px" Width="507px" MaxLength="450"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="rgConclusionValidator222222" 
                                ControlToValidate="tb_remark" ErrorMessage="Special instruction can't exceed 450 characters"
                                ValidationExpression="^[\s\S]{0,450}$" runat="server" Display="None"  SetFocusOnError="true" /> 
                    <br /> <br />
                        </td>
                    </tr>
              <tr>
                  <td>
                      Imagem:
                  </td>
                  <td >


                      <asp:FileUpload ID="FileUpload1" runat="server" />


                  </td>
              </tr>
                </table>
         <br />
        
        <asp:Button ID="btn_insert" runat="server" Text="Inserir" OnClick="btn_insert_Click" style="float:right;" Width="359px" />
          <br />
         <br />
    </div>

  <%--  <asp:Panel ID="Panel_gestão" runat="server">
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="idregisto" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                  <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    Aircraft
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_aircraft" runat="server" Text='<%# Bind("aircraft") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_aircraft" runat="server"  Text='<%# Eval("aircraft") %>' MaxLength="21"></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    Airline
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_airline" runat="server" Text='<%# Bind("airline") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_airline" runat="server" MaxLength="21" Text='<%# Eval("airline") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    REG
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_reg" runat="server" Text='<%# Bind("reg") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_reg" runat="server" MaxLength="21" Text='<%# Eval("reg") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    MSN
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_msn" runat="server" Text='<%# Bind("msn") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_msn" runat="server" MaxLength="21" Text='<%# Eval("msn") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

                  <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    Airport
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_airport" runat="server" Text='<%# Bind("airport") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_airport" runat="server" MaxLength="21" Text='<%# Eval("airport") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    Data
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_datar" runat="server" Text='<%# Bind("datar") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_datar" runat="server"  TextMode="Date" Text='<%# Eval("datar") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    Remark
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_remark" runat="server" Text='<%# Bind("remark") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tb_remark" runat="server" MaxLength="450" TextMode="MultiLine" Text='<%# Eval("remark") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    Visitas
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lb_visitas" runat="server" Text='<%# Bind("visitas") %>'></asp:Label>
                </ItemTemplate>
                
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    
                </HeaderTemplate>
                <ItemTemplate>
                <asp:Image runat="server" Width="250px" Height="150px" ImageUrl='<%# "data:image/Jpeg;base64," + Convert.ToBase64String((byte[])Eval("img")) %>' />  
                </ItemTemplate>
                   <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

                <asp:CommandField ShowEditButton="True" ValidationGroup="alterar" UpdateText="Atualizar" EditText="Acesso" CancelText="Cancelar" CausesValidation="true"
                                        ButtonType="Image" EditImageUrl="~/images/edit.Jpeg" CancelImageUrl="~/images/cancel_edit.Jpeg" UpdateImageUrl="~/images/confirm_edit.Jpeg" />
            
            
                 <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="apagar_btn" runat="server" CommandName="apagar" CausesValidation="false"
                        ImageUrl="~/images/delete.png" Width="24px" Height="24" ToolTip="Apagar Operador" />
                   <%-- <ajaxToolkit:ConfirmButtonExtender ID="cbe" runat="server"
                        TargetControlID="apagar_btn"
                        ConfirmText="Tem a certeza que pretende apagar o registo?"
                        Enabled="true" />--%>
             <%--   </ItemTemplate>
                <HeaderStyle></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

    </asp:Panel>--%>

</asp:Content>
