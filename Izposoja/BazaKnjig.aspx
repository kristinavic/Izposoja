<%@ Page Title="Book database" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BazaKnjig.aspx.cs" Inherits="Izposoja.BazaKnjig" %>
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
                                     <h2>Book database</h2></center>
                                 
                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSourceBooks" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM Books"></asp:SqlDataSource>
                                    <div class="col">
                                    <asp:GridView class="table table-bordered table-responsive " ID="GridViewBooks" runat="server" DataSourceID="SqlDataSourceBooks" AutoGenerateColumns="False" DataKeyNames="BookID">
                                    <Columns>
                                    <asp:BoundField DataField="BookID" HeaderText="ID knjige" SortExpression="BookID">
                                        <ControlStyle Font-Bold="True" />
                                        <ItemStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    
                              
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
                                                           &nbsp;| <span>Genre - <span>&nbsp;</span>
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
                                <div class="row">
                            <div class="col">
                                <p><a class="btn btn-default" href="Default.aspx">&laquo Home </a></p>
                            </div>
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

    </asp:Content>