using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DbCmd
    {
        SqlConnection GetConnection;
        private void KetnoiCSDL()
        {
            GetConnection = new SqlConnection(@"Data Source=DESKTOP-4H2CDN2;Initial Catalog=QLBHang;Persist Security Info=True;User ID=sa;Password=1093218446");
            GetConnection.Open();
        }
        private void NgatKetNoi()
        {
            GetConnection.Close();
            GetConnection.Dispose();
        }

        public DataTable ExecQueryProcedure(string TenSP, SqlParameter[] parameters = null)
        {
            KetnoiCSDL();
            SqlCommand cmd = new SqlCommand(TenSP, GetConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            if (parameters != null)
            {
                cmd.Parameters.AddRange(parameters);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            NgatKetNoi();

            return dt;

        }

        public int ExecNonQueryProcedure(string TenSP, SqlParameter[] parameters)
        {
            KetnoiCSDL();
            SqlCommand cmd = new SqlCommand(TenSP, GetConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(parameters);
            int kq = cmd.ExecuteNonQuery();
            NgatKetNoi();
            return kq;
        }


    }
}
