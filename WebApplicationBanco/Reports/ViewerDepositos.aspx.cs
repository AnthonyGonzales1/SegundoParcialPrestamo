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
    public partial class ViewerDepositos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLL.RepositorioBase<Depositos> repositorio = new BLL.RepositorioBase<Depositos>();
            DepositoReportViewer.ProcessingMode = ProcessingMode.Local;
            DepositoReportViewer.Reset();

            DepositoReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reports\ReportDepositos.rdlc");
            DepositoReportViewer.LocalReport.DataSources.Clear();
            DepositoReportViewer.LocalReport.DataSources.Add(new ReportDataSource("Depositos", repositorio.GetList(x=>true)));
            DepositoReportViewer.LocalReport.Refresh();
        }
    }
}