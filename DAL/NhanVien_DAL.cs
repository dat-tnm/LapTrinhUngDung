using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NhanVien_DAL : DAL
    {
        DbCmd db;

        public NhanVien_DAL()
        {
            db = new DbCmd();
        }

        public DataTable SelectAll()
        {
            return db.ExecQueryProcedure("NhanVien_SelectAll");
        }

        public int Insert(string id, string ten)
        {
            parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@maNV", id);
            parameters[1] = new SqlParameter("@hoTen", ten);
            return db.ExecNonQueryProcedure("NhanVien_Insert", parameters);
        }

        public int Update(string id, string ten)
        {
            parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@maNV", id);
            parameters[1] = new SqlParameter("@hoTen", ten);
            return db.ExecNonQueryProcedure("NhanVien_Update", parameters);
        }

        public int Delete(string id)
        {
            parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@maNV", id);
            return db.ExecNonQueryProcedure("NhanVien_Delete", parameters);
        }

    }
}
