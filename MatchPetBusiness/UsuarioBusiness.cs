using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class UsuarioBusiness
    {
        public UsuarioBusiness()
        {
        }
        public List<spGetUsuarios_Result> GetSpGetUsuarios(string nombre, string apellido)
        {
            try
            {
                List<spGetUsuarios_Result> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.spGetUsuarios(nombre, apellido, 1).ToList();
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
