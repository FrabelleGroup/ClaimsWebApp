<%@ Page Title="" Language="C#" MasterPageFile="~/Claims.Master" AutoEventWireup="true" CodeBehind="TNCR.aspx.cs" Inherits="ClaimsSystem.TNCR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TNCR - Claims System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-10">
            <ul class="breadcrumb">
                <li><a href="Home">Home</a></li>
                <li>Toll Non-Conformance Report</li>
            </ul>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnTNCR_Create" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Create" OnClick="btnTNCR_Create_Click" />
            <asp:Button ID="btnTNCR_Back" runat="server" CssClass="btn btn-md btn-warning btn-block" Text="Back" OnClick="btnTNCR_Back_Click" />
        </div>
    </div>
    <asp:MultiView ID="mvTNCR" runat="server">
        <asp:View ID="vwViewTNCR" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>View TNC Report</h4>
                                </div>
                                <div class="col-md-4 col-md-offset-4">
                                    <div class="form-group input-group mTop3-form-group">
                                        <asp:TextBox ID="txtTNCR_Search" runat="server" CssClass="form-control" placeholder="Search" />
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="lnkTNCR_Search" runat="server" CssClass="btn btn-default btn-padding" OnClick="lnkTNCR_Search_Click"> 
                                                <i class="fa fa-search"></i></asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvTNCRList" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
                                    HeaderStyle-HorizontalAlign="Center" PagerStyle-CssClass="pagination">
                                    <Columns>


                                        <asp:TemplateField ItemStyle-Width="5%" ShowHeader="False" HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lnkSelect" CausesValidation="false" CommandName="Select" CssClass="btn btn-primary" title="Select"
                                                    CommandArgument='<%# Container.DataItemIndex %>' data-rel="tooltip"><i class="glyphicon glyphicon-th-list"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No data found.
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="vwDetailsTNCR" runat="server">
            <asp:HiddenField ID="hfTNCRID" runat="server" Visible="false" />
            <div class="row">
                <div class="col-md-12">
                    <h3>Toll Non-Conformance Report (TNCR)</h3>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblTNCR_ID" runat="server" Text="TNCR ID" />
                    <asp:TextBox ID="txtTNCR_ID" runat="server" placeholder="TNCR ID" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblTNCR_DateCreated" runat="server" Text="Date Created" />
                    <asp:TextBox ID="txtTNCR_DateCreated" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" TextMode="Date" ReadOnly="true" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblTNCR_Toller" runat="server" Text="Toller" class="rField" />
                    <asp:DropDownList ID="ddlTNCR_Toller" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0" Text="Select" />
                        <asp:ListItem Value="1" Text="Toller 1" />
                        <asp:ListItem Value="2" Text="Toller 2" />
                        <asp:ListItem Value="3" Text="Toller 3" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblTNCR_TotalAffected" runat="server" Text="Total Affected" class="rField" />
                    <asp:TextBox ID="txtTNCR_TotalAffected" runat="server" placeholder="# pcs, # boxes, etc." CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblTNCR_AmountAffected" runat="server" Text="Amount Affected" class="rField" />
                    <asp:TextBox ID="txtTNCR_AmountAffected" runat="server" placeholder="Php x,xxx.xx" CssClass="form-control" TextMode="Number" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-12">
                    <h3>Details of Concern</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Inventory Variance
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_RawMaterials" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_RawMaterials" runat="server" Text="Raw Materials" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_ConsumptionVariance" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_ConsumptionVariance" runat="server" Text="Consumption Variance" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_TechnicalScrap" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_TechnicalScrap" runat="server" Text="Technical Scrap" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Others
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_YieldVariances" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_YieldVariances" runat="server" Text="Yield Variances" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_ConsumptionVariances" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_ConsumptionVariances" runat="server" Text="Consumption Variances" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_DelayReport" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_DelayReport" runat="server" Text="Delay Report" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            QA Non-Conformance
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:CheckBox ID="chkTNCR_Conc_WeakSeal" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_WeakSeal" runat="server" Text="Weak Seal" />
                                </div>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="chkTNCR_Conc_Bursting" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_Bursting" runat="server" Text="Bursting" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:CheckBox ID="chkTNCR_Conc_LoosePack" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_LoosePack" runat="server" Text="Loose Pack" />
                                </div>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="chkTNCR_Conc_Rejects" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_Rejects" runat="server" Text="Rejects" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:CheckBox ID="chkTNCR_Conc_Contamination" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_Contamination" runat="server" Text="Contamination" />
                                </div>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="chkTNCR_Conc_SwabGMPSanitation" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_SwabGMPSanitation" runat="server" Text="Swab / GMP / Sanitation" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:CheckBox ID="chkTNCR_Conc_Others" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_Others" runat="server" Text="Others" />
                                    <asp:TextBox ID="txtTNCR_Conc_Others" runat="server" CssClass="form-control" placeholder="Others" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            QA Deviation
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_WrongLabel" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_WrongLabel" runat="server" Text="Wrong Label" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkTNCR_Conc_ShortLacking" runat="server" />
                                    <asp:Label ID="lblTNCR_Conc_ShortLacking" runat="server" Text="Short / Lacking" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                        <asp:Label ID="lblTNCR_Remarks" runat="server" Text="Remarks" />
                        <asp:TextBox ID="txtTNCR_Remarks" runat="server" placeholder="Remarks" CssClass="form-control" TextMode="MultiLine" />
                    </div>
                </div>
            </div>
            
            </div>
            <br />
            <br />
            <asp:Label ID="lblTNCRDetails_Alert" runat="server" CssClass="AlertRed" />
            <br />
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnTNCRDetails_Submit" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnTNCRDetails_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" />
                </div>
            </div>
            <br />
            <br />

            <div id="modalNotification" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-12">
                            <center><h3><asp:Label ID="lblTNCRDetails_NotifHeader" runat="server" /></h3></center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <center><asp:Label ID="lblTNCRDetails_NotifBody" runat="server" /></center>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-2">
                            <asp:Button ID="btnTNCRDetails_SaveYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" />
                            <asp:Button ID="btnTNCRDetails_CancelYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" />
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnTNCRDetails_No" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="No" />
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
