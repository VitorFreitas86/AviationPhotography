<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="sweptwings.contact" %>
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
     <asp:Label ID="Label2" runat="server" Text="Contact" Font-Bold="true" Font-Size="Large"></asp:Label><br /><br />
 <a href="mailto:joao.toste@hotmail.com" target="_blank">joao.toste@hotmail.com</a><br /><br />
            </div></div>
</asp:Content>
