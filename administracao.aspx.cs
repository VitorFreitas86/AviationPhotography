using sweptwings.BAL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweptwings
{
    public partial class administracao : System.Web.UI.Page
    {
        BAL_registo registo = new BAL_registo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                GridView1.DataSource = registo.get_all_registo();
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "apagar")
            {
                ///GET ID OF OPERADORES
                GridViewRow linha = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                int DemoId = Convert.ToInt32(linha.RowIndex.ToString());
                int ID = Convert.ToInt32(GridView1.DataKeys[linha.RowIndex].Value.ToString());
                //APAGAR E CARREGAR OUTRA VEZ A GRIDVIEW

                registo.delete_registo(ID);
                GridView1.DataSource = registo.get_all_registo();
                GridView1.DataBind();

              

                string strPhysicalFolder = Server.MapPath("/fotos/");

                string strFileFullPath = strPhysicalFolder + ID+".Jpeg";

                if (System.IO.File.Exists(strFileFullPath))
                {
                    System.IO.File.Delete(strFileFullPath);
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                // when mouse is over the row, save original color to new attribute, and change it to highlight color
                e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#66CCFF'");
                // when mouse leaves the row, change the bg color to its original value   
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
            }
        }

        private ImageCodecInfo GetEncoder(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string tb_aircraft = (GridView1.Rows[e.RowIndex].FindControl("tb_aircraft") as TextBox).Text;
            string tb_airline = (GridView1.Rows[e.RowIndex].FindControl("tb_airline") as TextBox).Text;
            string tb_reg = (GridView1.Rows[e.RowIndex].FindControl("tb_reg") as TextBox).Text;
            string tb_msn = (GridView1.Rows[e.RowIndex].FindControl("tb_msn") as TextBox).Text;
            string tb_airport = (GridView1.Rows[e.RowIndex].FindControl("tb_airport") as TextBox).Text;
            string tb_datar = (GridView1.Rows[e.RowIndex].FindControl("tb_datar") as TextBox).Text;
            string tb_remark = (GridView1.Rows[e.RowIndex].FindControl("tb_remark") as TextBox).Text;
            //int ID = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("lb_id_editing") as Label).Text);
            int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            registo.update_registo(tb_aircraft.Trim(), tb_airline.Trim(), tb_reg.Trim(), tb_msn.Trim(), tb_airport.Trim(), tb_datar, tb_remark, ID);

            FileUpload fileupload2 = (GridView1.Rows[e.RowIndex].FindControl("fileupload2") as FileUpload);

            if (fileupload2.HasFile)
            {
                byte[] img = new byte[fileupload2.PostedFile.ContentLength - 1];
                byte[] img2 = new byte[fileupload2.PostedFile.ContentLength - 1];
                //img = fileupload2.FileBytes;
                //byte[] img = new byte[FileUpload1.PostedFile.ContentLength - 1];

                string watermarkText = "© João Toste Aviation Photography";
                string extensao = System.IO.Path.GetExtension(fileupload2.FileName);
                //Get the file name.
                string fileName = Path.GetFileNameWithoutExtension(fileupload2.PostedFile.FileName) + "." + extensao;
                Bitmap miniatura;
                //Read the File into a Bitmap.
                using (Bitmap bmp = new Bitmap(fileupload2.PostedFile.InputStream, false))
                {
                    int width = bmp.Width;
                    int height = bmp.Height;
                    using (Graphics grp = Graphics.FromImage(bmp))
                    {
                        using (System.Drawing.SolidBrush myBrush = new System.Drawing.SolidBrush(System.Drawing.Color.Black))
                        {
                            grp.FillRectangle(myBrush, new Rectangle(0, height - 16, width, 30)); // whatever
                                                                                                  // and so on...
                        } // myBrush will be disposed at this line
                        //Set the Color of the Watermark text.
                        Brush brush = new SolidBrush(Color.WhiteSmoke);
                        //grp.Clear(Color.Black);
                        //Set the Font and its size.
                        Font font = new System.Drawing.Font("Arial", 12, FontStyle.Bold, GraphicsUnit.Pixel);

                        //Determine the size of the Watermark text.
                        SizeF textSize = new SizeF();
                        textSize = grp.MeasureString(watermarkText, font);

                        //Position the text and draw it on the image.
                        Point position = new Point((bmp.Width - ((int)textSize.Width + 10)), (bmp.Height - ((int)textSize.Height + 2)));
                        grp.DrawString(watermarkText, font, brush, position);

                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            //Save the Watermarked image to the MemoryStream.
                            // bmp.Save(memoryStream, ImageFormat.Jpeg);
                            ImageCodecInfo jgpEncoder = GetEncoder(ImageFormat.Jpeg);
                            System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
                            EncoderParameters myEncoderParameters = new EncoderParameters(1);
                            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 100L);
                            myEncoderParameters.Param[0] = myEncoderParameter;

                            bmp.Save(memoryStream, jgpEncoder, myEncoderParameters);
                            memoryStream.Position = 0;
                            img = memoryStream.ToArray();
                        }
                    }
                  
                    using (MemoryStream memoryStream2 = new MemoryStream())
                    {
                        //Save the Watermarked image to the MemoryStream.
                        //CreateThumbnail(fileupload2, 250, 150).Save(memoryStream2, ImageFormat.Jpeg);
                        miniatura = CreateThumbnail(fileupload2, 250, 150);
                        miniatura.Save(memoryStream2, ImageFormat.Jpeg);
                        memoryStream2.Position = 0;
                        img2 = memoryStream2.ToArray();
                    }
                    registo.update_imagem(img, ID,img2);
                }

                string path = Server.MapPath("/fotos/");
                miniatura.Save(path + ID + ".Jpeg", ImageFormat.Jpeg);

            }
            
            Response.Redirect(Request.RawUrl);
        }

        public static Bitmap CreateThumbnail(FileUpload FileUpload1, int lnWidth, int lnHeight)
        {
            System.Drawing.Bitmap bmpOut = null;
            try
            {
                Bitmap loBMP = new Bitmap(FileUpload1.PostedFile.InputStream, false);
                //Bitmap loBMP = new Bitmap(lcFilename);
                ImageFormat loFormat = loBMP.RawFormat;

                decimal lnRatio;
                int lnNewWidth = 0;
                int lnNewHeight = 0;

                //*** If the image is smaller than a thumbnail just return it
                if (loBMP.Width < lnWidth && loBMP.Height < lnHeight)
                    return loBMP;

                if (loBMP.Width > loBMP.Height)
                {
                    lnRatio = (decimal)lnWidth / loBMP.Width;
                    lnNewWidth = lnWidth;
                    decimal lnTemp = loBMP.Height * lnRatio;
                    lnNewHeight = (int)lnTemp;
                }
                else
                {
                    lnRatio = (decimal)lnHeight / loBMP.Height;
                    lnNewHeight = lnHeight;
                    decimal lnTemp = loBMP.Width * lnRatio;
                    lnNewWidth = (int)lnTemp;
                }
                bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
                Graphics g = Graphics.FromImage(bmpOut);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.FillRectangle(Brushes.White, 0, 0, lnNewWidth, lnNewHeight);
                g.DrawImage(loBMP, 0, 0, lnNewWidth, lnNewHeight);

                loBMP.Dispose();
            }
            catch
            {
                return null;
            }

            return bmpOut;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = registo.get_all_registo();
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = registo.get_all_registo();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\inserir.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\utilizadores.aspx");
        }

        //---------------------------------
        public static Bitmap CreateThumbnail(string lcFilename, int lnWidth, int lnHeight)
        {
            System.Drawing.Bitmap bmpOut = null;
            try
            {
                Bitmap loBMP = new Bitmap(lcFilename);
                ImageFormat loFormat = loBMP.RawFormat;

                decimal lnRatio;
                int lnNewWidth = 0;
                int lnNewHeight = 0;

                //*** If the image is smaller than a thumbnail just return it
                if (loBMP.Width < lnWidth && loBMP.Height < lnHeight)
                    return loBMP;

                if (loBMP.Width > loBMP.Height)
                {
                    lnRatio = (decimal)lnWidth / loBMP.Width;
                    lnNewWidth = lnWidth;
                    decimal lnTemp = loBMP.Height * lnRatio;
                    lnNewHeight = (int)lnTemp;
                }
                else
                {
                    lnRatio = (decimal)lnHeight / loBMP.Height;
                    lnNewHeight = lnHeight;
                    decimal lnTemp = loBMP.Width * lnRatio;
                    lnNewWidth = (int)lnTemp;
                }
                bmpOut = new Bitmap(lnNewWidth, lnNewHeight);
                Graphics g = Graphics.FromImage(bmpOut);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.FillRectangle(Brushes.White, 0, 0, lnNewWidth, lnNewHeight);
                g.DrawImage(loBMP, 0, 0, lnNewWidth, lnNewHeight);

                loBMP.Dispose();
            }
            catch
            {
                return null;
            }

            return bmpOut;
        }
        //----------------------------------- 
    }
}