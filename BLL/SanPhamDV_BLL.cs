using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SanPhamDV_BLL
    {
        SanPhamDV_DAL sp = new SanPhamDV_DAL();

        public DataTable SelectAll()
        {
            return sp.SelectAll();
        }

        public int Insert(string id, string ten, string dvt, string dongia)
        {
            return sp.Insert(id, ten, dvt, dongia);
        }

        public int Update(string id, string ten, string dvt, string dongia)
        {
            return sp.Update(id, ten, dvt, dongia);
        }

        public int Delete(string idsv)
        {
            return sp.Delete(idsv);
        }
    }
}
