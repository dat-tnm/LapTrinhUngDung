using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CongTy_DAL : DAL
    {
        DbCmd db;

        public CongTy_DAL()
        {
            db = new DbCmd();
        }

        public DataTable SelectAll()
        {
            return db.ExecQueryProcedure("CongTy_SelectAll");
        }

        public int Insert(string id, string ten, string diaChi, string SDT, string fax, string maSoThue)
        {
            parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@maCT", id);
            parameters[1] = new SqlParameter("@ten", ten);
            parameters[2] = new SqlParameter("@diaChi", diaChi);
            parameters[3] = new SqlParameter("@SDT", SDT);
            parameters[4] = new SqlParameter("@fax", fax);
            parameters[5] = new SqlParameter("@maSoThue", maSoThue);
            return db.ExecNonQueryProcedure("CongTy_Insert", parameters);
        }

        public int Update(string id, string ten, string diaChi, string SDT, string fax, string maSoThue)
        {
            parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@maCT", id);
            parameters[1] = new SqlParameter("@ten", ten);
            parameters[2] = new SqlParameter("@diaChi", diaChi);
            parameters[3] = new SqlParameter("@SDT", SDT);
            parameters[4] = new SqlParameter("@fax", fax);
            parameters[5] = new SqlParameter("@maSoThue", maSoThue);
            return db.ExecNonQueryProcedure("CongTy_Update", parameters);
        }

        public int Delete(string id)
        {
            parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@maCT", id);

            return db.ExecNonQueryProcedure("CongTy_Delete", parameters);
        }

    }
}
