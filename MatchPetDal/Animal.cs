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
    
    public partial class Animal
    {
        public int idAnimal { get; set; }
        public int idOrganizacion { get; set; }
        public string tipo { get; set; }
        public string nombre { get; set; }
        public string genero { get; set; }
        public Nullable<System.DateTime> fecha_nacimiento { get; set; }
        public bool activo { get; set; }
        public bool borrado { get; set; }
    
        public virtual Organizacion Organizacion { get; set; }
    }
}
