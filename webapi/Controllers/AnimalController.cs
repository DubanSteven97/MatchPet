using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using webapi.Models;

using MatchPetDal;
using Microsoft.AspNetCore.Http;

using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Data.Entity;


namespace webapi.Controllers
{
    [Route("Matchpet/[controller]")]
    [ApiController]
    public class AnimalController : ControllerBase
    {

        [HttpGet]
        [Route("Lista")]
        [Authorize]

        public async Task<IActionResult> Lista()
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success == true)
            {
                var c = new Conexion();
                await c.DataBaseConfigAsync();
                var ctx = c.Context;

                var animales = await ctx.Animal.Where(x => x.activo == true && x.borrado == false).Select(x => new
                {
                    x.idAnimal,
                    x.idOrganizacion,
                    x.tipo,
                    x.nombre,
                    x.genero,
                    x.fecha_nacimiento,
                    x.activo,
                    x.borrado
                })
                .ToListAsync();

                return Ok(animales);
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }
    }
}
