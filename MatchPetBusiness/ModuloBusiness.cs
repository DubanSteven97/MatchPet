using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class ModuloBusiness
    {
        public ModuloBusiness()
        {
        }

        public List<spGetModulos_Result> GetModuloList()
        {
            try
            {
                List<spGetModulos_Result> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.spGetModulos().ToList();

                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /*
        public Organizacion GetOrganizacionById(int id)
        {
            try
            {
                Organizacion result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.Organizacion.Where(x => x.estado == 1 && x.idOrganizacion == id).FirstOrDefault();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool setOrganizacion(Organizacion org)
        {
            try
            {
                bool result = false;
                using (var dbContext = new DBMatchpet())
                {
                    dbContext.Organizacion.Add(org);

                    result = dbContext.SaveChanges() >= 1;
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }*/
    }
}
