<%@ Page Title="Izposoja" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Izposoja.aspx.cs" Inherits="Izposoja._Izposoja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>
    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <main aria-labelledby="title">
        
       <div class="container-fluid">
        <div class="row">

        <%-- Izposoja --%>
            <div class="col-md-4">
                <div class="card">
                  <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center><img width="200px" src="Images/user-login.jpg" /></center>
                        </div>
                     </div>

                  <div class="row">
                     <div class="col">
                     <center> <h3>Izposoja</h3> </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">
                      <div class="form-group">
                          <br /><asp:Label ID="IzposojaObvestilo" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>      
                      </div>
                      
                    <div class="col-md-6">
                        <label>ID uporabnika</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtUporIme" runat="server" placeholder="Uporabnik"></asp:TextBox>
                        </div>
                     </div>

                   <div class="col-md-6">
                          <label>ID knjige</label>
                        <div class="form-group">
                            <div class="input-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtKnjigaID" runat="server" placeholder="ID knjige"></asp:TextBox>
                            <asp:Button ID="btnIDKnjige" CssClass="btn-txtbx" runat="server" Text="Najdi" OnClick="btnIDKnjige_Click" />
                             </div>
                        </div>
                      </div>
                  </div>
 
                  <div class="row">
                     <div class="col-md-12">
                        <label>Naslov knjige</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtNaslov" runat="server" placeholder="Naslov knjige"></asp:TextBox>
                        </div>
                       </div>
                      </div>

                     <div class="row">
                       <div class="col-md-6">
                           <label>Ime</label>
                            <div class="form-group">
                               <asp:TextBox CssClass="form-control txtbox" ID="txtIme" runat="server" placeholder="Ime" ></asp:TextBox>
                            </div>
                        </div>
                         <div class="col-md-6">
                           <label>Priimek</label>
                            <div class="form-group">
                               <asp:TextBox CssClass="form-control txtbox" ID="txtPriimek" runat="server" placeholder="Priimek" ></asp:TextBox>
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="col-md-6">
                            <label>Datum izposoje</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control txtbox" ID="txtDatumPosoje" runat="server" placeholder="Datum" TextMode="Date" ></asp:TextBox>
                            </div>
                        </div>
                          <div class="col-md-6">
                             <br /> <asp:Button ID="btnIzposodi" runat="server" Text="Izposodi" OnClick="btnIzposodi_Click" CssClass="btn-urejanje" width="110px"/>
                        </div>
                    </div>

                   <div class="row">
                     <div class="col-md-12">
                        <br /><center><asp:Button ID="btnVrni" class="btn btn-lg  btn-brisi" runat="server" Text="Vrni knjigo" OnClick="btnVrni_Click" CssClass="btn-urejanje" width="250px"/></center>
                     </div>
                   </div>
                </div>

                 </div>
           </div>

        <%-- Seznam --%>
          <div class="col-md-8">
              <div class="card">
                <div class="card-body">
                    <div class="row">
                        <center> <img src="Images/bazaknjig.jpg" width="200px"/> </center>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                        <center> <h3>Seznam izposojenih knjig</h3> </center>
                        </div>
                    </div>
                                
                    <div class="row">
                        <hr />
                    </div> 

                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSourceIzposojeneKnjige" ConnectionString="<%$ ConnectionStrings:dbcon %>"  runat="server" SelectCommand="SELECT * FROM EvidencaPosoje" ></asp:SqlDataSource>
                      <div class="col">
                          <asp:GridView class="table table-striped table-bordered" ID="GridViewIzposojeneKnjige" runat="server" DataSourceID="SqlDataSourceIzposojeneKnjige" AutoGenerateColumns="False" CssClass="table">
                              <Columns>
								<asp:BoundField DataField="KnjigaID" HeaderText="ID knjige" SortExpression="KnjigaID"></asp:BoundField>
								<asp:BoundField DataField="Naslov" HeaderText="Naslov" SortExpression="Naslov"></asp:BoundField>
								<asp:BoundField DataField="UporIme" HeaderText="Trenutno pri" SortExpression="UporIme"></asp:BoundField>
                                  <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime"></asp:BoundField>
                                  <asp:BoundField DataField="Priimek" HeaderText="Priimek" SortExpression="Priimek"></asp:BoundField>
                                  <asp:BoundField DataField="DatumIzposoje" HeaderText="Datum Izposoje" SortExpression="DatumIzposoje"></asp:BoundField>
                              </Columns>
                        </asp:GridView>
                     </div>
                     </div>
                 </div>
               </div>
          </div>

        </div>
     </div>
</main>
</asp:Content>
