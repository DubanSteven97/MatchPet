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

        public List<spOrganizaciones_Result> GetOrganizacionsList()
        {
            try
            {
                List<spOrganizaciones_Result> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.spOrganizaciones().ToList();

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
                    result = dbContext.Organizacion.Where(x => x.idOrganizacion == id).FirstOrDefault();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int setOrganizacion(Organizacion org)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {
                    dbContext.Organizacion.Add(org);
                    result = dbContext.SaveChanges();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public int updateOrganizacion(Organizacion org)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {
                    Organizacion organizacion = dbContext.Organizacion.Where(x => x.idOrganizacion == org.idOrganizacion).FirstOrDefault();
                    organizacion.nombre = org.nombre;
                    organizacion.telefono = org.telefono;
                    organizacion.direccion = org.direccion;
                    organizacion.descripcion = org.descripcion;
                    organizacion.estado = org.estado;

                    result = dbContext.SaveChanges();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Persona> GetUserByOrganizacions(int id)
        {
            try
            {
                List<Persona> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.Persona.Where(x => x.idOrganizacion == id).ToList();
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