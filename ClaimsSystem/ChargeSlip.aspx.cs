using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClaimsSystem
{
    public partial class ChargeSlip : System.Web.UI.Page
    {
        _gControls _gc = new _gControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    MainButton(true, false);
                    mvCS.SetActiveView(vwViewCS);
                }
                else { }
            }
            catch (Exception ex)
            {

            }
        }

        #region Event(s)

        #region CS Header

        protected void btnCS_Create_Click(object sender, EventArgs e)
        {
            MainButton(false, true);

            Clear();
            mvCS.SetActiveView(vwDetailsCS);
        }

        protected void btnCS_Back_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this Charge Slip Report?", false, true);
        }

        protected void lnkCS_Search_Click(object sender, EventArgs e)
        {

        }

        protected void btnCSDetails_Submit_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Save", "Are you sure you want to save this Charge Slip Report?", true, false);
        }

        protected void btnCSDetails_Cancel_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this Charge Slip Report?", false, true);
        }

        protected void btnCSDetails_SaveYes_Click(object sender, EventArgs e)
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

                mvCS.SetActiveView(vwViewCS);
            }

            #endregion
        }

        protected void btnCSDetails_CancelYes_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);

            MainButton(true, false);
            Clear();

            mvCS.SetActiveView(vwViewCS);
        }

        protected void btnCSDetails_No_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);
        }

        #endregion

        #region CS Body

        protected void btnCSList_AddReport_Click(object sender, EventArgs e)
        {
            CSReportModal(true);
        }

        protected void btnCSeport_Yes_Click(object sender, EventArgs e)
        {
            #region Save

            try
            {

            }
            catch (Exception ex) { }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Payment Details has Successfully Saved!');", true);

                CSReportModal(false);

                //Update gvCSDetailReport
            }

            #endregion
        }

        protected void btnCSeport_Cancel_Click(object sender, EventArgs e)
        {
            CSReportModal(false);
        }

        #endregion

        #endregion

        #region Property(ies)

        private void MainButton(bool _bCSeate, bool _btnBack)
        {
            btnCS_Create.Visible = _bCSeate;
            btnCS_Back.Visible = _btnBack;
        }

        private void NotificationModal(bool _ShowHide, string _HeaderText, string _BodyText, bool _Save, bool _Cancel)
        {
            if (_ShowHide) { modalNotification.Attributes.Add("class", "modal displayShow"); }
            else { modalNotification.Attributes.Add("class", "modal displayHide"); }

            lblCSDetails_NotifHeader.Text = _HeaderText;
            lblCSDetails_NotifBody.Text = _BodyText;

            btnCSDetails_SaveYes.Visible = _Save;
            btnCSDetails_CancelYes.Visible = _Cancel;
        }

        private void CSReportModal(bool _ShowHide)
        {
            if (_ShowHide) { modalCSeport.Attributes.Add("class", "modal displayShow"); }
            else { modalCSeport.Attributes.Add("class", "modal displayHide"); }
        }

        private void Clear()
        {

        }

        #endregion

        
    }
}