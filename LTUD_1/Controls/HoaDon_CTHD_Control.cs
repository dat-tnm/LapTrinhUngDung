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
        NhanVien_Control nhanVien_Control;

        public HoaDon_CTHD_Control()
        {
            InitializeComponent();

            var nv_DAL = new NhanVien_DAL();
            var kh_DAL = new KhachHang_DAL();
            var hd_DAL = new HoaDon_DAL();
            var sanPhamDV_DAL = new SanPhamDV_DAL();

            cbbTenNV.DataSource = nv_DAL.SelectAll();
            cbbTenNV.DisplayMember = "MaNV";
            cbbTenNV.ValueMember = "HoTen";

            cbbTenKH.DataSource = kh_DAL.SelectAll();
            cbbTenKH.DisplayMember = "MaKH";
            cbbTenKH.ValueMember = "HoTen";

            cbbHangHoa.DataSource = sanPhamDV_DAL.SelectAll();
            cbbHangHoa.DisplayMember = "Ten";
            cbbHangHoa.ValueMember = "MaSPDV";

            dataGV_HD.DataSource = hd_DAL.SelectAll();
        }

        private void dataGV_HD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            var cthd_DAL = new CTHD_DAL();
            string maHD = dataGV_HD.Rows[e.RowIndex].Cells[1].Value.ToString();
            dataGV_CTHD.DataSource = cthd_DAL.SelectWhere(maHD);
        }

        private void dataGV_CTHD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtDonViTinh.Text = dataGV_CTHD.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtDonGia.Text = dataGV_CTHD.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtSoLuong.Text = dataGV_CTHD.Rows[e.RowIndex].Cells[4].Value.ToString();
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
    }
}
