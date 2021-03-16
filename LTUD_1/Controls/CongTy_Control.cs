using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL;

namespace LTUD_1.Controls
{

    public partial class CongTy_Control : UserControl
    {
        CongTy_DAL spdv = new CongTy_DAL();

        public CongTy_Control()
        {
            InitializeComponent();
            dataGridView1.DataSource = spdv.SelectAll();
        }

        void LoadDataGridView()
        {
            dataGridView1.DataSource = spdv.SelectAll();
        }






        private void btnCreate_Click(object sender, EventArgs e)
        {
            txtMa.Clear();
            txtTen.Clear();
            txtFax.Clear();
            txtMaSoThue.Clear();
            txtDiaChi.Clear();
            txtSDT.Clear();
            btnSave.Enabled = true;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            spdv.Insert(txtMa.Text, txtTen.Text, txtDiaChi.Text, txtSDT.Text, txtFax.Text, txtMaSoThue.Text);
            btnSave.Enabled = false;
            LoadDataGridView();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            spdv.Update(txtMa.Text, txtTen.Text, txtDiaChi.Text, txtSDT.Text, txtFax.Text, txtMaSoThue.Text);
            LoadDataGridView();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            spdv.Delete(txtMa.Text);

            txtMa.Clear();
            txtTen.Clear();
            txtFax.Clear();
            txtMaSoThue.Clear();
            txtDiaChi.Clear();
            txtSDT.Clear();
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            txtMa.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtTen.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtFax.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtMaSoThue.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtDiaChi.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtSDT.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
        }
    }
}
