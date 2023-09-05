using System;
using System.Collections.Generic;
using System.Security.Claims;

namespace webapi.Models;

public partial class Jwt
{
    public string Key { get; set; }
    public string Issuer { get; set; }
    public string Audience { get; set; }
    public string Subject { get; set; }


    public static dynamic validarToken(ClaimsIdentity identity)
    {
        try
        {
            if(identity.Claims.Count() == 0)
            {
                return new
                {
                    success = false,
                    message = "Verificar Token",
                    result = ""
                };
            }

            return new
            {
                success = true,
                message = "Exito",
                result = ""
            };
        }
        catch(Exception ex)
        {
            return new
            {
                success = false,
                message = "catch"+ex.Message,
                result= ""
            };
        }
    } 


}