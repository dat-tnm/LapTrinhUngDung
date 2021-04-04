using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class HoaDon_DAL : DAL
    {
        DbCmd db;

        public HoaDon_DAL()
        {
            db = new DbCmd();
        }

        public DataTable SelectAll()
        {
            return db.ExecQueryProcedure("HoaDon_SelectAll");
        }

        public DataTable SelectWhereId(string soHD)
        {
            parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@soHD", soHD);
            return db.ExecQueryProcedure("HoaDon_SelectWhereId", parameters);
        }

        //    CREATE PROCEDURE HoaDon_SelectAll
        //    AS

        //SELECT KhachHang.HoTen as [Tên khách hàng], HoaDon.SoHD as [Số hóa đơn], HoaDon.NgayTao, NhanVien.HoTen as [Tên nhân viên]
        //FROM dbo.HoaDon inner join NhanVien on HoaDon.MaNV = NhanVien.MaNV
        //inner join KhachHang on HoaDon.MaKH = KhachHang.MaKH

        public int Insert(string id, string maKH, string maNV, string maCT, string tenHD)
        {
            parameters = new SqlParameter[5];
            parameters[0] = new SqlParameter("@soHD", id);
            parameters[1] = new SqlParameter("@maKH", maKH);
            parameters[2] = new SqlParameter("@maNV", maNV);
            parameters[3] = new SqlParameter("@maCT", maCT);
            parameters[4] = new SqlParameter("@tenHD", tenHD);
            return db.ExecNonQueryProcedure("HoaDon_Insert", parameters);
        }

        public int Update(string id, string maKH, string maNV, string maCT, string tenHD)
        {
            parameters = new SqlParameter[5];
            parameters[0] = new SqlParameter("@soHD", id);
            parameters[1] = new SqlParameter("@maKH", maKH);
            parameters[2] = new SqlParameter("@maNV", maNV);
            parameters[3] = new SqlParameter("@maCT", maCT);
            parameters[4] = new SqlParameter("@tenHD", tenHD);
            return db.ExecNonQueryProcedure("HoaDon_Update", parameters);
        }

        public int Delete(string id)
        {
            parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@soHD", id);

            return db.ExecNonQueryProcedure("HoaDon_Delete", parameters);
        }

    }
}
