using Azure.Core;
using MatchPetDal;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Data.Entity;
using System.Security.Claims;
using webapi.Models;





namespace webapi.Controllers 
{
    [Route("Matchpet/[controller]")]
    [ApiController]

    public class OrganizacionController : ControllerBase
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

                var org = await ctx.Organizacion.Where(x => x.activo == true && x.borrado == false).Select(x => new
                {
                    x.idOrganizacion,
                    x.nombre,
                    x.descripcion,
                    x.telefono,
                    x.direccion,
                    x.activo,
                    x.borrado
                })
                .ToListAsync();

                return Ok(org);
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
 
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success)
            {

                var c = new Conexion();
                await c.DataBaseConfigAsync();
                var ctx = c.Context;

                var orgId = await ctx.Organizacion.Select(x => new
                {
                    x.idOrganizacion,
                    x.nombre,
                    x.descripcion,
                    x.telefono,
                    x.direccion,
                    x.activo,
                    x.borrado
                })
                .FirstOrDefaultAsync(o => o.idOrganizacion == id);

                if (orgId != null)
                {
                    return Ok(orgId);
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


                ctx.Organizacion.Add(request); 
                await ctx.SaveChangesAsync();

                return Ok(request);
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }

        
        [HttpPost]
        [Route("Actualizar/{id:int}")]
        [Authorize]

        public async Task<IActionResult> Actualizar([FromBody] Object request, int id)
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


            
                // Busca la organización que deseas actualizar por su ID.
                var data = JsonConvert.DeserializeObject<dynamic>(request.ToString());
                var organizacion = await ctx.Organizacion.FirstOrDefaultAsync(o => o.idOrganizacion == id);

                if (organizacion == null)
                {
                    return BadRequest("No existe la organización");
                }

                // Aplica los cambios en la entidad con los valores del objeto "request".
                organizacion.nombre = data.nombre == null ? organizacion.nombre  : data.nombre.ToString();
                organizacion.descripcion = data.descripcion == null ? organizacion.descripcion : data.descripcion.ToString();
                organizacion.telefono = data.telefono == null ? organizacion.telefono : data.telefono.ToString();
                organizacion.direccion = data.direccion == null ? organizacion.direccion : data.direccion.ToString();
                organizacion.activo = data.activo == null ? organizacion.activo : bool.Parse(data.activo.ToString());
                organizacion.borrado = data.borrado == null ? organizacion.borrado : bool.Parse(data.borrado.ToString());


                // Agrega todas las propiedades que desees actualizar.

                // Guarda los cambios en la base de datos.
                await ctx.SaveChangesAsync();

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
           
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);


            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }


            var c = new Conexion();
            await c.DataBaseConfigAsync();
            var ctx = c.Context;

            var organizacionEliminar = await ctx.Organizacion.FindAsync(id);

            if (respuestaToken.success == true) { 

                if (organizacionEliminar == null)
                {
                    return BadRequest("No existe la organización");
                }
                else
                {
                    
                    ctx.Organizacion.Remove(organizacionEliminar);
                    await ctx.SaveChangesAsync();
                    return Ok("Organización eliminada");
                }
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }
   


    [HttpPost]
    [Route("BorradoLogico/{id:int}")]
    [Authorize]

    public async Task<IActionResult> BorradoLogico(int id)
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

                // Busca la organización que deseas eliminar logicamnete por su ID.
                var organizacion = await ctx.Organizacion.FirstOrDefaultAsync(o => o.idOrganizacion == id && o.activo == true && o.borrado == false);

                if (organizacion == null)
                {
                    return BadRequest("No existe la organización");
                }

                // Aplica los cambios para el borrado logico
                organizacion.activo = false;
                organizacion.borrado = true;

                // Guarda los cambios en la base de datos.
                await ctx.SaveChangesAsync();

                return Ok("Organización eliminada");
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }
    }
}