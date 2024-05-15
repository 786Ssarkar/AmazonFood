using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Pages_Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Bind cart items
            Binditems();
        }
    }

    protected void Binditems()
    {
      DataTable dt = new DataTable();
        dt.Columns.Add("ItemName");
        dt.Columns.Add("ItemPrice");
        dt.Rows.Add("Daal", 50);
        dt.Rows.Add("panir", 150);



        rpt.DataSource = dt;
        rpt.DataBind();

            
    }

    protected void btnDecrease_Click(object sender, EventArgs e)
    {
        {
            //// Decrease quantity
            //Button btnDecrease = (Button)sender;
            //GridViewRow row = (GridViewRow)btnDecrease.NamingContainer;
            //int rowIndex = row.RowIndex;
            //List<CartItem> cartItems = Session["Cart"] as List<CartItem>;
            //cartItems[rowIndex].Quantity--;
            //if (cartItems[rowIndex].Quantity <= 0)
            //{
            //    cartItems.RemoveAt(rowIndex);
            //}
            //Session["Cart"] = cartItems;
            //BindCartItems();
        }

    }

    protected void btnIncrease_Click(object sender, EventArgs e)
    {

        //// Increase quantity
        //Button btnIncrease = (Button)sender;
        //GridViewRow row = (GridViewRow)btnIncrease.NamingContainer;
        //int rowIndex = row.RowIndex;
        //List<CartItem> cartItems = Session["Cart"] as List<CartItem>;
        //cartItems[rowIndex].Quantity++;
        //Session["Cart"] = cartItems;
        //BindCartItems();
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        // Remove item
        //Button btnRemove = (Button)sender;
        //GridViewRow row = (GridViewRow)btnRemove.NamingContainer;
        //int rowIndex = row.RowIndex;
        //List<CartItem> cartItems = Session["Cart"] as List<CartItem>;
        //cartItems.RemoveAt(rowIndex);
        //Session["Cart"] = cartItems;
        //BindCartItems();
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {

        // Implement checkout functionality
        // Redirect to checkout page or handle payment process
    }
}