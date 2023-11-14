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


            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            OrganizacionBusiness orgB = new OrganizacionBusiness();
            List<Persona> usuariosByorganizacion = orgB.GetUserByOrganizacions(id);
            string json = "";
            json = JsonConvert.SerializeObject(usuariosByorganizacion);
            return json;
        }


        [HttpGet]
        [Route("DelOrganizacion/{id:int}")]
        [Authorize]

        public string  DelOrganizacion(int id)
        {
            

            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var respuestaToken = Jwt.validarToken(identity);


            if (!respuestaToken.success)
                return BadRequest(respuestaToken);

            OrganizacionBusiness orgB = new OrganizacionBusiness();

   
            string json = "";
            json = JsonConvert.SerializeObject(orgB.delOrganizacion(id));

            return json;
        }
   
    }
}