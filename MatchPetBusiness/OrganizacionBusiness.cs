using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class OrganizacionBusiness
    {
        public OrganizacionBusiness()
        {
        }

        public List<Organizacion> GetOrganizacionsList()
        {
            try
            {
                List<Organizacion> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = (from o in dbContext.Organizacion
                              where o.estado == 1
                              select o).ToList();

                    //TODO:El error cel ciclo es porque intenta mostrar los animales que tiene asociados
                    /*foreach (var org in result)
                    {
                        org.Animal = null;
                    }*/
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

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
        }
    }
}
