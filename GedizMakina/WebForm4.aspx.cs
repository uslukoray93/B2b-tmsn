using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string[] birler = { "", "Bir", "İki", "Üç", "Dört", "Beş", "Altı", "Yedi", "Sekiz", "Dokuz" };
        string[] onlar = { "", "On", "Yirmi", "Otuz", "Kırk", "Elli", "Altmış", "Yetmiş", "Seksen", "Doksan" };
        string[] gruplar = { "", "Bin", "Milyon", "Milyar", "Trilyon", "Katrilyon", "Kentilyon", "Seksilyon", "Septilyon", "Oktilyon", "Nonilyon", "Desilyon", "Undesilyon", "Dodesilyon", "Tredesilyon", "Kattuordesilyon", "Kendesilyon", "Sexdesilyon", "Septendesilyon", "Oktodesilyon", "Novemdesilyon", "Vigintilyon", "Unvigintilyon", "Dovigintilyon", "Trevigintilyon", "Kattuorvigintilyon", "Kenvigintilyon", "Sexvigintilyon", "Septenvigintilyon", "Oktovigintilyon", "Novemvigintilyon", "Trigintilyon", "Untrigintilyon", "Dotrigintilyon", "Googol" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            decimal tutar = Convert.ToDecimal(ASPxTextBox1.Text);
            long lira = (long)Math.Floor(tutar);
            int kurus = (int)Math.Floor((tutar - lira) * 100);

            string liraYaziyla = TutariYaziyaCevir(lira);
            string kurusYaziyla = KurusuCevir(kurus);

            string tutarYaziyla = liraYaziyla + " Türk Lirası " + kurusYaziyla;
            //Console.WriteLine("Yazıyla: " + tutarYaziyla);

            ASPxLabel1.Text = tutarYaziyla.ToString();
        }

        string TutariYaziyaCevir(long sayi)
        {
            if (sayi == 0)
                return "Sıfır";

            string cevirilen = "";

            int grupIndeksi = 0;
            while (sayi > 0)
            {
                int grupDegeri = (int)(sayi % 1000);
                if (grupDegeri > 0)
                {
                    string grupDegeriYaziyla = GrupDegeriniCevir(grupDegeri, grupIndeksi == 1);
                    cevirilen = grupDegeriYaziyla + " " + gruplar[grupIndeksi] + " " + cevirilen;
                }
                sayi /= 1000;
                grupIndeksi++;
            }

            return cevirilen.Trim();
        }

        string GrupDegeriniCevir(int sayi, bool binlikGrubu)
        {
            int yuzler = sayi / 100;
            int onlarBasamagi = (sayi % 100) / 10;
            int birlerBasamagi = sayi % 10;

            string yaziyla = "";

            if (yuzler > 0)
            {
                if (yuzler == 1)
                    yaziyla += "Yüz ";
                else
                    yaziyla += birler[yuzler] + " Yüz ";
            }

            if (onlarBasamagi > 0)
                yaziyla += onlar[onlarBasamagi] + " ";

            if (birlerBasamagi > 0)
            {
                if (binlikGrubu && birlerBasamagi == 1)
                    yaziyla += "";
                else
                    yaziyla += birler[birlerBasamagi] + " ";
            }

            return yaziyla;
        }

        string KurusuCevir(int kurus)
        {
            string kurusYaziyla = TutariYaziyaCevir(kurus);

            if (kurus == 0)
                return "";

            if (kurusYaziyla == "Bir")
                kurusYaziyla = "Bir Kuruş";
            else
                kurusYaziyla += " Kuruş";

            return kurusYaziyla;
        }
    }
}