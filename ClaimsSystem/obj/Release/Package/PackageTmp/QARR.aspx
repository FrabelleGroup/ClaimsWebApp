<%@ Page Title="" Language="C#" MasterPageFile="~/Claims.Master" AutoEventWireup="true" CodeBehind="QARR.aspx.cs" Inherits="ClaimsSystem.QARR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    QARR - Claims System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-10">
            <ul class="breadcrumb">
                <li><a href="Home">Home</a></li>
                <li>QA Rejection Report</li>
            </ul>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnQARR_Create" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Create" OnClick="btnQARR_Create_Click" />
            <asp:Button ID="btnQARR_Back" runat="server" CssClass="btn btn-md btn-warning btn-block" Text="Back" OnClick="btnQARR_Back_Click" />
        </div>
    </div>
    <asp:MultiView ID="mvQARR" runat="server">
        <asp:View ID="vwViewQARR" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>View QA Rejection Report</h4>
                                </div>
                                <div class="col-md-4 col-md-offset-4">
                                    <div class="form-group input-group mTop3-form-group">
                                        <asp:TextBox ID="txtQARR_Search" runat="server" CssClass="form-control" placeholder="Search" />
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="lnkQARR_Search" runat="server" CssClass="btn btn-default btn-padding" OnClick="lnkQARR_Search_Click"> 
                                                <i class="fa fa-search"></i></asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvQARRList" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
                                    HeaderStyle-HorizontalAlign="Center" PagerStyle-CssClass="pagination" OnRowCommand="gvQARRList_RowCommand">
                                    <Columns>
                                    <asp:BoundField DataField="QARRID" HeaderText="QARRID" />
                                    <asp:BoundField DataField="CompanyID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="ReferenceCode" HeaderText="ReferenceCode" />
                                    <asp:BoundField DataField="ReferenceDate" HeaderText="ReferenceDate" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="IssuedTo" HeaderText="IssuedTo" />
                                    <asp:BoundField DataField="SupplierID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Department" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="InitiatedBy" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NotedBy" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Subject" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Type_Legal" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Type_Product" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Type_Procedure" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Type_StructuralAndSanitation" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Type_Other" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="Type_OtherRemarks" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NC_SupplierServiceProvider" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NC_FBC" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NC_Toll" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NC_ADP" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NC_Trucker" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NC_Other" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="NC_OtherRemarks" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="SummaryReport" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="DateCreated" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataFormatString="{0:d}" />
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
        <asp:View ID="vwDetailsQARR" runat="server">
            <asp:HiddenField ID="hfQARRID" runat="server" Visible="false" />
            <div class="row">
                <div class="col-md-12">
                    <h3>QA Rejection Report (QARR)</h3>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_ID" runat="server" Text="QARR ID" />
                    <asp:TextBox ID="txtQARR_ID" runat="server" placeholder="QARR ID" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_DateCreated" runat="server" Text="Date Created" />
                    <asp:TextBox ID="txtQARR_DateCreated" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" TextMode="Date" ReadOnly="true" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_IssuedTo" runat="server" Text="Issued To" />
                    <asp:TextBox ID="txtQARR_IssuedTo" runat="server" placeholder="Issued To" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_InitiatedBy" runat="server" Text="Initiated By" />
                    <asp:TextBox ID="txtQARR_InitiatedBy" runat="server" placeholder="Inititated By" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_ReferenceCode" runat="server" Text="Reference Code" />
                    <asp:TextBox ID="txtQARR_ReferenceCode" runat="server" placeholder="Reference Code" CssClass="form-control" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_Department" runat="server" Text="Department" />
                    <asp:TextBox ID="txtQARR_Department" runat="server" placeholder="Department" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_NotedBy" runat="server" Text="Noted By" />
                    <asp:TextBox ID="txtQARR_NotedBy" runat="server" placeholder="Noted By" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblQARR_ReferenceDate" runat="server" Text="Reference Date" />
                    <asp:TextBox ID="txtQARR_ReferenceDate" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" TextMode="Date" />
                </div>
            </div>
            <br />
            <hr />
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblQARR_Subject" runat="server" Text="Subject" />
                    <asp:TextBox ID="txtQARR_Subject" runat="server" placeholder="Subject" CssClass="form-control" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Type of Non-Conformance
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_Type_Legal" runat="server" />
                                    <asp:Label ID="lblQARR_Type_Legal" runat="server" Text="Legal" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_Type_Product" runat="server" />
                                    <asp:Label ID="lblQARR_Type_Product" runat="server" Text="Product" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_Type_Procedure" runat="server" />
                                    <asp:Label ID="lblQARR_Type_Procedure" runat="server" Text="Procedure" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_Type_StructuralSanitation" runat="server" />
                                    <asp:Label ID="lblQARR_Type_StructuralSanitation" runat="server" Text="Structural and Sanitation" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_Type_Others" runat="server" />
                                    <asp:Label ID="lblQARR_Type_Others" runat="server" Text="Others" />
                                    <asp:TextBox ID="txtQARR_Type_Others" runat="server" placeholder="Others" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Non-Conformance By
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_NC_SupplierServiceProvider" runat="server" />
                                    <asp:Label ID="lblQARR_NC_SupplierServiceProvider" runat="server" Text="Supplier / Service Provider" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_NC_FBC" runat="server" />
                                    <asp:Label ID="lblQARR_NC_FBC" runat="server" Text="FBC" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_NC_Toll" runat="server" />
                                    <asp:Label ID="lblQARR_NC_Toll" runat="server" Text="Toll" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_NC_ADP" runat="server" />
                                    <asp:Label ID="lblQARR_NC_ADP" runat="server" Text="ADP" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_NC_Trucker" runat="server" />
                                    <asp:Label ID="lblQARR_NC_Trucker" runat="server" Text="Trucker" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox ID="chkQARR_NC_Others" runat="server" />
                                    <asp:Label ID="lblQARR_NC_Others" runat="server" Text="Others" />
                                    <asp:TextBox ID="txtQARR_NC_Others" runat="server" placeholder="Others" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblQARR_SummaryReport" runat="server" Text="Description of Non-Conformance" />
                    <asp:TextBox ID="txtQARR_SummaryReport" runat="server" placeholder="Include information such as Date, Time, Brand/Lot/Batch No., Item Description, Container No., Involved Personnel, Brief Incident, Quantity Affected vs Grand Total Quantity as reference." CssClass="form-control" TextMode="MultiLine" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:FileUpload ID="fuQARR" runat="server" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnQARR_Upload" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Upload" />
                </div>
            </div>
            <br /><br />
            <asp:Label ID="lblQARRDetails_Alert" runat="server" CssClass="AlertRed" />
            <br /><br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnQARRDetails_Submit" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" OnClick="btnQARRDetails_Submit_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnQARRDetails_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnQARRDetails_Cancel_Click" />
                </div>
            </div>
            <br /><br />



            <div id="modalNotification" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-12">
                            <center><h3><asp:Label ID="lblQARRDetails_NotifHeader" runat="server" /></h3></center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <center><asp:Label ID="lblQARRDetails_NotifBody" runat="server" /></center>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-2">
                            <asp:Button ID="btnQARRDetails_SaveYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnQARRDetails_SaveYes_Click" />
                            <asp:Button ID="btnQARRDetails_CancelYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnQARRDetails_CancelYes_Click" />
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnQARRDetails_No" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="No" OnClick="btnQARRDetails_No_Click" />
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
