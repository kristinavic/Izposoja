<%@ Page Title="Edit books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajKnjigo.aspx.cs" Inherits="Izposoja.DodajKnjigo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });

         function readURL(input) {
             if (input.files && input.files[0]) {
                 var reader = new FileReader();

                 reader.onload = function (e) {
                     $('#imgview').attr('src', e.target.result);
                 };

                 reader.readAsDataURL(input.files[0]);
             }
         }

     </script>
    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <center> <h2 id="title"><%: Title %></h2> </center>
       <div class="container-fluid">
        <div class="row">

       <%-- left part --%>
            <div class="col-md-4">
                <div class="card">
                    
                  <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center> <img id="imgview" width="200px" src="Images/bazaknjig2.jpg" /> </center>
                        </div>
                     </div>

                  <div class="row">
                     <div class="col">
                     <center> <h2>Add book</h2>
                     <p>Change, edit or delete book.</p> </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">
                      <asp:Label ID="DodajKnjigoObvestilo" runat="server" Font-Size="Large" ForeColor="Green"></asp:Label>
                     <div class="col-md-6">
                        <label>Book ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control txtbox" ID="txtIDKnjige" runat="server" placeholder="Book ID" TabIndex="1"></asp:TextBox>
                              <asp:Button  CssClass="btn-txtbx" ID="btnNajdi" runat="server" Text="Find" OnClick="btnNajdiKnjigo_Click" TabIndex="1" />
                           </div>
                        </div>
                     </div>
                      <div class="col-md-6">
                        <label>Owner</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control txtbox" ID="txtLastnik" runat="server" placeholder="Book owner" TabIndex="2"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                   </div>

                  <div class="row">
                      <div class="col-md-12">
                        <label>Title</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtNaslov" runat="server" placeholder="Book title" TabIndex="3"></asp:TextBox>
                        </div>
                        </div>
                   </div>

                  <div class="row">
                    <label>Author</label>
                     <div class="form-group">
                         <asp:TextBox CssClass="form-control txtbox" ID="txtAvtor" runat="server" placeholder="Book author" TabIndex="4"></asp:TextBox>
                        </div>
                   </div>
                  <div class="row">
                     <div class="col-md-5">
                        <label>Publication year</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtLeto" runat="server" placeholder="1900" TabIndex="5" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-7">
                        <label>Genre</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListBoxZvrst" runat="server" SelectionMode="Multiple" Rows="3" TabIndex="6">
                              <asp:ListItem Text="Action" Value="Action" />
                              <asp:ListItem Text="Art" Value="Art" />         
                              <asp:ListItem Text="Biography" Value="Biography" />
                              <asp:ListItem Text="Crime" Value="Crime" />
                              <asp:ListItem Text="Drama" Value="Drama" />
                              <asp:ListItem Text="Fantasy" Value="Fantasy" />
                              <asp:ListItem Text="Health" Value="Health" />
                              <asp:ListItem Text="History" Value="History" />
                              <asp:ListItem Text="Horror" Value="Horror" />
                              <asp:ListItem Text="Novel" Value="Novel" />
                              <asp:ListItem Text="Personal growth" Value="Personal growth" />
                              <asp:ListItem Text="Poetry" Value="Poetry" />
                              <asp:ListItem Text="Romance" Value="Romance" />
                              <asp:ListItem Text="Sci-Fi" Value="Sci-Fi" />
                              <asp:ListItem Text="Science" Value="Science" />
                              <asp:ListItem Text="Thriller" Value="Thriller" />
                              <asp:ListItem Text="Travel" Value="Travel" />                      
                              <asp:ListItem Text="War" Value="War" />
                           </asp:ListBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-12">
                        <label>Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtOpis" runat="server" placeholder="Book description" TextMode="MultiLine" Rows="3" TabIndex="7"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <label>Picture</label>
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" TabIndex="8" />
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="btnDodaj" runat="server" Text="Add" OnClick="btnDodaj_Click" width="110px" CssClass="btn-urejanje" TabIndex="9" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnSpremeni" runat="server" Text="Change" OnClick="btnSpremeni_Click" width="110px" ForeColor="Black" CssClass="btn-urejanje" TabIndex="10" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnBrisi" runat="server" Text="Delete" OnClick="btnBrisi_Click" width="110px" CssClass="btn-urejanje" TabIndex="11" />
                     </div>
                  </div>

               </div>
             </div>

            </div>

           <%-- right part --%>
          <div class="col-md-8">
                <div class="card">
                    <div class="card-body">

                        
                          <%-- gridview - book inventory--%>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSourceBooks" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM Books"></asp:SqlDataSource>
                            <div class="col">
                            <asp:GridView class="table table-bordered" ID="GridViewBooks" runat="server" DataSourceID="SqlDataSourceBooks" AutoGenerateColumns="False" DataKeyNames="BookID">
                            <Columns>
                              <asp:BoundField DataField="BookID" HeaderText="Book ID" SortExpression="BookID" />
                              
                             <%-- gridview - design --%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">

                                          <%-- book info --%>
                                          <div class="col-lg-10">

                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Author - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Author") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Year published - </span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("PublicationYear") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      Genre -<span>&nbsp;</span>
                                                      <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Genre") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-12">
                                                   Owner -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Owner") %>'></asp:Label>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-12">
                                                   Description -
                                                   <asp:Label ID="Label12" runat="server" Font-Italic="True" Font-Size="Small" Text='<%# Eval("Description") %>'></asp:Label>
                                                </div>
                                             </div>
                                          </div>

                                           <%-- picture --%>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Picture") %>' />
                                          </div>
                                       </div>
                                    </div>
                                    </ItemTemplate>

                                </asp:TemplateField>
                              
                            
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
