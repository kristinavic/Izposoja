<%@ Page Title="User registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registracija.aspx.cs" Inherits="Izposoja.Registracija" %>
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
                                    <label>Please fill the form, all fields are mandatory.</label>
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

                                <label>Username:</label> <asp:RequiredFieldValidator ID="rfvUpIme" runat="server" CssClass="validator" ControlToValidate="txtUpIme" ErrorMessage="Mandatory field" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <div class="form-group">
                                        <asp:TextBox ID="txtUpIme" runat="server" CssClass="form-control txtbox" placeholder="Username"></asp:TextBox>
                                     </div>

                                <label>Name:</label> <asp:RequiredFieldValidator ID="rfvIme" runat="server" CssClass="validator" ControlToValidate="txtIme" ErrorMessage="Mandatory field" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtIme" runat="server" CssClass="form-control txtbox" placeholder=Name></asp:TextBox>
                                    </div>

                                <label>Surname:</label> <asp:RequiredFieldValidator ID="rfvPriimek" runat="server" CssClass="validator" ControlToValidate="txtPriimek" ErrorMessage="Mandatory field" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPriimek" runat="server" CssClass="form-control txtbox" placeholder="Surname"></asp:TextBox>
                                    </div>

                                <label>E-mail address:</label><asp:RequiredFieldValidator ID="rfvEnaslov" runat="server" CssClass="validator" ControlToValidate="txtEnaslov" ErrorMessage="Mandatory field" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEnaslov" runat="server" CssClass="validator"  ControlToValidate="txtEnaslov" ErrorMessage="Wrong e-mail." ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                                  <div class="form-group">
                                        <asp:TextBox ID="txtEnaslov" runat="server" CssClass="form-control txtbox" placeholder="E-mail"></asp:TextBox>
                                        </div>

                                <label>Password:</label> <asp:RequiredFieldValidator ID="rfvGeslo" runat="server" CssClass="validator" ControlToValidate="txtGeslo" ErrorMessage="Password entry is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtGeslo" runat="server" CssClass="form-control txtbox" TextMode="Password" placeholder="Password"></asp:TextBox>
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
