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
using DAL;

namespace LTUD_1.Controls
{

    public partial class KhachHang_Control : UserControl
    {
        KhachHang_DAL spdv = new KhachHang_DAL();

        public KhachHang_Control()
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
            txtHoTen.Clear();
            txtTenCongTy.Clear();
            txtMaSoThue.Clear();
            txtDiaChi.Clear();
            btnSave.Enabled = true;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            spdv.Insert(txtMa.Text, txtHoTen.Text, txtTenCongTy.Text, txtMaSoThue.Text, txtDiaChi.Text);
            btnSave.Enabled = false;
            LoadDataGridView();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            spdv.Update(txtMa.Text, txtHoTen.Text, txtTenCongTy.Text, txtMaSoThue.Text, txtDiaChi.Text);
            LoadDataGridView();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            spdv.Delete(txtMa.Text);
            txtMa.Clear();
            txtHoTen.Clear();
            txtTenCongTy.Clear();
            txtMaSoThue.Clear();
            LoadDataGridView();
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            txtMa.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtHoTen.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtTenCongTy.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtMaSoThue.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
        }
    }
}
