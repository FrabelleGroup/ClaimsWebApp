using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClaimsSystem
{
    public partial class TNCR : System.Web.UI.Page
    {
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
    }
}