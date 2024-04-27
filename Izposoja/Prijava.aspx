<%@ Page Title="User login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prijava.aspx.cs" Inherits="IzposojaKnjig.Prijava" %>
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
                                    <img width="250px" src="Images/user-login.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2 id="title"><%: Title %></h2>
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
                                    <br /><asp:Label ID="PrijavaObvestilo" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label> 

                                </div>
                              
                                <label>Username:</label> 
                                    <div class="form-group">
                                    <asp:TextBox ID="txtUpIme" runat="server" CssClass="form-control txtbox" placeholder="Username"></asp:TextBox>
                                </div>
                            
                                <label>Password:</label> 
                                <div class="form-group">
                                    <asp:TextBox ID="txtGesloPrijava" runat="server" CssClass="form-control txtbox" TextMode="Password" placeholder="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <center><asp:Button ID="btnPrijava" runat="server" cssClass="btn btn-dodaj" Text="Prijava" OnClick="btnPrijava_Click" Width="200px" /></center>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
      </div> 
    
</asp:Content>
