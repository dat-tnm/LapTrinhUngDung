using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;

namespace LTUD_1.Controls
{
    public partial class SanPhamDV_Control : UserControl
    {
        SanPhamDV_BLL spdv = new SanPhamDV_BLL();

        public SanPhamDV_Control()
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
            txtMaSPDV.Clear();
            txtTen.Clear();
            txtDVT.Clear();
            txtDonGia.Clear();
            btnSave.Enabled = true;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            spdv.Insert(txtMaSPDV.Text, txtTen.Text, txtDVT.Text, txtDonGia.Text);
            btnSave.Enabled = false;
            LoadDataGridView();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            spdv.Update(txtMaSPDV.Text, txtTen.Text, txtDVT.Text, txtDonGia.Text);
            LoadDataGridView();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            spdv.Delete(txtMaSPDV.Text);
            txtMaSPDV.Clear();
            txtTen.Clear();
            txtDVT.Clear();
            txtDonGia.Clear();
            LoadDataGridView();
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            txtMaSPDV.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtTen.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtDVT.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtDonGia.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
        }
    }
}
