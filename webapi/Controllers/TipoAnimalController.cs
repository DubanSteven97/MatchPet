using MatchPetBusiness;
using MatchPetDal;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Security.Claims;
using webapi.Models;

namespace webapi.Controllers
{
    [Route("Matchpet/[controller]")]
    [ApiController]
    public class TipoAnimalController : ControllerBase
    {
        [HttpGet]
        [Route("GetTipoAnimales")]

        public IActionResult GetTipoAnimales()
        {
            TipoAnimalBusiness tipAnimal = new TipoAnimalBusiness();

            List<spTipoAnimales_Result> tipAni = tipAnimal.GetTipoAnimalList();

            return Ok(tipAni);
        }

        [HttpGet]
        [Route("GetTipoAnimal/{id:int}")]
        [Authorize]

        public string GetTipoAnimal(int id)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            TipoAnimalBusiness tipAnimal = new TipoAnimalBusiness();
            TipoAnimal tipAni = tipAnimal.GetTipoAnimalById(id);
            string json = "";
            json = JsonConvert.SerializeObject(tipAni.ToObject());
            return json;
        }

        [HttpPost]
        [Route("InsertTipoAnimal")]
        [Authorize]

        public int InsertTipoAnimal([FromBody] TipoAnimal request)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            TipoAnimalBusiness tipAnimal = new TipoAnimalBusiness();
            return tipAnimal.setTipoAnimal(request);
        }

        [HttpPost]
        [Route("UpdateTipoAnimal")]
        [Authorize]
        public int UpdateTipoAnimal([FromBody] TipoAnimal request)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            TipoAnimalBusiness tipAnimal = new TipoAnimalBusiness();
            return tipAnimal.UpdateTipoAnimal(request);

        }


        [HttpGet]
        [Route("DelTipoAnimal/{id:int}")]
        [Authorize]

        public string DelTipoAnimal(int id)
        {


            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);


            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            TipoAnimalBusiness tipoAnimal = new TipoAnimalBusiness();


            string json = "";
            json = JsonConvert.SerializeObject(tipoAnimal.delTipoAnimal(id));

            return json;
        }
    }
}



