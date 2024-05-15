using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Transection_AddStock : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        divAlert.InnerHtml = "";
        if (!IsPostBack)
        {
            FillDDl(ddlItem, "Item");
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new[] { 
                new DataColumn("ItemId"), 
                new DataColumn("PurchaseAmount"), 
                new DataColumn("TotalPurchaseQty"), 
                new DataColumn("TotalPurchaseAmount"), 
            });
            FillGrid(grdItems, dt);
        }
    }
    public void FillDDl(DropDownList ddl, string table, string id = "")
    {

        SqlDataAdapter adpt = new SqlDataAdapter("UspTrn_BindDDL", Connstr);
        adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
        adpt.SelectCommand.Parameters.Clear();
        adpt.SelectCommand.Parameters.AddWithValue("@table", table);
        if (id != "")
        {
            adpt.SelectCommand.Parameters.AddWithValue("@id", id);
        }
        DataSet ds = new DataSet();
        adpt.Fill(ds);
        ddl.Items.Clear();
        ddl.DataSource = ds.Tables[0];
        ddl.DataTextField = "Name";
        ddl.DataValueField = "id";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("--Select--", ""));

    }

    public string GetTotal(string[] Numbers)
    {
        int Total = 1;
        for (int i = 0; i < Numbers.Length; i++)
        {
            Total *= Convert.ToInt32(Numbers[i]);
        }
        return Convert.ToString(Total);
    }
    protected void BtnAddStock_Click(object sender, EventArgs e)
    {
        string total = GetTotal(new[] { txtQuantity.Text, txtPurchaseAmount.Text });

        using (DataTable dt = (DataTable)ViewState["grdItems"])
        {
            var cells = new[]
            {
            ddlItem.SelectedValue,
            txtPurchaseAmount.Text,
            txtQuantity.Text,
            total
        };
            dt.Rows.Add(cells);
            FillGrid(grdItems, dt);
            btnSaveAll.Visible = true;
        }
    }
    public void FillGrid(GridView grd, DataTable dataTable)
    {
        if (dataTable.Rows.Count > 0)
        {
            grd.DataSource =dataTable;
            grd.DataBind();
        }
        else
        {
            alertmsg("Table is Empty", "bg-warning");
        }
        ViewState["grdItems"] = dataTable;


    }
    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");
        //sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml += sb.ToString();

    }

    protected void btnSaveAll_Click(object sender, EventArgs e)
    {
        using (SqlDataAdapter adpt = new SqlDataAdapter("UspTrn_AddStock", Connstr))
        {
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
            adpt.SelectCommand.Parameters.Clear();
            adpt.SelectCommand.Parameters.AddRange(new[] {
                    new SqlParameter("@type_Stocks",ViewState["grdItems"]),
                    new SqlParameter("@CreatedByIp",Request.UserHostAddress),
                    new SqlParameter("@CreatedBy",Convert.ToString( Session["Id"])),
            }); ;
            using (DataSet ds = new DataSet())
            {
                adpt.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                        {
                            alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-success");
                        }
                        else
                        {
                            alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-warning");
                        }
                    }
                    else
                    {
                        alertmsg("Somthing went wrong", "bg-warning");
                    }
                }
                else
                {
                    alertmsg("Somthing went wrong", "bg-warning");
                }

            }
        }
    }
    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        txtTotalAmount.Text = GetTotal(new[] { txtPurchaseAmount.Text, txtQuantity.Text });
    }
}

