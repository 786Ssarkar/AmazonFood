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
using System.Data.SqlTypes;
using System.Globalization;
using System.Web.DynamicData;

public partial class Transection_AddStock : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        divAlert.InnerHtml = "";
        if (!IsPostBack)
        {
            FillDDl(ddlItem, "Item");
            FillGrid(grdItems, CreateDT());
            FillTotalGrid();
        }
    }
    public DataTable CreateDT()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new[] {
                new DataColumn("ItemId",typeof(int)),
                new DataColumn("ItemName",typeof(string)),
                new DataColumn("PurchaseAmount",typeof(decimal)),
                new DataColumn("TotalPurchaseQty", typeof(int)),
                new DataColumn("TotalPurchaseAmount", typeof(decimal)),
            });
        return dt;
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
            dt.Rows.Add(Convert.ToInt32(ddlItem.SelectedValue), ddlItem.SelectedItem.Text, Convert.ToDecimal(txtPurchaseAmount.Text), Convert.ToInt32(txtQuantity.Text), Convert.ToDecimal(total)
        );

            FillGrid(grdItems, dt);
            btnSaveAll.Visible = true;

            ddlItem.ClearSelection();
            txtPurchaseAmount.Text = "";
            txtTotalAmount.Text = "";
            txtQuantity.Text = "";
        }
    }
    public void FillGrid(GridView grd, DataTable dataTable)
    {
        if (dataTable.Rows.Count > 0)
        {
            grd.DataSource = dataTable;
            grd.DataBind();
        }
        ViewState["grdItems"] = dataTable;
    }
    public void FillTotalGrid()
    {
        using (SqlDataAdapter adpt = new SqlDataAdapter("Usptrn_GetItemStock", Connstr))
        {
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
            adpt.SelectCommand.Parameters.AddWithValue("@SalerId", Convert.ToString(Session["Id"]));
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            if (ds != null)
            {
                if (ds.Tables.Count > 1)
                {

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        grdTotalStocks.DataSource = ds.Tables[0];
                        grdTotalStocks.DataBind();
                    }
                }
                else
                {
                    alertmsg(ds.Tables[0].Rows[0]["msg"].ToString(), "bg-warning");
                }
            }
        }
    }
    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");

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
            DataTable dt = (DataTable)ViewState["grdItems"];
            dt.Columns.Remove("ItemName");

            adpt.SelectCommand.Parameters.AddRange(new[] {
                    new SqlParameter("@type_Stocks",dt),
                    new SqlParameter("@CreatedByIp",Request.UserHostAddress),
                    new SqlParameter("@CreatedBy",Convert.ToString( Session["Id"])),
            });

            using (DataSet ds = new DataSet())
            {
                adpt.Fill(ds);
                dt.Columns.Add("ItemName", typeof(string)).SetOrdinal(1);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                        {
                            alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-success");
                            btnSaveAll.Visible = false;
                            grdItems.DataSource = null;
                            grdItems.DataBind();
                            FillTotalGrid();
                            ViewState["grdItems"] = CreateDT();
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

}

