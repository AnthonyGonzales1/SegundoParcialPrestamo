﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebFormPrestamo.aspx.cs" Inherits="WebApplicationBanco.Registros.WebFormPrestamo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function openReportModal() {
            $("#<%=reportModal.ClientID%>").modal({
                backdrop: 'static',
                keyboard: false
            }); 
            $("#<%=reportModal.ClientID%>").modal("show");
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <!--Card Header-->
        <div class="card-header text-center text-white bg-primary">
            <h3>Registro de prestamos</h3>
        </div>

        <!--Card body-->
        <div class="card-body">
            <!--Id-->
            <div class="form-group row justify-content-center">
                sPrestamo ID<div class="col-lg-3">
                    <div class="input-group">
                        <asp:TextBox ID="IdTextBox" CssClass="form-control" TextMode="Number" runat="server" OnTextChanged="IdTextBox_TextChanged"></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="BuscarButton" CssClass="btn btn-secondary" runat="server" CausesValidation="False" OnClick="BuscarButton_Click" Text="Buscar">
                                
                            </asp:Button>
                        </div>
                    </div>                 
                </div>

                <!--Fecha-->
                
                <div class="col-lg-3">
                    <asp:TextBox ID="FechaTextBox" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>

            <!--CuentaId-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label5" CssClass="col-form-label" Text="Cuenta" runat="server">Cuenta:</asp:Label>
                <div class="col-lg-4">
                    <asp:DropDownList ID="CuentaDropDownList" runat="server">
                        <asp:ListItem>Seleccionar</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="CuentaDropDownList" runat="server" Text="*" Display="Dynamic" ErrorMessage="Debes seleccionar una cuenta bancaria"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!--Credito-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label4" CssClass="col-form-label" Text="Capital:" runat="server"></asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="CapitalTextBox" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="CapitalTextBox" Text="*" runat="server" Display="Dynamic" ErrorMessage="Indique un concepto"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!--Interes anual-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label6" CssClass="col-form-label" Text="Interes" runat="server">Interes:</asp:Label>
                <div class="col-lg-4">
                    <div class="input-group">
                        <div class="input-group-append">
                            <asp:TextBox ID="InteresTextBox" runat="server"></asp:TextBox>
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="InteresTextBox" Text="*" Display="Dynamic" runat="server" ErrorMessage="Debe ingresar una tasa de interes"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator" ControlToValidate="InteresTextBox" runat="server" Display="Dynamic" Text="*" ErrorMessage="El interes no es valido" Type="Integer" MinimumValue="0" MaximumValue="999999"></asp:RangeValidator>
                </div>
            </div>
            
            <!--Tiempo-->
            <div class="form-group row justify-content-center">
                <asp:Label ID="Label7" CssClass="col-form-label" Text="Tiempo" runat="server">Tiempo:</asp:Label>
                <div class="col-lg-4">
                    <asp:TextBox ID="TiempoTextBox" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TiempoTextBox" Text="*" Display="Dynamic" runat="server" ErrorMessage="Debe ingresar el tiempo de pago"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator4" ControlToValidate="TiempoTextBox" runat="server" Display="Dynamic" Text="*" ErrorMessage="El tiempo no es valido" Type="Integer" MinimumValue="0" MaximumValue="999999"></asp:RangeValidator>
                </div>
                <div class="w-100"></div>
                <div class="col-lg-6">
                    <asp:Button ID="CalcularButton" CssClass="btn btn-primary" runat="server" Text="Calcular" OnClick="CalcularButton_Click" />
                    <br />
                </div>
            </div>

            <!--Grid-->
            <div class="row justify-content-center mt-3">
                <div class="col-lg-11">           
                    <asp:GridView ID="CuotaGridView" runat="server" AllowPaging="True" PageSize="7" CssClass="table table-striped table-hover table-responsive-lg" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="NoPago" HeaderText="Cuota" />
                            <asp:BoundField HeaderText="Fecha" />
                            <asp:BoundField DataField="Interes" HeaderText="Interes" />
                            <asp:BoundField DataField="Capital" HeaderText="Capital" />
                            <asp:BoundField DataField="Balance" HeaderText="Balance" />
                        </Columns>    
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <div class="col-lg-2 mr-2">
                    <asp:TextBox ID="InteresTotalTextBox" CssClass="form-control" Visible="false" ReadOnly="true" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-2 mr-3">
                    <asp:TextBox ID="CapitalTotalTextBox" CssClass="form-control" Visible="false" ReadOnly="true" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-2 ml-5 mr-1">
                </div>
            </div>
    
            <!--Card body end-->
        </div>

        <div class="card-footer">
            <!--Butones-->
            <div class="form-group row justify-content-center">
                <!--Nuevo-->
                <div class="col-lg-1 mr-1">
                    <asp:Button ID="NuevoButton" CssClass="btn btn-primary" runat="server" CausesValidation="False" Text="Nuevo" OnClick="NuevoButton_Click" >
                        
                    </asp:Button>
                    <br />
                    <br />
                </div>

                <!--Guardar-->
                <div class="col-lg-1 mr-3">
                    <asp:Button ID="GuardarButton" CssClass="btn btn-primary" runat="server" CausesValidation="False" Text="Guardar" OnClick="GuardarButton_Click">
                        
                    </asp:Button>
                    <br />
                    <br />
                </div>

                <!--Eliminar-->
                <div class="col-lg-1 mr-3">
                    <asp:Button ID="EliminarButton" CssClass="btn btn-primary" runat="server" CausesValidation="False" Text="Eliminar" OnClick="EliminarButton_Click" >
                        
                    </asp:Button>
                    <br />
                    <br />
                </div> 

                <!--Imprimir-->
                <div class="col-lg-1 mr-3">
                    <asp:LinkButton ID="ImprimirButton" CssClass="btn btn-primary" runat="server" CausesValidation="False">Imprimir</asp:LinkButton>
                    <br />
                </div>      
            </div>

            <!--Card footer end-->
        </div>
    </div>


    <!--Report Modal-->
    <div class="modal fade" id="reportModal"  role="dialog" runat="server">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!--Body-->
                

                <!--Footer-->
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <asp:ValidationSummary ID="ValidationSummary" ShowMessageBox="true" ShowSummary="false" runat="server" />
</asp:Content>