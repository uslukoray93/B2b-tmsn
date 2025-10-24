using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GedizMakina.App_Code
{
    public class ConCs
    {
        public SqlConnection _Baglan()
        {
            string _ConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["gediz"].ConnectionString;
            //"Data Source=213.142.145.250;Initial Catalog=senbendenal_master;Persist Security Info=True;User ID=CeBoSoft_sba;Password=Cs153575";

            SqlConnection cn = new SqlConnection(_ConnectionStrings);

            SqlConnection.ClearPool(cn);
            SqlConnection.ClearAllPools();

            cn.Open();

            return (cn);
        }


        public int InsUpdDel(string _Sql)
        {
            SqlConnection _Baglan = this._Baglan();
            SqlCommand cm = new SqlCommand(_Sql, _Baglan);

            //cm.CommandType = CommandType.StoredProcedure;
            //SqlCommandBuilder.DeriveParameters(cm);

            int _Sonuc = 0;

            try
            {
                _Sonuc = cm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            cm.Dispose();
            _Baglan.Close();
            _Baglan.Dispose();

            return (_Sonuc);
        }


        public DataTable DataTableGetir(string _Sql)
        {
            SqlConnection _Baglan = this._Baglan();
            SqlDataAdapter da = new SqlDataAdapter(_Sql, _Baglan);
            DataTable dt = new DataTable();

            try
            {
                da.Fill(dt);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            da.Dispose();
            _Baglan.Close();
            _Baglan.Dispose();

            return dt;
        }




        public DataRow DataRowGetir(string _Sql)
        {
            DataTable _Tablo = DataTableGetir(_Sql);
            if (_Tablo.Rows.Count == 0) return null;
            return _Tablo.Rows[0];
        }
    }
}