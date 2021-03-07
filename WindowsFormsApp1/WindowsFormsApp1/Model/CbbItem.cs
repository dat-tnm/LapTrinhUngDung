using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1.Model
{
    class CbbItem
    {
        public string Text { get; set; }
        public string Value { get; set; }

        public CbbItem(string text, string value)
        {
            Text = text;
            Value = value;
        }

        public override string ToString()
        {
            return Value;
        }
    }
}
