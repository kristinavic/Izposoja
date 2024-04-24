<%@ Page Title="Moj profil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mojprofil.aspx.cs" Inherits="Izposoja.Mojprofil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
</script>
    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">

            <%-- leva polovica --%>
            <div class="col-md-5 ">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                     <img width="200px" src="Images/urejanje.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2 id="title"><%: Title %></h2>
                                    <label>Tukaj lahko spremeniš podatke ali geslo.</label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                            <asp:Label ID="spremembaObvestilo" runat="server" Font-Size="Medium" ForeColor="Green"></asp:Label> 
                        </div>
                            <div class="col">
                                <label>Uporabniško ime:</label> 
                                     <div class="form-group">
                                        <asp:TextBox ID="txtUpIme" runat="server" CssClass="form-control txtbox" placeholder="Uporabniško ime"></asp:TextBox>
                                     </div>

                                <label>Ime:</label> <br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtIme" runat="server" CssClass="form-control txtbox" placeholder="Ime"></asp:TextBox>
                                    </div>

                                <label>Priimek:</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPriimek" runat="server" CssClass="form-control txtbox" placeholder="Priimek"></asp:TextBox>

                                <label>Elektronski naslov:</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEnaslov" runat="server" CssClass="form-control txtbox" placeholder="Elektronski naslov"></asp:TextBox>
                                    </div>

                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-4">
                                <label>Uporabniško ime </label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUpIme2" runat="server" CssClass="form-control txtbox" placeholder="Uporabniško ime" ReadOnly="true" Enabled="false" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Staro geslo </label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtStaroGeslo" runat="server" CssClass="form-control txtbox" placeholder="Staro geslo" TextMode="Password" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Novo geslo </label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtNovoGeslo" runat="server" CssClass="form-control txtbox" placeholder="Novo geslo" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8 mx-auto"><center>
                                <div class="form-group">
                                    <asp:Button ID="btnSpremeni" runat="server" cssClass="btn-urejanje" width="250px" Text="Spremeni podatke" OnClick="btnSpremeni_Click"/></center>
                                </div>
                            </div>
                       </div>

                </div>
            </div>
            </div>

            <%-- desna polovica --%>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="200px" src="Images/bazaknjig2.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2>Moje izposojene knjige</h2>
                                    <label>Pregled knjig, ki so trenutno pri tebi.</label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <%-- gridview --%>
                        <div class="row">
                            <div class="col-md">
                                <asp:GridView class="table table-bordered" ID="GridViewMojeIzposojene" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
      </div>
    

</asp:Content>
