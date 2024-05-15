﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;

public partial class Item_Management_ItemMaster : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        divAlert.InnerHtml = "";
        if (!IsPostBack)
        {
            FillDDl(ddlItemType, "ItemType");
            FillGrid(grdItems, "Usptrn_GetItem");


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
    protected void btnAdd_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {

            using (SqlDataAdapter adpt = new SqlDataAdapter("UspMst_RegItem", Connstr))
            {
                adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
                adpt.SelectCommand.Parameters.Clear();
                adpt.SelectCommand.Parameters.AddRange(new[] {
                    new SqlParameter("@ItemName",txtItemName.Text.Trim()),
                    new SqlParameter("@ItemTypeId",ddlItemType.SelectedValue),
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
                                txtItemName.Text = "";
                                ddlItemType.ClearSelection();
                                FillGrid(grdItems, "Usptrn_GetItem");
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
        else
        {
            alertmsg("Page is not Valid", "bg-warning");
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
        //sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml += sb.ToString();

    }

    public void FillGrid(GridView grd, string proc)
    {

        SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr);
        adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
        adpt.SelectCommand.Parameters.Clear();

        DataSet ds = new DataSet();
        adpt.Fill(ds);
        if (ds.Tables.Count > 1)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                grd.DataSource = ds.Tables[0];
                grd.DataBind();
            }
            else
            {
                alertmsg("Table is Empty", "bg-warning");
            }
        }
        else if (ds.Tables.Count > 0)
        {
            if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
            {
                alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-warning");

            }
        }
        else
        {
            alertmsg("Somthing went wrong", "bg-warning");
        }


    }
}