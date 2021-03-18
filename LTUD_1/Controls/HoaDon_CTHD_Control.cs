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
    public partial class HoaDon_CTHD_Control : UserControl
    {
        FormManagement form2;
        int cthdRowIndex;
        DataTable cthd_Garbage;

        public HoaDon_CTHD_Control()
        {
            InitializeComponent();

            var nv_DAL = new NhanVien_DAL();
            var kh_DAL = new KhachHang_DAL();
            var hd_DAL = new HoaDon_DAL();
            var sanPhamDV_DAL = new SanPhamDV_DAL();

            cbbTenNV.DataSource = nv_DAL.SelectAll();
            cbbTenNV.DisplayMember = "HoTen";
            cbbTenNV.ValueMember = "MaNV";

            cbbTenKH.DataSource = kh_DAL.SelectAll();
            cbbTenKH.DisplayMember = "HoTen";
            cbbTenKH.ValueMember = "MaKH";

            cbbHangHoa.DataSource = sanPhamDV_DAL.SelectAll();
            cbbHangHoa.DisplayMember = "Ten";
            cbbHangHoa.ValueMember = "MaSPDV";

            dataGV_HD.DataSource = hd_DAL.SelectAll();
        }

        private void dataGV_HD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            var cthd_DAL = new CTHD_DAL();
            string maHD = dataGV_HD.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtMaHD.Text = maHD;
            dataGV_CTHD.DataSource = cthd_DAL.SelectWhere(maHD);
            cthd_Garbage = cthd_DAL.SelectWhere(" ");
        }

        private void dataGV_CTHD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            cthdRowIndex = e.RowIndex;

            cbbHangHoa.Text = dataGV_CTHD[1, rowIndex].Value.ToString();
            txtDonViTinh.Text = dataGV_CTHD.Rows[rowIndex].Cells[2].Value.ToString();
            txtDonGia.Text = dataGV_CTHD.Rows[rowIndex].Cells[3].Value.ToString();
            txtSoLuong.Text = dataGV_CTHD.Rows[rowIndex].Cells[4].Value.ToString();
        }

        private void btnAddNV_Click(object sender, EventArgs e)
        {
            form2 = new FormManagement();
            form2.Controls.Add(new NhanVien_Control());
            form2.Show();
        }

        private void btnAddKH_Click(object sender, EventArgs e)
        {
            form2 = new FormManagement();
            form2.Controls.Add(new KhachHang_Control());
            form2.Show();
        }

        private void btnNewHD_Click(object sender, EventArgs e)
        {
            txtMaHD.Enabled = true;
            btnSaveHD.Enabled = true;
        }

        private void cbbHangHoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtDonViTinh.Text = ((DataRowView)cbbHangHoa.SelectedItem)[2].ToString();
            txtDonGia.Text = ((DataRowView)cbbHangHoa.SelectedItem)[3].ToString();
        }

        private void btnAddCTHD_Click(object sender, EventArgs e)
        {
            if (dataGV_CTHD.DataSource == null)
            {
                MessageBox.Show("Bạn chưa chọn hóa đơn!");
                return;
            }

            double thanhTien;
            try
            {
                thanhTien = double.Parse(txtDonGia.Text) * double.Parse(txtSoLuong.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Đơn giá, số lượng phải là kiểu số!");
                return;
            }
            string maHangHoa = ((DataRowView)cbbHangHoa.SelectedItem)[0].ToString();
            string tenHangHoa = ((DataRowView)cbbHangHoa.SelectedItem)[1].ToString();

            DataTable source = (DataTable)dataGV_CTHD.DataSource;
            foreach (DataRow row in source.Rows)
            {
                if (row[0].ToString() == maHangHoa)
                {
                    row[4] = double.Parse(row[4].ToString()) + double.Parse(txtSoLuong.Text);
                    row[5] = double.Parse(row[5].ToString()) + thanhTien;
                    return;
                }
            }

            source.Rows.Add(maHangHoa, tenHangHoa, txtDonViTinh.Text, txtDonGia.Text, txtSoLuong.Text, thanhTien.ToString());
        }

        private void btnEditCTHD_Click(object sender, EventArgs e)
        {
            double thanhTien;
            try
            {
                thanhTien = double.Parse(txtDonGia.Text) * double.Parse(txtSoLuong.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Đơn giá, số lượng phải là kiểu số!");
                return;
            }
            string maHangHoa = ((DataRowView)cbbHangHoa.SelectedItem)[0].ToString();
            string tenHangHoa = ((DataRowView)cbbHangHoa.SelectedItem)[1].ToString();

            DataRow row = ((DataTable)dataGV_CTHD.DataSource).Rows[cthdRowIndex];
            row[0] = maHangHoa;
            row[1] = tenHangHoa;
            row[2] = txtDonViTinh.Text;
            row[3] = txtDonGia.Text;
            row[4] = txtSoLuong.Text;
            row[5] = thanhTien.ToString();
        }

        private void btnDeleteCTHD_Click(object sender, EventArgs e)
        {
            DataRow row = ((DataTable)dataGV_CTHD.DataSource).Rows[0];
            cthd_Garbage.Rows.Add(row[0]);
            dataGV_CTHD.Rows.RemoveAt(cthdRowIndex);
        }

        private void btnSaveHD_Click(object sender, EventArgs e)
        {
            var hd_DAL = new HoaDon_DAL();
            string maKH = cbbTenKH.SelectedValue.ToString();
            string maNV = cbbTenNV.SelectedValue.ToString();
            hd_DAL.Insert(txtMaHD.Text, maKH, maNV, "CT01", "HD mua hang");

            dataGV_HD.DataSource = hd_DAL.SelectAll();
            txtMaHD.Enabled = false;
        }

        private void btnUpdateHD_Click(object sender, EventArgs e)
        {
            var hd_DAL = new HoaDon_DAL();
            string maKH = cbbTenKH.SelectedValue.ToString();
            string maNV = cbbTenNV.SelectedValue.ToString();
            hd_DAL.Update(txtMaHD.Text, maKH, maNV, "CT01", "HD mua hang");

            //Inserting or Updating cthds
            var cthd_DAL = new CTHD_DAL();
            DataRowCollection cthds = ((DataTable)dataGV_CTHD.DataSource).Rows;
            foreach (DataRow row in cthds)
            {
                if (row.RowState == DataRowState.Modified)
                    cthd_DAL.Update(txtMaHD.Text, row[0].ToString(), row[4].ToString(), row[3].ToString());
                else if (row.RowState == DataRowState.Added)
                    cthd_DAL.Insert(txtMaHD.Text, row[0].ToString(), row[4].ToString(), row[3].ToString());
            }

            //Deleting cthds in garbage
            cthds = cthd_Garbage.Rows;
            foreach (DataRow row in cthds)
            {
                cthd_DAL.Delete(txtMaHD.Text, row[0].ToString());
            }
            cthd_Garbage.Rows.Clear();

            dataGV_CTHD.DataSource = cthd_DAL.SelectWhere(txtMaHD.Text);
        }

        private void btnDeleteHD_Click(object sender, EventArgs e)
        {
            var hd_DAL = new HoaDon_DAL();
            hd_DAL.Delete(txtMaHD.Text);

            //Nếu có Cascading từ khóa chính HoaDon tới ChiTietHoaDon thì chỉ cần xóa HoaDon là xong

            //var cthd_DAL = new CTHD_DAL();
            //DataRowCollection cthds = cthd_DAL.SelectWhere(txtMaHD.Text).Rows;
            //foreach (DataRow row in cthds)
            //{
            //    cthd_DAL.Delete(txtMaHD.Text, row[0].ToString());
            //}

            dataGV_HD.DataSource = hd_DAL.SelectAll();
        }
    }
}
