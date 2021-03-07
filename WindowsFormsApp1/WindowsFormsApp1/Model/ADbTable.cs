using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1.Model
{
    abstract class ADbTable
    {
        public abstract void SetToInstance(string[] textValues);

        public abstract string GetExecProcSelectAllString();

        public abstract string GetExecProcSelectWhereString();

        public abstract string GetExecProcInsertString();

        public abstract string GetExecProcUpdateString();

        public abstract string GetExecProcDeleteString();

        public abstract string[] GetPropertyNameList();
    }
}
