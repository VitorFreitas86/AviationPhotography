<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="sweptwings.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Aviation Photography - João Toste </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div align="center" style="text-decoration:none; color:black; font-size:8pt;" >
        <asp:DataList ID="DataList1" runat="server" Font-Size="8pt" RepeatDirection="Vertical" DataKeyField="idregisto" RepeatColumns="5" CellPadding="10">
            <ItemTemplate>
                 <div style="border: 1px solid black; padding: 8px 8px 8px 8px; background-color: #8EAADB;">
                          <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# String.Format("~/image/{0}/{1}/{2}/{3}/{4}", Eval("idregisto"),Eval("airport_url") ,Eval("airline_url"), Eval("aircraft_url"),Eval("reg_url")) %>' runat="server" Target="_blank">
                            <asp:Image runat="server" Width="250px" Height="150px" ImageUrl='<%# "data:image/Jpeg;base64," + Convert.ToBase64String((byte[])Eval("img_thumb")) %>' />
                            <asp:Label ID="lb_idregisto" runat="server" Text='<%# Bind("idregisto") %>' Visible="false"></asp:Label>
                        </asp:HyperLink>
             <%--           <table>
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
                                    <asp:HyperLink ID="HyperLink_datar" NavigateUrl='<%# String.Format("~/list/{0}/{1}","datar",Eval("datar"))%>' runat="server" Text='<%# Bind("datar") %>' Target="_blank" Style="text-decoration: none; color: black;" />
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
                                                <asp:LinkButton id="LinkButton_airline"
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
                                                                  <asp:LinkButton id="LinkButton_reg"
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
                                                                          <asp:LinkButton id="LinkButton_msn"
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
                            <asp:LinkButton id="LinkButton_airport"
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
    </div>
</asp:Content>
