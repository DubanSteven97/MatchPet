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
    }
}
