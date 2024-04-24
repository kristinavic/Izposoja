<%@ Page Title="O strani" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ostrani.aspx.cs" Inherits="IzposojaKnjig.About" %>
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
                              <p>Stran je zamišljena kot manjše omrežje prijateljev in znancev, ki radi berejo. Priporočila, ocene in izposoja tako poteka med znanimi ljudmi, ki jim zaupaš.</p>
                              <p>Za pridružitev obstoječi knjižnjici prijateljev je potrebna prijava, zaželeno je, da imaš v svoji lasti nekaj knjig. Razen nakupa lastnih knjig, s pridružitvijo nimaš dodatnih stroškov.<p>
                            </div>
                        </div>

                    <div class="row">
                            <div class="col">
                                <p><a class="btn btn-default" href="Default.aspx">&laquo Nazaj</a></p>
                            </div>
                        </div>
                </div>
            </div>
    </main>
</asp:Content>
