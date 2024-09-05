using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Linq;
using System.Xml.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Linq.Expressions;
using System.Security.Cryptography;
using static System.Net.Mime.MediaTypeNames;

public partial class Pages_Default2 : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString.ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            FillDDl(ddlCategory, "TRANSPORTATON$", "Category");
            FillDDl(ddlSubCategory, "TRANSPORTATON$", "Sub Category");

        }
    }
    void fillinput()
    {
        if (ddlSubCategory.SelectedValue != "0" && ddlCategory.SelectedValue != "0")
        {
            String QueryStr = "select distinct Ingredients,[Material Cost], PROTIEN,CALORIES ,Formula from [TRANSPORTATON$] trn inner join NUTRITION$ nut on trn.Ingredients= nut.[MATARIAL NAME ] where [Sub Category] = '" + ddlSubCategory.SelectedValue + "' and Category = '" + ddlCategory.SelectedValue + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(QueryStr, Connstr);
            adpt.SelectCommand.CommandType = System.Data.CommandType.Text;

            DataSet ds = new DataSet();
            adpt.Fill(ds);

            grdMAinData.DataSource = ds.Tables[0];
            grdMAinData.DataBind();
            PrevCalCulation();
            DvIngredients.Visible = true;
        }
    }
    public void FillDDl(DropDownList ddl, string table, string name)
    {

        String QueryStr = " select [" + name + "]  from [" + table + "] group by [" + name + "]";
        SqlDataAdapter adpt = new SqlDataAdapter(QueryStr, Connstr);


        adpt.SelectCommand.CommandType = System.Data.CommandType.Text;

        DataSet ds = new DataSet();
        adpt.Fill(ds);
        ddl.Items.Clear();
        ddl.DataSource = ds.Tables[0];
        ddl.DataTextField = name;
        ddl.DataValueField = name;
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillinput();
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        double sumofcost = 0, sumofCalories = 0, sumofprotien = 0,sumofpercent = 0;
       
        foreach (GridViewRow row in grdMAinData.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtFormula = (TextBox)row.FindControl("txtFormula");
                System.Web.UI.WebControls.Label lblCost = (System.Web.UI.WebControls.Label)row.FindControl("lblCost");
                System.Web.UI.WebControls.Label lblPROTIEN = (System.Web.UI.WebControls.Label)row.FindControl("lblPROTIEN");
                System.Web.UI.WebControls.Label lblCALORIES = (System.Web.UI.WebControls.Label)row.FindControl("lblCALORIES");
                
                double formulaValue = (txtFormula.Text != "") ? Convert.ToDouble(txtFormula.Text) / 100 : 0;
                sumofprotien += Convert.ToDouble(lblPROTIEN.Text) * formulaValue;
                sumofCalories += Convert.ToDouble(lblCALORIES.Text) * formulaValue;
                sumofcost += Convert.ToDouble(lblCost.Text) * formulaValue;
                sumofpercent += (txtFormula.Text != "") ? Convert.ToDouble(txtFormula.Text): 0;
                // Previous data
                System.Web.UI.WebControls.Label lblPrevFormula = (System.Web.UI.WebControls.Label)row.FindControl("lblPrevFormula");
            }
        }
        
        lblTotalCALORIES.Text = sumofCalories.ToString();
        lblTotalCost.Text = sumofcost.ToString();
        lblTotalPROTIEN.Text = sumofprotien.ToString();
        lblTotalPrs.Text = sumofpercent.ToString();
    }

protected void PrevCalCulation()
    {
        double sumofcost = 0, sumofCalories = 0, sumofprotien = 0,sumofpercent = 0;       
        foreach (GridViewRow row in grdMAinData.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {                
                System.Web.UI.WebControls.Label lblPrevFormula = (System.Web.UI.WebControls.Label)row.FindControl("lblPrevFormula");
                System.Web.UI.WebControls.Label lblCost = (System.Web.UI.WebControls.Label)row.FindControl("lblCost");
                System.Web.UI.WebControls.Label lblPROTIEN = (System.Web.UI.WebControls.Label)row.FindControl("lblPROTIEN");
                System.Web.UI.WebControls.Label lblCALORIES = (System.Web.UI.WebControls.Label)row.FindControl("lblCALORIES");
                
                double formulaValue = (lblPrevFormula.Text != "") ? Convert.ToDouble(lblPrevFormula.Text) / 100 : 0;
                sumofprotien += Convert.ToDouble(lblPROTIEN.Text) * formulaValue;
                sumofCalories += Convert.ToDouble(lblCALORIES.Text) * formulaValue;
                sumofcost += Convert.ToDouble(lblCost.Text) * formulaValue;
                sumofpercent += (lblPrevFormula.Text != "") ? Convert.ToDouble(lblPrevFormula.Text): 0;
               
            }
        }
        
        lblPrevCALORIES.Text = sumofCalories.ToString();
        lblPrevCost.Text = sumofcost.ToString();
        lblPrevPROTIEN.Text = sumofprotien.ToString();
        lblPrevPrs.Text = sumofpercent.ToString();
    }
}