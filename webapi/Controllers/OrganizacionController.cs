using Azure.Core;
using MatchPetBusiness;
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
        [Route("GetOrganizaciones")]
        [Authorize]

        public IActionResult GetOrganizaciones()
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
            {
                return BadRequest(respuestaToken);
            }

            if (respuestaToken.success == true)
            {
                OrganizacionBusiness orgB = new OrganizacionBusiness();

                List<spOrganizaciones_Result> org = orgB.GetOrganizacionsList();

                return Ok(org);
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }

        [HttpGet]
        [Route("GetOrganizacion/{id:int}")]
        [Authorize]

        public string GetOrganizacion(int id)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            OrganizacionBusiness orgB = new OrganizacionBusiness();
            Organizacion organizacion = orgB.GetOrganizacionById(id);
            string json = "";
            json = JsonConvert.SerializeObject(organizacion.ToObject());
            return json;
        }

        [HttpPost]
        [Route("InsertOrganizacion")]
        [Authorize]

        public int InsertOrganizacion([FromBody] Organizacion request)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            OrganizacionBusiness orgB = new OrganizacionBusiness();
            return orgB.setOrganizacion(request);
        }

        [HttpPost]
        [Route("UpdateOrganizacion")]
        [Authorize]
        public int UpdateOrganizacion([FromBody] Organizacion request)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);

            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            OrganizacionBusiness orgB = new OrganizacionBusiness();
            return orgB.updateOrganizacion(request);

        }

        [HttpGet]
        [Route("GetUserByOrganizacion/{id:int}")]
        [Authorize]

        public string GetUserByOrganizacion(int id)
        {

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);


            OrganizacionBusiness orgB = new OrganizacionBusiness();
            List<Persona> usuariosByorganizacion = orgB.GetUserByOrganizacions(id);
            string json = "";
            json = JsonConvert.SerializeObject(usuariosByorganizacion);
            return json;
        }
        /*
        
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
                c.DataBaseConfigAsync();
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
            c.DataBaseConfigAsync();
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
                c.DataBaseConfigAsync();
                var ctx = c.Context;

                // Busca la organización que deseas eliminar logicamnete por su ID.
                var organizacion = await ctx.Organizacion.FirstOrDefaultAsync(o => o.idOrganizacion == id);

                if (organizacion == null)
                {
                    return BadRequest("No existe la organización");
                }

                // Aplica los cambios para el borrado logico
                //organizacion.activo = false;
                //organizacion.borrado = true;

                // Guarda los cambios en la base de datos.
                await ctx.SaveChangesAsync();

                return Ok("Organización eliminada");
            }
            else
            {
                return BadRequest("Token invalido");
            }
        }*/
    }
}