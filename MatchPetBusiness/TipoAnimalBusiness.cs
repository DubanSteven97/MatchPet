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

        public int UpdateTipoAnimal(TipoAnimal tipAn)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {
                    TipoAnimal tipAnimal = dbContext.TipoAnimal.Where(x => x.idTipoAnimal == tipAn.idTipoAnimal).FirstOrDefault();
                    tipAnimal.nombre = tipAn.nombre;
                    tipAnimal.descripcion = tipAn.descripcion;
                    tipAnimal.img = tipAn.img; 
                    tipAnimal.fechaCreacion = tipAn.fechaCreacion;
                    tipAnimal.ruta = tipAn.ruta;
                    tipAnimal.estado = tipAn.estado;

                    result = dbContext.SaveChanges();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public string delTipoAnimal(int id)
        {
            try
            {
                string result = "ok";
                using (var dbContext = new DBMatchpet())
                {


                    //Validación para ver si esta asignado a un animañ

                    Animal tipAnimal = dbContext.Animal.Where(x => x.idTipoAnimal == id).FirstOrDefault();

                    if (tipAnimal != null)
                    {
                        return "exist";
                    }

                    // Busca el animal que deseas eliminar logicamnete por su ID.
                    var tipoAnimal = dbContext.TipoAnimal.FirstOrDefault(o => o.idTipoAnimal == id);

                    if (tipoAnimal == null)
                    {
                        return "error";
                    }

                    // Aplica los cambios para el borrado logico
                    tipoAnimal.estado = 0;


                    // Guarda los cambios en la base de datos.
                    dbContext.SaveChanges();
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
