using MatchPetBusiness;
using MatchPetDal;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using webapi.Models;

namespace webapi.Controllers
{
    [Route("Matchpet/[controller]")]
    [ApiController]
    public class ModuloController : ControllerBase
    {
        [HttpGet]
        [Route("GetModulos")]
        public IActionResult GetModulos() {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            ModuloBusiness modB = new ModuloBusiness();
            List<spGetModulos_Result> modulos = modB.GetModuloList();

            return Ok(modulos);
        }

    }
}
