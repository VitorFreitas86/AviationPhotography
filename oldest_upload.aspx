<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oldest_upload.aspx.cs" Inherits="sweptwings.oldest_upload1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">
    #divOne
    {
        width:100%;
        text-align:center;
    }
   
    #tblOne
    {
        margin:0 auto;       
    }
   input[disabled='disabled'] {
       background-color:#8EAADB;
}

   #sidebar {
    position: -webkit-sticky;  
    position: sticky;
    top: 0; 
} 
   #sticky { 
    width: 265px; 
    height: 300px; 
    background: whitesmoke; 
    float: right;
}

#container { 
    width: 100%; 
}
  .button-link {
         background:whitesmoke;
    color:#4472C4;
     -webkit-transition-duration: 0.2s;
    -moz-transition-duration: 0.2s;
    transition-duration: 0.2s;
    padding:5px 5px 5px 5px;
    font:bold;
        border-radius: 5px 5px 5px 5px;

        }

        .button-link:hover, .button-link:focus {
    background: #356094;
    border: solid 1px #2A4E77;
    text-decoration: none;
    color:whitesmoke;
}
        </style>
        <title>Aviation Photography - João Toste </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div align="center" >
       <asp:Panel ID="Panel1" runat="server" >
        <asp:DataList ID="DataList1" runat="server" Font-Size="8pt" RepeatDirection="Vertical" DataKeyField="idregisto" RepeatColumns="5" CellPadding="15"  >
            <ItemTemplate>
              <div style="border: 1px solid black; padding: 8px 8px 8px 8px; background-color: #8EAADB;">
                         <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# String.Format("~/image/{0}/{1}/{2}/{3}/{4}", Eval("idregisto"),Eval("airport_url") ,Eval("airline_url"), Eval("aircraft_url"),Eval("reg_url")) %>' runat="server" Target="_blank">
                           <asp:Image runat="server" Width="250px" Height="150px" ImageUrl='<%# "data:image/Jpeg;base64," + Convert.ToBase64String((byte[])Eval("img_thumb")) %>' />
                            <asp:Label ID="lb_idregisto" runat="server" Text='<%# Bind("idregisto") %>' Visible="false"></asp:Label>
                        </asp:HyperLink>
               <%--         <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Aircraft:" Font-Bold="true"></asp:Label>
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink_aircraft"  Width="185px" NavigateUrl='<%# String.Format("~/list/{0}/{1}","aircraft",Eval("aircraft"))%>' runat="server" Text='<%# Bind("aircraft") %>' Target="_blank" Style="text-decoration: none; color: black;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Airline:" Font-Bold="true"></asp:Label>
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink_airline"  Width="185px" NavigateUrl='<%# String.Format("~/list/{0}/{1}","airline",Eval("airline"))%>' runat="server" Text='<%# Bind("airline") %>' Target="_blank" Style="text-decoration: none; color: black;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="REG:" Font-Bold="true"></asp:Label>
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink_reg"  Width="185px" NavigateUrl='<%# String.Format("~/list/{0}/{1}","reg",Eval("reg"))%>' runat="server" Text='<%# Bind("reg") %>' Target="_blank" Style="text-decoration: none; color: black;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="MSN:" Font-Bold="true"></asp:Label>
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink_msn"  Width="185px" NavigateUrl='<%# String.Format("~/list/{0}/{1}","msn",Eval("msn"))%>' runat="server" Text='<%# Bind("msn") %>' Target="_blank" Style="text-decoration: none; color: black;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Airport:" Font-Bold="true"></asp:Label>
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink_airport"  Width="185px" NavigateUrl='<%# String.Format("~/list/{0}/{1}","airport",Eval("airport"))%>' runat="server" Text='<%# Bind("airport") %>' Target="_blank" Style="text-decoration: none; color: black;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="Date:" Font-Bold="true"></asp:Label>
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink_datar"  Width="185px" NavigateUrl='<%# String.Format("~/list/{0}/{1}","datar",Eval("datar"))%>' runat="server" Text='<%# Bind("datar") %>' Target="_blank" Style="text-decoration: none; color: black;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="Remark:" Font-Bold="true"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lb_remark" runat="server" Width="185px" Text='<%# Bind("remark") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>--%>
                   <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Aircraft:" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                                   <asp:LinkButton id="LinkButton_aircraft"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_aircraft_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                                <asp:Label ID="lb_aircraft" Width="185px"  runat="server" Text='<%# Bind("aircraft") %>'></asp:Label>
                                       </asp:LinkButton>
                        </td>
                    </tr>
                        <tr>
                        <td>
                           <asp:Label ID="Label2" runat="server" Text="Airline:" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                                                <asp:LinkButton id="LinkButton1"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_airline_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                              <asp:Label ID="lb_airline" runat="server" Width="185px"  Text='<%# Bind("airline") %>'></asp:Label>
                                                    </asp:LinkButton>
                        </td>
                    </tr>
                      <tr>
                        <td>
                           <asp:Label ID="Label3" runat="server" Text="REG:" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                                                                  <asp:LinkButton id="LinkButton2"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_reg_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                     <asp:Label ID="lb_reg" runat="server" Width="185px"  Text='<%# Bind("reg") %>'></asp:Label>
                                                                      </asp:LinkButton>
                        </td>
                    </tr>
                       <tr>
                        <td>
                           <asp:Label ID="Label4" runat="server" Text="MSN:" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                                                                          <asp:LinkButton id="LinkButton3"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_msn_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;"  >
                       <asp:Label ID="lb_msn" runat="server" Width="185px"  Text='<%# Bind("msn") %>'></asp:Label>
                                                                              </asp:LinkButton>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           <asp:Label ID="Label5" runat="server" Text="Airport:" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton id="LinkButton4"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_airport_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                       <asp:Label ID="lb_airport" runat="server" Width="185px"  Text='<%# Bind("airport") %>'></asp:Label>
                                </asp:LinkButton>
                        </td>
                    </tr>
                       <tr>
                        <td>
                           <asp:Label ID="Label6" runat="server" Text="Date:" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                                        <asp:LinkButton id="LinkButton5"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_datar_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                     <asp:Label ID="lb_data" runat="server" Text='<%# Bind("datar") %>'></asp:Label>
                                            </asp:LinkButton>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           <asp:Label ID="Label7" runat="server" Text="Remark:" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                              <asp:Label ID="lb_remark" runat="server"  Font-Bold="false"   Width="185px"  Text='<%# Bind("remark") %>'></asp:Label>
                            <%--<asp:TextBox ID="lb_remark" runat="server" TextMode="MultiLine" ForeColor="Black" Font-Names="Verdana"  BackColor="#8EAADB" Style=" -ms-overflow-style: none;  border:0px; resize:none; overflow:no-display; background-color:#8EAADB;" enabled="false"  Width="185px"  Text='<%# Bind("remark") %>' ReadOnly="true" ></asp:TextBox>--%>
                        </td>
                    </tr>
                </table>
                    </div>
            </ItemTemplate>
        </asp:DataList>
              
         <div id="divOne">
            <table cellpadding="0" border="0"  id="tblOne" style="color:WhiteSmoke; font-size:10pt;"  >
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="lbtnFirst" runat="server" CssClass="button-link" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                &nbsp;</td>
                            <td align="right">
                                <asp:LinkButton ID="lbtnPrevious" runat="server" CssClass="button-link" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;</td>
                            <td align="center" valign="middle">
                                <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                    OnItemDataBound="dlPaging_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnPaging" runat="server" CssClass="button-link"  CommandArgument='<%# Eval("PageIndex") %>'
                                            CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td align="left">
                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnNext" runat="server" CssClass="button-link" CausesValidation="false"
                                    OnClick="lbtnNext_Click">Next</asp:LinkButton></td>
                            <td align="left">
                                &nbsp;
                                <asp:LinkButton ID="lbtnLast" runat="server" CssClass="button-link" CausesValidation="false" OnClick="lbtnLast_Click" >Last</asp:LinkButton></td>
                        </tr>
                           <tr>
                            <td colspan="5" align="center" style="height: 30px" valign="middle">
                                <asp:Label ID="lblfotoInfo" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="5" align="center" style="height: 30px" valign="middle">
                                <asp:Label ID="lblPageInfo" runat="server"></asp:Label></td>
                        </tr>
                      
                    </table> </div>
              </asp:Panel>
         </div>
</asp:Content>
