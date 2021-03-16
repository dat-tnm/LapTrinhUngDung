using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NhanVien_BLL
    {
        NhanVien_DAL nv = new NhanVien_DAL();

        public DataTable SelectAll()
        {
            return nv.SelectAll();
        }

        public int Insert(string id, string ten)
        {
            return nv.Insert(id, ten);
        }

        public int Update(string id, string ten)
        {
            return nv.Update(id, ten);
        }

        public int Delete(string idsv)
        {
            return nv.Delete(idsv);
        }
    }
}
