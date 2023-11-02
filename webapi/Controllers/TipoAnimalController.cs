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
        [Authorize]

        public IActionResult GetTipoAnimales()
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success == true)
            {
                TipoAnimalBusiness orgB = new TipoAnimalBusiness();

                List<spTipoAnimales_Result> org = orgB.GetTipoAnimalList();

                return Ok(org);
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }

        [HttpGet]
        [Route("GetTipoAnimal/{id:int}")]
        [Authorize]

        public string GetTipoAnimal(int id)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            TipoAnimalBusiness orgB = new TipoAnimalBusiness();
            TipoAnimal tipoAnimal = orgB.GetTipoAnimalById(id);
            string json = "";
            json = JsonConvert.SerializeObject(tipoAnimal.ToObject());
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

            TipoAnimalBusiness orgB = new TipoAnimalBusiness();
            return orgB.setTipoAnimal(request);
        }
    }
}



