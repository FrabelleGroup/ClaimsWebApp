<%@ Page Title="" Language="C#" MasterPageFile="~/Claims.Master" AutoEventWireup="true" CodeBehind="ChargeSlip.aspx.cs" Inherits="ClaimsSystem.ChargeSlip" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Charge Slip - Claims System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-10">
            <ul class="breadcrumb">
                <li><a href="Home">Home</a></li>
                <li>Charge Slip Report</li>
            </ul>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnCS_Create" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Create" OnClick="btnCS_Create_Click" />
            <asp:Button ID="btnCS_Back" runat="server" CssClass="btn btn-md btn-warning btn-block" Text="Back" OnClick="btnCS_Back_Click" />
        </div>
        <a href="ChargeSlip.aspx">ChargeSlip.aspx</a>
    </div>
    <asp:MultiView ID="mvCS" runat="server">
        <asp:View ID="vwViewCS" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>View Charge Slip Report</h4>
                                </div>
                                <div class="col-md-4 col-md-offset-4">
                                    <div class="form-group input-group mTop3-form-group">
                                        <asp:TextBox ID="txtCS_Search" runat="server" CssClass="form-control" placeholder="Search" />
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="lnkCS_Search" runat="server" CssClass="btn btn-default btn-padding" OnClick="lnkCS_Search_Click"> 
                                                <i class="fa fa-search"></i></asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvCSList" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
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
        <asp:View ID="vwDetailsCS" runat="server">
            <asp:HiddenField ID="hfCSID" runat="server" Visible="false" />
            <div class="row">
                <div class="col-md-12">
                    <h3>Charge Slip Report (CS)</h3>
                </div>
            </div>
            <br />
            
            <div class="row">
                <div class="col-md-8">
                    <asp:Label ID="lblCS_Subject" runat="server" Text="Subject" />
                    <asp:TextBox ID="txtCS_Subject" runat="server" placeholder="Subject" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblCS_AmountCharged" runat="server" Text="Amount Charged" />
                    <asp:TextBox ID="txtCS_AmountCharged" runat="server" placeholder="Php x,xxx.xx" CssClass="form-control" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Charge To
                        </div>
                        <div class="panel-body">
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-5">
                                    <asp:RadioButton ID="chkCS_ChrgeTo_Toll" runat="server" GroupName="ChargeTo" />
                                    <asp:Label ID="lblCS_ChrgeTo_Toll" runat="server" Text="Toll" />
                                </div>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtCS_ChrgeTo_Toll" runat="server" placeholder="Toll" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-5">
                                    <asp:RadioButton ID="chkCS_ChrgeTo_Supplier" runat="server" GroupName="ChargeTo" />
                                    <asp:Label ID="lblCS_ChrgeTo_Supplier" runat="server" Text="Supplier" />
                                </div>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtCS_ChrgeTo_Supplier" runat="server" placeholder="Supplier" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-5">
                                    <asp:RadioButton ID="chkCS_ChrgeTo_FBCEmployeeDeptartment" runat="server" GroupName="ChargeTo" />
                                    <asp:Label ID="lblCS_ChrgeTo_FBCEmployeeDeptartment" runat="server" Text="FBC Employee / Deptartment" />
                                </div>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtCS_ChrgeTo_FBCEmployeeDeptartment" runat="server" placeholder="FBC Employee / Deptartment" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-5">
                                    <asp:RadioButton ID="chkCS_ChrgeTo_TruckingCompany" runat="server" GroupName="ChargeTo" />
                                    <asp:Label ID="lblCS_ChrgeTo_TruckingCompany" runat="server" Text="Trucking / Company" />
                                </div>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtCS_ChrgeTo_TruckingCompany" runat="server" placeholder="Toll" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-5">
                                    <asp:RadioButton ID="chkCS_ChrgeTo_ADP" runat="server" GroupName="ChargeTo" />
                                    <asp:Label ID="lblCS_ChrgeTo_ADP" runat="server" Text="ADP" />
                                </div>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtCS_ChrgeTo_ADP" runat="server" placeholder="ADP" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-5">
                                    <asp:RadioButton ID="chkCS_ChrgeTo_TDC" runat="server" GroupName="ChargeTo" />
                                    <asp:Label ID="lblCS_ChrgeTo_TDC" runat="server" Text="TDC" />
                                </div>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtCS_ChrgeTo_TDC" runat="server" placeholder="TDC" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Attachments Included
                        </div>
                        <div class="panel-body">
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-3">
                                    <asp:CheckBox ID="chkCS_Attch_QARR" runat="server" />
                                    <asp:Label ID="lblCS_Attch_QARR" runat="server" Text="QARR" />
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCS_Attch_QARRNo" runat="server" placeholder="QARR No" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-3">
                                    <asp:CheckBox ID="chkCS_Attch_CS" runat="server"  />
                                    <asp:Label ID="lblCS_Attch_CS" runat="server" Text="CS" />
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCS_Attch_CS" runat="server" placeholder="CS No" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-3">
                                    <asp:CheckBox ID="chkCS_Attch_TNCR" runat="server"  />
                                    <asp:Label ID="lblCS_Attch_TNCR" runat="server" Text="TNCR" />
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCS_Attch_TNCR" runat="server" placeholder="TNCR No" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-3">
                                    <asp:CheckBox ID="chkCS_Attch_NTE" runat="server"  />
                                    <asp:Label ID="lblCS_Attch_NTE" runat="server" Text="NTE" />
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCS_Attch_NTE" runat="server" placeholder="NTE No" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-3">
                                    <asp:CheckBox ID="chkCS_Attch_Others" runat="server"  />
                                    <asp:Label ID="lblCS_Attch_Others" runat="server" Text="Others" />
                                </div>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtCS_Attch_Others" runat="server" placeholder="Others" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-12">
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br /><br />
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-10">
                                    <h4>View Payment Details</h4>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnCSList_AddReport" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Add Payment" OnClick="btnCSList_AddReport_Click"/>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div style="width: 100%; overflow-x: scroll;">
                                <asp:GridView runat="server" ID="gvCSDetailReport" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
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
            <br /><br />
            <asp:Label ID="lblCSDetails_Alert" runat="server" CssClass="AlertRed" />
            <br /><br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnCSDetails_Submit" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" OnClick="btnCSDetails_Submit_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnCSDetails_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnCSDetails_Cancel_Click" />
                </div>
            </div>
            <br /><br />
            <div id="modalCSeport" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row">
                                <div class="col-md-12">
                                    <center><h3>Add Payment Details</h3></center>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblCSeport_PaymentType" runat="server" Text="Payment Type" />&nbsp;&nbsp;
                                    <asp:RadioButton ID="rdoPaymentType_Full" runat="server" Text="Full Payment" GroupName="PaymentType" />&nbsp;&nbsp;
                                    <asp:RadioButton ID="rdoPaymentType_Partial" runat="server" Text="Partial Payment" GroupName="PaymentType" />
                                    
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblCSeports_PaymentDate" runat="server" Text="Payment Date" />
                                    <asp:TextBox ID="txtCSReport_PaymentDate" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblCSReports_PaymentPeriodCovered" runat="server" Text="Payment Period Covered (From - To)" />
                                    <div class="row">
                                        <div class="col-md-6"><asp:TextBox ID="txtCSReports_From" runat="server" placeholder="mm/dd/yyyy" TextMode="Date" CssClass="form-control" /></div>
                                        <div class="col-md-6"><asp:TextBox ID="txtCSReports_To" runat="server" placeholder="mm/dd/yyyy" TextMode="Date" CssClass="form-control" /></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblCSReports_AmountCharged" runat="server" Text="Amount Charged" />
                                    <asp:TextBox ID="txtCSReports_AmountCharged" runat="server" placeholder="Php x,xxx.xx" CssClass="form-control" TextMode="Number" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Payment Details
                                        </div>
                                        <div class="panel-body">
                                            <div class="row rowPaddingBottom5">
                                                <div class="col-md-1"><center><b><asp:Label ID="lblSelect" runat="server" Text="Select" /></b></center></div>
                                                <div class="col-md-2"><center><b><asp:Label ID="lblMode" runat="server" Text="Mode" /></b></center></div>
                                                <div class="col-md-4"><center><b><asp:Label ID="lblAmount" runat="server" Text="Amount" /></b></center></div>
                                                <div class="col-md-5"><center><b><asp:Label ID="lblDetails" runat="server" Text="Details" /></b></center></div>
                                            </div>
                                            <div class="row rowPaddingBottom5">
                                                <div class="col-md-1"><center><asp:CheckBox ID="chkCS_PPC_Check" runat="server" /></center></div>
                                                <div class="col-md-2"><asp:Label ID="lblCS_PPC_Check" runat="server" Text="Check" /></div>
                                                <div class="col-md-4"><asp:TextBox ID="txtCS_PPC_CheckAmount" runat="server" placeholder="Php x,xxx.xx" TextMode="Number" CssClass="form-control" /></div>
                                                <div class="col-md-5"><asp:TextBox ID="txtCS_PPC_CheckDetails" runat="server" placeholder="Check Details" CssClass="form-control" /></div>
                                            </div>
                                            <div class="row rowPaddingBottom5">
                                                <div class="col-md-1"><center><asp:CheckBox ID="chkCS_PPC_BillingDeduction" runat="server" /></center></div>
                                                <div class="col-md-2"><asp:Label ID="lblCS_PPC_BillingDeduction" runat="server" Text="Billing Deduction" /></div>
                                                <div class="col-md-4"><asp:TextBox ID="txtCS_PPC_BillingDeductionAmount" runat="server" placeholder="Php x,xxx.xx" TextMode="Number" CssClass="form-control" /></div>
                                                <div class="col-md-5"><asp:TextBox ID="txtCS_PPC_BillingDeductionDetails" runat="server" placeholder="Billing Deduction Details" CssClass="form-control" /></div>
                                            </div>
                                            <div class="row rowPaddingBottom5">
                                                <div class="col-md-1"><center><asp:CheckBox ID="chkCS_PPC_CreditMemo" runat="server" /></center></div>
                                                <div class="col-md-2"><asp:Label ID="lblCS_PPC_CreditMemo" runat="server" Text="Technical Scrap" /></div>
                                                <div class="col-md-4"><asp:TextBox ID="txtCS_PPC_CreditMemoAmount" runat="server" placeholder="Php x,xxx.xx" TextMode="Number" CssClass="form-control" /></div>
                                                <div class="col-md-5"><asp:TextBox ID="txtCS_PPC_CreditMemoDetails" runat="server" placeholder="Credit Memo Details" CssClass="form-control" /></div>
                                            </div>
                                            <div class="row rowPaddingBottom5">
                                                <div class="col-md-1"><center><asp:CheckBox ID="chkCS_PPC_SalaryDeduction" runat="server" /></center></div>
                                                <div class="col-md-2"><asp:Label ID="lblCS_PPC_SalaryDeduction" runat="server" Text="Salary Deduction" /></div>
                                                <div class="col-md-4"><asp:TextBox ID="txtCS_PPC_SalaryDeductionAmount" runat="server" placeholder="Php x,xxx.xx" TextMode="Number" CssClass="form-control" /></div>
                                                <div class="col-md-5"><asp:TextBox ID="txtCS_PPC_SalaryDeductionDetails" runat="server" placeholder="Salary Deduction Details" CssClass="form-control" /></div>
                                            </div>
                                            <div class="row rowPaddingBottom5">
                                                <div class="col-md-1"><center><asp:CheckBox ID="chkCS_PPC_Others" runat="server" /></center></div>
                                                <div class="col-md-2"><asp:Label ID="lblCS_PPC_Others" runat="server" Text="Others" /></div>
                                                <div class="col-md-4"><asp:TextBox ID="txtCS_PPC_OthersAmount" runat="server" placeholder="Php x,xxx.xx" TextMode="Number" CssClass="form-control" /></div>
                                                <div class="col-md-5"><asp:TextBox ID="txtCS_PPC_OthersDetails" runat="server" placeholder="Other Details" CssClass="form-control" /></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row rowPaddingBottom5">
                                <div class="col-md-3"><b><asp:Label ID="lblTotalAmountPaid" runat="server" Text="TOTAL AMOUNT PAID (PHP)" /></b></div>
                                <div class="col-md-4"><asp:TextBox ID="txtTotalAmountPaid" runat="server" placeholder="Php x,xxx.xx" TextMode="Number" CssClass="form-control" /></div>
                            </div>
                            <div class="row">
                                <div class="col-md-3"><b><asp:Label ID="lblBalance" runat="server" Text="BALANCE (PHP)" /></b></div>
                                <div class="col-md-4"><asp:TextBox ID="txtBalance" runat="server" placeholder="Php x,xxx.xx" TextMode="Number" CssClass="form-control" /></div>
                            </div>
                            <br /><br /><br />
                            <div class="row">
                                <div class="col-md-8"></div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnCSeport_Yes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnCSeport_Yes_Click" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnCSeport_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnCSeport_Cancel_Click" />
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
                            <center><h3><asp:Label ID="lblCSDetails_NotifHeader" runat="server" /></h3></center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <center><asp:Label ID="lblCSDetails_NotifBody" runat="server" /></center>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-2">
                            <asp:Button ID="btnCSDetails_SaveYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnCSDetails_SaveYes_Click" />
                            <asp:Button ID="btnCSDetails_CancelYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnCSDetails_CancelYes_Click"/>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnCSDetails_No" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="No" OnClick="btnCSDetails_No_Click"/>
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
