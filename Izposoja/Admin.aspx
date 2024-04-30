<%@ Page Title="Edit users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Izposoja.Admin" %>
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
        <center><h2>Edit users</h2></center>
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
                                <center> <h2> Member </h2> 
                                <p>Delete or add user.</p> </center>
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
                                <label>Username:</label> 
                                     <div class="form-group">
                                        <asp:TextBox ID="txtUpIme" runat="server" CssClass="form-control" placeholder="Username" ></asp:TextBox>
                                    </div>
                             </div>
                            <div class="col-md-6">
                                <br /> 
                                <asp:Button ID="btnIzbrisiUporabnika" Cssclass="btn-urejanje" width="150px" runat="server" Text="Delete user" OnClick="btnIzbrisiUporabnika_Click" /> 
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Name:</label> <br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtIme" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                    </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Surname:</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPriimek" runat="server" CssClass="form-control" placeholder="Surname"></asp:TextBox>
                                    </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>E-mail adress</label>&nbsp; <asp:RegularExpressionValidator ID="revEnaslov" runat="server" CssClass="validator"  ControlToValidate="txtEnaslov" ErrorMessage="Wrong e-mail." ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEnaslov" runat="server" CssClass="form-control" placeholder="E-mail adress"></asp:TextBox>
                                    </div>
                         </div>

                           
                        <div class="row">
                            <div class="col-md-6">
                                <label>Password</label> 
                                <div class="form-group">
                                    <asp:TextBox ID="txtGeslo" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                </div>
                             </div>
                             <div class="col-md-6 mx-auto">
                                <br />
                                    <asp:Button ID="btnDodajUporabnika" CssClass="btn-urejanje" width="150px" runat="server" Text="Add user" OnClick="btnDodajUporabnika_Click" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcon %>" SelectCommand="SELECT * FROM Users"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Username">

                                    <Columns>
                              <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                              <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                              <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                              <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                              <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"  />
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
