using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApp1.Model.Interface;

namespace WindowsFormsApp1.Model
{
    class SanPhamDV : ADbTable
    {
        public SanPhamDV()
        {

        }

        public override void SetToInstance(string[] textValues)
        {
            MaSPDV = textValues[0];
            Ten = textValues[1];
            DVT = textValues[2];
            DonGia = double.Parse(textValues[3]);
        }

        public string MaSPDV { get; set; }

        public string Ten { get; set; }

        public string DVT { get; set; }

        public double DonGia { get; set; }



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
            return $"EXEC SanPhamDV_Insert @maSPDV = '{MaSPDV}', @ten = '{Ten}', @DVT = '{DVT}', @donGia = {DonGia};";
        }

        public override string GetExecProcUpdateString()
        {
            return $"EXEC SanPhamDV_Update @maSPDV = '{MaSPDV}', @ten = '{Ten}', @DVT = '{DVT}', @donGia = {DonGia};";
        }

        public override string GetExecProcDeleteString()
        {
            return $"EXEC SanPhamDV_Delete @maSPDV = '{MaSPDV}';";
        }

        public override string[] GetPropertyNameList()
        {
            return new string[4] { "Mã SPDV", "Tên SPDV", "Đơn vị tính", "Đơn giá" };
        }
    }
}
