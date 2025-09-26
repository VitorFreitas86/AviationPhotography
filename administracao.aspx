<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administracao.aspx.cs" Inherits="sweptwings.administracao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:#4472C4; font-family:Verdana;">
    <form id="form1" runat="server">
        <div style="padding-bottom:15px;">
            <asp:Button ID="Button1" runat="server" Text="Inserir novo registo" Width="49%" OnClick="Button1_Click" Style="float:left;" Height="32px" />
            <asp:Button ID="Button2" runat="server" Text="Gerir utilizadores" Width="49%"  Style="float:right;"  Height="32px" OnClick="Button2_Click" />
        </div>
    <div style="margin-top:5px;">
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
                    <asp:TextBox ID="tb_aircraft" runat="server"  TextMode="MultiLine" Text='<%# Eval("aircraft") %>' MaxLength="45"></asp:TextBox>
                       <%--<asp:Label ID="lb_id_editing" runat="server" Text='<%# Bind("idregisto") %>' Visible="false"></asp:Label>--%>
                    <asp:RegularExpressionValidator ID="rgConclusionValidator2" 
                                ControlToValidate="tb_aircraft" ErrorMessage="Special instruction can't exceed 45 characters"
                                ValidationExpression="^[\s\S]{0,45}$" runat="server" Display="None"  SetFocusOnError="true" /> 
                       <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator55" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_aircraft"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="alterar" runat="server" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_aircraft" ErrorMessage="Necessário o preenchimento da aeronave"></asp:RequiredFieldValidator>
                          
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
                    <asp:TextBox ID="tb_airline" runat="server" TextMode="MultiLine" MaxLength="45" Text='<%# Eval("airline") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rgConclusionValidator22" 
                                ControlToValidate="tb_airline" ErrorMessage="Special instruction can't exceed 45 characters"
                                ValidationExpression="^[\s\S]{0,45}$" runat="server" Display="None"  SetFocusOnError="true" /> 
                      <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator44" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_airline"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="alterar" runat="server" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_airline" ErrorMessage="Necessário o preenchimento da operadora"></asp:RequiredFieldValidator>
                      
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
                    <asp:TextBox ID="tb_reg" runat="server" TextMode="MultiLine" MaxLength="45" Text='<%# Eval("reg") %>'></asp:TextBox>
                       <asp:RegularExpressionValidator ID="rgConclusionValidator222" 
                                ControlToValidate="tb_reg" ErrorMessage="Special instruction can't exceed 45 characters"
                                ValidationExpression="^[\s\S]{0,45}$" runat="server" Display="None"  SetFocusOnError="true" /> 
                      <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator33" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_reg"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                  <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4234" runat="server" ValidationGroup="alterar" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_reg" ErrorMessage="Necessário o preenchimento do REG"></asp:RequiredFieldValidator>
                      
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
                    <asp:TextBox ID="tb_msn" runat="server" TextMode="MultiLine" MaxLength="45" Text='<%# Eval("msn") %>'></asp:TextBox>
                     <asp:RegularExpressionValidator ID="rgConclusionValidator2222" 
                                ControlToValidate="tb_msn" ErrorMessage="Special instruction can't exceed 45 characters"
                                ValidationExpression="^[\s\S]{0,45}$" runat="server" Display="None"  SetFocusOnError="true" /> 
                      <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator22" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_msn"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                  <br />
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
                    <asp:TextBox ID="tb_airport" runat="server" TextMode="MultiLine" MaxLength="45" Text='<%# Eval("airport") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rgConclusionValidator22222" 
                                ControlToValidate="tb_airport" ErrorMessage="Special instruction can't exceed 45 characters"
                                ValidationExpression="^[\s\S]{0,45}$" runat="server" Display="None"  SetFocusOnError="true" /> 
                      <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator11" ValidationExpression="^([^<>!@#%/?*+\[\]\\])+$"  ControlToValidate="tb_airport"  ForeColor="Red" ErrorMessage="Campo possui caracteres irregulares. os seguintes caracteres não podem ser introduzidos: [^* ' ; : @  & = + $ , \/ ? # []]*$"></asp:RegularExpressionValidator>
                   
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup="alterar" runat="server" ForeColor="Red" Font-Bold="true" ControlToValidate="tb_airport" ErrorMessage="Necessário o preenchimento do aeroporto"></asp:RequiredFieldValidator>
                 
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
                <EditItemTemplate><%--'<%# Eval("datar") %>'--%>
                    <asp:TextBox ID="tb_datar" runat="server"  TextMode="Date" Text='<%# Bind("datar", "{0:yyyy-MM-ddTHH:mm:ss}") %>'></asp:TextBox>
                    <br />
                    <br />
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
                     <asp:RegularExpressionValidator ID="rgConclusionValidator222222" 
                                ControlToValidate="tb_remark" ErrorMessage="Special instruction can't exceed 450 characters"
                                ValidationExpression="^[\s\S]{0,450}$" runat="server" Display="None"  SetFocusOnError="true" /> 
                    <br />
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
                <asp:Image runat="server" Width="250px" Height="150px" ImageUrl='<%# "data:image/Jpeg;base64," + Convert.ToBase64String((byte[])Eval("img_thumb")) %>' />  
                </ItemTemplate>
                   <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField> 

                <asp:CommandField ShowEditButton="True" ValidationGroup="alterar" UpdateText="Atualizar" EditText="Acesso" CancelText="Cancelar" CausesValidation="true"
                                        ButtonType="Image" EditImageUrl="~/images/edit.png" CancelImageUrl="~/images/cancel_edit.png" UpdateImageUrl="~/images/confirm_edit.png" />
            
            
                 <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:ImageButton ID="apagar_btn" runat="server" CommandName="apagar" CausesValidation="false"
                        ImageUrl="~/images/delete.png" Width="24px" Height="24" ToolTip="Apagar Operador" />
                   <%-- <ajaxToolkit:ConfirmButtonExtender ID="cbe" runat="server"
                        TargetControlID="apagar_btn"
                        ConfirmText="Tem a certeza que pretende apagar o registo?"
                        Enabled="true" />--%>
                </ItemTemplate>
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

    </div>
    </form>
</body>
</html>
