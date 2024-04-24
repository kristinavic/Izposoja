<%@ Page Title="Urejanje knjig" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajKnjigo.aspx.cs" Inherits="Izposoja.DodajKnjigo" %>
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

       <%-- leva polovica --%>
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
                     <center> <h2>Dodaj knjigo</h2>
                     <p>Dodaj, spremeni ali izbriši knjigo.</p> </center>
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
                        <label>ID knjige</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control txtbox" ID="txtIDKnjige" runat="server" placeholder="ID knjige" TabIndex="1"></asp:TextBox>
                              <asp:Button  CssClass="btn-txtbx" ID="btnNajdi" runat="server" Text="Najdi" OnClick="btnNajdiKnjigo_Click" TabIndex="1" />
                           </div>
                        </div>
                     </div>
                      <div class="col-md-6">
                        <label>Lastnik</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control txtbox" ID="txtLastnik" runat="server" placeholder="Lastnik knjige" TabIndex="2"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                   </div>

                  <div class="row">
                      <div class="col-md-12">
                        <label>Naslov</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtNaslov" runat="server" placeholder="Naslov knjige" TabIndex="3"></asp:TextBox>
                        </div>
                        </div>
                   </div>

                  <div class="row">
                    <label>Avtor</label>
                     <div class="form-group">
                         <asp:TextBox CssClass="form-control txtbox" ID="txtAvtor" runat="server" placeholder="Avtor knjige" TabIndex="4"></asp:TextBox>
                        </div>
                   </div>
                  <div class="row">
                     <div class="col-md-5">
                        <label>Leto izdaje</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control txtbox" ID="txtLeto" runat="server" placeholder="1900" TabIndex="5" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-7">
                        <label>Zvrst</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListBoxZvrst" runat="server" SelectionMode="Multiple" Rows="3" TabIndex="6">
                              <asp:ListItem Text="Akcija" Value="Action" />
                              <asp:ListItem Text="Biografija" Value="Biografija" />
                              <asp:ListItem Text="Drama" Value="Drama" />
                              <asp:ListItem Text="Fantazija" Value="Fantazija" />
                              <asp:ListItem Text="Horor" Value="Horor" />
                              <asp:ListItem Text="Kriminalka" Value="Kriminalka" />
                              <asp:ListItem Text="Novela" Value="Novela" />
                              <asp:ListItem Text="Osebna rast" Value="Osebna rast" />
                              <asp:ListItem Text="Poezija" Value="Poezija" />
                              <asp:ListItem Text="Potovanja" Value="Potovanja" />
                              <asp:ListItem Text="Romanca" Value="Romanca" />
                              <asp:ListItem Text="Sci-Fi" Value="Sci-Fi" />
                              <asp:ListItem Text="Triler" Value="Triler" />
                              <asp:ListItem Text="Umetnost" Value="Umetnost" />                               
                              <asp:ListItem Text="Vojni" Value="Vojni" />
                              <asp:ListItem Text="Zdravje" Value="Zdravje" />
                              <asp:ListItem Text="Zgodovina" Value="Zgodovina" />
                              <asp:ListItem Text="Znanost" Value="Znanost" />
                           </asp:ListBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-12">
                        <label>Opis</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtOpis" runat="server" placeholder="Opis knjige" TextMode="MultiLine" Rows="3" TabIndex="7"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <label>Slika</label>
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" TabIndex="8" />
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="btnDodaj" runat="server" Text="Dodaj" OnClick="btnDodaj_Click" width="110px" CssClass="btn-urejanje" TabIndex="9" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnSpremeni" runat="server" Text="Spremeni" OnClick="btnSpremeni_Click" width="110px" ForeColor="Black" CssClass="btn-urejanje" TabIndex="10" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnBrisi" runat="server" Text="Izbriši" OnClick="btnBrisi_Click" width="110px" CssClass="btn-urejanje" TabIndex="11" />
                     </div>
                  </div>

               </div>
             </div>

            </div>

           <%-- desna polovica --%>
          <div class="col-md-8">
                <div class="card">
                    <div class="card-body">

                        
                          <%-- gridview - book inventory--%>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSourceKnjige" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM Knjige"></asp:SqlDataSource>
                            <div class="col">
                            <asp:GridView class="table table-bordered" ID="GridViewKnjige" runat="server" DataSourceID="SqlDataSourceKnjige" AutoGenerateColumns="False" DataKeyNames="KnjigaID">
                            <Columns>
                              <asp:BoundField DataField="KnjigaID" HeaderText="ID knjige" SortExpression="KnjigaID" />
                              
                             <%-- gridview - dizajn --%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">

                                          <%-- book info --%>
                                          <div class="col-lg-10">

                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("Naslov") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Avtor - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Avtor") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Leto izdaje - </span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("LetoIzdaje") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      Zvrst -<span>&nbsp;</span>
                                                      <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Zvrst") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-12">
                                                   Lastnik -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Lastnik") %>'></asp:Label>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-12">
                                                   Opis -
                                                   <asp:Label ID="Label12" runat="server" Font-Italic="True" Font-Size="Small" Text='<%# Eval("Opis") %>'></asp:Label>
                                                </div>
                                             </div>
                                          </div>

                                           <%-- slika --%>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Slika") %>' />
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
