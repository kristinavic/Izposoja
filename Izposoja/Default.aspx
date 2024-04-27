<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Izposoja._Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
    </asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
   <main aria-labelledby="aspnetTitle">
      <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center> <h2 id="aspnetTitle">Let me borrow you a book</h2>
                    <p>Page for borrowing books between small group of trusted friends, no fees, but with friend's recomendations and first hand book reviews.</p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 card card-default" aria-labelledby="OstraniTitle">
                    <center>
                        <img src="Images/info.png" height="130px" /></center>
                    <h2 id="OstraniTitle">About</h2>
                    <p>Borrowing books between people you know.</p><br />
                    <p><a class="btn btn-default" href="Ostrani.aspx">More &raquo;</a></p>
                </div>
                <div class="col-md-4 card card-default" aria-labelledby="KakoDelujeTitle">
                    <center> <img src="Images/kakodeluje.jpg" height="130px"  /></center>
                    <h2 id="KakoDelujeTitle">How does it work</h2>
                    <p>With login you  join your friends in networks and can instantly begin with book exchange.</p>
                    <p><asp:LinkButton class="btn btn-default" ID="LinkButtonPrijavaDef" runat="server" Visible="True" href="Prijava.aspx" >Log in &raquo;</asp:LinkButton></p>
                </div>
                <div class="col-md-4 card card-default" aria-labelledby="BazaKnjigTitle">
                    <center><img src="Images/bazaknjig.jpg" height="130px" /></center>
                    <h2 id="BazaKnjigTitle">Book database</h2>
                    <p>Currently available books</p><br />
                    <p><asp:LinkButton class="btn btn-default" ID="LinkButtonBaza" runat="server" Visible="True" href="BazaKnjig.aspx" >Browse books  &raquo;</asp:LinkButton></p>
                </div>
              </div>
        </div>  
        </section>
   </main>

</asp:Content>
