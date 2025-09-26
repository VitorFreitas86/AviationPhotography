<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usefullinks.aspx.cs" Inherits="sweptwings.usefullinks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        div.layout
{
  text-align: center;
}
        div.centre {
            text-align: center;
            width: 50%;
            display: block;
            margin-left: auto;
            margin-right: auto;
           background-color:whitesmoke;
        }
    </style>
        <title>Aviation Photography - João Toste </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br /><br /><br />
      <div class="layout">
        <div class="centre">
               <asp:Label ID="Label8" runat="server" Text="Useful links" Font-Bold="true"></asp:Label><br /><br />
                <a href="http://www.fr24.com" target="_blank">Flight Radar 24</a><br /><br />
                <a href="http://pt.flightaware.com/live/airport/LPLA" target="_blank">Flightaware</a><br /><br />
                    <a href="https://www.radarbox24.com" target="_blank">RadarBox</a><br /><br />
                  <a href="http://aerogarelajes.azores.gov.pt/sivv.aspx" target="_blank">Aerogare Lajes</a><br /><br />
                <a href="https://www.windguru.cz/35923" target="_blank">Windguru</a><br /><br />
            </div>
          </div>
</asp:Content>
