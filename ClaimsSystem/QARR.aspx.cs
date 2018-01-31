using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClaimsSystem.ServiceReference1;
using Newtonsoft.Json;

namespace ClaimsSystem
{
    public partial class QARR : System.Web.UI.Page
    {
        _gControls _gc = new _gControls();
        ClaimsClient _wcf = new ClaimsClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    _gc.DeserializeDataTable(_wcf.Get_Qa_Report(""), gvQARRList);

                    MainButton(true, false);
                    mvQARR.SetActiveView(vwViewQARR);
                }
                else { }
            }
            catch (Exception ex) { }
        }


        protected void btnQARR_Create_Click(object sender, EventArgs e)
        {
            //Get QARR ID from DB
            string _jResponse = _wcf.Set_Qa_Report(0, 0, "", DateTime.Now, "", 0, "", "", "", "", false, false, false, false, false, "", false, false, false, false, false, false, "", "", DateTime.Now, true);

            if (_jResponse != "")
            {
                dynamic _jData = JsonConvert.DeserializeObject<dynamic>(_jResponse);
                txtQARR_ID.Text = (string)_jData[0].QARRID;
            }

            MainButton(false, true);

            Clear(false);
            mvQARR.SetActiveView(vwDetailsQARR);
        }

        protected void btnQARR_Back_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this QAR Report?", false, true);
        }

        protected void lnkQARR_Search_Click(object sender, EventArgs e)
        {

        }

        protected void btnQARRDetails_Submit_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Save", "Are you sure you want to save this QAR Report?", true, false);
        }

        protected void btnQARRDetails_Cancel_Click(object sender, EventArgs e)
        {
            NotificationModal(true, "Confirmation To Cancel", "Are you sure you want to cancel this QAR Report?", false, true);
        }

        protected void btnQARRDetails_SaveYes_Click(object sender, EventArgs e)
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
                Clear(false);

                mvQARR.SetActiveView(vwViewQARR);
            }

            #endregion
        }

        protected void btnQARRDetails_CancelYes_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);

            MainButton(true, false);
            Clear(true);

            mvQARR.SetActiveView(vwViewQARR);
        }

        protected void btnQARRDetails_No_Click(object sender, EventArgs e)
        {
            NotificationModal(false, "", "", false, false);
        }


        #region Property(ies)

        private void MainButton(bool _bQARReate, bool _btnBack)
        {
            btnQARR_Create.Visible = _bQARReate;
            btnQARR_Back.Visible = _btnBack;
        }

        private void NotificationModal(bool _ShowHide, string _HeaderText, string _BodyText, bool _Save, bool _Cancel)
        {
            if (_ShowHide) { modalNotification.Attributes.Add("class", "modal displayShow"); }
            else { modalNotification.Attributes.Add("class", "modal displayHide"); }

            lblQARRDetails_NotifHeader.Text = _HeaderText;
            lblQARRDetails_NotifBody.Text = _BodyText;

            btnQARRDetails_SaveYes.Visible = _Save;
            btnQARRDetails_CancelYes.Visible = _Cancel;
        }

        private void Clear(bool _ClearID)
        {
            if (_ClearID) { hfQARRID.Value = "0"; txtQARR_ID.Text = ""; }

            //Clear other fields
        }

        #endregion
    }
}