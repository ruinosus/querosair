<%@ Page Title="" Language="C#" MasterPageFile="~/Gui/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>
<%@ register assembly="GMaps" namespace="Subgurim.Controles" tagprefix="maps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <maps:GMap ID="GoogleMaps" runat="server"
           Key="ABQIAAAAHNm8baJQvyqt43sH0-C-xxSNF-JBDdJ9QUqqfy2PoZnuhs0dNhSN68kxp6Mu1vIv4opDztIDSgf7Jg"
           />
           </ContentTemplate>
        </asp:UpdatePanel>

</div>
</asp:Content>

