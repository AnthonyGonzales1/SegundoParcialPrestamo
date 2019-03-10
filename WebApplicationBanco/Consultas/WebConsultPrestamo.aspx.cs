using BLL;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationBanco.Consultas
{
    public partial class WebConsultPrestamo : System.Web.UI.Page
    {
        Expression<Func<Prestamos, bool>> filter = x => true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DesdeTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
                HastaTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void CallModal(string mensaje)
        {
            Label label = (Label)Master.FindControl("MessageLabel");
            if (label != null)
                label.Text = mensaje;

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert",
                            "$(function() { openModal(); });", true);
        }

        public static int ToInt(string valor)
        {
            int retorno = 0;
            int.TryParse(valor, out retorno);

            return retorno;
        }

        public decimal ToDecimal(string text)
        {
            return (string.IsNullOrWhiteSpace(text)) ? 0 : decimal.Parse(text);
        }

        public float ToFloat(string text)
        {
            return (string.IsNullOrWhiteSpace(text)) ? 0 : float.Parse(text);
        }


        private void Filtrar()
        {
            var dato = 0;
            string i = DateTime.Parse(DesdeTextBox.Text).Date.ToString("yyyy-MM-dd");
            DateTime fInicial = DateTime.Parse(i);

            string f = DateTime.Parse(HastaTextBox.Text).Date.ToString("yyyy-MM-dd");
            DateTime fFinal = DateTime.Parse(f);

            switch (FiltroDropDownList.SelectedIndex)
            {
                case 0://Todo
                    filter = x => true;
                    break;

                case 1://PrestamoId
                    dato = ToInt(BuscarTextBox.Text);
                    filter = (x => x.PrestamoId == dato && ((x.Fecha >= fInicial) && (x.Fecha <= fFinal)));
                    break;

                case 2://CuentaId
                    dato = ToInt(BuscarTextBox.Text);
                    filter = (x => x.CuentaId == dato && ((x.Fecha >= fInicial) && (x.Fecha <= fFinal)));
                    break;

                case 3://Fecha
                    filter = (x => x.Fecha.Equals(BuscarTextBox.Text));
                    break;

                case 4://Capital
                    decimal c = ToDecimal(BuscarTextBox.Text);
                    filter = (x => x.Capital <= c && ((x.Fecha >= fInicial) && (x.Fecha <= fFinal)));
                    break;

                case 5://Interes
                    decimal interes = ToDecimal(BuscarTextBox.Text);
                    filter = (x => x.Interes <= interes && ((x.Fecha >= fInicial) && (x.Fecha <= fFinal)));
                    break;

                case 6://Tiempo
                    dato = ToInt(BuscarTextBox.Text);
                    filter = (x => x.Tiempo <= dato && ((x.Fecha >= fInicial) && (x.Fecha <= fFinal)));
                    break;

                case 7://Monto
                    decimal monto = ToDecimal(BuscarTextBox.Text);
                    filter = (x => x.Monto <= monto && ((x.Fecha >= fInicial) && (x.Fecha <= fFinal)));
                    break;
            }
        }

        protected void PrestamoGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void BuscarLinkButton_Click(object sender, EventArgs e)
        {
            PrestamoRepositorio rep = new PrestamoRepositorio();
            Filtrar();
            PrestamoGridView.DataSource = rep.GetList(filter);
            PrestamoGridView.DataBind();
        }
    }
}