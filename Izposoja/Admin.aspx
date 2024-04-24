<%@ Page Title="Urejanje članov" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Izposoja.Admin" %>
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
        <center><h2>Urejanje uporabnikov</h2></center>
        <div class="row">

        <%-- leva polovica --%>
            <div class="col-md-4 mx-auto">

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
                                <center> <h2> Član </h2> 
                                <p>Izbriši ali dodaj uporabnika.</p> </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:Label ID="AdminUrejanjeObvestilo" runat="server" ForeColor="Green"></asp:Label>
                            <div class="col-md-6">
                                <label>Uporabniško ime:</label> 
                                     <div class="form-group">
                                        <asp:TextBox ID="txtUpIme" runat="server" CssClass="form-control" placeholder="Uporabniško ime" ></asp:TextBox>
                                    </div>
                             </div>
                            <div class="col-md-6">
                                <br /> 
                                <asp:Button ID="btnIzbrisiUporabnika" Cssclass="btn-urejanje" width="150px" runat="server" Text="Izbriši uporabnika" OnClick="btnIzbrisiUporabnika_Click" /> 
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Ime:</label> <br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtIme" runat="server" CssClass="form-control" placeholder="Ime"></asp:TextBox>
                                    </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Priimek:</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPriimek" runat="server" CssClass="form-control" placeholder="Priimek"></asp:TextBox>
                                    </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Elektronski naslov</label>&nbsp; <asp:RegularExpressionValidator ID="revEnaslov" runat="server" CssClass="validator"  ControlToValidate="txtEnaslov" ErrorMessage="Nepravilen e-naslov." ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEnaslov" runat="server" CssClass="form-control" placeholder="Elektronski naslov"></asp:TextBox>
                                    </div>
                         </div>

                           
                        <div class="row">
                            <div class="col-md-6">
                                <label>Geslo</label> 
                                <div class="form-group">
                                    <asp:TextBox ID="txtGeslo" runat="server" CssClass="form-control" TextMode="Password" placeholder="Geslo"></asp:TextBox>
                                </div>
                             </div>
                             <div class="col-md-6 mx-auto">
                                <br />
                                    <asp:Button ID="btnDodajUporabnika" CssClass="btn-urejanje" width="150px" runat="server" Text="Dodaj uporabnika" OnClick="btnDodajUporabnika_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>

        <%-- desna polovica - gridview  --%>
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM Uporabniki"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="UporIme">

                                    <Columns>
                              <asp:BoundField DataField="UporIme" HeaderText="Uporabnik" ReadOnly="True" SortExpression="UporIme" />
                              <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime" />
                              <asp:BoundField DataField="Priimek" HeaderText="Priimek" SortExpression="Priimek" />
                              <asp:BoundField DataField="eNaslov" HeaderText="E-naslov" SortExpression="eNaslov" />
                              <asp:BoundField DataField="Geslo" HeaderText="Geslo" SortExpression="Geslo"  />
                           </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div> 
    </div>

</asp:Content>
