using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class HD_CTHD_BLL
    {
        HoaDon_DAL hoaDon_DAL;
        CTHD_DAL cthd_DAL;

        public DataTable HoaDon_SelectAll()
        {
            return hoaDon_DAL.SelectAll();
        }

    }
}
