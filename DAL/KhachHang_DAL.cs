using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class KhachHang_DAL : DAL
    {
        DbCmd db;

        public KhachHang_DAL()
        {
            db = new DbCmd();
        }

        public DataTable SelectAll()
        {
            return db.ExecQueryProcedure("KhachHang_SelectAll");
        }

        public int Insert(string id, string ten, string tenCongTy, string maSoThue, string diaChi)
        {
            parameters = new SqlParameter[5];
            parameters[0] = new SqlParameter("@maKH", id);
            parameters[1] = new SqlParameter("@hoTen", ten);
            parameters[2] = new SqlParameter("@tenCongTy", tenCongTy);
            parameters[3] = new SqlParameter("@maSoThue", maSoThue);
            parameters[4] = new SqlParameter("@diaChi", diaChi);
            return db.ExecNonQueryProcedure("KhachHang_Insert", parameters);
        }

        public int Update(string id, string ten, string tenCongTy, string maSoThue, string diaChi)
        {
            parameters = new SqlParameter[5];
            parameters[0] = new SqlParameter("@maKH", id);
            parameters[1] = new SqlParameter("@hoTen", ten);
            parameters[2] = new SqlParameter("@tenCongTy", tenCongTy);
            parameters[3] = new SqlParameter("@maSoThue", maSoThue);
            parameters[4] = new SqlParameter("@diaChi", diaChi);
            return db.ExecNonQueryProcedure("KhachHang_Update", parameters);
        }

        public int Delete(string id)
        {
            parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@maKH", id);

            return db.ExecNonQueryProcedure("KhachHang_Delete", parameters);
        }

    }
}
