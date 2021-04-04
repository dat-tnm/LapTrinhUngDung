using DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LTUD_1
{
    public partial class Form_InHoaDon : Form
    {
        public string MaHD;

        public Form_InHoaDon(string MaHD)
        {
            InitializeComponent();

            var hd_DAL = new HoaDon_DAL();
            CrystalReport1 rpt = new CrystalReport1();
            rpt.SetDataSource(hd_DAL.SelectWhereId(MaHD));
            crystalReportViewer1.ReportSource = rpt;
        }

        private void Form_InHoaDon_Load(object sender, EventArgs e)
        {

        }
    }
}
