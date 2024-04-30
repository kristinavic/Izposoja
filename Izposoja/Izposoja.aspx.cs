using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Izposoja
{
    public partial class _Izposoja : System.Web.UI.Page
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
                    GridViewBorrowedBooks.DataBind();
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnIDKnjige_Click(object sender, EventArgs e)
        {
            pridobiPodatke();
        }

        protected void btnIzposodi_Click(object sender, EventArgs e)    //checkout
        {
            if (knjigaObstaja() && ClanObstaja())        
            {
                if (izposojaObstaja())
                {
                    IzposojaObvestilo.Text = "User already has this book.";
                }
                else
                 izdajaKnjige();
            }
            else
                IzposojaObvestilo.Text = "Wrong data!";

        }

        protected void btnVrni_Click(object sender, EventArgs e) //return
        {
            if (knjigaObstaja() && ClanObstaja())
            {
                if (izposojaObstaja())
                {
                    vrniKnjigo();
                }
                else
                    IzposojaObvestilo.Text = "No entry!";
            }
            else
                IzposojaObvestilo.Text = "Wrong data!";

        }


        void vrniKnjigo() //return book
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Delete from Checkout WHERE BookID='" + txtKnjigaID.Text + "' AND Username='" + txtUporIme.Text + "'", con);
                int result = cmd.ExecuteNonQuery(); //save result of deleted rows 

                if (result > 0)
                {
                    IzposojaObvestilo.Text = "Book returned!";

                    GridViewBorrowedBooks.DataBind();
                    con.Close();
                }
                else
                {
                    IzposojaObvestilo.Text = "Error!";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void izdajaKnjige()   // borrow book
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Checkout (Username,Name,Surname,BookID,Title,Checkout) " +
                    "VALUES ('"+ txtUporIme.Text + "', '"+ txtIme.Text+"', '" + txtPriimek.Text+"', '"+ txtKnjigaID.Text+"', '"+ txtNaslov.Text+"', '" + txtDatumPosoje.Text+"')", con);

                cmd.ExecuteNonQuery();
                con.Close();

                IzposojaObvestilo.ForeColor = System.Drawing.Color.Green;
                IzposojaObvestilo.Text = "Book borrowed!";

                GridViewBorrowedBooks.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool knjigaObstaja()   //book exists
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from Books where BookID='" + txtKnjigaID.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1) 
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
                return false;
            }
        }


        bool ClanObstaja()  // user exists
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                /// - for Name
                SqlCommand cmd = new SqlCommand("select Name, Surname from Users where Username='" + txtUporIme.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
                return false;
            }
        }

        bool izposojaObstaja()  //checkout exists
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from Checkout where Username='" + txtUporIme.Text + "' and BookID='"+txtKnjigaID.Text+"'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
                return false;
            }
        }


        void pridobiPodatke() // get data
        {
            try
            {
                SqlConnection con = new SqlConnection(strdbcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // - for Title through BookID 
                SqlCommand cmd = new SqlCommand("select Title from Books where BookID='" + txtKnjigaID.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >=1) // if ID matches
                {
                    txtNaslov.Text = dt.Rows[0]["Title"].ToString(); //0-row, column Title
                }
                else
                {
                    IzposojaObvestilo.Text = "Wrong or missing book ID!";
                }


                // - for Name
                cmd = new SqlCommand("select Name, Surname from Users where Username='" + txtUporIme.Text + "' ", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1) // if ID matches
                {
                    txtIme.Text = dt.Rows[0]["Name"].ToString(); //0-row, column Name
                    txtPriimek.Text = dt.Rows[0]["Surname"].ToString(); //0-row, column Surname
                }
                else
                {
                    IzposojaObvestilo.Text = "Wrong or missing username!";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }
    }
}