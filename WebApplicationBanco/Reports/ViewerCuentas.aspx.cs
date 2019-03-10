using Entities;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationBanco.Reports
{
    public partial class ViewerCuentas : System.Web.UI.Page
    {
        Expression<Func<Cuentas, bool>> filtro = p => true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BLL.RepositorioBase<Cuentas> repositorio = new BLL.RepositorioBase<Cuentas>();
                CuentasReportViewer.ProcessingMode = ProcessingMode.Local;
                CuentasReportViewer.Reset();

                CuentasReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reports\ReportCuentas.rdlc");
                CuentasReportViewer.LocalReport.DataSources.Clear();
                CuentasReportViewer.LocalReport.DataSources.Add(new ReportDataSource("Cuentas", repositorio.GetList(x => true)));
                CuentasReportViewer.LocalReport.Refresh();

            }
        }
    }
}
