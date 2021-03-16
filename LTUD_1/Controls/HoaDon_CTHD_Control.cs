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
        NhanVien_DAL nv_DAL;
        KhachHang_DAL kh_DAL;
        HoaDon_DAL hd_DAL;
        CTHD_DAL cthd_DAL;

        public HoaDon_CTHD_Control()
        {
            InitializeComponent();

            nv_DAL = new NhanVien_DAL();
            kh_DAL = new KhachHang_DAL();
            hd_DAL = new HoaDon_DAL();
            cthd_DAL = new CTHD_DAL();

            cbbTenNV.DataSource = nv_DAL.SelectAll();
            cbbTenNV.DisplayMember = "MaNV";
            cbbTenNV.ValueMember = "HoTen";

            cbbTenKH.DataSource = kh_DAL.SelectAll();
            cbbTenKH.DisplayMember = "MaKH";
            cbbTenKH.ValueMember = "HoTen";

            dataGV_HD.DataSource = hd_DAL.SelectAll();
        }

        private void dataGV_HD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string maHD = dataGV_HD.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtMaHD.Text = maHD;
            dataGV_CTHD.DataSource = cthd_DAL.SelectWhere(maHD);
        }

        private void dataGV_CTHD_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtDonViTinh.Text = dataGV_CTHD.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtSoLuong.Text = dataGV_CTHD.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtDonGia.Text = dataGV_CTHD.Rows[e.RowIndex].Cells[3].Value.ToString();
        }
    }
}
