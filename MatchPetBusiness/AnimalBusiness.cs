using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class AnimalBusiness
    {
        public AnimalBusiness()
        {
        }


        public List<spGetAnimales_Result> GetAnimalesList()
        {
            try
            {
                List<spGetAnimales_Result> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.spGetAnimales().ToList();

                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int setAnimal(Animal anim)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {

                    dbContext.Animal.Add(anim);
                    dbContext.SaveChanges();
                    result = anim.idAnimal;


                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int setImagenAnimal(Imagen img)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {

                    dbContext.Imagen.Add(img);
                    result = dbContext.SaveChanges();

                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Animal GetAnimalById(int id)
        {
            try
            {
                Animal result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.Animal.Where(x => x.idAnimal == id).FirstOrDefault();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Imagen> GetImgByAnimald(int id)
        {
            try
            {
                List<Imagen> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.Imagen.Where(x => x.idAnimal == id && x.estado == 1).ToList();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public int updateAnimal(Animal animal)
        {
            try
            {
                int result = 0;
                using (var dbContext = new DBMatchpet())
                {
                    Animal anim = dbContext.Animal.Where(x => x.idAnimal == animal.idAnimal).FirstOrDefault();
                    anim.nombre = animal.nombre;
                    anim.idOrganizacion = animal.idOrganizacion;
                    anim.idTipoAnimal = animal.idTipoAnimal;
                    anim.fechaCreacion = animal.fechaCreacion;
                    anim.fecha_nacimiento = animal.fecha_nacimiento;
                    anim.genero = animal.genero;
                    anim.ruta = animal.ruta;
                    anim.estado = animal.estado;

                    result = dbContext.SaveChanges();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string delAnimal(int id)
        {
            try
            {
                string result = "ok";
                using (var dbContext = new DBMatchpet())
                {


                    //Validación para ver si esta asignado a un proceso de adopción

                    ProcesoAdopcion anim = dbContext.ProcesoAdopcion.Where(x => x.idAnimal == id && x.estado != 0).FirstOrDefault();

                    if (anim != null)
                    {
                        return "exist";
                    }


                    // Busca el animal que deseas eliminar logicamnete por su ID.
                    var animal = dbContext.Animal.FirstOrDefault(o => o.idAnimal == id);

                    if (animal == null)
                    {
                        return "error";
                    }

                    // Aplica los cambios para el borrado logico
                    animal.estado = 0;


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

        public string delFileAnimal(int id, int idImagen)
        {
            try
            {
                string result = "ok";
                using (var dbContext = new DBMatchpet())
                {



                    // Busca la imagen que deseas eliminar logicamnete por su ID.
                    var imgAnimal = dbContext.Imagen.FirstOrDefault(o => o.idAnimal == id && o.idImagen == idImagen);

                    if (imgAnimal == null)
                    {
                        return "error";
                    }

                    // Aplica los cambios para el borrado logico
                    imgAnimal.estado = 0;


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
