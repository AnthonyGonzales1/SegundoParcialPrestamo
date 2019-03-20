<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebConsultDeposito.aspx.cs" Inherits="WebApplicationBanco.Consultas.WebConsultDeposito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-6">
        <div class="card-header text-center text-white bg-primary">
            <h3>Consulta de depositos</h3>
        </div>
        <div class="card-body">
            <!---->
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <asp:Label ID="FiltroLabel" runat="server" Text="Filtrar-por">
                        Filtro:
                    </asp:Label>
                    <asp:DropDownList ID="FiltroDropDownList" runat="server" CssClass="form-control">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>DepositoId</asp:ListItem>
                        <asp:ListItem>CuentaId</asp:ListItem>
                        <asp:ListItem>Fecha</asp:ListItem>
                        <asp:ListItem>Concepto</asp:ListItem>
                        <asp:ListItem>Mnto</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1">
                </div>
                <div class="col-lg-4">
                    <asp:Label ID="BuscarLabel" runat="server" Text="Buscar">Buscar:</asp:Label>
                    <asp:TextBox ID="BuscarTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-1 p-0">
                    <asp:Button ID="BuscarButton" CssClass="btn btn-secondary" runat="server" Text="Buscar" OnClick="BuscarButton_Click1" />
                    <br />
                    <div class="form-group col-md-2">
                        <asp:Label ID="Label1" runat="server" Text="Desde" />
                        <asp:TextBox ID="DesdeTextBox" runat="server" class="form-control input-group" TextMode="Date" />
                    </div>
                    <div class="form-group col-md-2">
                        <asp:Label ID="Label2" runat="server" Text="Hasta" />
                        <asp:TextBox ID="HastaTextBox" runat="server" class="form-control input-group" TextMode="Date" />
                    </div>
                </div>
            </div>

            <!--Grid-->
            <div class="row justify-content-center mt-3">
                <div class="col-lg-11">
                    <asp:GridView ID="DepositoGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-responsive-lg" PageSize="7" OnSelectedIndexChanged="DepositoGridView_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                            <asp:BoundField DataField="Concepto" HeaderText="Concepto" />
                            <asp:BoundField DataField="Monto" HeaderText="Monto" />
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

            <!--Card body end-->
        </div>

        <!--Card end-->
    </div>
    <asp:Button ID="ImprimirButton" CssClass="btn btn-secondary" runat="server" Text="Imprimir" OnClick="ImprimirButton_Click" />
</asp:Content>
