<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="sweptwings.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
                div.header
{
  text-align: center;
      background-color:whitesmoke;
       width: 50%;
        display: block;
            margin-left: auto;
            margin-right: auto;
              padding:10px 10px 10px 10px;
}
        div.layout
{
  text-align: center;
  width:100%;
}
        div.centre {
            text-align: justify;
            width: 50%;
            display: block;
            margin-left: auto;
            margin-right: auto;
            background-color:whitesmoke;
            padding:10px 10px 10px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
   <div class="layout">
       <div class="header">
        <asp:Label ID="Label2" runat="server" Text="About" Font-Bold="true" Font-Size="Large"></asp:Label>
        </div>
           <div class="centre">        
    <asp:Label ID="Label1" Font-Size="Large"   Width="100%" runat="server" Text="This website promotes Plane Spotting by João Toste. Plane Spotting is a hobby of tracking the movement of aircrafts, which is often accomplished by photography. João Toste was born in 1987 and is a doctor since 2011. Due to his proximity to Lajes Airport, he admired the planes since a early stage. It was only in 2006, when he bought his first digital camera that he became a active Plane Spotter, photographing the aircraft movements in Lajes."></asp:Label>
</div></div>
</asp:Content>
