using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
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
            var listaOrganizaciones = await _baseDatos.Organizacions.Where(x => x.Activo == true && x.Borrado == false).ToListAsync();
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success == true)
            {
                return Ok(listaOrganizaciones);

            }
            else
            {
                return BadRequest("Token invalido");
            }
        }

        [HttpGet]
        [Route("Registro/{id:int}")]
        [Authorize]

        public async Task<IActionResult> Registro(int id)
        {
            var organizacion = await _baseDatos.Organizacions.FirstOrDefaultAsync(o => o.IdOrganizacion == id); ;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success == true)
            {
                if (organizacion != null)
                {
                    return Ok(organizacion);
                }
                else
                {
                    return BadRequest("No existe la organización");
                }
                
            }
            else
            {
                return BadRequest("Token invalido");
            }
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

        [HttpPost]
        [Route("Actualizar/{id:int}")]
        [Authorize]

        public async Task<IActionResult> Actualizar([FromBody] Object request, int id)
        {
            var data = JsonConvert.DeserializeObject<dynamic>(request.ToString());
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success == true)
            {
                // Busca la organización que deseas actualizar por su ID.
                var organizacion = await _baseDatos.Organizacions.FirstOrDefaultAsync(o => o.IdOrganizacion == id);

                if (organizacion == null)
                {
                    return BadRequest("No existe la organización");
                }

                // Aplica los cambios en la entidad con los valores del objeto "request".
                organizacion.Nombre = data.nombre == null ? organizacion.Nombre  : data.nombre.ToString();
                organizacion.Activo = data.activo == null ? organizacion.Activo : bool.Parse(data.activo.ToString());
                organizacion.Borrado = data.borrado == null ? organizacion.Borrado : bool.Parse(data.borrado.ToString());

    
                // Agrega todas las propiedades que desees actualizar.

                // Guarda los cambios en la base de datos.
                await _baseDatos.SaveChangesAsync();

                return Ok(organizacion);
            }
            else
            {
                return BadRequest("Token invalido");
            }
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
                return BadRequest(respuestaToken);
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