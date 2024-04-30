using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Izposoja
{
    public partial class Mojprofil : System.Web.UI.Page           // My profile page
    {
        string strdbcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    spremembaObvestilo.Text = "Session expired, please login again.";
                    Response.Redirect("Prijava.aspx");
                }
                else
                {
                    MojeIzposojeneKnjige();

                    if (!Page.IsPostBack)
                    {
                        PoodatkiOprofilu();
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnSpremeni_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    spremembaObvestilo.Text = "Session expired, please login again.";
                    Response.Redirect("Prijava.aspx");
                }
                else
                {
                    SpremeniPodatkeProfila();  //change profile data
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void SpremeniPodatkeProfila() //change profile data
        {
            string password = string.Empty;

            if (txtNovoGeslo.Text.Trim() == "")  //if field for noew password is empty, I don't want to change password
            {
                password = txtStaroGeslo.Text;
            }
            else
            {
                password = txtNovoGeslo.Text.Trim();
            }


            try
            {
                SqlConnection con = new SqlConnection(strdbcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update Users set Username='" +txtUpIme.Text+ "',Name='" +txtIme.Text+ "',Surname='" +txtPriimek.Text+ "',email='" +txtEnaslov.Text+ "',Password='" +password+ "' WHERE Username='" + Session["username"].ToString()+ "'  ", con);
                //SqlCommand cmd = new SqlCommand("update Users set Username=@Username,Name=@Name,Surname=@Surname,email=@email,Password=@Password WHERE Username='" + Session["username"].ToString()+ "'  ", con);

                int rezultat = cmd.ExecuteNonQuery(); //returns effected rows and saves them in result 
                con.Close();

                if (rezultat > 0) //if effects at least 1 row
                {
                    spremembaObvestilo.Text = "Data successfully changed!";
                    PoodatkiOprofilu();  //Profile data
                    MojeIzposojeneKnjige(); // My borrowed books
                }
                else
                {
                    spremembaObvestilo.Text = "Wrong entry!";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void PoodatkiOprofilu()  //Profile data
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from Users where Username='" + Session["username"].ToString() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtUpIme.Text = dt.Rows[0]["Username"].ToString();
                txtIme.Text = dt.Rows[0]["Name"].ToString();
                txtPriimek.Text = dt.Rows[0]["Surname"].ToString();
                txtEnaslov.Text = dt.Rows[0]["email"].ToString();
                txtUpIme2.Text = dt.Rows[0]["Username"].ToString();

            }
            catch (Exception ex)
            {

            }

        }

        void MojeIzposojeneKnjige() // My borrowed books
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from Checkout where Username='" + Session["username"].ToString() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewMyBorrowed.DataSource = dt;
                GridViewMyBorrowed.DataBind();

            }
            catch (Exception ex)
            {
                
            }
        }
    }
}