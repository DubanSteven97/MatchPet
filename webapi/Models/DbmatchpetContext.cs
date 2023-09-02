using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace webapi.Models;

public partial class DbmatchpetContext : DbContext
{
    public DbmatchpetContext()
    {
    }

    public DbmatchpetContext(DbContextOptions<DbmatchpetContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Organizacion> Organizacions { get; set; }

    

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Organizacion>(entity =>
        {
            entity.HasKey(e => e.IdOrganizacion).HasName("PK__Organiza__E31291EEE62FDE24");

            entity.ToTable("Organizacion");

            entity.Property(e => e.IdOrganizacion).HasColumnName("idOrganizacion");
            entity.Property(e => e.Activo).HasColumnName("activo");
            entity.Property(e => e.Borrado).HasColumnName("borrado");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("nombre");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
