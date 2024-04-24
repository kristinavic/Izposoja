<%@ Page Title="Registracija uporabnika" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registracija.aspx.cs" Inherits="Izposoja.Registracija" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="300px"src="Images/registracija.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2 id="title"><%: Title %></h2>
                                    <label>Prosim izpolni obrazec. Vsa polja so obvezna.</label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="registracijaObvestilo" runat="server" Font-Size="Medium" ForeColor="Green"></asp:Label> 
                                </div>

                                <label>Uporabniško ime:</label> <asp:RequiredFieldValidator ID="rfvUpIme" runat="server" CssClass="validator" ControlToValidate="txtUpIme" ErrorMessage="Obvezno polje" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <div class="form-group">
                                        <asp:TextBox ID="txtUpIme" runat="server" CssClass="form-control txtbox" placeholder="Uporabniško ime"></asp:TextBox>
                                     </div>

                                <label>Ime:</label> <asp:RequiredFieldValidator ID="rfvIme" runat="server" CssClass="validator" ControlToValidate="txtIme" ErrorMessage="Ovezno polje" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtIme" runat="server" CssClass="form-control txtbox" placeholder="Ime"></asp:TextBox>
                                    </div>

                                <label>Priimek:</label> <asp:RequiredFieldValidator ID="rfvPriimek" runat="server" CssClass="validator" ControlToValidate="txtPriimek" ErrorMessage="Obvezno polje" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPriimek" runat="server" CssClass="form-control txtbox" placeholder="Priimek"></asp:TextBox>
                                    </div>

                                <label>Elektronski naslov:</label><asp:RequiredFieldValidator ID="rfvEnaslov" runat="server" CssClass="validator" ControlToValidate="txtEnaslov" ErrorMessage="Obvezno polje" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEnaslov" runat="server" CssClass="validator"  ControlToValidate="txtEnaslov" ErrorMessage="Nepravilen e-naslov." ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                                  <div class="form-group">
                                        <asp:TextBox ID="txtEnaslov" runat="server" CssClass="form-control txtbox" placeholder="Elektronski naslov"></asp:TextBox>
                                        </div>

                                <label>Geslo:</label> <asp:RequiredFieldValidator ID="rfvGeslo" runat="server" CssClass="validator" ControlToValidate="txtGeslo" ErrorMessage="Obvezen vnos gesla" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtGeslo" runat="server" CssClass="form-control txtbox" TextMode="Password" placeholder="Geslo"></asp:TextBox>
                                 </div>

                                <div class="form-group">
                                    <center><asp:Button ID="btnRegistracija" Width="300px" runat="server" Text="Registracija" OnClick="btnRegistracija_Click" CssClass="btn" /></center>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
      </div> 

</asp:Content>
