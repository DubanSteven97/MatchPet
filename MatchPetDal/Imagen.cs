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
    
    public partial class Imagen
    {
        public int idImagen { get; set; }
        public int idAnimal { get; set; }
        public string img { get; set; }
        public int estado { get; set; }
    
        public virtual Animal Animal { get; set; }
    }
}
