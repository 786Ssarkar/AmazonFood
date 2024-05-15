using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text;
using System.Configuration;

public partial class Pages_Login : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        divAlert.InnerHtml = "";
    }
    public static string HashPassword(string password)
    {
        SHA512 sha512 = SHA512Managed.Create();
        return Convert.ToBase64String(sha512.ComputeHash(System.Text.Encoding.Default.GetBytes(password)));
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    
    {
        string msg="", bgcolor="";
        if (Page.IsValid)
        {

            using (SqlDataAdapter adpt = new SqlDataAdapter("UspTrn_Login", Connstr))
            {
                adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
                adpt.SelectCommand.Parameters.Clear();
                adpt.SelectCommand.Parameters.AddRange(new[] {
                new SqlParameter("@UserName",txtUsername.Text.Trim() ),
                new SqlParameter("@Password",HashPassword(txtPassword.Text)),
            });
                using (DataSet ds = new DataSet())
                {
                    adpt.Fill(ds);
                    if (ds.Tables.Count > 1)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (Convert.ToString(ds.Tables[0].Rows[0]["Usertype"]) == "1")
                            {
                                //Admin =1
                                Session["Name"] = Convert.ToString(ds.Tables[0].Rows[0]["name"]);
                                Session["Img"] = Convert.ToString(ds.Tables[0].Rows[0]["img"]);
                                Session["Id"] = Convert.ToString(ds.Tables[0].Rows[0]["Id"]);
                                Session["Usertype"] = Convert.ToString(ds.Tables[0].Rows[0]["Usertype"]);
                                Response.Redirect("~/Pages/Dashboard.aspx");
                            }
                            else if (Convert.ToString(ds.Tables[0].Rows[0]["Usertype"]) == "2")
                            {
                                //Buyer=2

                                Session["Name"] = Convert.ToString(ds.Tables[0].Rows[0]["name"]);
                                Session["Img"] = Convert.ToString(ds.Tables[0].Rows[0]["img"]);
                                Session["Id"] = Convert.ToString(ds.Tables[0].Rows[0]["Id"]);
                                Session["Usertype"] = Convert.ToString(ds.Tables[0].Rows[0]["Usertype"]);
                                Response.Redirect("~/Pages/Dashboard.aspx");
                            }
                            else if (Convert.ToString(ds.Tables[0].Rows[0]["Usertype"]) == "3")
                            {
                                //Seller = 3

                                Session["Name"] = Convert.ToString(ds.Tables[0].Rows[0]["name"]);
                                Session["Img"] = Convert.ToString(ds.Tables[0].Rows[0]["img"]);
                                Session["Id"] = Convert.ToString(ds.Tables[0].Rows[0]["Id"]);
                                Session["Usertype"] = Convert.ToString(ds.Tables[0].Rows[0]["Usertype"]);
                                Response.Redirect("~/Pages/Dashboard.aspx");
                            }
                            else
                            {
                                msg ="Unknown User Type";
                                bgcolor = "bg-warning";
                            }
                        }
                        else
                        {
                            msg = "Something went wrong";
                            bgcolor = "bg-warning";
                        }
                    }
                    else if (ds.Tables.Count > 0)
                    {
                        if (!Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                        {
                            msg = Convert.ToString(ds.Tables[0].Rows[0]["msg"]);
                            bgcolor = "bg-warning";

                        }
                    }
                    else
                    {
                        msg = "Somthing went wrong";
                        bgcolor = "bg-warning";
                    }

                }
            }
        }
        else
        {
            msg = "Page is not Valid";
            bgcolor = "bg-warning";
        }

        alertmsg(msg, bgcolor);


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
        divAlert.InnerHtml = sb.ToString();

    }
}