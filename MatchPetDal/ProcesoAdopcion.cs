//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MatchPetDal
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProcesoAdopcion
    {
        public int idProcesoAdopcion { get; set; }
        public int idPersona { get; set; }
        public int idAnimal { get; set; }
        public int idOrganizacion { get; set; }
        public System.DateTime fecha_solicitud { get; set; }
        public string requisitos { get; set; }
        public int estado { get; set; }
    
        public virtual Animal Animal { get; set; }
        public virtual Organizacion Organizacion { get; set; }
        public virtual Persona Persona { get; set; }
    }
}
