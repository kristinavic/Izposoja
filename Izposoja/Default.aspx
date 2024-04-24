<%@ Page Title="Začetna stran" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Izposoja._Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
    </asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
   <main aria-labelledby="aspnetTitle">
      <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center> <h2 id="aspnetTitle">Posodim ti knjigo</h2>
                    <p>Stran namenjena (iz)posoji knjig med prijatelji, brez stroškov in s priporočili ter ocenami knjig iz prve roke.</p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 card card-default" aria-labelledby="OstraniTitle">
                    <center>
                        <img src="Images/info.png" height="130px" /></center>
                    <h2 id="OstraniTitle">O strani</h2>
                    <p>Posoja knjig med ljudmi, ki jih poznaš.</p>
                    <p><a class="btn btn-default" href="Ostrani.aspx">Več &raquo;</a></p>
                </div>
                <div class="col-md-4 card card-default" aria-labelledby="KakoDelujeTitle">
                    <center> <img src="Images/kakodeluje.jpg" height="130px"  /></center>
                    <h2 id="KakoDelujeTitle">Kako deluje</h2>
                    <p>S prijavo se pridružiš prijateljem v omrežju in lahko začneš z izposojo knjig.</p>
                    <p><asp:LinkButton class="btn btn-default" ID="LinkButtonPrijavaDef" runat="server" Visible="True" href="Prijava.aspx" >Prijava &raquo;</asp:LinkButton></p>
                </div>
                <div class="col-md-4 card card-default" aria-labelledby="BazaKnjigTitle">
                    <center><img src="Images/bazaknjig.jpg" height="130px" /></center>
                    <h2 id="BazaKnjigTitle">Baza knjig</h2>
                    <p>Pregled knjig, ki so trenutno na voljo.</p>
                    <p><asp:LinkButton class="btn btn-default" ID="LinkButtonBaza" runat="server" Visible="True" href="BazaKnjig.aspx" >Prebrskaj bazo  &raquo;</asp:LinkButton></p>
                </div>
              </div>
        </div>  
        </section>
   </main>

</asp:Content>
