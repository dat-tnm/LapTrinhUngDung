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
    public partial class NhanVien_Control : UserControl
    {
        NhanVien_BLL spdv = new NhanVien_BLL();

        public NhanVien_Control()
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
            btnSave.Enabled = true;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            spdv.Insert(txtMa.Text, txtTen.Text);
            btnSave.Enabled = false;
            LoadDataGridView();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            spdv.Update(txtMa.Text, txtTen.Text);
            LoadDataGridView();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            spdv.Delete(txtMa.Text);
            txtMa.Clear();
            txtTen.Clear();
            LoadDataGridView();
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            txtMa.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtTen.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
        }
    }
}
