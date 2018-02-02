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
    public partial class TNCR : System.Web.UI.Page
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
                    gvTNCRList.DataSource = Retrieve_Header();
                    gvTNCRList.DataBind();
                    mvTNCR.SetActiveView(vwViewTNCR);
                }
                else { }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnTNCR_Create_Click(object sender, EventArgs e)
        {
            MainButton(false, true);

            Clear();
            mvTNCR.SetActiveView(vwDetailsTNCR);
        }

        protected void btnTNCR_Back_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this LNC Report?", false, true);
        }

        protected void lnkTNCR_Search_Click(object sender, EventArgs e)
        {

        }

        protected void btnTNCRDetails_Submit_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Save", "Are you sure you want to save this TNC Report?", true, false);
        }

        protected void btnTNCRDetails_Cancel_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this NTE Report?", false, true);
        }

        protected void btnTNCRDetails_SaveYes_Click(object sender, EventArgs e)
        {
            try
            {                
                NotificationModal(false, "", "", false, false);
                _wcf.Set_Tall_Report(Convert.ToInt32(hfTNCRID.Value), 0, DateTime.Now, txtTNCR_TotalAffected.Text, Convert.ToDecimal(txtTNCR_AmountAffected.Text), chkTNCR_Conc_ConsumptionVariance.Checked
                    , chkTNCR_Conc_RawMaterials.Checked, /*"finishgoods"*/false, chkTNCR_Conc_TechnicalScrap.Checked, chkTNCR_Conc_YieldVariances.Checked, chkTNCR_Conc_ConsumptionVariances.Checked,
                    chkTNCR_Conc_DelayReport.Checked, /*"QADeviation"*/false, chkTNCR_Conc_WrongLabel.Checked, chkTNCR_Conc_ShortLacking.Checked, /*"QANonConformance"*/false, chkTNCR_Conc_WeakSeal.Checked,
                    chkTNCR_Conc_Bursting.Checked, chkTNCR_Conc_LoosePack.Checked, chkTNCR_Conc_Rejects.Checked, chkTNCR_Conc_Contamination.Checked, chkTNCR_Conc_SwabGMPSanitation.Checked,
                    chkTNCR_Conc_Others.Checked, txtTNCR_Conc_Others.Text, 0, 0, 0, true, txtTNCR_Remarks.Text, ddlTNCR_Toller.SelectedValue);
                // save header
// int TallID, int CompanyID, DateTime Date, string TotalAffected, decimal TotalAffectedAmount, bool InventoryVariance, bool RawMaterials, bool FinishedGoods, bool TechnicalScrap, bool YieldVariances, bool ConsumptionVariance, bool DelayReport, bool QADeviation, bool WrongLabel, bool ShortLacking, bool QANonConformance, bool WeakSeal, bool Bursting, bool LoosePack, bool Rejects, bool Contamination, bool SwabGMPSanitation, bool Others, string OthersRemarks, int PreparedByID, int ReceivedByID, int AcknowledgeByID, bool Status, string Remarks, string Toller
           /*     _wcf.Set_Tall_Report(Convert.ToInt32(hfTNCRID.Value), 0, DateTime.Now, txtTNCR_TotalAffected.Text, Convert.ToDecimal(txtTNCR_AmountAffected), chkTNCR_Conc_ConsumptionVariance.Checked
    , chkTNCR_Conc_RawMaterials.Checked, "finishgoods", chkTNCR_Conc_TechnicalScrap.Checked, chkTNCR_Conc_YieldVariances.Checked, chkTNCR_Conc_ConsumptionVariances.Checked,
    chkTNCR_Conc_DelayReport.Checked, "QADeviation", chkTNCR_Conc_WrongLabel.Checked, chkTNCR_Conc_ShortLacking.Checked, "QANonConformance", chkTNCR_Conc_WeakSeal.Checked,
    chkTNCR_Conc_Bursting.Checked, chkTNCR_Conc_LoosePack.Checked, chkTNCR_Conc_Rejects.Checked, chkTNCR_Conc_Contamination.Checked, chkTNCR_Conc_SwabGMPSanitation.Checked,
    chkTNCR_Conc_Others.Checked, txtTNCR_Conc_Others.Text, 0, 0, 0, true); */
               

            }
            catch (Exception ex)
            {

            }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Saved!');", true);

                MainButton(true, false);
                Clear();

               // mvNTE.SetActiveView(vwViewNTE);
            }
//save db
        }

        protected void btnTNCRDetails_CancelYes_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);

            MainButton(true, false);
            Clear();
        }

        protected void btnTNCRDetails_No_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);
        }

        #region Functions

        public DataTable Retrieve_Header()
        {
            string _jsonResponse = _wcf.Get_Tall_Report("");
            var headerData = JsonConvert.DeserializeObject<DataTable>(_jsonResponse);
            return headerData;
        }


        #endregion

        #region Property(ies)

        private void MainButton(bool _btnCreate, bool _btnBack)
        {
            btnTNCR_Create.Visible = _btnCreate;
            btnTNCR_Back.Visible = _btnBack;
        }

        private void NotificationModal(bool _ShowHide, string _HeaderText, string _BodyText, bool _Save, bool _Cancel)
        {
            if (_ShowHide) { modalNotification.Attributes.Add("class", "modal displayShow"); }
            else { modalNotification.Attributes.Add("class", "modal displayHide"); }

            lblTNCRDetails_NotifHeader.Text = _HeaderText;
            lblTNCRDetails_NotifBody.Text = _BodyText;

            btnTNCRDetails_SaveYes.Visible = _Save;
            btnTNCRDetails_CancelYes.Visible = _Cancel;
        }

        private void Clear()
        {

        }

        #endregion

        #region GridView Event(s)

        protected void gvTNCRList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int _index = Convert.ToInt32(e.CommandArgument) % gvTNCRList.PageSize;
                GridViewRow _row = gvTNCRList.Rows[_index];
                hfTNCRID.Value = _row.Cells[0].Text.Replace("&nbsp;", "");
                txtTNCR_ID.Text = _row.Cells[0].Text.Replace("&nbsp;", "");
                DateTime dc = DateTime.Parse(_row.Cells[2].Text);
                txtTNCR_DateCreated.Text = dc.ToString("yyyy-MM-dd");
                ddlTNCR_Toller.SelectedValue = _row.Cells[29].Text.Replace("&nbsp;", "");
                txtTNCR_TotalAffected.Text = _row.Cells[3].Text.Replace("&nbsp;", "");
                txtTNCR_AmountAffected.Text = _row.Cells[4].Text.Replace("&nbsp;", "");
                chkTNCR_Conc_RawMaterials.Checked = _gc.Load_CheckBox(_row.Cells[6].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_ConsumptionVariance.Checked = _gc.Load_CheckBox(_row.Cells[5].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_TechnicalScrap.Checked = _gc.Load_CheckBox(_row.Cells[8].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_YieldVariances.Checked = _gc.Load_CheckBox(_row.Cells[9].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_ConsumptionVariances.Checked = _gc.Load_CheckBox(_row.Cells[10].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_DelayReport.Checked = _gc.Load_CheckBox(_row.Cells[11].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_WeakSeal.Checked = _gc.Load_CheckBox(_row.Cells[16].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_Bursting.Checked = _gc.Load_CheckBox(_row.Cells[17].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_LoosePack.Checked = _gc.Load_CheckBox(_row.Cells[18].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_Rejects.Checked = _gc.Load_CheckBox(_row.Cells[19].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_Contamination.Checked = _gc.Load_CheckBox(_row.Cells[20].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_SwabGMPSanitation.Checked = _gc.Load_CheckBox(_row.Cells[21].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_Others.Checked = _gc.Load_CheckBox(_row.Cells[22].Text.Replace("&nbsp;", ""));
                txtTNCR_Conc_Others.Text = _row.Cells[23].Text.Replace("&nbsp;", "");
                chkTNCR_Conc_WrongLabel.Checked = _gc.Load_CheckBox(_row.Cells[13].Text.Replace("&nbsp;", ""));
                chkTNCR_Conc_ShortLacking.Checked = _gc.Load_CheckBox(_row.Cells[14].Text.Replace("&nbsp;", ""));
                txtTNCR_Remarks.Text = _row.Cells[28].Text.Replace("&nbsp;", "");



                mvTNCR.SetActiveView(vwDetailsTNCR);
            }
        }

        protected void gvTNCRList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTNCRList.PageIndex = e.NewPageIndex;
            gvTNCRList.DataSource = Retrieve_Header();
            gvTNCRList.DataBind();
        }

        protected void gvTNCRList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        #endregion

        
    }
}