using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BLL
{
    public class KhachHang_BLL
    {
        KhachHang_DAL kh = new KhachHang_DAL();

        public DataTable SelectAll()
        {
            return kh.SelectAll();
        }

        public int Insert(string id, string ten, string tenCongTy, string maSoThue, string diaChi)
        {
            return kh.Insert(id, ten, tenCongTy, maSoThue, diaChi);
        }

        public int Update(string id, string ten, string tenCongTy, string maSoThue, string diaChi)
        {
            return kh.Update(id, ten, tenCongTy, maSoThue, diaChi);
        }

        public int Delete(string id)
        {
            return kh.Delete(id);
        }
    }
}
