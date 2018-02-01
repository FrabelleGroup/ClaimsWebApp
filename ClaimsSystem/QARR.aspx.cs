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
            //Get QARR ID from DB **ARGEE**
            string _jResponse = _wcf.Set_Qa_Report(0, 0, "", DateTime.Now, "", 0, "", "", "", "", false, false, false, false, false, "", false, false, false, false, false, false, "", "", DateTime.Now, true);

            if (_jResponse != "")
            {
                dynamic _jData = JsonConvert.DeserializeObject<dynamic>(_jResponse);
                txtQARR_ID.Text = (string)_jData[0].QARRID;
            }
            //END ARGEE
            
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
            //    int QARRID, int CompanyID, string ReferenceCode, DateTime ReferenceDate, string IssuedTo, int SupplierID, string Department
            //, string InitiatedBy, string NotedBy, string Subject, bool Type_Legal, bool Type_Product, bool Type_Procedure, bool Type_StructuralAndSanitation
            //, bool Type_Other, string Type_OtherRemarks, bool NC_SupplierServiceProvider, bool NC_FBC, bool NC_Toll, bool NC_ADP, bool NC_Trucker
            //, bool NC_Other, string NC_OtherRemarks, string SummaryReport, DateTime DateCreated, bool Status
                NotificationModal(false, "", "", false, false);
                _wcf.Set_Qa_Report(Convert.ToInt32(txtQARR_ID.Text), 0, txtQARR_ReferenceCode.Text, DateTime.Now, txtQARR_IssuedTo.Text, 0, txtQARR_Department.Text, txtQARR_InitiatedBy.Text, txtQARR_NotedBy.Text, lblQARR_Subject.Text,
                    chkQARR_Type_Legal.Checked, chkQARR_Type_Product.Checked, chkQARR_Type_Procedure.Checked, chkQARR_Type_StructuralSanitation.Checked,
                    chkQARR_Type_Others.Checked, txtQARR_Type_Others.Text, chkQARR_NC_SupplierServiceProvider.Checked, chkQARR_NC_FBC.Checked, chkQARR_NC_Toll.Checked, chkQARR_NC_ADP.Checked,
                    chkQARR_NC_Trucker.Checked, chkQARR_NC_Others.Checked, txtQARR_NC_Others.Text, txtQARR_SummaryReport.Text, DateTime.Now, true);
                _gc.DeserializeDataTable(_wcf.Get_Qa_Report(""), gvQARRList); 
                mvQARR.SetActiveView(vwViewQARR);

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

        #region GridView Event(s)

        protected void gvQARRList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int _index = Convert.ToInt32(e.CommandArgument);
                GridViewRow _row = gvQARRList.Rows[_index];
                hfQARRID.Value =_row.Cells[0].Text.Replace("&nbsp;", "");
                txtQARR_ID.Text = _row.Cells[0].Text.Replace("&nbsp;", "");
                txtQARR_DateCreated.Text = _row.Cells[25].Text.Replace("&nbsp;", "");
                txtQARR_IssuedTo.Text = _row.Cells[5].Text.Replace("&nbsp;", "");
                txtQARR_InitiatedBy.Text = _row.Cells[8].Text.Replace("&nbsp;", "");
                txtQARR_ReferenceCode.Text = _row.Cells[3].Text.Replace("&nbsp;", "");
                txtQARR_Department.Text = _row.Cells[7].Text.Replace("&nbsp;", "");
                txtQARR_NotedBy.Text = _row.Cells[9].Text.Replace("&nbsp;", "");
                txtQARR_ReferenceDate.Text = _row.Cells[4].Text.Replace("&nbsp;", "");
                txtQARR_Subject.Text = _row.Cells[10].Text.Replace("&nbsp;", "");
                chkQARR_Type_Legal.Checked = _gc.Load_CheckBox(_row.Cells[11].Text.Replace("&nbsp;", ""));
                chkQARR_Type_Product.Checked = _gc.Load_CheckBox(_row.Cells[12].Text.Replace("&nbsp;", ""));
                chkQARR_Type_Procedure.Checked = _gc.Load_CheckBox(_row.Cells[13].Text.Replace("&nbsp;", ""));
                chkQARR_Type_StructuralSanitation.Checked = _gc.Load_CheckBox(_row.Cells[14].Text.Replace("&nbsp;", ""));
                chkQARR_Type_Others.Checked = _gc.Load_CheckBox(_row.Cells[15].Text.Replace("&nbsp;", ""));
                txtQARR_Type_Others.Text = _row.Cells[16].Text.Replace("&nbsp;", "");
                chkQARR_NC_SupplierServiceProvider.Checked = _gc.Load_CheckBox(_row.Cells[17].Text.Replace("&nbsp;", ""));
                chkQARR_NC_FBC.Checked = _gc.Load_CheckBox(_row.Cells[18].Text.Replace("&nbsp;", ""));
                chkQARR_NC_Toll.Checked = _gc.Load_CheckBox(_row.Cells[19].Text.Replace("&nbsp;", ""));
                chkQARR_NC_ADP.Checked = _gc.Load_CheckBox(_row.Cells[20].Text.Replace("&nbsp;", ""));
                chkQARR_NC_Trucker.Checked = _gc.Load_CheckBox(_row.Cells[21].Text.Replace("&nbsp;", ""));
                chkQARR_NC_Others.Checked = _gc.Load_CheckBox(_row.Cells[22].Text.Replace("&nbsp;", ""));
                txtQARR_NC_Others.Text = _row.Cells[23].Text.Replace("&nbsp;", "");
                txtQARR_SummaryReport.Text = _row.Cells[24].Text.Replace("&nbsp;", "");



                mvQARR.SetActiveView(vwDetailsQARR);
            }
        }

        protected void gvQARRList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvQARRList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        #endregion
    }
}