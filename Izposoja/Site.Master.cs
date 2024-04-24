using IzposojaKnjig;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Izposoja
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["dostop"] != null)
                {
                    
                    if (Session["dostop"].Equals("admin"))  //pogled za admina
                    {
                        LinkButtonIzposoja.Visible = true;
                        LinkButtonPrijava.Visible = false;
                        LinkButtonRegistracija.Visible = false;

                        LinkButtonUrediClane.Visible = true;
                        LinkButtonDodajKnjigo.Visible = true;
                        LinkButtonMojprofil.Visible = true;
                        LinkButtonOdjava.Visible = true;

                    }
                    else 
                    if (Session["dostop"].Equals("user"))   //pogled za prijavljenega uporabnika
                    {
                        LinkButtonIzposoja.Visible = true;
                        LinkButtonPrijava.Visible = false;
                        LinkButtonRegistracija.Visible = false;

                        LinkButtonUrediClane.Visible = false;
                        LinkButtonDodajKnjigo.Visible = false;
                        LinkButtonMojprofil.Visible = true;                        
                        LinkButtonOdjava.Visible = true;
                    }
                    else      //pogled za neprijavljenega uporabnika
                    {
                        LinkButtonIzposoja.Visible = false;
                        LinkButtonPrijava.Visible = true;
                        LinkButtonRegistracija.Visible = true;

                        LinkButtonMojprofil.Visible = false;
                        LinkButtonUrediClane.Visible = false;
                        LinkButtonDodajKnjigo.Visible = false;
                        LinkButtonOdjava.Visible = false;
                    }
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
           


        protected void LinkButtonMojprofil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mojprofil.aspx");
        }


        protected void LinkButtonOdjava_Click1(object sender, EventArgs e)
        {
            Session["username"] = Session["dostop"] = String.Empty;
            Session.Abandon();

            LinkButtonPrijava.Visible = true;
            LinkButtonRegistracija.Visible = true;

            LinkButtonMojprofil.Visible = false;
            LinkButtonUrediClane.Visible = false;
            LinkButtonDodajKnjigo.Visible = false;
            LinkButtonOdjava.Visible = false;

            Response.Redirect("Default.aspx");
        }
    }
}