using BLL;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationBanco.Registros
{
    public partial class WebFormPrestamo : System.Web.UI.Page
    {
        public bool SeBusco { get; set; }
        List<Cuotas> detalle = new List<Cuotas>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarDropdownList();
                ViewState.Add("Detalle", detalle);
            }
            else
            {
                detalle = (List<Cuotas>)ViewState["Detalle"];
            }


            FechaTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        public int ToInt(string text)
        {
            return (string.IsNullOrWhiteSpace(text)) ? 0 : int.Parse(text);
        }

        public decimal ToDecimal(string text)
        {
            return (string.IsNullOrWhiteSpace(text)) ? 0 : decimal.Parse(text);
        }

        public float ToFloat(string text)
        {
            return (string.IsNullOrWhiteSpace(text)) ? 0 : float.Parse(text);
        }

        protected void CallModal(string mensaje)
        {
            Label label = (Label)Master.FindControl("MessageLabel");
            if (label != null)
                label.Text = mensaje;

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert",
                            "$(function() { openModal(); });", true);
        }

        private void LlenarDropdownList()
        {
            RepositorioBase<Cuentas> rep = new RepositorioBase<Cuentas>();
            CuentaDropDownList.DataSource = rep.GetList(x => true);
            CuentaDropDownList.DataValueField = "CuentaId";
            CuentaDropDownList.DataTextField = "Nombre";
            CuentaDropDownList.DataBind();
            CuentaDropDownList.Items.Insert(0, new ListItem("", ""));

        }

        private void LlenaCampo(Prestamos prestamo)
        {
            CuentaDropDownList.SelectedValue = prestamo.CuentaId.ToString();
            FechaTextBox.Text = prestamo.Fecha.ToString("yyyy-MM-dd");
            CapitalTextBox.Text = prestamo.Capital.ToString();
            InteresTextBox.Text = prestamo.Interes.ToString();
            TiempoTextBox.Text = prestamo.Tiempo.ToString();
            CuotaGridView.DataSource = prestamo.Detalle.ToList();
            CuotaGridView.DataBind();
            ViewState["Detalle"] = prestamo.Detalle;

        }

        private Prestamos LlenaClase()
        {
            return new Prestamos(
                ToInt(IdTextBox.Text),
                ToInt(CuentaDropDownList.SelectedValue),
                DateTime.Parse(FechaTextBox.Text),
                ToDecimal(CapitalTextBox.Text),
                ToDecimal(InteresTextBox.Text),
                ToInt(TiempoTextBox.Text),
                ToDecimal(CapitalTotalTextBox.Text),
                ToDecimal(InteresTotalTextBox.Text),
                ToDecimal(CapitalTotalTextBox.Text) + ToDecimal(InteresTotalTextBox.Text),
                detalle
                );
        }

        private void Limpiar()
        {
            IdTextBox.Text = string.Empty;
            CuentaDropDownList.SelectedIndex = 0;
            FechaTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
            CapitalTextBox.Text = string.Empty;
            InteresTextBox.Text = string.Empty;
            TiempoTextBox.Text = string.Empty;
            CuotaGridView.DataSource = null;
            CuotaGridView.DataBind();
        }

        protected void IdTextBox_TextChanged(object sender, EventArgs e)
        { }
        

        private bool Calculo()
        {
            return (CuotaGridView.Rows.Count > 0 || CuotaGridView.DataSource != null) ? true : false;
        }
       
        protected void BuscarButton_Click(object sender, EventArgs e)
        {

            PrestamoRepositorio rep = new PrestamoRepositorio();
            Prestamos prestamo = rep.Buscar(ToInt(IdTextBox.Text));

            if (prestamo != null)
            {
                LlenaCampo(prestamo);
                SeBusco = true;
                ViewState["SeBusco"] = SeBusco;
            }
            else
                CallModal("Este prestamo no existe.");
        }

        protected void CalcularButton_Click1(object sender, EventArgs e)
        {
            detalle.Clear();
            int tiempo = ToInt(TiempoTextBox.Text);
            decimal interes = (ToDecimal(InteresTextBox.Text)); interes /= 100;
            decimal cuota = ToDecimal(CapitalTextBox.Text);
            decimal capital = ToDecimal(CapitalTextBox.Text);
            decimal totalCapital = capital / tiempo, totalInteres = capital * interes;

            for (int i = 1; i <= ToInt(TiempoTextBox.Text); ++i)
            {
                Cuotas cuotas = new Cuotas();
                cuotas.PrestamoId = ToInt(IdTextBox.Text);
                cuotas.Capital = decimal.Round(capital / tiempo);
                cuotas.Interes = decimal.Round(totalInteres / tiempo);
                cuotas.Cuota = decimal.Round(capital + interes);
                cuotas.Balance = decimal.Round(cuotas.Interes + tiempo + capital) - cuotas.Capital;
                capital = cuotas.Balance;

                detalle.Add(cuotas);
            }
            CuotaGridView.DataSource = detalle.ToList();
            CuotaGridView.DataBind();
            ViewState["Detalle"] = detalle;
            CapitalTotalTextBox.Text = totalCapital.ToString();
            InteresTotalTextBox.Text = totalInteres.ToString();
        }

        protected void NuevoButton_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Calculo())
                {
                    PrestamoRepositorio rep = new PrestamoRepositorio();

                    if (ToInt(IdTextBox.Text) == 0)
                    {
                        if (rep.Guardar(LlenaClase()))
                        {
                            CallModal("Prestamo registrado. " + LlenaClase().Detalle.Count);
                            Limpiar();
                        }
                    }
                    else
                    {
                        if (rep.Modificar(LlenaClase()))
                        {
                            CallModal("Prestamo modificado.");
                            Limpiar();
                        }
                    }
                }
                else
                    CallModal("Amortizacion no calculada.");

            }
        }

        protected void EliminarButton_Click(object sender, EventArgs e)
        {


                PrestamoRepositorio rep = new PrestamoRepositorio();
                Prestamos prestamos = rep.Buscar(ToInt(IdTextBox.Text));

                if (prestamos != null)
                {
                    if (rep.Eliminar(ToInt(IdTextBox.Text)))
                    {
                        CallModal("Prestamo eliminado");
                        Limpiar();
                    }
                    else
                        CallModal("Prestamo no eliminado");
                }
            }

            protected void ImprimirButton_Click1(object sender, EventArgs e)
        {

        }

        protected void CuotaGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}