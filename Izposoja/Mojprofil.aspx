<%@ Page Title="My profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mojprofil.aspx.cs" Inherits="Izposoja.Mojprofil" %>
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

            <%-- left half --%>
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
                                    <label>Here you can change your data or password.</label>
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
                                <label>Username:</label> 
                                     <div class="form-group">
                                        <asp:TextBox ID="txtUpIme" runat="server" CssClass="form-control txtbox" placeholder="Username"></asp:TextBox>
                                     </div>

                                <label>Name:</label> <br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtIme" runat="server" CssClass="form-control txtbox" placeholder=Name></asp:TextBox>
                                    </div>

                                <label>Surname:</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPriimek" runat="server" CssClass="form-control txtbox" placeholder="Surname"></asp:TextBox>

                                <label>E-mail adress:</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEnaslov" runat="server" CssClass="form-control txtbox" placeholder="E-mail"></asp:TextBox>
                                    </div>

                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-4">
                                <label>Username </label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUpIme2" runat="server" CssClass="form-control txtbox" placeholder="Username" ReadOnly="true" Enabled="false" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old password </label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtStaroGeslo" runat="server" CssClass="form-control txtbox" placeholder="Old password" TextMode="Password" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>New password </label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtNovoGeslo" runat="server" CssClass="form-control txtbox" placeholder="New password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8 mx-auto"><center>
                                <div class="form-group">
                                    <asp:Button ID="btnSpremeni" runat="server" cssClass="btn-urejanje" width="250px" Text="Change data" OnClick="btnSpremeni_Click"/></center>
                                </div>
                            </div>
                       </div>

                </div>
            </div>
            </div>

            <%-- right half --%>
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
                                    <h2>My borrowed books</h2>
                                    <label>Borrwed books you currently own.</label>
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
                                <asp:GridView class="table table-bordered" ID="GridViewMyBorrowed" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
      </div>
    

</asp:Content>
