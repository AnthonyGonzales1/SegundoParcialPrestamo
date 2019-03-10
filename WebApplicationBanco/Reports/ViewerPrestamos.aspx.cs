using Entities;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationBanco.Reports
{
    public partial class ViewerPrestamos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLL.RepositorioBase<Prestamos> repositorio = new BLL.RepositorioBase<Prestamos>();
            PrestamoReportViewer.ProcessingMode = ProcessingMode.Local;
            PrestamoReportViewer.Reset();

            PrestamoReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reports\ReportPrestamos.rdlc");
            PrestamoReportViewer.LocalReport.DataSources.Clear();
            PrestamoReportViewer.LocalReport.DataSources.Add(new ReportDataSource("Prestamos", repositorio.GetList(x => true)));
            PrestamoReportViewer.LocalReport.Refresh();
        }
    }
}