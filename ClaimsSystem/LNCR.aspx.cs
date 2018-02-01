using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClaimsSystem.ServiceReference1;
using System.Data;
using Newtonsoft.Json;

namespace ClaimsSystem
{
    public partial class LNCR : System.Web.UI.Page
    {
        ClaimsClient _wcf = new ClaimsClient();
        _gControls _gc = new _gControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    MainButton(true, false);
                    mvLNCR.SetActiveView(vwViewLNCR);
                    gvLNCRList.DataSource = Retrieve_Header();
                    gvLNCRList.DataBind();
                }
                else { }
            }
            catch (Exception ex)
            {
                
            }
        
        
        }

        #region Event(s)

        #region Functions

        public DataTable Retrieve_Header()
        {
            string _jsonResponse = _wcf.Get_Logistics_HeaderReport("");
            var headerData = JsonConvert.DeserializeObject<DataTable>(_jsonResponse);
            return headerData;
        }

        public DataTable Retrieve_Body()
        {
            string _jsonResponse = _wcf.Get_Logistics_BodyReport(hfLNCRID.Value);
            var bodyData = JsonConvert.DeserializeObject<DataTable>(_jsonResponse);
            return bodyData;
        }

        #endregion

        #region LNCR Header

        protected void btnLNCR_Create_Click(object sender, EventArgs e)
        {
         /*   int LNCRHeadID, int CompanyID, int SupplierID, string DriverName, string Helper, DateTime Date
            , DateTime ChargeSlipDate, DateTime TransactionDate, DateTime DateCreated, bool Category_Shortages, bool Category_LateLiquidation
            , bool Category_LateArrival, bool Category_NoShow, bool Category_LateDelivery, bool Category_NonDelivery, bool Category_QualityRelated
            , bool Category_Others, string Category_OthersRemarks, bool Penalty_WrittenWarning, bool Penalty_Charge, bool Penalty_Others
            , string Penalty_OthersRemarks, string PreparedBy, string AcknowledgeBy, string ApprovedBy, bool Status   */
            //Get QARR ID from DB **ARGEE**
           // string _jResponse = _wcf.Set_Qa_Report(0, 0, "", DateTime.Now, "", 0, "", "", "", "", false, false, false, false, false, "", false, false, false, false, false, false, "", "", DateTime.Now, true);
            string _jResponse = _wcf.Set_Logistics_HeaderReport(0, 0, 0, "", "", DateTime.Now, DateTime.Now, DateTime.Now, DateTime.Now, false, false, false, false, false, false, false, false, "", false, false, false, "", "", "", "", true);
            if (_jResponse != "")
            {
                dynamic _jData = JsonConvert.DeserializeObject<dynamic>(_jResponse);
                txtLNCR_ID.Text = (string)_jData[0].LNCRHeadID;
            }
            //END ARGEE

            MainButton(false, true);

            Clear();
            mvLNCR.SetActiveView(vwDetailsLNCR);
        }

        protected void btnLNCR_Back_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this LNC Report?", false, true);
        }

        protected void lnkLNCR_Search_Click(object sender, EventArgs e)
        {

        }

        protected void btnLNCRDetails_Submit_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Save", "Are you sure you want to save this LNC Report?", true, false);
           
        }

        protected void btnLNCRDetails_Cancel_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this LNC Report?", false, true);
        }

        protected void btnLNCRDetails_SaveYes_Click(object sender, EventArgs e)
        {
            #region Save

            try
            {
                //int LNCRHeadID, int CompanyID, int SupplierID, string DriverName, string Helper
                //  , string Date, string ChargeSlipDate, string TransactionDate, string DateCreated, bool Category_Shortages
                //  , bool Category_LateLiquidation, bool Category_LateArrival, bool Category_NoShow, bool Category_LateDelivery, bool Category_NonDelivery
                //  , bool Category_QualityRelated, bool Category_Others, string Category_OthersRemarks, bool Penalty_WrittenWarning, bool Penalty_Charge
                //  , bool Penalty_Others, string Penalty_OthersRemarks, string PreparedBy, string AcknowledgeBy, string ApprovedBy, bool Status
                _wcf.Set_Logistics_HeaderReport(Convert.ToInt32(txtLNCR_ID.Text), 0, ddlLNCR_Trucker.SelectedIndex, txtLNCR_DriverName.Text, txtLNCR_HelperName.Text
                    , DateTime.Now, _gc.ToDateTime(txtLNCR_ChargeSlipDate.Text), _gc.ToDateTime(txtLNCR_TransactionDate.Text), DateTime.Now, chkLNCR_Cat_Shortages.Checked
                    , chkLNCR_Cat_LateLiquidation.Checked, chkLNCR_Cat_LateArrival.Checked, chkLNCR_Cat_NoShow.Checked, chkLNCR_Cat_LateDelivery.Checked, chkLNCR_Cat_NonDelivery.Checked
                    , chkLNCR_Cat_QualityRelated.Checked, chkLNCR_Cat_Others.Checked, txtLNCR_Cat_Others.Text, chkLNCR_Pen_WrittenWarning.Checked, chkLNCR_Pen_Charge.Checked
                    , chkLNCR_Pen_Others.Checked, txtLNCR_Pen_Others.Text, "", "", "", true);
                gvLNCRList.DataSource = Retrieve_Header();
                gvLNCRList.DataBind();
                mvLNCR.SetActiveView(vwViewLNCR);
               //hfLNCRID.Value
                NotificationModal(false, "", "", false, true);
            
            }
            catch (Exception ex)
            {
                
            }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Saved!');", true);

                MainButton(true, false);
                Clear();
                mvLNCR.SetActiveView(vwViewLNCR);
            }

            #endregion
        }

        protected void btnLNCRDetails_CancelYes_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);

            MainButton(true, false);
            Clear();
            gvLNCRList.DataSource = Retrieve_Header();
            gvLNCRList.DataBind();
            mvLNCR.SetActiveView(vwViewLNCR);
        }

        protected void btnLNCRDetails_No_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);
        }

        #endregion

        #region LNCR Body

        protected void btnLNCRList_AddReport_Click(object sender, EventArgs e)
        {
            LNCReportModal(true);
        }

        protected void btnLNCReport_Yes_Click(object sender, EventArgs e)
        {
            #region Save

            try
            {
                _wcf.Set_Logistics_BodyReport(Convert.ToInt32(hfLNCRBodyID.Value), Convert.ToInt32(txtLNCR_ID.Text), txtLNCRReport_DocumentReferenceNo.Text, txtLNCRReport_ItemCustomer.Text, Convert.ToDecimal(txtLNCReport_Qty.Text), txtLNCReport_UOM.Text, Convert.ToDecimal(txtLNCReport_Amount.Text), txtLNCReport_Remarks.Text, true);
                gvLNCRDetailReport.DataSource = Retrieve_Body();
                gvLNCRDetailReport.DataBind();
                mvLNCR.SetActiveView(vwDetailsLNCR);
            }
            catch (Exception ex) { }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('LNC Report Details has Successfully Saved!');", true);

                LNCReportModal(false);

                //Update gvLNCRDetailReport
            }

            #endregion
        }

        protected void btnLNCReport_Cancel_Click(object sender, EventArgs e)
        {
            LNCReportModal(false);
        }

        #endregion

        #endregion

        #region GridView Event(s)

        protected void gvLNCRList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int _index = Convert.ToInt32(e.CommandArgument);
                GridViewRow _row = gvLNCRList.Rows[_index];
                hfLNCRID.Value = _row.Cells[0].Text.Replace("&nbsp;", "");
                txtLNCR_ID.Text= _row.Cells[0].Text.Replace("&nbsp;", "");
                DateTime dc = DateTime.Parse(_row.Cells[5].Text);
                txtLNCR_DateCreated.Text = dc.ToString("yyyy-MM-dd");
                DateTime cd = DateTime.Parse(_row.Cells[6].Text);
                txtLNCR_ChargeSlipDate.Text = cd.ToString("yyyy-MM-dd");
                DateTime td = DateTime.Parse(_row.Cells[7].Text);
                txtLNCR_TransactionDate.Text = td.ToString("yyyy-MM-dd");
                ddlLNCR_Trucker.SelectedValue = _row.Cells[2].Text.Replace("&nbsp;", "");
                txtLNCR_DriverName.Text = _row.Cells[3].Text.Replace("&nbsp;", "");
                txtLNCR_HelperName.Text = _row.Cells[4].Text.Replace("&nbsp;", "");
                chkLNCR_Cat_Shortages.Checked = _gc.Load_CheckBox(_row.Cells[9].Text.Replace("&nbsp;", ""));
                chkLNCR_Cat_LateDelivery.Checked = _gc.Load_CheckBox(_row.Cells[13].Text.Replace("&nbsp;", ""));
                chkLNCR_Cat_LateLiquidation.Checked = _gc.Load_CheckBox(_row.Cells[10].Text.Replace("&nbsp;", ""));
                chkLNCR_Cat_NonDelivery.Checked = _gc.Load_CheckBox(_row.Cells[14].Text.Replace("&nbsp;", ""));
                chkLNCR_Cat_LateArrival.Checked = _gc.Load_CheckBox(_row.Cells[11].Text.Replace("&nbsp;", ""));
                chkLNCR_Cat_QualityRelated.Checked = _gc.Load_CheckBox(_row.Cells[15].Text.Replace("&nbsp;", ""));
                chkLNCR_Cat_NoShow.Checked = _gc.Load_CheckBox(_row.Cells[12].Text.Replace("&nbsp;", ""));
                chkLNCR_Cat_Others.Checked = _gc.Load_CheckBox(_row.Cells[16].Text.Replace("&nbsp;", ""));
                txtLNCR_Cat_Others.Text = _row.Cells[17].Text.Replace("&nbsp;", "");
                chkLNCR_Pen_WrittenWarning.Checked = _gc.Load_CheckBox(_row.Cells[18].Text.Replace("&nbsp;", ""));
                chkLNCR_Pen_Charge.Checked = _gc.Load_CheckBox(_row.Cells[0].Text.Replace("&nbsp;", ""));
                chkLNCR_Pen_Others.Checked = _gc.Load_CheckBox(_row.Cells[0].Text.Replace("&nbsp;", ""));
                txtLNCR_Pen_Others.Text = _row.Cells[0].Text.Replace("&nbsp;", "");
                gvLNCRDetailReport.DataSource = Retrieve_Body();
                gvLNCRDetailReport.DataBind();
                mvLNCR.SetActiveView(vwDetailsLNCR);
            }
        }

        protected void gvLNCRList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvLNCRList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        #endregion

        #region Property(ies)

        private void MainButton(bool _btnCreate, bool _btnBack)
        {
            btnLNCR_Create.Visible = _btnCreate;
            btnLNCR_Back.Visible = _btnBack;
        }

        private void LNCReportModal(bool _ShowHide)
        {
            if (_ShowHide) { modalLNCReport.Attributes.Add("class", "modal displayShow"); }
            else { modalLNCReport.Attributes.Add("class", "modal displayHide"); }
        }

        private void NotificationModal(bool _ShowHide, string _HeaderText, string _BodyText, bool _Save, bool _Cancel)
        {
            if (_ShowHide) { modalNotification.Attributes.Add("class", "modal displayShow"); }
            else { modalNotification.Attributes.Add("class", "modal displayHide"); }

            lblLNCRDetails_NotifHeader.Text = _HeaderText;
            lblLNCRDetails_NotifBody.Text = _BodyText;

            btnLNCRDetails_SaveYes.Visible = _Save;
            btnLNCRDetails_CancelYes.Visible = _Cancel;
        }

        private void Clear()
        {

        }
        
        #endregion
    }
}