<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebConsultPrestamo.aspx.cs" Inherits="WebApplicationBanco.Consultas.WebConsultPrestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-header text-center text-white bg-primary">
            <h3>Consulta de pretasmos</h3>
        </div>

        <!--Card body-->
        <div class="card-body">
            <!--Rango fecha-->
            <div class="form-group row justify-content-center">
                <div class="col-lg-4">
                    <asp:Label ID="Label1" runat="server" Text="Fecha-inicio">Desde:</asp:Label>
                    <asp:TextBox ID="DesdeTextBox" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-2"></div>
                <div class="col-lg-4">
                    <asp:Label ID="Label2" runat="server" Text="Fecha-inicial">Hasta:</asp:Label>
                    <asp:TextBox ID="HastaTextBox" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>

            <!---->
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <asp:Label ID="FiltroLabel" runat="server" Text="Filtrar-por">
                        Filtro:
                    </asp:Label>
                    <asp:DropDownList ID="FiltroDropDownList" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>PrestamoId</asp:ListItem>
                        <asp:ListItem>CuentaId</asp:ListItem>
                        <asp:ListItem>Fecha</asp:ListItem>
                        <asp:ListItem>Capital</asp:ListItem>
                        <asp:ListItem>Interes</asp:ListItem>
                        <asp:ListItem>Tiempo</asp:ListItem>
                        <asp:ListItem>Monto</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1"></div>
                <div class="col-lg-4">
                    <asp:Label ID="BuscarLabel" runat="server" Text="Buscar">Buscar:</asp:Label>
                    <asp:TextBox ID="BuscarTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-1 p-0">
                    <asp:Button ID="BuscarButton" CssClass="btn btn-secondary" runat="server" Text="Buscar" OnClick="BuscarButton_Click1" />
                </div>
            </div>

            <!--Grid-->
            <div class="row justify-content-center mt-3">
                <div class="col-lg-11">
                    <asp:GridView ID="PrestamoGridView" runat="server" AllowPaging="True" PageSize="7" CssClass="table table-striped table-hover table-responsive-lg" AutoGenerateColumns="False" OnPageIndexChanging="PrestamoGridView_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="PrestamoGridView_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                            <asp:BoundField DataField="Capital" HeaderText="Capital" />
                            <asp:BoundField DataField="Interes" HeaderText="Interes" />
                            <asp:BoundField DataField="Tiempo" HeaderText="Tiempo" />
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
    </div>
    <asp:Button ID="ImprimirButton" CssClass="btn btn-secondary" runat="server" Text="Imprimir" OnClick="ImprimirButton_Click" />
</asp:Content>
