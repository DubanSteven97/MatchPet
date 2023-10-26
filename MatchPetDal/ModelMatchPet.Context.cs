﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class DBMatchpet : DbContext
    {
        public DBMatchpet()
            : base("name=DBMatchpet")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Animal> Animal { get; set; }
        public virtual DbSet<Apadrinamiento> Apadrinamiento { get; set; }
        public virtual DbSet<Aplicacion> Aplicacion { get; set; }
        public virtual DbSet<Contacto> Contacto { get; set; }
        public virtual DbSet<Donacion> Donacion { get; set; }
        public virtual DbSet<Estado> Estado { get; set; }
        public virtual DbSet<Modulo> Modulo { get; set; }
        public virtual DbSet<Organizacion> Organizacion { get; set; }
        public virtual DbSet<Permiso> Permiso { get; set; }
        public virtual DbSet<Persona> Persona { get; set; }
        public virtual DbSet<ProcesoAdopcion> ProcesoAdopcion { get; set; }
        public virtual DbSet<Publicacion> Publicacion { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<Suscripcion> Suscripcion { get; set; }
        public virtual DbSet<TipoAnimal> TipoAnimal { get; set; }
        public virtual DbSet<TipoPago> TipoPago { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
    
        public virtual ObjectResult<spGetAnimales_Result> spGetAnimales()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spGetAnimales_Result>("spGetAnimales");
        }
    
        public virtual int spSetTokenApp(Nullable<int> p_idAplicacion, string p_token, Nullable<System.DateTime> p_expire)
        {
            var p_idAplicacionParameter = p_idAplicacion.HasValue ?
                new ObjectParameter("p_idAplicacion", p_idAplicacion) :
                new ObjectParameter("p_idAplicacion", typeof(int));
    
            var p_tokenParameter = p_token != null ?
                new ObjectParameter("p_token", p_token) :
                new ObjectParameter("p_token", typeof(string));
    
            var p_expireParameter = p_expire.HasValue ?
                new ObjectParameter("p_expire", p_expire) :
                new ObjectParameter("p_expire", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spSetTokenApp", p_idAplicacionParameter, p_tokenParameter, p_expireParameter);
        }
    }
}
