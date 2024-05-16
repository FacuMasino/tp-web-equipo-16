using DataAccessLayer;
using System;
using System.Net;

namespace Utilities
{
    public static class Helper
    {
        public static int GetLastId(string table)
        {
            int lastId = 0;
            DataAccess dataAccess = new DataAccess();

            try
            {
                dataAccess.SetQuery("select ident_current(@Table) as LastId");
                dataAccess.SetParameter("@Table", table);
                dataAccess.ExecuteRead();

                if (dataAccess.Reader.Read())
                {
                    lastId = Convert.ToInt32(dataAccess.Reader["LastId"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dataAccess.CloseConnection();
            }

            return lastId;
        }

        public static bool IsAccesibleImage(string url)
        {
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "HEAD";
            try
            {
                using (var resp = request.GetResponse() as HttpWebResponse)
                {
                    if (resp != null && resp.StatusCode == HttpStatusCode.OK)
                    {
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
