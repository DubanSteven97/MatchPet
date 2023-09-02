using System;
using System.Collections.Generic;

using Microsoft.EntityFrameworkCore;
using webapi.Models;

namespace webapi.Models;

public partial class Usuario
{
    public int idUsuario { get; set; }

    public string? Nombres { get; set; }

    public string? Apellidos { get; set; }

    public bool Activo { get; set; }

    public bool Borrado { get; set; }

  

    

    public static List<Usuario> DB()
    {
        var list = new List<Usuario>()
        {
            new Usuario
            {
                idUsuario = 1,
                Nombres = "Duban",
                Apellidos = "Estupiñan",
                Activo = true,
                Borrado = false
            }
        };


        return list;
    }
}