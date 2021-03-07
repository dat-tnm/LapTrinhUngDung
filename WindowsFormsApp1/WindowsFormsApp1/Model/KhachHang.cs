using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApp1.Model.Interface;

namespace WindowsFormsApp1.Model
{
    class KhachHang : ADbTable
    {
        public KhachHang()
        {

        }

        public override void SetToInstance(string[] textValues)
        {
            MaKH = textValues[0];
            HoTen = textValues[1];
            TenCongTy = textValues[2];
            MaSoThue = textValues[3];
            DiaChi = textValues[4];
        }

        public string MaKH { get; set; }

        public string HoTen { get; set; }

        public string TenCongTy { get; set; }

        public string MaSoThue { get; set; }

        public string DiaChi { get; set; }




        public override string GetExecProcSelectAllString()
        {
            throw new NotImplementedException();
        }

        public override string GetExecProcSelectWhereString()
        {
            throw new NotImplementedException();
        }

        public override string GetExecProcInsertString()
        {
            return $"EXEC KhachHang_Insert @maKH = '{MaKH}', @hoTen = '{HoTen}', @tenCongTy = '{TenCongTy}', @maSoThue = {MaSoThue}, @diaChi = '{DiaChi}';";
        }

        public override string GetExecProcUpdateString()
        {
            return $"EXEC KhachHang_Update @maKH = '{MaKH}', @hoTen = '{HoTen}', @tenCongTy = '{TenCongTy}', @maSoThue = {MaSoThue}, @diaChi = '{DiaChi}';";
        }

        public override string GetExecProcDeleteString()
        {
            return $"EXEC KhachHang_Delete @maKH = '{MaKH}';";
        }

        public override string[] GetPropertyNameList()
        {
            return new string[5] { "Mã KH", "Họ tên", "Tên công ty", "Mã số thuế", "Địa chỉ" };
        }
    }
}
