<%@ Page Title="" Language="C#" MasterPageFile="~/Claims.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="ClaimsSystem.Reports" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Report - Claims System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><a href="Home">Home</a></li>
                <li>Report Generation</li>
            </ul>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <CR:CrystalReportViewer ID="crv1" runat="server" AutoDataBind="true" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>

