using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using webapi.Models;

using MatchPetDal;
using Microsoft.AspNetCore.Http;

using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Data.Entity;
using MatchPetBusiness;

namespace webapi.Controllers
{
    [Route("Matchpet/[controller]")]
    [ApiController]
    public class PersonaController : ControllerBase
    {

        [HttpGet]
        [Route("GetUsuarios")]

        public string GetUsuarios()
        {
            PersonaBusiness usuario = new PersonaBusiness();

            List<Persona> per = usuario.getUsuarios();

            List<UsuarioApp> usus = new List<UsuarioApp>();

            foreach (Persona persona in per)
            {
                UsuarioApp usu = new UsuarioApp();
                usu.idPersona = persona.idPersona;
                usu.nombres = persona.nombres;
                usu.apellidos = persona.apellidos;
                usu.telefono = persona.telefono;
                usu.email = persona.email;
                usus.Add(usu);
            }

            string json = "";
            json = JsonConvert.SerializeObject(usus);
            return json;
    
        }

        [HttpPost]
        [Route("LoginUsr")]
        public dynamic LoginUsr([FromBody] Object optData)
        {
            var data = JsonConvert.DeserializeObject<dynamic>(optData.ToString());

            PersonaBusiness usuB = new PersonaBusiness();
            string email = data.email.ToString();
            string password = data.password.ToString();
            
            Persona per = usuB.Login(email, password);
            UsuarioApp us = new UsuarioApp();
            if (per is null){
                return new
                {
                    success = false,
                    message = "Usuario o contraseña incorrecta",
                    result = us
                };
            }else{
                us.idPersona = per.idPersona;
                us.nombres = per.nombres;
                us.apellidos = per.apellidos;
                us.telefono = per.telefono;
                us.email = per.email;  

                return new
                {
                    success = true,
                    message = "Bienvenido " + us.nombres,
                    result = us
                };     
            }
            
        }
    }
}
