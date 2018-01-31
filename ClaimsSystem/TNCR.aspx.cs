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
                    chkTNCR_Conc_Others.Checked, txtTNCR_Conc_Others.Text,0,0,0,true);
                // save header

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

        #region Function

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

        }

        protected void gvTNCRList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvTNCRList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        #endregion

        
    }
}