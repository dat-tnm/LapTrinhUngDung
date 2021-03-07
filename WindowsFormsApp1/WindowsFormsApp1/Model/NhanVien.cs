using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApp1.Model.Interface;

namespace WindowsFormsApp1.Model
{
    class NhanVien : ADbTable
    {
        public string MaNV { get; set; }
        public string HoTen { get; set; }


        public NhanVien()
        {
        }

        public override void SetToInstance(string[] textValues)
        {
            MaNV = textValues[0];
            HoTen = textValues[1];
        }


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
            return $"EXEC NhanVien_Insert @maNV = '{MaNV}', @hoTen = '{HoTen}';";
        }

        public override string GetExecProcUpdateString()
        {
            return $"EXEC NhanVien_Update @maNV = '{MaNV}', @hoTen = '{HoTen}';";
        }

        public override string GetExecProcDeleteString()
        {
            return $"EXEC NhanVien_Delete @maNV = '{MaNV}';";
        }

        public override string[] GetPropertyNameList()
        {
            return new string[2] { "Mã NV", "Họ tên" };
        }
    }
}
