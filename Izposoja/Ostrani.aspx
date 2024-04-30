<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ostrani.aspx.cs" Inherits="IzposojaKnjig.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stili.css" rel="stylesheet" type="text/css" />
    
    </asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
       
        <div class="container">
            <div class="col-5 mx-auto card">
                    <div class="row">
                         <div class="col">
                                <center>
                                    <img width="300px" src="Images/info.png" />
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
                              <p>Page is intented to connect small group of friends and aquintances who love to read. Recommendations, reviews and book exchange made through people you know and trust.</p>
                              <p>To join existing library network of friends you need to login, it's also preferrable that you own some books. By joining this network you do not have additional costs, the only cost you will have is when you buy a book for yourself.<p>
                            </div>
                        </div>

                    <div class="row">
                            <div class="col">
                                <p><a class="btn btn-default" href="Default.aspx">&laquo Back</a></p>
                            </div>
                        </div>
                </div>
            </div>
    </main>
</asp:Content>
