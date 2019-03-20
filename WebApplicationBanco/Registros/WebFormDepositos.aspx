<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormDepositos.aspx.cs" Inherits="WebApplicationBanco.Registros.WebFormDepositos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-header text-center text-white bg-primary">
            <h3>Registro de depositos</h3>
        </div>

        <!--Card body-->
        <div class="card-body">
            <!--Id-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label1" runat="server" CssClass="col-form-label" Text="DepositoId">DepositoId:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="IdTextBox" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="IdRFV" runat="server" ErrorMessage="No puede estar vacío" ControlToValidate="IdTextBox" Display="Dynamic" ForeColor="Red" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="IdREV" runat="server" ErrorMessage="Solo Números" ValidationExpression="^[0-9]*$" ControlToValidate="IdTextBox" ForeColor="Red" ValidationGroup="Guardar">Solo Números</asp:RegularExpressionValidator>

                </div>
                <div class="col-lg-1">
                    <asp:Button ID="BuscarButton" runat="server" CssClass="btn btn-secondary" Text="Buscar" OnClick="BuscarButton_Click1" />
                </div>
            </div>

            <!--CuentaId-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label5" runat="server" CssClass="col-form-label" Text="Cuentas">Cuenta:</asp:Label>
                <div class="col-lg-4">
                    <asp:DropDownList ID="CuentaDropDownList" runat="server" CssClass="form-control">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CuentaDropDownList" ErrorMessage="Debe seleccionar" Text="*"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!--Fecha-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label2" runat="server" CssClass="col-form-label" Text="Fecha">Fecha:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="FechaTextBox" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                </div>
            </div>

            <!--Concepto-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label4" runat="server" CssClass="col-form-label" Text="Concepto">Concepto:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="ConceptoTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="No puede estar vacío" ControlToValidate="ConceptoTextBox" Display="Dynamic" ForeColor="Red" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Solo Números" ValidationExpression="^[0-9]*$" ControlToValidate="ConceptoTextBox" ForeColor="Red" ValidationGroup="Guardar">Solo Números</asp:RegularExpressionValidator>
                </div>
                <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ConceptoTextBox" Display="Dynamic" ErrorMessage="Indique un concepto" Text="*"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!--Monto-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label6" runat="server" CssClass="col-form-label" Text="Monto">Monto:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="MontoTextBox" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="No puede estar vacío" ControlToValidate="MontoTextBox" Display="Dynamic" ForeColor="Red" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Solo Números" ValidationExpression="^[0-9]*$" ControlToValidate="MontoTextBox" ForeColor="Red" ValidationGroup="Guardar">Solo Números</asp:RegularExpressionValidator>
                </div>
                <div class="col-lg-1">
                    <asp:RangeValidator ID="RangeValidator" runat="server" ControlToValidate="MontoTextBox" Display="Dynamic" ErrorMessage="Ingrese un monto positivo" MaximumValue="999999" MinimumValue="0" Text="*" Type="Integer"></asp:RangeValidator>
                </div>
            </div>

            <!--Card body end-->
        </div>

        <div class="card-footer">
            <!--Butones-->
            <div class="form-group row justify-content-center">
                <div class="col-lg-1 mr-1">
                    <asp:Button ID="GuardarButton" runat="server" CssClass="btn btn-secondary" Text="Guardar" OnClick="GuardarButton_Click1" />
                </div>
                <div class="col-lg-1 mr-3">
                    <asp:Button ID="NuevoButton" runat="server" CssClass="btn btn-secondary" Text="Nuevo" OnClick="NuevoButton_Click1" />
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
