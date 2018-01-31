<%@ Page Title="" Language="C#" MasterPageFile="~/Claims.Master" AutoEventWireup="true" CodeBehind="NTE.aspx.cs" Inherits="ClaimsSystem.NTE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    NTE - Claims System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-10">
            <ul class="breadcrumb">
                <li><a href="Home">Home</a></li>
                <li>Notice to Explain</li>
            </ul>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnNTE_Create" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Create" OnClick="btnNTE_Create_Click" />
            <asp:Button ID="btnNTE_Back" runat="server" CssClass="btn btn-md btn-warning btn-block" Text="Back" OnClick="btnNTE_Back_Click" />
        </div>
    </div>

    <asp:MultiView ID="mvNTE" runat="server">
        <asp:View ID="vwViewNTE" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>View NTE Report</h4>
                                </div>
                                <div class="col-md-4 col-md-offset-4">
                                    <div class="form-group input-group mTop3-form-group">
                                        <asp:TextBox ID="txtNTE_Search" runat="server" CssClass="form-control" placeholder="Search"/>
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="lnkNTE_Search" runat="server" CssClass="btn btn-default btn-padding" OnClick="lnkNTE_Search_Click"> 
                                                <i class="fa fa-search"></i></asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvNTEList" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
                                    HeaderStyle-HorizontalAlign="Center" PagerStyle-CssClass="pagination" OnRowCommand="gvNTEList_RowCommand" OnPageIndexChanging="gvNTEList_PageIndexChanging"
                                    OnSelectedIndexChanged="gvNTEList_SelectedIndexChanged">
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
        <asp:View ID="vwDetailsNTE" runat="server">
            <asp:HiddenField ID="hfNTEID" runat="server" Visible="false" />
            <div class="row">
                <div class="col-md-12">
                    <h3>Notice to Explain (NTE)</h3>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblNTE_ID" runat="server" Text="NTE ID" />
                    <asp:TextBox ID="txtNTE_ID" runat="server" placeholder="NTE ID" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblNTE_DateCreated" runat="server" Text="Date Created" />
                    <asp:TextBox ID="txtNTE_DateCreated" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" TextMode="DateTime" ReadOnly="true" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblNTE_Subject" runat="server" Text="Subject" />
                    <asp:TextBox ID="txtNTE_Subject" runat="server" placeholder="Subject" CssClass="form-control" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblNTE_EmployeeName" runat="server" Text="Employee Name" />
                    <asp:TextBox ID="txtNTE_EmployeeName" runat="server" placeholder="Employee Name" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblNTE_IncidentDate" runat="server" Text="Incident Date" />
                    <asp:TextBox ID="txtNTE_IncidentDate" runat="server" TextMode="Date" placeholder="mm/dd/yyyy" CssClass="form-control"/>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblNTE_IncidentPlace" runat="server" Text="Incident Place" />
                    <asp:TextBox ID="txtNTE_IncidentPlace" runat="server" CssClass="form-control"/>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblNTE_DaysOfSuspension" runat="server" Text="Days of Suspension" />
                    <asp:TextBox ID="NTE_DaysOfSuspension" runat="server" CssClass="form-control" TextMode="Number"/>
                </div>
                <div class="col-md-8">
                    <asp:Label ID="lblNTE_Remarks" runat="server" Text="Remarks" />
                    <asp:TextBox ID="txtNTE_Remarks" runat="server" placeholder="Remarks" CssClass="form-control" TextMode="MultiLine" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-10">
                                    <h4>View Offenses</h4>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnNTEList_AddOffenses" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Add Offenses" OnClick="btnNTEList_AddOffenses_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvNTEProvision" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
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
            <br />
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-10">
                                    <h4>View CoD Provisions</h4>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnNTEList_AddProvision" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Add Provision" OnClick="btnNTEList_AddProvision_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvNTE_Provision" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
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
            <br />
            <br />
            <asp:Label ID="lblNTEDetails_Alert" runat="server" CssClass="AlertRed" />
            <br />
            <br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnNTEDetails_Submit" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" OnClick="btnNTEDetails_Submit_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnNTEDetails_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnNTEDetails_Cancel_Click" />
                </div>
            </div>
            <br />
            <br />
            <div id="modalOffense" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row">
                                <div class="col-md-12">
                                    <center><h3>Add Offense Detail</h3></center>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblNTEOffense_OffenseID" runat="server" Text="Offense ID" />
                                    <asp:TextBox ID="txtNTEOffense_OffenseID" runat="server" placeholder="Offense ID" CssClass="form-control" ReadOnly="true" />
                                    <asp:HiddenField ID="hfNTEOffense_NTEID" runat="server" Visible="false" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblNTEOffense_OffenseDetail" runat="server" Text="Offense Detail" />
                                    <asp:TextBox ID="txtNTEOffense_OffenseDetail" runat="server" placeholder="Offense Detail" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                            <br /><br /><br />
                            <div class="row">
                                <div class="col-md-2 col-md-offset-8">
                                    <asp:Button ID="btnNTEOffense_Yes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" OnClick="btnNTEOffense_Yes_Click" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnNTEOffense_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnNTEOffense_Cancel_Click" />
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
            <div id="modalProvision" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row">
                                <div class="col-md-12">
                                    <center><h3>Add Provision Detail</h3></center>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblNTEProvision_CODID" runat="server" Text="COD ID" />
                                    <asp:TextBox ID="txtNTEProvision_CODID" runat="server" placeholder="COD ID" CssClass="form-control" ReadOnly="true" />
                                    <asp:HiddenField ID="hfNTEProvision_NTEID" runat="server" Visible="false" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblNTEProvision_Sec" runat="server" Text="Sec" />
                                    <asp:TextBox ID="txtNTEProvision_Sec" runat="server" placeholder="Sec" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblNTEProvision_Para" runat="server" Text="Para" />
                                    <asp:TextBox ID="txtNTEProvision_Para" runat="server" placeholder="Para" CssClass="form-control" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblNTEProvision_Provision" runat="server" Text="Provision" />
                                    <asp:TextBox ID="txtNTEProvision_Provision" runat="server" placeholder="Provision" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                            <br /><br /><br />
                            <div class="row">
                                <div class="col-md-2 col-md-offset-8">
                                    <asp:Button ID="btnNTEProvision_Yes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" OnClick="btnNTEProvision_Yes_Click" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnNTEProvision_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnNTEProvision_Cancel_Click" />
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
                            <center><h3><asp:Label ID="lblNTEDetails_NotifHeader" runat="server" /></h3></center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <center><asp:Label ID="lblNTEDetails_NotifBody" runat="server" /></center>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-2">
                            <asp:Button ID="btnNTEDetails_SaveYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnNTEDetails_SaveYes_Click" />
                            <asp:Button ID="btnNTEDetails_CancelYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnNTEDetails_CancelYes_Click" />
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnNTEDetails_No" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="No" OnClick="btnNTEDetails_No_Click" />
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
