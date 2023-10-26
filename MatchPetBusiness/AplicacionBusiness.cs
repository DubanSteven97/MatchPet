using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class AplicacionBusiness
    {
        public AplicacionBusiness()
        {
        }
        public Aplicacion GetAutorization(string user, string pass)
        {
            try
            {
                Aplicacion result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = (from a in dbContext.Aplicacion
                              where a.estado == 1
                              && a.usuario == user
                              && a.clave == pass
                              select a).FirstOrDefault();
                }
                return result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public int SetToken(int id, string token, DateTime expire)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.spSetTokenApp(id, token, expire);
                    return result;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
