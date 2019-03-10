﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormCuentas.aspx.cs" Inherits="WebApplicationBanco.Registros.WebFormCuentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
    <div class="card-header text-center text-white bg-primary">
        <h3>Registro de Cuentas</h3>
    </div>
    <div class="card-body">
            <!--Id-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 col-form-label" Text="CuentaId">CuentaId:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="IdTextBox" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                    <asp:Button ID="BuscarButton" runat="server" CausesValidation="False" CssClass="btn btn-secondary" Text="Buscar" >
                        
                    </asp:Button>
                </div>
        </div>

            <!--Fecha-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label2" runat="server" CssClass="col-lg-2 col-form-label" Text="Fecha">Fecha:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="FechaTextBox" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                </div>
        </div>

            <!--Nombre-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 col-form-label" Text="Nombre">Nombre:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="NombreTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="NombreTextBox" Display="Dynamic" ErrorMessage="Indique un nombre de cuenta" Text="*"></asp:RequiredFieldValidator>
                </div>
        </div>

            <!--Balance-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 col-form-label" Text="Balance">Balance:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="BalanceTextBox" runat="server" CssClass="form-control" ReadOnly="true" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                </div>
        </div>

            <!--Card body end-->
        </div>
    <div class="card-footer">
            <!--Butones-->
            <div class="form-group row justify-content-center">
                <div class="col-lg-1 mr-1">
                    <asp:Button ID="NuevoButton" runat="server" CausesValidation="False" CssClass="btn btn-primary" Text="Nuevo">
                        
                    </asp:Button>
                </div>
                <div class="col-lg-1 mr-3">
                    <asp:Button ID="GuardarButton" runat="server" CssClass="btn btn-primary" Text="Guardar">
                        
                    </asp:Button>
                </div>
                <div class="col-lg-1 mr-3">
                    <asp:Button ID="EliminarButton" runat="server" CausesValidation="False" CssClass="btn btn-primary" Text="Eliminar" >
                        
                    </asp:Button>
                </div>
        </div>
            <!--Card footer end-->
        </div>
</div>
<asp:ValidationSummary ID="ValidationSummary" runat="server" ShowMessageBox="true" ShowSummary="false" />
</asp:Content>
