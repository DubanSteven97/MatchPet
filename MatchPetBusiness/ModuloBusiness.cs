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
        
        public Modulo GetModuloById(int id)
        {
            try
            {
                Modulo result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.Modulo.Where(x => x.idModulo == id).FirstOrDefault();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public int insertModulo(Modulo mod)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {
                    dbContext.Modulo.Add(mod);

                    result = dbContext.SaveChanges();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int updateModulo(Modulo mod)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {
                    Modulo modulo = dbContext.Modulo.Where(x => x.idModulo == mod.idModulo).FirstOrDefault();
                    modulo.titulo = mod.titulo;
                    modulo.descripcion = mod.descripcion;
                    modulo.icono = mod.icono;
                    modulo.ruta = mod.ruta;
                    modulo.estado = mod.estado;

                    result = dbContext.SaveChanges();
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
