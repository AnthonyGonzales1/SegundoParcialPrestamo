<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormCuentas.aspx.cs" Inherits="WebApplicationBanco.Registros.WebFormCuentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-6">
        <div class="card-header text-center text-white bg-primary">
            <h3>Registro de Cuentas</h3>
        </div>
        <div class="card-body">
            <!--Id-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 col-form-label" Text="CuentaId">CuentaId:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="IdTextBox" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="IdRFV" runat="server" ErrorMessage="No puede estar vacío" ControlToValidate="IdTextBox" Display="Dynamic" ForeColor="Red" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="IdREV" runat="server" ErrorMessage="Solo Números" ForeColor="Red" ValidationExpression="^[0-9]*$" ControlToValidate="IdTextBox" ValidationGroup="Guardar">Solo Números</asp:RegularExpressionValidator>

                </div>
                <div class="col-lg-1">
                    <asp:Button ID="BuscarButton" runat="server" CssClass="btn btn-secondary" Text="Buscar" OnClick="BuscarButton_Click1" />
                </div>
            </div>

            <!--Fecha-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label2" runat="server" CssClass="col-lg-2 col-form-label" Text="Fecha">Fecha:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="FechaTextBox" type="date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                </div>
            </div>

            <!--Nombre-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 col-form-label" Text="Nombre">Nombre:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="NombreTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NombreRFV" runat="server" ErrorMessage="No puede estar vacío" ControlToValidate="NombreTextBox" Display="Dynamic" ForeColor="Red" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="NombreREV" runat="server" ErrorMessage="Solo Letras" ControlToValidate="NombreTextBox" ForeColor="Red" ValidationExpression="^[a-z &amp; A-Z]*$" ValidationGroup="Guardar">Solo Letras</asp:RegularExpressionValidator>

                </div>
                <div class="col-lg-1">
                </div>
            </div>

            <!--Balance-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 col-form-label" Text="Balance">Balance:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="BalanceTextBox" runat="server" CssClass="form-control" ReadOnly="true" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="BalanceRFV" runat="server" ErrorMessage="No puede estar vacío" ControlToValidate="BalanceTextBox" ForeColor="Red" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="BalanceREV" runat="server" ErrorMessage="Solo Números" ForeColor="Red" ValidationExpression="^[0-9]*$" ControlToValidate="BalanceTextBox" ValidationGroup="Guardar">Solo Números</asp:RegularExpressionValidator>

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
                    <asp:Button ID="NuevoButton" runat="server" CssClass="btn btn-secondary" Text="Nuevo" OnClick="NuevoButton_Click1" />
                </div>
                <div class="col-lg-1 mr-3">
                    <asp:Button ID="GuardarButton" runat="server" CssClass="btn btn-secondary" Text="Guardar" OnClick="GuardarButton_Click1" />
                </div>
                <div class="col-lg-1 mr-3">
                    <asp:Button ID="EliminarButton" runat="server" CssClass="btn btn-secondary" Text="Eliminar" OnClick="EliminarButton_Click1" />
                </div>
            </div>
            <!--Card footer end-->
        </div>
    </div>
    <asp:ValidationSummary ID="ValidationSummary" runat="server" ShowMessageBox="true" ShowSummary="false" />
</asp:Content>
