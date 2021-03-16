using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class SanPhamDV_DAL : DAL
    {
        DbCmd db;

        public SanPhamDV_DAL()
        {
            db = new DbCmd();
        }

        public DataTable SelectAll()
        {
            return db.ExecQueryProcedure("SanPhamDV_SelectAll");
        }

        public int Insert(string id, string ten, string DVT, string donGia)
        {
            parameters = new SqlParameter[4];
            parameters[0] = new SqlParameter("@maSPDV", id);
            parameters[1] = new SqlParameter("@ten", ten);
            parameters[1] = new SqlParameter("@DVT", DVT);
            parameters[1] = new SqlParameter("@donGia", donGia);
            return db.ExecNonQueryProcedure("SanPhamDV_Insert", parameters);
        }

        public int Update(string id, string ten, string DVT, string donGia)
        {
            parameters = new SqlParameter[4];
            parameters[0] = new SqlParameter("@maSPDV", id);
            parameters[1] = new SqlParameter("@ten", ten);
            parameters[1] = new SqlParameter("@DVT", DVT);
            parameters[1] = new SqlParameter("@donGia", donGia);
            return db.ExecNonQueryProcedure("SanPhamDV_Insert", parameters);
        }

        public int Delete(string id)
        {
            parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@maSPDV", id);
            return db.ExecNonQueryProcedure("SanPhamDV_Insert", parameters);
        }

    }
}
