using MatchPetBusiness;
using MatchPetDal;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using webapi.Models;
using Newtonsoft.Json;

namespace webapi.Controllers
{
    [Route("Matchpet/[controller]")]
    [ApiController]
    public class ModuloController : ControllerBase
    {
        [HttpGet]
        [Route("GetModulos")]
        [Authorize]
        public IActionResult GetModulos() {

            ModuloBusiness modB = new ModuloBusiness();
            List<spGetModulos_Result> modulos = modB.GetModuloList();

            return Ok(modulos);
        }

        [HttpGet]
        [Route("GetModulo/{id:int}")]
        [Authorize]
        public string GetModulo(int id)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            ModuloBusiness modB = new ModuloBusiness();
            Modulo modulo = modB.GetModuloById(id);
            string json = "";
            json = JsonConvert.SerializeObject(modulo.ToObject());
            return json;
        }

        [HttpPost]
        [Route("InsertModulo")]
        [Authorize]
        public int InsertModulo([FromBody] Modulo request)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            ModuloBusiness modB = new ModuloBusiness();
            return modB.insertModulo(request);

        }

        [HttpPost]
        [Route("UpdateModulo")]
        [Authorize]
        public int UpdateModulo([FromBody] Modulo request)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            ModuloBusiness modB = new ModuloBusiness();
            return modB.updateModulo(request);

        }

    }
}
