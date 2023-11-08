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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Animal()
        {
            this.Apadrinamiento = new HashSet<Apadrinamiento>();
            this.Imagen = new HashSet<Imagen>();
            this.ProcesoAdopcion = new HashSet<ProcesoAdopcion>();
        }
    
        public int idAnimal { get; set; }
        public int idOrganizacion { get; set; }
        public int idTipoAnimal { get; set; }
        public string nombre { get; set; }
        public string genero { get; set; }
        public Nullable<System.DateTime> fecha_nacimiento { get; set; }
        public Nullable<System.DateTime> fechaCreacion { get; set; }
        public string ruta { get; set; }
        public int estado { get; set; }
    
        public virtual Organizacion Organizacion { get; set; }
        public virtual TipoAnimal TipoAnimal { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Apadrinamiento> Apadrinamiento { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Imagen> Imagen { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProcesoAdopcion> ProcesoAdopcion { get; set; }

        public Object ToObject()
        {
            return new
            {
                idAnimal,
                idOrganizacion,
                idTipoAnimal,
                nombre,
                genero,
                fecha_nacimiento,
                fechaCreacion,
                ruta,
                estado
            };
        }
    }
}
