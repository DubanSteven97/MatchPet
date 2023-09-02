using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using webapi.Models;

namespace webapi.Controllers 
{
    [Route("Matchpet/[controller]")]
    [ApiController]

    public class OrganizacionController : ControllerBase
    {

        private readonly DbmatchpetContext _baseDatos;

        public OrganizacionController(DbmatchpetContext baseDatos)
        {
            _baseDatos = baseDatos;
        }

        [HttpGet]
        [Route("Lista")]
        [Authorize]

        public async Task<IActionResult> Lista()
        {
            var listaOrganizaciones = await _baseDatos.Organizacions.ToListAsync();
            return Ok(listaOrganizaciones);
        }

        [HttpPost]
        [Route("Agregar")]
        [Authorize]

        public async Task<IActionResult> Agregar([FromBody] Organizacion request)
        {
            await _baseDatos.Organizacions.AddAsync(request);
            await _baseDatos.SaveChangesAsync();
            return Ok(request);
        }



        [HttpDelete]
        [Route("Eliminar/{id:int}")]
        [Authorize]

        public async Task<IActionResult> Eliminar(int id)
        {
            var organizacionEliminar = await _baseDatos.Organizacions.FindAsync(id);
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

           


            if (!respuestaToken.success)
            {
                return Ok(respuestaToken);
            }

            if (respuestaToken.success == true) { 

                if (organizacionEliminar == null)
                {
                    return BadRequest("No existe la organización");
                }
                else
                {
                    _baseDatos.Organizacions.Remove(organizacionEliminar);
                    await _baseDatos.SaveChangesAsync();
                    return Ok("Organización eliminada");
                }
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }
    }

}