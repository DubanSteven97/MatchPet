using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class TipoAnimalBusiness
    {
        public TipoAnimalBusiness()
        {
        }

        public List<spTipoAnimales_Result> GetTipoAnimalList()
        {
            try
            {
                List<spTipoAnimales_Result> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.spTipoAnimales().ToList();

                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public TipoAnimal GetTipoAnimalById(int id)
        {
            try
            {
                TipoAnimal result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.TipoAnimal.Where(x => x.idTipoAnimal == id).FirstOrDefault();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int setTipoAnimal(TipoAnimal org)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {

                    var tipoAnimal = dbContext.TipoAnimal.FirstOrDefault(o => o.nombre == org.nombre);


                    if (tipoAnimal != null)
                    {
                        return 2;
                    }
                    dbContext.TipoAnimal.Add(org);
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
