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
    public class AnimalController : ControllerBase
    {

        [HttpGet]
        [Route("Lista")]

        public async Task<IActionResult> Lista()
        {
            AnimalBusiness aniB = new AnimalBusiness();
            List<spGetAnimales_Result> animales = aniB.GetSpGetAnimales();

            return Ok(animales);
            
        }
    }
}
