using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Amazon : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)

    {
        if (!IsPostBack)
        {
            if (Session["Id"] != null)
            {

                if (Session["Name"] != null)
                {
                    lblName.Text = Session["Name"].ToString();

                }
                if (Session["Img"] != null)
                {
                    imgProfile.Src = "/assets/images/UploadedImg/" + Convert.ToString(Session["Img"]);
                }
            }
            else
            {
                Response.Redirect("/Pages/Transaction/Login.aspx");
            }
        }
    }
}
