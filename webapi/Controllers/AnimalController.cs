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
        [Route("GetAnimales")]
        [Authorize]

        public IActionResult GetAnimales()
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success == true)
            {
                AnimalBusiness animales = new AnimalBusiness();

                List<spGetAnimales_Result> anim = animales.GetAnimalesList();

                return Ok(anim);
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }

        [HttpGet]
        [Route("GetAnimal/{id:int}")]
        [Authorize]

        public string GetAnimal(int id)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            AnimalBusiness animal = new AnimalBusiness();
            Animal anim = animal.GetAnimalById(id);
            string json = "";
            json = JsonConvert.SerializeObject(anim.ToObject());
            return json;
        }

        [HttpGet]
        [Route("GetImgByAnimal/{id:int}")]
        [Authorize]

        public string GetImgByAnimal(int id)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);


            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

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
    }
}
