using MatchPetBusiness;
using MatchPetDal;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.JsonWebTokens;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.Data.Entity;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using webapi.Models;


namespace webapi.Controllers
{
    [Route("Matchpet/[controller]")]
    [ApiController]

    public class AplicacionController : ControllerBase
    {
        public IConfiguration _configuration;
        public AplicacionController(IConfiguration configuration)
        {
            _configuration = configuration;
        }


        [HttpPost]
        [Route("Auth")]
        public dynamic GenerarToken([FromBody] Object optData)
        {
            var data = JsonConvert.DeserializeObject<dynamic>(optData.ToString());

            string user = data.usuario.ToString();
            string password = data.password.ToString();

            AplicacionBusiness appB = new AplicacionBusiness();
            Aplicacion app = appB.GetAutorization(user,password);

            if (app is null)
            {
                return new
                {
                    success = false,
                    message = "Usuario o contraseña incorrecta",
                    result = ""
                };
            }

            var jwt = _configuration.GetSection("Jwt").Get<Jwt>();


            var claims = new[]{
                new Claim(Microsoft.IdentityModel.JsonWebTokens.JwtRegisteredClaimNames.Sub, jwt.Subject),
                new Claim(Microsoft.IdentityModel.JsonWebTokens.JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(Microsoft.IdentityModel.JsonWebTokens.JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                new Claim("id", app.nombre)
            };


            var Key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwt.Key));
            var singIn = new SigningCredentials(Key, SecurityAlgorithms.HmacSha256);


            var token = new JwtSecurityToken(
                jwt.Issuer,
                jwt.Audience,
                claims,
                expires: DateTime.Now.AddMinutes(1),
                signingCredentials: singIn


                );


            return new
            {
                success = true,
                message = "Exito",
                result = new JwtSecurityTokenHandler().WriteToken(token)
            };
        }

    }

}