using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CTHD_DAL : DAL
    {
        DbCmd db;

        public CTHD_DAL()
        {
            db = new DbCmd();
        }

        public DataTable SelectAll()
        {
            return db.ExecQueryProcedure("ChiTietHoaDon_SelectAll");
        }

        public int Insert(string id, string maSPDV, string soLuong, string donGIa)
        {
            parameters = new SqlParameter[4];
            parameters[0] = new SqlParameter("@soHD", id);
            parameters[1] = new SqlParameter("@maSPDV", maSPDV);
            parameters[2] = new SqlParameter("@soLuong", soLuong);
            parameters[3] = new SqlParameter("@donGia", donGIa);
            return db.ExecNonQueryProcedure("ChiTietHoaDon_Insert", parameters);
        }

        public int Update(string id, string maSPDV, string soLuong, string donGIa)
        {
            parameters = new SqlParameter[4];
            parameters[0] = new SqlParameter("@soHD", id);
            parameters[1] = new SqlParameter("@maSPDV", maSPDV);
            parameters[2] = new SqlParameter("@soLuong", soLuong);
            parameters[3] = new SqlParameter("@donGia", donGIa);
            return db.ExecNonQueryProcedure("ChiTietHoaDon_Update", parameters);
        }

        public int Delete(string id, string maSPDV)
        {
            parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@soHD", id);
            parameters[1] = new SqlParameter("@maSPDV", maSPDV);

            return db.ExecNonQueryProcedure("ChiTietHoaDon_Delete", parameters);
        }

        public DataTable SelectWhere(string idHoaDon)
        {
            parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@soHD", idHoaDon);

            return db.ExecQueryProcedure("ChiTietHoaDon_SelectWhereId", parameters);
        }

//CREATE PROCEDURE ChiTietHoaDon_SelectWhereId
//@soHD CHAR(10)
//AS
//    SELECT ct.MaSPDV as [Mã hàng], SanPhamDV.Ten as [Tên hàng], SanPhamDV.DVT, ct.DonGia as [Đơn giá], ct.SoLuong as [Số lượng], (ct.DonGia * ct.SoLuong) as [Thành tiền]

//    FROM dbo.ChiTietHoaDon as ct inner join SanPhamDV on ct.MaSPDV = SanPhamDV.MaSPDV

//    WHERE SoHD = @soHD
    }
}
