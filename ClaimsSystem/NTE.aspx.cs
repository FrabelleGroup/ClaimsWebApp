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
    public partial class NTE : System.Web.UI.Page
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
                    gvNTEList.DataSource = Retrieve_Header();
                    gvNTEList.DataBind();
                    mvNTE.SetActiveView(vwViewNTE);
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
            string _jsonResponse = _wcf.Get_NoticeToExplain_Head("");
            var headerData = JsonConvert.DeserializeObject<DataTable>(_jsonResponse);
            return headerData;
        }

        public DataTable Retrieve_Body()
        {
            string _jsonResponse = _wcf.Get_NoticeToExplain_Body(hfNTEID.Value);
            var bodyData = JsonConvert.DeserializeObject<DataTable>(_jsonResponse);
            return bodyData;
        }

        public DataTable Retrieve_Body1()
        {
            string _jsonResponse = _wcf.Get_Cod(hfNTEID.Value);
            var bodyData1 = JsonConvert.DeserializeObject<DataTable>(_jsonResponse);
            return bodyData1;
        }   



        #endregion

        #region NTE Head

        protected void btnNTE_Create_Click(object sender, EventArgs e)
        {
           /* int NTEID, int CompanyID, DateTime DATE, string EmployeeName, string Subject, DateTime IncidentDateTime
            , string IncidentSuspensionDays, string Remarks, bool Status*/
            string _jResponse = _wcf.Set_NoticeToExplain_Head(0, 0, DateTime.Now,"","", DateTime.Now, "", "", true,"");
            if (_jResponse != "")
            {
                dynamic _jData = JsonConvert.DeserializeObject<dynamic>(_jResponse);
                txtNTE_ID.Text = (string)_jData[0].NTEID;
            }


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
               /* _wcf.Set_Logistics_BodyReport(Convert.ToInt32(hfLNCRBodyID.Value), Convert.ToInt32(txtLNCR_ID.Text), txtLNCRReport_DocumentReferenceNo.Text, txtLNCRReport_ItemCustomer.Text, Convert.ToDecimal(txtLNCReport_Qty.Text), txtLNCReport_UOM.Text, Convert.ToDecimal(txtLNCReport_Amount.Text), txtLNCReport_Remarks.Text, true);
                gvLNCRDetailReport.DataSource = Retrieve_Body();
                gvLNCRDetailReport.DataBind();
                mvLNCR.SetActiveView(vwDetailsLNCR);        
                * 
                * 
                * int NTEID, int CompanyID, DateTime DATE, string EmployeeName, string Subject, DateTime IncidentDateTime
            , string IncidentSuspensionDays, string Remarks, bool Status*/
                NotificationModal(false, "", "", false, false);
                // save header
                _wcf.Set_NoticeToExplain_Head(Convert.ToInt32(txtNTE_ID.Text), 0, DateTime.Now, txtNTE_EmployeeName.Text, txtNTE_Subject.Text, _gc.ToDateTime(txtNTE_IncidentDate.Text), NTE_DaysOfSuspension.Text, txtNTE_Remarks.Text, true, txtNTE_IncidentPlace.Text);
                gvNTEList.DataSource = Retrieve_Header();
                gvNTEList.DataBind();
                mvNTE.SetActiveView(vwViewNTE);

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
            gvNTEList.DataSource = Retrieve_Header();
            gvNTEList.DataBind();
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
                //  int OffenseID, int NTEID, string Details, bool Status
                _wcf.Set_NoticeToExplain_Body(Convert.ToInt32(hfNTEOffense_NTEID.Value), Convert.ToInt32(txtNTE_ID.Text), txtNTEOffense_OffenseDetail.Text, true);
                gvNTEProvision.DataSource = Retrieve_Body();
                gvNTEProvision.DataBind();
                gvNTE_Provision.DataSource = Retrieve_Body1();
                gvNTE_Provision.DataBind();
                mvNTE.SetActiveView(vwDetailsNTE);
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
                //int CODID, int NTEID, string Sec, string Para, string Provision, bool Status
                _wcf.Set_Cod(Convert.ToInt32(hfNTEProvision_NTEID.Value), Convert.ToInt32(txtNTE_ID.Text), txtNTEProvision_Sec.Text, txtNTEProvision_Para.Text, txtNTEProvision_Provision.Text,true);
                gvNTEProvision.DataSource = Retrieve_Body();
                gvNTEProvision.DataBind();
                gvNTE_Provision.DataSource = Retrieve_Body1();
                gvNTE_Provision.DataBind();
                mvNTE.SetActiveView(vwDetailsNTE);
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
            if (e.CommandName == "Select")
            {
                int _index = Convert.ToInt32(e.CommandArgument);
                GridViewRow _row = gvNTEList.Rows[_index];
                hfNTEID.Value = _row.Cells[0].Text.Replace("&nbsp;", "");
                txtNTE_ID.Text = _row.Cells[0].Text.Replace("&nbsp;", "");
                DateTime dc = DateTime.Parse(_row.Cells[2].Text);
                txtNTE_DateCreated.Text = dc.ToString("yyyy-MM-dd");
                txtNTE_Subject.Text = _row.Cells[4].Text.Replace("&nbsp;", "");
                txtNTE_EmployeeName.Text = _row.Cells[3].Text.Replace("&nbsp;", "");
                DateTime ida = DateTime.Parse(_row.Cells[5].Text);
                txtNTE_IncidentDate.Text = ida.ToString("yyyy-MM-dd");
                txtNTE_IncidentPlace.Text = _row.Cells[6].Text.Replace("&nbsp;", "");
                NTE_DaysOfSuspension.Text = _row.Cells[7].Text.Replace("&nbsp;", "");
                txtNTE_Remarks.Text = _row.Cells[8].Text.Replace("&nbsp;", "");

                gvNTEProvision.DataSource = Retrieve_Body();
                gvNTEProvision.DataBind();
                gvNTE_Provision.DataSource = Retrieve_Body1();
                gvNTE_Provision.DataBind();
                mvNTE.SetActiveView(vwDetailsNTE);
            }
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