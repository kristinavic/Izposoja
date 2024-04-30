<%@ Page Title="Borrow book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Izposoja.aspx.cs" Inherits="Izposoja._Izposoja" %>
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

        <%-- Borrow book --%>
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
                     <center> <h3>Borrow book</h3> </center>
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
                        <label>Username</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtUporIme" runat="server" placeholder="Username"></asp:TextBox>
                        </div>
                     </div>

                   <div class="col-md-6">
                          <label>Book ID</label>
                        <div class="form-group">
                            <div class="input-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtKnjigaID" runat="server" placeholder="Book ID"></asp:TextBox>
                            <asp:Button ID="btnIDKnjige" CssClass="btn-txtbx" runat="server" Text="Find" OnClick="btnIDKnjige_Click" />
                             </div>
                        </div>
                      </div>
                  </div>
 
                  <div class="row">
                     <div class="col-md-12">
                        <label>Book title</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtNaslov" runat="server" placeholder="Book title"></asp:TextBox>
                        </div>
                       </div>
                      </div>

                     <div class="row">
                       <div class="col-md-6">
                           <label>Name</label>
                            <div class="form-group">
                               <asp:TextBox CssClass="form-control txtbox" ID="txtIme" runat="server" placeholder="Name" ></asp:TextBox>
                            </div>
                        </div>
                         <div class="col-md-6">
                           <label>Surnam</label>
                            <div class="form-group">
                               <asp:TextBox CssClass="form-control txtbox" ID="txtPriimek" runat="server" placeholder="Surname" ></asp:TextBox>
                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="col-md-6">
                            <label>Date of chekout</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control txtbox" ID="txtDatumPosoje" runat="server" placeholder="Date" TextMode="Date" ></asp:TextBox>
                            </div>
                        </div>
                          <div class="col-md-6">
                             <br /> <asp:Button ID="btnIzposodi" runat="server" Text="Izposodi" OnClick="btnIzposodi_Click" CssClass="btn-urejanje" width="110px"/>
                        </div>
                    </div>

                   <div class="row">
                     <div class="col-md-12">
                        <br /><center><asp:Button ID="btnVrni" class="btn btn-lg  btn-brisi" runat="server" Text="Return book" OnClick="btnVrni_Click" CssClass="btn-urejanje" width="250px"/></center>
                     </div>
                   </div>
                </div>

                 </div>
           </div>

        <%-- List --%>
          <div class="col-md-8">
              <div class="card">
                <div class="card-body">
                    <div class="row">
                        <center> <img src="Images/bazaknjig.jpg" width="200px"/> </center>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                        <center> <h3>List of currently borrowed books</h3> </center>
                        </div>
                    </div>
                                
                    <div class="row">
                        <hr />
                    </div> 

                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSourceBorrowedBooks" ConnectionString="<%$ ConnectionStrings:dbcon %>"  runat="server" SelectCommand="SELECT * FROM Checkout" ></asp:SqlDataSource>
                      <div class="col">
                          <asp:GridView class="table table-striped table-bordered" ID="GridViewBorrowedBooks" runat="server" DataSourceID="SqlDataSourceBorrowedBooks" AutoGenerateColumns="False" CssClass="table">
                              <Columns>
								<asp:BoundField DataField="BookID" HeaderText="Book ID" SortExpression="BookID"></asp:BoundField>
								<asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
								<asp:BoundField DataField="Username" HeaderText="Currently at" SortExpression="Username"></asp:BoundField>
                                  <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                  <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname"></asp:BoundField>
                                  <asp:BoundField DataField="Checkout" HeaderText="Checkout date" SortExpression="Checkout"></asp:BoundField>
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
