using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Reflection.Emit;
using System.Net;
using System.Reflection;
using System.Activities.Statements;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Diagnostics;
using System.IO;
using static System.Net.Mime.MediaTypeNames;
using System.Net.Mail;

public partial class Pages_Buyer_BuyerRegistration : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    //string FileName ;


    protected void Page_Load(object sender, EventArgs e)
    {
        divAlert.InnerHtml="";
        if (!IsPostBack)
        {
            FillDDl(ddlDivision, "Division");
            FillDDl(ddlDistrict, "District");
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
    public string saveImg(string filename)
    {
        string oldpath = Server.MapPath("~/assets/images/TempImg/");
        string newpath = Server.MapPath("~/assets/images/UploadedImg/");
        if (File.Exists(oldpath + filename))
        {
            File.Move(oldpath + filename, newpath + filename);
            return filename;
        }
        else
        {
            ProfileUpload.SaveAs(newpath + filename);
            return filename;
        }
    }
    public void deleteImg(string filename)
    {
        string oldpath = Server.MapPath("~/assets/images/TempImg/");
        if (!File.Exists(oldpath + filename))
        {
            File.Delete(oldpath + filename);

        }
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        string msg, bgcolor;
        if (Page.IsValid)
        {

            using (SqlDataAdapter adpt = new SqlDataAdapter("UspMst_UserReg", Connstr))
            {
                adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
                adpt.SelectCommand.Parameters.Clear();
                adpt.SelectCommand.Parameters.AddRange(new[] {
                new SqlParameter("@UserTypeId",2),
                new SqlParameter("@UserName",txtName.Text.Trim() ),
                new SqlParameter("@DivisionId",ddlDivision.SelectedValue ),
                new SqlParameter("@DistrictId",ddlDistrict.SelectedValue ),
                new SqlParameter("@Email",txtEmail.Text.Trim() ),
                new SqlParameter("@Password",HashPassword(txtPassword.Text)),
                new SqlParameter("@Mobile", txtMobile.Text.Trim()),
                new SqlParameter("@Gender",ddlGender.SelectedValue ),
                new SqlParameter("@Address",txtAddress.Text.Trim() ),
                new SqlParameter("@CreatedByIp", Request.UserHostAddress),
                new SqlParameter("@UserImage", saveImg(Path.GetFileName(imgPreview.Src))),
            });
                using (DataSet ds = new DataSet())
                {
                    adpt.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                            {
                                msg = Convert.ToString(ds.Tables[0].Rows[0]["msg"]);
                                bgcolor = "bg-success";
                                
                                string MailBody = "Hello <b>" + txtName.Text.Trim() + "</b>,<br/>&nbsp; You have successfully registered  in Amazon Food as a Buyer. Now You Can purchase  food items form  <a href='"+HttpContext.Current.Request.Url.AbsoluteUri+ "'>this site</a>" + "<br/> <br/>   Username :" + txtMobile.Text.Trim() + " <br/> PassWord :" + txtPassword.Text;
                                try
                                {

                                    SendMail(txtEmail.Text.Trim(), msg, MailBody);
                                    btnClear_Click(sender, e);
                                }
                                catch (Exception ex)
                                {
                                    alertmsg("<b>!Error </b> <br/>" + ex.Message.ToString(), "bg-danger");
                                }
                            }
                            else
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
       
        if (!string.IsNullOrEmpty(Path.GetFileName(imgPreview.Src)))
        {
            deleteImg(Path.GetFileName(imgPreview.Src));
            imgPreview.Src = "/assets/images/User_Avatar.png";
        }

    }
    public void SendMail(string to, string sub, string body)
    {
        string from, pass;
        from = "Sagarsarkar4156@gmail.com";
        pass = "snqt uhqn hbwr qndx";

        using (MailMessage mailMsg = new MailMessage(from, to, sub, body))
        {
            mailMsg.IsBodyHtml = true;
            // mailMsg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            NetworkCredential credential = new NetworkCredential(from, pass);
            using (SmtpClient client = new SmtpClient("smtp.gmail.com", 587))
            {
                client.EnableSsl = true;
                client.Credentials = credential;
                client.Send(mailMsg);
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
    public static string HashPassword(string password)
    {
        SHA512 sha512 = SHA512Managed.Create();
        return Convert.ToBase64String(sha512.ComputeHash(System.Text.Encoding.Default.GetBytes(password)));
    }

    //RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();
    //UnicodeEncoding _encoder = new UnicodeEncoding();
    //private string Encrypt(string data)
    //{
    //    string _publicKey = @"<RSAKeyValue><Modulus>oVWagmbxPKSYBbW7PG09+Yj3QKEEKWX2UBH0/heOsvzgSDq6snrAXHgDOmsqUfpWp6OKSw2ruzzErnRvL9MIi6NrLV1+5uzkU3AU8XUeAZZBhh1Hdi+qgPeGoMJSodkrLo8FNXZhoOzSxa3aB1odhXBMbeN6CAYTnKNmPNtZqr0=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";
    //    rsa.FromXmlString(_publicKey);
    //    var dataToEncrypt = _encoder.GetBytes(data);
    //    var encryptedByteArray = rsa.Encrypt(dataToEncrypt, false).ToArray();
    //    var length = encryptedByteArray.Count();
    //    var item = 0;
    //    var sb = new StringBuilder();
    //    foreach (var x in encryptedByteArray)
    //    {
    //        item++;
    //        sb.Append(x);

    //        if (item < length)
    //            sb.Append(",");
    //    }
    //    return sb.ToString();
    //}


    protected void btnClear_Click(object sender, EventArgs e)
    {

        ProfileUpload.PostedFile.InputStream.Dispose();
        txtAddress.Text = "";
        ddlGender.ClearSelection();
        txtMobile.Text = "";
        txtPassword.Text = "";
        txtEmail.Text = "";
        ddlDistrict.ClearSelection();
        txtName.Text = "";
        ddlDivision.ClearSelection();
        //Response.Redirect("BuyerRegistration.aspx");
    }

    protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDDl(ddlDistrict, "District", ddlDivision.SelectedValue);
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (ProfileUpload.HasFile)
        {
            string path = Server.MapPath("~/assets/images/TempImg/");
            ProfileUpload.SaveAs(path + ProfileUpload.FileName);
            imgPreview.Src = ("/assets/images/TempImg/" + ProfileUpload.FileName);
        }
    }
}