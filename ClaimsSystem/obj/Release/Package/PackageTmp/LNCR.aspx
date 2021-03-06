﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Claims.Master" AutoEventWireup="true" CodeBehind="LNCR.aspx.cs" Inherits="ClaimsSystem.LNCR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    LNCR - Claims System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-10">
            <ul class="breadcrumb">
                <li><a href="Home">Home</a></li>
                <li>Logistics Non-Conformance Report</li>
            </ul>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnLNCR_Create" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Create" OnClick="btnLNCR_Create_Click" />
            <asp:Button ID="btnLNCR_Back" runat="server" CssClass="btn btn-md btn-warning btn-block" Text="Back" OnClick="btnLNCR_Back_Click" />
        </div>
    </div>
    <asp:MultiView ID="mvLNCR" runat="server">
        <asp:View ID="vwViewLNCR" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>View LNC Report</h4>
                                </div>
                                <div class="col-md-4 col-md-offset-4">
                                    <div class="form-group input-group mTop3-form-group">
                                        <asp:TextBox ID="txtLNCR_Search" runat="server" CssClass="form-control" placeholder="Search" />
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="lnkLNCR_Search" runat="server" CssClass="btn btn-default btn-padding" OnClick="lnkLNCR_Search_Click"> 
                                                <i class="fa fa-search"></i></asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvLNCRList" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
                                    HeaderStyle-HorizontalAlign="Center" PagerStyle-CssClass="pagination" OnRowCommand="gvLNCRList_RowCommand" OnPageIndexChanging="gvLNCRList_PageIndexChanging"
                                    OnSelectedIndexChanged="gvLNCRList_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="LNCRHeadID" HeaderText="LNCRHeadID" />
                                        <asp:BoundField DataField="CompanyID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="SupplierID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="DriverName" HeaderText="DriverName" />
                                        <asp:BoundField DataField="Helper" HeaderText="Helper" />
                                        <asp:BoundField DataField="Date" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="ChargeSlipDate" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="DateCreated" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="Category_Shortages" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_LateLiquidation" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_LateArrival" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_NoShow" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_LateDelivery" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_NonDelivery" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_QualityRelated" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_Others" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Category_OthersRemarks" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Penalty_WrittenWarning" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Penalty_Charge" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Penalty_Others" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Penalty_OthersRemarks" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="PreparedBy" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="AcknowledgeBy" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="ApprovedBy" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                        <asp:BoundField DataField="Status" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />

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
        <asp:View ID="vwDetailsLNCR" runat="server">
            <asp:HiddenField ID="hfLNCRID" value="0" runat="server" Visible="false" />
            <div class="row">
                <div class="col-md-12">
                    <h3>Logistics Non-Conformance Report (LNCR)</h3>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblLNCR_ID" runat="server" Text="LNCR ID" />
                    <asp:TextBox ID="txtLNCR_ID" runat="server" placeholder="LNCR ID" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblLNCR_DateCreated" runat="server" Text="Date Created" />
                    <asp:TextBox ID="txtLNCR_DateCreated" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" TextMode="Date" ReadOnly="true"/>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblLNCR_ChargeSlipDate" runat="server" Text="Charge Slip Date" class="rField" />
                    <asp:TextBox ID="txtLNCR_ChargeSlipDate" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblLNCR_TransactionDate" runat="server" Text="Transaction Date" class="rField" />
                    <asp:TextBox ID="txtLNCR_TransactionDate" runat="server" placeholder="LNCR ID" CssClass="form-control" TextMode="Date" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblLNCR_Trucker" runat="server" Text="Trucker" class="rField" />
                    <asp:DropDownList ID="ddlLNCR_Trucker" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0" Text="Select" />
                        <asp:ListItem Value="1" Text="Company 1" />
                        <asp:ListItem Value="2" Text="Company 2" />
                        <asp:ListItem Value="3" Text="Company 3" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblLNCR_DriverName" runat="server" Text="Driver Name" />
                    <asp:TextBox ID="txtLNCR_DriverName" runat="server" placeholder="Driver Name" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblLNCR_HelperName" runat="server" Text="Helper" />
                    <asp:TextBox ID="txtLNCR_HelperName" runat="server" placeholder="Helper Name" CssClass="form-control" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-8">
                    <h3>Category</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_Shortages" runat="server" />
                            <asp:Label ID="lblNCR_Cat_Shortages" runat="server" Text="Shortages" />
                        </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_LateDelivery" runat="server" />
                            <asp:Label ID="lblLNCR_Cat_LateDelivery" runat="server" Text="Late Delivery" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_LateLiquidation" runat="server" />
                            <asp:Label ID="lblLNCR_Cat_LateLiquidation" runat="server" Text="Late Liquidation" />
                        </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_NonDelivery" runat="server" />
                            <asp:Label ID="lblLNCR_Cat_NonDelivery" runat="server" Text="Non Delivery" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_LateArrival" runat="server" />
                            <asp:Label ID="lblLNCR_Cat_LateArrival" runat="server" Text="Late Arrival" />
                        </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_QualityRelated" runat="server" />
                            <asp:Label ID="lblLNCR_Cat_QualityRelated" runat="server" Text="Quality Related" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_NoShow" runat="server" />
                            <asp:Label ID="lblLNCR_Cat_NoShow" runat="server" Text="No Show" />
                        </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkLNCR_Cat_Others" runat="server" />
                            <asp:Label ID="lblLNCR_Cat_Others" runat="server" Text="Others" />
                            <asp:TextBox ID="txtLNCR_Cat_Others" runat="server" placeholder="Others" CssClass="form-control" TextMode="MultiLine" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <h3>Penalty</h3>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:CheckBox ID="chkLNCR_Pen_WrittenWarning" runat="server" />
                            <asp:Label ID="lblLNCR_Pen_WrittenWarning" runat="server" Text="Written Warning" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:CheckBox ID="chkLNCR_Pen_Charge" runat="server" />
                            <asp:Label ID="lblLNCR_Pen_Charge" runat="server" Text="Charge" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:CheckBox ID="chkLNCR_Pen_Others" runat="server" />
                            <asp:Label ID="lblLNCR_Pen_Others" runat="server" Text="Others" />
                            <asp:TextBox ID="txtLNCR_Pen_Others" runat="server" placeholder="Others" CssClass="form-control" TextMode="MultiLine" />
                        </div>
                    </div>
                </div>
            </div>
            <br /><br />
            <asp:Label ID="lblLNCRDetails_Alert" runat="server" CssClass="AlertRed" />
            <br /><br />
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-10">
                                    <h4>View Report Details</h4>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnLNCRList_AddReport" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Add Detail" OnClick="btnLNCRList_AddReport_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvLNCRDetailReport" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
                                    HeaderStyle-HorizontalAlign="Center" PagerStyle-CssClass="pagination" OnRowCommand="gvLNCRList_RowCommand" OnPageIndexChanging="gvLNCRList_PageIndexChanging"
                                    OnSelectedIndexChanged="gvLNCRList_SelectedIndexChanged">
                                    <Columns>
                                    <asp:BoundField DataField="LNCRBodyID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="LNCRHeadID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="DocumentReferenceNo" HeaderText="DocumentReferenceNo" />
                                    <asp:BoundField DataField="ItemCustomer" HeaderText="ItemCustomer" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    <asp:BoundField DataField="UnitOfMeasurement" HeaderText="UnitOfMeasurement" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                    <asp:BoundField DataField="Status" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />

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
            <br /><br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnLNCRDetails_Submit" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" OnClick="btnLNCRDetails_Submit_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnLNCRDetails_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnLNCRDetails_Cancel_Click" />
                </div>
            </div>
            <br /><br />
            <div id="modalLNCReport" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row">
                                <div class="col-md-12">
                                    <center><h3>Add LNC Report Details</h3></center>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblLNCReport_DocumentReferenceNo" runat="server" Text="Document Reference No" />
                                    <asp:TextBox ID="txtLNCRReport_DocumentReferenceNo" runat="server" placeholder="Document Reference No" CssClass="form-control" />
                                                <asp:HiddenField ID="hfLNCRBodyID" value="0" runat="server" Visible="false" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblLNCReports_ItemCustomer" runat="server" Text="Item / Customer" />
                                    <asp:TextBox ID="txtLNCRReport_ItemCustomer" runat="server" placeholder="Item / Customer" CssClass="form-control" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblLNCReport_Qty" runat="server" Text="Qty" />
                                    <asp:TextBox ID="txtLNCReport_Qty" runat="server" placeholder="Qty" CssClass="form-control" TextMode="Number" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblLNCReport_UOM" runat="server" Text="UOM" />
                                    <asp:TextBox ID="txtLNCReport_UOM" runat="server" placeholder="UOM [Pcs, Kg, Pack, etc.]" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblLNCReport_Amount" runat="server" Text="Amount" />
                                    <asp:TextBox ID="txtLNCReport_Amount" runat="server" placeholder="Php x,xxx.xx" CssClass="form-control" TextMode="Number" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblLNCReport_Remarks" runat="server" Text="Remarks" />
                                    <asp:TextBox ID="txtLNCReport_Remarks" runat="server" placeholder="Remarks" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                            <br /><br /><br />
                            <div class="row">
                                <div class="col-md-8"></div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnLNCReport_Yes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnLNCReport_Yes_Click" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnLNCReport_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnLNCReport_Cancel_Click" />
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
            <div id="modalNotification" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-12">
                            <center><h3><asp:Label ID="lblLNCRDetails_NotifHeader" runat="server" /></h3></center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <center><asp:Label ID="lblLNCRDetails_NotifBody" runat="server" /></center>
                        </div>
                    </div>
                    <br /><br /><br />
                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-2">
                            <asp:Button ID="btnLNCRDetails_SaveYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnLNCRDetails_SaveYes_Click" />
                            <asp:Button ID="btnLNCRDetails_CancelYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnLNCRDetails_CancelYes_Click" />
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnLNCRDetails_No" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="No" OnClick="btnLNCRDetails_No_Click" />
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
