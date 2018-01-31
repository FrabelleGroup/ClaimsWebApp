using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClaimsSystem
{
    public partial class NTE : System.Web.UI.Page
    {
        _gControls _gc = new _gControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    MainButton(true, false);
                    mvNTE.SetActiveView(vwViewNTE);
                }
                else { }
            }
            catch (Exception ex)
            {

            }
        }

        #region Event(s)

        #region NTE Head

        protected void btnNTE_Create_Click(object sender, EventArgs e)
        {
            MainButton(false, true);

            Clear();
            mvNTE.SetActiveView(vwDetailsNTE);
        }

        protected void btnNTE_Back_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this NTE Report?", false, true);
        }

        protected void lnkNTE_Search_Click(object sender, EventArgs e)
        {

        }

        protected void btnNTEDetails_Submit_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Save", "Are you sure you want to save this NTE Report?", true, false);
        }

        protected void btnNTEDetails_Cancel_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this NTE Report?", false, true);
        }

        protected void btnNTEDetails_SaveYes_Click(object sender, EventArgs e)
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

                mvNTE.SetActiveView(vwViewNTE);
            }

            #endregion
        }

        protected void btnNTEDetails_CancelYes_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);

            MainButton(true, false);
            Clear();

            mvNTE.SetActiveView(vwViewNTE);
        }

        protected void btnNTEDetails_No_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);
        }

        #endregion

        #region Add Offenses

        protected void btnNTEList_AddOffenses_Click(object sender, EventArgs e)
        {
            OffenseModal(true);
        }

        protected void btnNTEOffense_Yes_Click(object sender, EventArgs e)
        {
            #region Save

            try
            {

            }
            catch (Exception ex) { }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Offense Details has Successfully Saved!');", true);

                OffenseModal(false);
            }

            #endregion
        }

        protected void btnNTEOffense_Cancel_Click(object sender, EventArgs e)
        {
            OffenseModal(false);
        }

        #endregion

        #region Add Provision

        protected void btnNTEList_AddProvision_Click(object sender, EventArgs e)
        {
            ProvisionModal(true);
        }

        protected void btnNTEProvision_Yes_Click(object sender, EventArgs e)
        {
            #region Save

            try
            {

            }
            catch (Exception ex) { }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Provision Details has Successfully Saved!');", true);

                ProvisionModal(false);
            }

            #endregion
        }

        protected void btnNTEProvision_Cancel_Click(object sender, EventArgs e)
        {
            ProvisionModal(false);
        }

        #endregion

        #endregion

        #region GridView Event(s)

        protected void gvNTEList_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvNTEList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvNTEList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        #endregion

        #region Property(ies)

        private void MainButton(bool _btnCreate, bool _btnBack)
        {
            btnNTE_Create.Visible = _btnCreate;
            btnNTE_Back.Visible = _btnBack;
        }

        private void OffenseModal(bool _ShowHide)
        {
            if (_ShowHide) { modalOffense.Attributes.Add("class", "modal displayShow"); }
            else { modalOffense.Attributes.Add("class", "modal displayHide"); }
        }

        private void ProvisionModal(bool _ShowHide)
        {
            if (_ShowHide) { modalProvision.Attributes.Add("class", "modal displayShow"); }
            else { modalProvision.Attributes.Add("class", "modal displayHide"); }
        }

        private void NotificationModal(bool _ShowHide, string _HeaderText, string _BodyText, bool _Save, bool _Cancel)
        {
            if (_ShowHide) { modalNotification.Attributes.Add("class", "modal displayShow"); }
            else { modalNotification.Attributes.Add("class", "modal displayHide"); }

            lblNTEDetails_NotifHeader.Text = _HeaderText;
            lblNTEDetails_NotifBody.Text = _BodyText;

            btnNTEDetails_SaveYes.Visible = _Save;
            btnNTEDetails_CancelYes.Visible = _Cancel;
        }

        private void Clear()
        {

        }

        #endregion
    }
}