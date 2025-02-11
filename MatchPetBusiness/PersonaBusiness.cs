using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class PersonaBusiness
    {
        public PersonaBusiness()
        {
        }

        public List<Persona> getUsuarios()
        {
            try
            {
                List<Persona> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    var us = from u in dbContext.Persona
                              select u;
                    result = (List<Persona>)us.ToList();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Persona Login(string email, string pass)
        {
            try
            {
                Persona result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = (from p in dbContext.Persona
                              where p.estado == 1
                              && p.email == email
                              && p.password == pass
                              select p).FirstOrDefault();
                }
                return result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
