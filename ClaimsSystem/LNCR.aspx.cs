using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClaimsSystem
{
    public partial class LNCR : System.Web.UI.Page
    {
        _gControls _gc = new _gControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    MainButton(true, false);
                    mvLNCR.SetActiveView(vwViewLNCR);
                }
                else { }
            }
            catch (Exception ex)
            {
                
            }
        
        
        }

        #region Event(s)

        #region LNCR Header

        protected void btnLNCR_Create_Click(object sender, EventArgs e)
        {
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
                NotificationModal(false, "", "", false, false);

                
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