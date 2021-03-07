using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp1.Model;
using WindowsFormsApp1.Model.Interface;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        string connectionString = @"Data Source=DESKTOP-4H2CDN2;Initial Catalog=QLBHang;Persist Security Info=True;User ID=sa;Password=1093218446";
        List<Label> labels;
        List<TextBox> textBoxes;
        string[] modelProperties;
        ADbTable model;

        public Form1()
        {
            InitializeComponent();

            labels = new List<Label>() { label1, label2, label3, label4, label5, label6, label7, label8 };
            textBoxes = new List<TextBox>() { textBox1, textBox2, textBox3, textBox4, textBox5, textBox6, textBox7, textBox8 };
            model = new CongTy();

            var listCbbItem = new List<CbbItem>()
            {
                new CbbItem("Chi tiết hóa đơn", "ChiTietHoaDon"),
                new CbbItem("Công ty", "CongTy"),
                new CbbItem("Hóa đơn", "HoaDon"),
                new CbbItem("Khách hàng", "KhachHang"),
                new CbbItem("Nhân viên", "NhanVien"),
                new CbbItem("Sản phẩm dịch vụ", "SanPhamDV"),
            };
            comboBox1.DataSource = listCbbItem;
            comboBox1.DisplayMember = "Text";
            comboBox1.ValueMember = "Value";

            LoadLabelTextboxes();
        }


        DataTable SelectQueryToSQL(string query) 
        {
            SqlConnection sql = new SqlConnection(connectionString);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connectionString);
            DataTable dt = new DataTable();
            sqlDataAdapter.Fill(dt);

            sql.Close();
            sql.Dispose();

            return dt;
        }

        void NonQueryToSQL(string nonQueryString)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(nonQueryString, con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            int rowAffected = cmd.ExecuteNonQuery();
            con.Close();
        }

        void LoadLabelTextboxes()
        {
            modelProperties = model.GetPropertyNameList();
            for (int i = 0; i < modelProperties.Length; i++)
            {
                labels[i].Text = modelProperties[i];
                labels[i].Visible = true;
                textBoxes[i].Visible = true;
            }

            for (int i = modelProperties.Length; i < labels.Count; i++)
            {
                labels[i].Visible = false;
                textBoxes[i].Visible = false;
            }
        }




        //Event
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < modelProperties.Length; i++)
            {
                textBoxes[i].Clear();
            }
            var tableName = comboBox1.SelectedValue.ToString();
            string query = "Select * from " + tableName;
            dataGV.DataSource = SelectQueryToSQL(query);

            switch (tableName)
            {
                case "NhanVien":
                    model = new NhanVien();
                    break;
                case "SanPhamDV":
                    model = new SanPhamDV();
                    break;
                case "KhachHang":
                    model = new KhachHang();
                    break;
                case "CongTy":
                    model = new CongTy();
                    break;
                default:
                    return;
            }
            LoadLabelTextboxes();
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            btnSave.Enabled = true;
            for (int i = 0; i < modelProperties.Length; i++)
            {
                textBoxes[i].Clear();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            string[] textValues = textBoxes.Select(tb => tb.Text).ToArray();
            
            try
            {
                model.SetToInstance(textValues);
            }
            catch (Exception)
            {
                MessageBox.Show("Giá, số lượng phải nhập số !", "Ối dồi ôi lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            NonQueryToSQL(model.GetExecProcInsertString());
            btnSave.Enabled = false;
            comboBox1_SelectedIndexChanged(sender, e);
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (dataGV.SelectedCells.Count == 0)
                return;

            ADbTable model;
            switch (comboBox1.SelectedValue.ToString())
            {
                case "NhanVien":
                    model = new NhanVien() { MaNV = textBox1.Text };
                    break;
                case "SanPhamDV":
                    model = new SanPhamDV() { MaSPDV = textBox1.Text };
                    break;
                default:
                    return;
            }
            NonQueryToSQL(model.GetExecProcDeleteString());
            comboBox1_SelectedIndexChanged(sender, e);
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (dataGV.SelectedCells.Count == 0)
                return;

            string[] textValues = textBoxes.Select(tb => tb.Text).ToArray();

            try
            {
                model.SetToInstance(textValues);
            }
            catch (Exception)
            {
                MessageBox.Show("Giá, số lượng phải nhập số !", "Ối dồi ôi lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            NonQueryToSQL(model.GetExecProcUpdateString());
            comboBox1_SelectedIndexChanged(sender, e);
        }

        private void dataGV_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int row = e.RowIndex;
            for (int i = 0; i < modelProperties.Length; i++)
            {
                textBoxes[i].Text = dataGV.Rows[row].Cells[i].Value.ToString();
            }
        }
    }
}
