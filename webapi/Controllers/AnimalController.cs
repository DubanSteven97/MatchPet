using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using webapi.Models;

using MatchPetDal;
using Microsoft.AspNetCore.Http;

using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Data.Entity;
using MatchPetBusiness;

namespace webapi.Controllers
{
    [Route("Matchpet/[controller]")]
    [ApiController]
    public class AnimalController : ControllerBase
    {

        [HttpGet]
        [Route("GetAnimales/{idOrganizacion:int}")]

        public IActionResult GetAnimales(int idOrganizacion)
        {
            AnimalBusiness animales = new AnimalBusiness();

            List<spGetAnimales_Result> anim = animales.GetAnimalesList(idOrganizacion);

            return Ok(anim);
        }

        [HttpGet]
        [Route("GetAnimalesByTipo/{idTipoAnimal:int}")]

        public IActionResult GetAnimalesByTipo(int idTipoAnimal)
        {
            AnimalBusiness animales = new AnimalBusiness();

            List<spGetAnimales_Result> anim = animales.GetAnimalesByTipoList(idTipoAnimal);

            return Ok(anim);
        }

        [HttpGet]
        [Route("GetAnimal/{id:int}")]

        public string GetAnimal(int id)
        {
            AnimalBusiness animal = new AnimalBusiness();
            Animal anim = animal.GetAnimalById(id);
            string json = "";
            json = JsonConvert.SerializeObject(anim.ToObject());
            return json;
        }

        [HttpGet]
        [Route("GetImgByAnimal/{id:int}")]

        public string GetImgByAnimal(int id)
        {

            AnimalBusiness anim = new AnimalBusiness();
            List<Imagen> imagenesByanimal = anim.GetImgByAnimald(id);
            string json = "";
            json = JsonConvert.SerializeObject(imagenesByanimal);
            return json;
        }

        [HttpPost]
        [Route("UpdateAnimal")]
        [Authorize]
        public int UpdateAnimal([FromBody] Animal request)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            AnimalBusiness animal = new AnimalBusiness();
            return animal.updateAnimal(request);

        }

        [HttpPost]
        [Route("InsertAnimal")]
        [Authorize]

        public int InsertAnimal([FromBody] Animal request)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            AnimalBusiness tipAnimal = new AnimalBusiness();
            return tipAnimal.setAnimal(request);
        }

        [HttpPost]
        [Route("SetImagenAnimal")]
        [Authorize]

        public int SetImagenAnimal([FromBody] Imagen request)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            AnimalBusiness imgAnimal = new AnimalBusiness();
            imgAnimal.setImagenAnimal(request);

            return request.idImagen;
        }

        [HttpGet]
        [Route("DelAnimal/{id:int}")]
        [Authorize]

        public string DelAnimal(int id)
        {


            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);


            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            AnimalBusiness Animal = new AnimalBusiness();


            string json = "";
            json = JsonConvert.SerializeObject(Animal.delAnimal(id));

            return json;
        }

        [HttpGet]
        [Route("DelFileAnimal/{id:int}/{idImagen:int}")]
        [Authorize]

        public string DelFileAnimal(int id, int idImagen)
        {


            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);


            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            AnimalBusiness imgAnimal = new AnimalBusiness();


            string json = "";
            json = JsonConvert.SerializeObject(imgAnimal.delFileAnimal(id,idImagen));

            return json;
        }
    }
}
