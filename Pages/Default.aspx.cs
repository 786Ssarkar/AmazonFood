using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.Drawing;
using System.IO;


public partial class Pages_Default : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        // baindChart();
        ddlBind();

    }


    public void ConvertToQR()
    {
        QRCodeGenerator QrGenerator = new QRCodeGenerator();  //  created obj of QRCodeGenerator 
        QRCodeData qrdata = QrGenerator.CreateQrCode(txtTextToConert.Text, QRCodeGenerator.ECCLevel.H);  // CreateQrCode function returns QRCodeData to 
        QRCode Qr = new QRCode(qrdata);                         //  goted QRCode by its data (qrdata) 
        Bitmap qrCodeImage = Qr.GetGraphic(20);                 //  created Bitmap of this QRCode Qr
        using (MemoryStream stream = new MemoryStream())
        {
            qrCodeImage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);   //saved qrcode  in a mamory stream  
            byte[] byteImage = stream.ToArray();                                //got all bytes as array from stream
            string base64Image = Convert.ToBase64String(byteImage);             //Converted to base64 string 
            // Display the QR code in the image control
            img.ImageUrl = "data:image/png;base64," + base64Image;
            img.Visible = true;
        }
    }

    //public void baindChart()
    //{
    //    DataSet ds = new DataSet();
    //    using (SqlDataAdapter adpt = new SqlDataAdapter("select count(tbl.UserId) counts, usertype.UserTypeName types from Mst_tblUserRegistraion tbl join Mst_tblUserType usertype on usertype.UserTypeId=tbl.UserTypeId group by usertype.UserTypeName", Connstr))
    //    {
    //        adpt.Fill(ds);
    //    }

    //    StringBuilder Sb = new StringBuilder();
    //    Sb.Append("<script>");
    //    Sb.Append("(function (H) {");
    //    Sb.Append("H.seriesTypes.pie.prototype.animate = function (init) {");
    //    Sb.Append("const series = this,");
    //    Sb.Append("chart = series.chart,");
    //    Sb.Append("points = series.points,");
    //    Sb.Append("{");
    //    Sb.Append("animation");
    //    Sb.Append("} = series.options,");
    //    Sb.Append("{");
    //    Sb.Append("startAngleRad");
    //    Sb.Append("} = series;");
    //    Sb.Append("function fanAnimate(point, startAngleRad) {");
    //    Sb.Append("const graphic = point.graphic,");
    //    Sb.Append("args = point.shapeArgs;");
    //    Sb.Append("if (graphic && args) {");
    //    Sb.Append("graphic");
    //    Sb.Append(".attr({");
    //    Sb.Append("start: startAngleRad,");
    //    Sb.Append("end: startAngleRad,");
    //    Sb.Append("opacity: 1                                                          ");
    //    Sb.Append("})                                                                  ");
    //    Sb.Append(".animate({                                                          ");
    //    Sb.Append("start: args.start,                                                  ");
    //    Sb.Append("end: args.end                                                       ");
    //    Sb.Append("}, {                                                                ");
    //    Sb.Append("duration: animation.duration / points.length                        ");
    //    Sb.Append("}, function () {                                                    ");
    //    Sb.Append("if (points[point.index + 1]) {                                      ");
    //    Sb.Append("fanAnimate(points[point.index + 1], args.end);                      ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("if (point.index === series.points.length - 1) {                     ");
    //    Sb.Append("series.dataLabelsGroup.animate({                                    ");
    //    Sb.Append("opacity: 1                                                          ");
    //    Sb.Append("},                                                                  ");
    //    Sb.Append("void 0,                                                             ");
    //    Sb.Append("function () {                                                       ");
    //    Sb.Append("points.forEach(point => {                                           ");
    //    Sb.Append("point.opacity = 1;                                                  ");
    //    Sb.Append("});                                                                 ");
    //    Sb.Append("series.update({                                                     ");
    //    Sb.Append("enableMouseTracking: true                                           ");
    //    Sb.Append("}, false);                                                          ");
    //    Sb.Append("chart.update({                                                      ");
    //    Sb.Append("plotOptions: {                                                      ");
    //    Sb.Append("pie: {                                                              ");
    //    Sb.Append("innerSize: '40%',                                                   ");
    //    Sb.Append("borderRadius: 8                                                     ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("});                                                                 ");
    //    Sb.Append("});                                                                 ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("});                                                                 ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("if (init) {                                                         ");
    //    Sb.Append("points.forEach(point => {                                           ");
    //    Sb.Append("point.opacity = 0;");
    //    Sb.Append("});");
    //    Sb.Append("} else {");
    //    Sb.Append("fanAnimate(points[0], startAngleRad);");
    //    Sb.Append("}");
    //    Sb.Append("};");
    //    Sb.Append("}(Highcharts));");
    //    Sb.Append("Highcharts.chart('container', {");
    //    Sb.Append("chart: {");
    //    Sb.Append("type: 'pie'");
    //    Sb.Append("},");
    //    Sb.Append("title: {");
    //    Sb.Append("text: 'Departamental Strength of the Company',                      ");
    //    Sb.Append("align: 'left'                                                       ");
    //    Sb.Append("},                                                                  ");
    //    Sb.Append("subtitle: {                                                         ");
    //    Sb.Append("text: 'Custom animation of pie series',                             ");
    //    Sb.Append("align: 'left'                                                       ");
    //    Sb.Append("},                                                                  ");
    //    Sb.Append("tooltip: {                                                          ");
    //    Sb.Append("pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'        ");
    //    Sb.Append("},                                                                  ");
    //    Sb.Append("accessibility: {                                                    ");
    //    Sb.Append("point: {                                                            ");
    //    Sb.Append("valueSuffix: '%'                                                    ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("},                                                                  ");
    //    Sb.Append("plotOptions: {                                                      ");
    //    Sb.Append("pie: {                                                              ");
    //    Sb.Append("allowPointSelect: true,                                             ");
    //    Sb.Append("borderWidth: 2,                                                     ");
    //    Sb.Append("cursor: 'pointer',                                                  ");
    //    Sb.Append("dataLabels: {                                                       ");
    //    Sb.Append("enabled: true,                                                      ");
    //    Sb.Append("format: '<b>{point.name}</b><br>{point.percentage}%',               ");
    //    Sb.Append("distance: 20                                                        ");
    //    Sb.Append("}                                                                   ");
    //    Sb.Append("}");
    //    Sb.Append("},");
    //    Sb.Append("series: [{");
    //    Sb.Append("enableMouseTracking: false,");
    //    Sb.Append("animation: {");
    //    Sb.Append("duration: 2000");
    //    Sb.Append("},");
    //    Sb.Append("colorByPoint: true,");
    //    Sb.Append("data: [");
    //    {


    //        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //        {
    //            Sb.Append("{");

    //            Sb.Append("name: '" + ds.Tables[0].Rows[i]["types"] + "',");
    //            Sb.Append("y: " + ds.Tables[0].Rows[i]["counts"] + "");
    //            Sb.Append("},");

    //        }
    //        Sb.Length--;
    //        Sb.Append("]");
    //        Sb.Append("}]");
    //        Sb.Append("});");
    //        Sb.Append("</script>");


    //        divsrc.InnerHtml = Sb.ToString();

    //    }
    //}

    protected void btnGenrate_Click(object sender, EventArgs e)
    {
        ConvertToQR();
    }
    protected void ddlBind()
    {
        using (SqlDataAdapter adpt = new SqlDataAdapter("USP_GetLast2SessionYears", "Data Source=.;Initial Catalog=db_stdm;Integrated Security=True"))
        {
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;
            //adpt.SelectCommand.Parameters.AddWithValue("@currentyear", DateTime.Now.ToString("yyyy"));
            DataSet ds = new DataSet();
            adpt.Fill(ds);

            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlSession.DataSource = ds.Tables[0];
                    ddlSession.DataTextField = "Years";
                    ddlSession.DataValueField = "Years";
                    ddlSession.DataBind();
                    ddlSession.Items.Insert(0, new ListItem("--Select--", "0"));

                }
            }
        }
    }
}