using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Izposoja
{
    
    public partial class Admin : System.Web.UI.Page
    {
        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    Response.Redirect("Prijava.aspx");
                }
                else
                {
                    GridView1.DataBind();   //connects with database
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnIzbrisiUporabnika_Click(object sender, EventArgs e)  //btn for deleting user
        {
            if (UporabnikObstaja())   // user exists
            {
                IzbrisiUporabnika();  // delete user
                GridView1.DataBind();
            }
        }


        void IzbrisiUporabnika()        //delete user
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //connection

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from Users WHERE Username='" + txtUpIme.Text + "' ", con);

                cmd.ExecuteNonQuery();   //execution
                con.Close();

                AdminUrejanjeObvestilo.Text = "User " + txtUpIme.Text + " is deleted.";
            }
            catch (Exception ex)
            {
                AdminUrejanjeObvestilo.ForeColor = System.Drawing.Color.Red;
                AdminUrejanjeObvestilo.Text = "User cannot be deleted. Check if he returned books.";
            }
        }

        bool UporabnikObstaja()         //user exists
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //connection

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //fill datatable throug adapter with select command: 
                SqlCommand cmd = new SqlCommand("SELECT * from Users where Username='" + txtUpIme.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();     
                da.Fill(dt);

                if (dt.Rows.Count >= 1)  // if entry already exists
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        protected void btnDodajUporabnika_Click(object sender, EventArgs e)     // btn Add user
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);  //connection

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Users (Username,Name,Surname,email,PAssword) " +
                "VALUES ('" + txtUpIme.Text + "', '" + txtIme.Text + "', '" + txtPriimek.Text + "', '" + txtEnaslov.Text + "', '" + txtGeslo.Text + "' )", con);

                cmd.ExecuteNonQuery();   //execution
                con.Close();

                AdminUrejanjeObvestilo.Text = " <br/> User " + txtUpIme.Text + "successfully added!";
                Page_Load(sender, e);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}