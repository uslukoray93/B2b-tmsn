using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GedizMakina.App_Code
{
    public class Tools
    {
        public void UcretIadesiBas(int _CariId, int _SiparisId, int _IadeTurId, int _BankaId, string _Iban, decimal _Tutar)
        {
            App_Code.ConCs cn = new App_Code.ConCs();

            SqlCommand cm = new SqlCommand("Insert Into IadeUcret (CariId, SiparisId, IadeTurId, BankaId, IbanNo, Tutar) Values (" + _CariId + ", " + _SiparisId + ", " + _IadeTurId + ", " + _BankaId + ", '" + _Iban + "', '" + _Tutar + "')", cn._Baglan());
            cm.ExecuteNonQuery();
        }

        public void CariBakiyeBas(int _SiparisId, int _CariId, decimal _Tutar, int _HareketTurId)
        {
            App_Code.ConCs cn = new App_Code.ConCs();

            SqlCommand cm = new SqlCommand("Insert Into CariBakiye (SiparisId, CariId, BorcTutar, HareketTurId) Values (" + _SiparisId + ", " + _CariId + ", '" + _Tutar + "', " + _HareketTurId + ")", cn._Baglan());

            cm.ExecuteNonQuery();
        }

        public void TicketGonder(int _MusteriId, int _Kategori, string _SoruBaslik, string _Soru)
        {
            App_Code.Ticket cn = new Ticket();

            cn.InsUpdDel("Insert Into Ticket (MusteriId, KategoriId, SoruBaslik, Soru) Values ('" + _MusteriId + "', " + _Kategori + ", '" + _SoruBaslik + "', '" + _Soru + "')");
        }

        public void TicketList(int _MusteriId)
        {
            App_Code.Ticket cn = new Ticket();

            cn.DataTableGetir("SELECT t.TicketId, t.MusteriId, t.KategoriId, (SELECT k.Kategori FROM Kategoriler k WHERE k.KategoriId = t.KategoriId) KategoriAdi, t.SoruBaslik,        t.Soru, t.TicketTarihi FROM Ticket t WHERE t.MusteriId = " + _MusteriId + "");
        }
    }
}