using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApp1.Model.Interface;

namespace WindowsFormsApp1.Model
{
    class CongTy : ADbTable
    {
        public CongTy()
        {

        }

        public override void SetToInstance(string[] textValues)
        {
            MaCT = textValues[0];
            Ten = textValues[1];
            DiaChi = textValues[2];
            SDT = textValues[3];
            Fax = textValues[4];
            MaSoThue = textValues[5];
        }

        public string MaCT { get; set; }

        public string Ten { get; set; }

        public string DiaChi { get; set; }

        public string SDT { get; set; }

        public string Fax { get; set; }

        public string MaSoThue { get; set; }


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
            return $"EXEC CongTy_Insert @maSPDV = '{MaCT}', @ten = '{Ten}', @diaChi = '{DiaChi}', @SDT = {SDT}, @fax = {Fax}, @maSoThue = {MaSoThue};";
        }

        public override string GetExecProcUpdateString()
        {
            return $"EXEC CongTy_Update @maSPDV = '{MaCT}', @ten = '{Ten}', @diaChi = '{DiaChi}', @SDT = {SDT}, @fax = {Fax}, @maSoThue = {MaSoThue};";
        }

        public override string GetExecProcDeleteString()
        {
            return $"EXEC CongTy_Delete @maSPDV = '{MaCT}';";
        }

        public override string[] GetPropertyNameList()
        {
            return new string[6] { "Mã công ty", "Tên công ty", "Địa chỉ", "SDT", "Fax", "Mã số thuế" };
        }
    }
}
