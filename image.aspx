<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="image.aspx.cs" Inherits="sweptwings.image1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta property="og:type" ="website" />
    <meta name="robots" content="index, follow" />
       <meta name="googlebot" content="index, follow" />
    <%--<meta property="og:image:type" content="image/png" />--%>
    <style type="text/css">
        .centerImage {
            text-align: center;
            display: block;
        }

        .box {
            /* basics */
            background-color: #4472C4;
            /*color: #C4BE92;*/
            text-align: center;
            color: white;
            /* rounded corners */
            -webkit-border-radius: 12px;
            border-radius: 12px;
            -moz-background-clip: padding;
            -webkit-background-clip: padding-box;
            background-clip: padding-box;
            padding: .8em .8em 1em;
            width: 8em;
            margin: 0 auto;
            -webkit-box-shadow: 0px 0px 12px 0px #000;
            box-shadow: 0px 0px 12px 0px #000;
            margin-bottom:5px;
            margin-top:5px;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%--  <script>
        var mydiv = document.getElementById('myCommentsDiv');
        mydiv.innerHTML =
           '<div class="fb-comments" data-href="' + document.location.href + '" data-num-posts="2" data-width="470"></fb:comments>';
        FB.XFBML.parse(mydiv);
    </script>--%>
  
    <asp:Panel ID="Panel1" runat="server" Width="100%" HorizontalAlign="center">
        <table style="width: 100%; font-size:10pt;">
            <tr>
                <td style="width: 100%;">
                    <table style="background-color: #8EAADB;" align="center">
                        <tr>
                            <td colspan="3">
                                <%--<asp:Image runat="server" ID="img1" ImageUrl='<%# "data:image/Jpeg;base64," + Convert.ToBase64String((byte[])Eval("img")) %>' />--%>
                            <asp:HyperLink  ID="HyperLink1"  runat="server" Target="_blank">
                            <asp:Image ID="img1" runat="server"  ImageUrl='<%# "data:image/Jpeg;base64," + Convert.ToBase64String((byte[])Eval("img_thumb")) %>' />
                            <asp:Label ID="lb_idregisto" runat="server" Text='<%# Bind("idregisto") %>' Visible="false"></asp:Label>
                        </asp:HyperLink>
                                 </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div class="box">
                                    <asp:Label ID="lb_visitas" runat="server" Text=""></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td  style="text-align:left;" >
                                &nbsp; &nbsp;
                                <asp:Label ID="Label1" runat="server" Text="Aircraft:" Font-Bold="true"></asp:Label>
                               <%-- <asp:LinkButton ID="LinkButton_aircraft"
                                    OnClientClick="window.document.forms[0].target='_blank';" OnClick="LinkButton_aircraft_click"
                                    runat="server" Style="color: Black; text-decoration: none; text-decoration: none;">
                                    
                                </asp:LinkButton>--%>
                            <asp:LinkButton id="LinkButton_aircraft"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_aircraft_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                                <asp:Label ID="lb_aircraft"   runat="server" Text='<%# Bind("aircraft") %>'></asp:Label>
                                       </asp:LinkButton>
                            </td>
                            <td></td>
                            <td style="text-align:left;">
                                
                                <asp:Label ID="Label5" runat="server" Text="Airport:" Font-Bold="true"></asp:Label>
                          <%--      <asp:LinkButton ID="LinkButton4"
                                    OnClientClick="window.document.forms[0].target='_blank';" OnClick="LinkButton_airport_click"
                                    runat="server" Style="color: Black; text-decoration: none; text-decoration: none;">
                                
                                </asp:LinkButton>  --%>
                                    <asp:LinkButton id="LinkButton_airport"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_airport_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                       <asp:Label ID="lb_airport" runat="server"  Text='<%# Bind("airport") %>'></asp:Label>
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:left;">
                                  &nbsp; &nbsp;
                                <asp:Label ID="Label2" runat="server" Text="Airline:" Font-Bold="true"></asp:Label>
                             <%--   <asp:LinkButton ID="LinkButton1"
                                    OnClientClick="window.document.forms[0].target='_blank';" OnClick="LinkButton_airline_click"
                                    runat="server" Style="color: Black; text-decoration: none; text-decoration: none;">
                                   
                                </asp:LinkButton>--%>
                                                               <asp:LinkButton id="LinkButton_airline"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_airline_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                              <asp:Label ID="lb_airline" runat="server"   Text='<%# Bind("airline") %>'></asp:Label>
                                                    </asp:LinkButton>
                            </td>
                            <td></td>
                            <td style="text-align:left;">
                                <asp:Label ID="Label6" runat="server" Text="Date:" Font-Bold="true"></asp:Label>
                             <%--   <asp:LinkButton ID="LinkButton5"
                                    OnClientClick="window.document.forms[0].target='_blank';" OnClick="LinkButton_datar_click"
                                    runat="server" Style="color: Black; text-decoration: none; text-decoration: none;">
                                   
                                </asp:LinkButton> --%>
                                 <asp:LinkButton id="LinkButton5"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_datar_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                     <asp:Label ID="lb_data" runat="server" Text='<%# Bind("datar") %>'></asp:Label>
                                            </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:left;">
                                  &nbsp; &nbsp;
                                <asp:Label ID="Label3" runat="server" Text="REG:" Font-Bold="true"></asp:Label>
                               <%-- <asp:LinkButton ID="LinkButton2"
                                    OnClientClick="window.document.forms[0].target='_blank';" OnClick="LinkButton_reg_click"
                                    runat="server" Style="color: Black; text-decoration: none; text-decoration: none;">
                                  
                                </asp:LinkButton>--%>
                               <asp:LinkButton id="LinkButton_reg"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_reg_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;" >
                     <asp:Label ID="lb_reg" runat="server"   Text='<%# Bind("reg") %>'></asp:Label>
                                                                      </asp:LinkButton>
                            </td>
                            <td></td>
                            <td style="text-align:left;">
                                <asp:Label ID="Label4" runat="server" Text="MSN:" Font-Bold="true"></asp:Label>

                             <%--   <asp:LinkButton ID="LinkButton3"
                                    OnClientClick="window.document.forms[0].target='_blank';" OnClick="LinkButton_msn_click"
                                    runat="server" Style="color: Black; text-decoration: none; text-decoration: none;">
                                    
                                </asp:LinkButton>  --%>
                             <asp:LinkButton id="LinkButton_msn"
 OnClientClick="window.document.forms[0].target='_blank';"  OnClick="LinkButton_msn_click"
       runat="server" style="color:Black; text-decoration:none; text-decoration:none;"  >
                       <asp:Label ID="lb_msn" runat="server"   Text='<%# Bind("msn") %>'></asp:Label>
                                                                              </asp:LinkButton>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="3" style="text-align:left;" >
                                  &nbsp; &nbsp;
                                <asp:Label ID="Label7" runat="server" Text="Remark:" Font-Bold="true"></asp:Label>
                                <asp:Label ID="lb_remark" runat="server" Text='<%# Bind("remark") %>'></asp:Label>
                                <br />   <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <%--<div>
                                    <span class='st_facebook_hcount' displaytext='Facebook'></span>
                                    <span class='st_sharethis_hcount' displaytext='ShareThis'></span>
                                    <span class='st_twitter_hcount' displaytext='Tweet'></span>
                                    <span class='st_linkedin_hcount' displaytext='LinkedIn'></span>
                                    <span class='st_pinterest_hcount' displaytext='Pinterest'></span>
                                    <span class='st_email_hcount' displaytext='Email'></span>
                                </div>--%>
                                <div class="sharethis-inline-share-buttons"></div>
                                 <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" >
                                  <%--<script type="text/javascript">var switchTo5x = true;</script>--%>
    <%--<script type="text/javascript" id="st_insights_js" src="JS/buttons.js?publisher=7f5d6a38-decc-44e3-bc0d-0d8836f5d7bf"></script>--%>
    <%--<script type="text/javascript">stLight.options({ publisher: "7f5d6a38-decc-44e3-bc0d-0d8836f5d7bf", doNotHash: false, doNotCopy: false, hashAddressBar: false });</script>--%>
 <%--   <div id="fb-root"></div>--%>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/pt_PT/sdk.js#xfbml=1&version=v2.8&appId=265210547241092";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
                                <script type="text/javascript" src="//platform-api.sharethis.com/js/sharethis.js#property=58e6401b1f68e90012f2abd7&product=inline-share-buttons"></script>
                                <div id="fb-root"></div><%--<script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script>--%>
                                <script src="JS/all.js#xfbml=1"></script>
                                <div id="fbc"></div>
                                <script>
    var elemDiv = document.getElementById("fbc");
    var markup = '';
    markup += '<div class="fb-comments" data-href="'+location.href+'" data-num-posts="10" data-width="500" style="margin-bottom:10px;"></div>';
    elemDiv.innerHTML = markup;
    FB.XFBML.parse(elemDiv);
</script>
<%--<script type="text/javascript" src = "//connect.facebook.net/bg_BG/all.js#xfbml=1&appId=xxxxxxxxxx"></script>--%>

                                
    <%--<div><%# ("Clients") %></div>--%>
                               <%--<div '<%# String.Format("http://vhfreitas-001-site1.ctempurl.com/image.aspx/{0}/", Eval("Clients")) %>' id="myCommentsDiv"> http://vhfreitas-001-site1.ctempurl.com/image.aspx/<%=Request.QueryString["ID"]%> </div>--%>
                               <%--  <fb:comments href="" num_posts="10" width="500">'"http://vhfreitas-001-site1.ctempurl.com/image.aspx/"+<%=Clients %>'</fb:comments>--%>
                                 <%--  <div class="fb-comments" data-width="500"  data-href="<?php echo $url;>" data-numposts="10" style=" margin-bottom:10px;"></div>--%>
    <%--                        String.Format("~/image/{0}/{1}/{2}/{3}", Eval("idregisto"),Eval("airport_url") ,Eval("airline_url"), Eval("aircraft_url")) %>'
                                                            <script>
    $(".fb-comments").attr("data-href", window.location.href);
</script>--%>
                                 <%--{{ store.url }}--%><%-- data-href="{{ page.full_path }}"--%>
                                <%----%>
                                
<%-- <script>
    $(".fb-comments").attr("data-href", window.location.href);
</script>--%>
                                    <%--<div class="fb-comments"  data-width="550px" data-numposts="5" ></div>--%>

      <%--                          <script type='text/javascript'> runat="server"id="fbdiv"
                                    var postUrl = '<data:post.url/>';
                                    document.write("  <div class='fb-comments' data-width='550px' data-numposts='5' data-href='" + postUrl + "' ></div>");
     //document.write("<div class="fb-like" data-href='" + postUrl + "' data-layout="standard" data-action="recommend" data-show-faces="true" data-share="true"></div>");
</script>--%>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>