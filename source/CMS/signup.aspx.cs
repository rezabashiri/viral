using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            uscSignUp.OnSendVerificationCode += UscSignUp_OnSendVerificationCode;
            uscSignUp.OnVerificationComplete += UscSignUp_OnVerificationComplete;
        }

        private void UscSignUp_OnVerificationComplete(AccessManagementService.Access.UserActiveStatus status)
        {
            switch (status)
            {
                case AccessManagementService.Access.UserActiveStatus.Active:
                    //Server.TransferRequest("~/LoginUser.aspx");
                    break;
                case AccessManagementService.Access.UserActiveStatus.NotActive:
                    break;

            }
        }

        private void UscSignUp_OnSendVerificationCode(AccessManagementService.Helpers.VerificationStatus Status)
        {
        }
    }
}