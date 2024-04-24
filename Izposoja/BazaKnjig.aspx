<%@ Page Title="Baza knjig" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BazaKnjig.aspx.cs" Inherits="Izposoja.BazaKnjig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
        <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>
    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    
                        <div class="card">
                            <div class="card-body">

                                    <center><img src="Images/bazaknjig2.jpg" width="250px"/>
                                     <h2>Baza knjig</h2></center>
                                 
                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSourceKnjige" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM Knjige"></asp:SqlDataSource>
                                    <div class="col">
                                    <asp:GridView class="table table-bordered table-responsive " ID="GridViewKnjige" runat="server" DataSourceID="SqlDataSourceKnjige" AutoGenerateColumns="False" DataKeyNames="KnjigaID">
                                    <Columns>
                                    <asp:BoundField DataField="KnjigaID" HeaderText="ID knjige" SortExpression="KnjigaID">
                                        <ControlStyle Font-Bold="True" />
                                        <ItemStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    
                              
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
                                                           &nbsp;| <span>Zvrst - <span>&nbsp;</span>
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
                                <div class="row">
                            <div class="col">
                                <p><a class="btn btn-default" href="Default.aspx">&laquo Na prvo stran</a></p>
                            </div>
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

    </asp:Content>