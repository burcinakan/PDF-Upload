using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using DataAccessLayer;

namespace YardımProjesi.Admin
{
    public partial class fileupload : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Kategori> Kategoriler = dm.KategoriListele();
            ddl_kategoriler.DataSource = Kategoriler;
            ddl_kategoriler.DataBind();


            if (!IsPostBack)
            {
                LoadData();
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            string filelocation = GridView1.Rows[rowIndex].Cells[3].Text;
            string FilePath = Server.MapPath(filelocation);
            WebClient User = new WebClient();
            Byte[] FileBuffer = User.DownloadData(FilePath);
            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }




        }
        void LoadData()
        {
            var st = from s in db.Dosyalar select s;
            GridView1.DataSource = st;
            GridView1.DataBind();

        }



        DataClasses1DataContext db = new DataClasses1DataContext();
        protected void Button1_Click(object sender, EventArgs e)
        {
            string fname = FileUpload1.FileName;
            string flocation = "PDF File/";
            string pathstring = System.IO.Path.Combine(flocation, fname);
            var st = new Dosyalar
            {
                FileName = TextBox1.Text,
                FileLocation = pathstring,

            };
            db.Dosyalar.InsertOnSubmit(st);
            db.SubmitChanges();
            FileUpload1.SaveAs(MapPath(pathstring));
            Label1.Text = "Başarılı";
            LoadData();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}