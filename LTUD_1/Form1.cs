using LTUD_1.Controls;
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
    public partial class Form1 : Form
    {
        NhanVien_Control nhanVien_Control;
        SanPhamDV_Control sanPhamDV_Control;
        KhachHang_Control khachHang_Control;
        CongTy_Control congTy_Control;
        HoaDon_CTHD_Control hoaDon_Control;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            sanPhamDV_Control = new SanPhamDV_Control();
            thanhToánToolStripMenuItem_Click(sender, e);
        }

        private void mItemSanPhamDV_Click(object sender, EventArgs e)
        {
            if (sanPhamDV_Control == null)
                sanPhamDV_Control = new SanPhamDV_Control();

            panel1.Controls.Clear();
            panel1.Controls.Add(sanPhamDV_Control);
        }

        private void nhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (nhanVien_Control == null)
                nhanVien_Control = new NhanVien_Control();

            panel1.Controls.Clear();
            panel1.Controls.Add(nhanVien_Control);
        }

        private void côngTyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (congTy_Control == null)
                congTy_Control = new CongTy_Control();

            panel1.Controls.Clear();
            panel1.Controls.Add(congTy_Control);
        }

        private void kháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (khachHang_Control == null)
                khachHang_Control = new KhachHang_Control();

            panel1.Controls.Clear();
            panel1.Controls.Add(khachHang_Control);
        }

        private void thanhToánToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (hoaDon_Control == null)
                hoaDon_Control = new HoaDon_CTHD_Control();

            panel1.Controls.Clear();
            panel1.Controls.Add(hoaDon_Control);
        }
    }
}
