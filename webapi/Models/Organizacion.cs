using System;
using System.Collections.Generic;

namespace webapi.Models;

public partial class Organizacion
{
    public int IdOrganizacion { get; set; }

    public string? Nombre { get; set; }

    public bool Activo { get; set; }

    public bool Borrado { get; set; }
}
