using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace BOTFAQ.Models
{
    public partial class FAQDB001Context : DbContext
    {
        public FAQDB001Context()
        {
        }

        public FAQDB001Context(DbContextOptions<FAQDB001Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Faqtb001Dialogo> Faqtb001Dialogo { get; set; }
        public virtual DbSet<Faqtb002Conversa> Faqtb002Conversa { get; set; }
        public virtual DbSet<Faqtb003Regra> Faqtb003Regra { get; set; }
        public virtual DbSet<Faqtb004Sessao> Faqtb004Sessao { get; set; }
        public virtual DbSet<Faqtb005Resposta> Faqtb005Resposta { get; set; }
        public virtual DbSet<Faqtb006Envio> Faqtb006Envio { get; set; }
        public virtual DbSet<Faqtb007TipoConversa> Faqtb007TipoConversa { get; set; }
        public virtual DbSet<Faqtb008Cartao> Faqtb008Cartao { get; set; }
        public virtual DbSet<Faqtb009Variavel> Faqtb009Variavel { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-Q27R8CJ;Initial Catalog=FAQDB001;User ID=user;Password=password");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Faqtb001Dialogo>(entity =>
            {
                entity.HasKey(e => e.NuDialogo);

                entity.ToTable("faqtb001_dialogo");

                entity.Property(e => e.NuDialogo).HasColumnName("nu_dialogo");

                entity.Property(e => e.NoDialogo)
                    .IsRequired()
                    .HasColumnName("no_dialogo")
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Faqtb002Conversa>(entity =>
            {
                entity.HasKey(e => e.NuConversa);

                entity.ToTable("faqtb002_conversa");

                entity.Property(e => e.NuConversa).HasColumnName("nu_conversa");

                entity.Property(e => e.DeConversa)
                    .IsRequired()
                    .HasColumnName("de_conversa")
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.IcTipoConversa)
                    .IsRequired()
                    .HasColumnName("ic_tipo_conversa")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NuDialogo).HasColumnName("nu_dialogo");

                entity.Property(e => e.NuVariavel).HasColumnName("nu_variavel");

                entity.HasOne(d => d.IcTipoConversaNavigation)
                    .WithMany(p => p.Faqtb002Conversa)
                    .HasForeignKey(d => d.IcTipoConversa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb002_conversa_faqtb007_tipo_conversa");

                entity.HasOne(d => d.NuDialogoNavigation)
                    .WithMany(p => p.Faqtb002Conversa)
                    .HasForeignKey(d => d.NuDialogo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb002_conversa_faqtb001_dialogo");

                entity.HasOne(d => d.NuVariavelNavigation)
                    .WithMany(p => p.Faqtb002Conversa)
                    .HasForeignKey(d => d.NuVariavel)
                    .HasConstraintName("FK_faqtb002_conversa_faqtb009_variavel");
            });

            modelBuilder.Entity<Faqtb003Regra>(entity =>
            {
                entity.HasKey(e => new { e.NuConversaAnterior, e.NuConversaPosterior });

                entity.ToTable("faqtb003_regra");

                entity.HasIndex(e => new { e.NuConversaAnterior, e.NuConversaPosterior })
                    .HasName("IX_faqtb003_regra")
                    .IsUnique();

                entity.Property(e => e.NuConversaAnterior).HasColumnName("nu_conversa_anterior");

                entity.Property(e => e.NuConversaPosterior).HasColumnName("nu_conversa_posterior");

                entity.Property(e => e.DeRegra)
                    .IsRequired()
                    .HasColumnName("de_regra")
                    .HasMaxLength(4000)
                    .IsUnicode(false);

                entity.HasOne(d => d.NuConversaAnteriorNavigation)
                    .WithMany(p => p.Faqtb003RegraNuConversaAnteriorNavigation)
                    .HasForeignKey(d => d.NuConversaAnterior)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb003_regra_faqtb002_conversa");

                entity.HasOne(d => d.NuConversaPosteriorNavigation)
                    .WithMany(p => p.Faqtb003RegraNuConversaPosteriorNavigation)
                    .HasForeignKey(d => d.NuConversaPosterior)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb003_regra_faqtb002_conversa1");
            });

            modelBuilder.Entity<Faqtb004Sessao>(entity =>
            {
                entity.HasKey(e => e.NuSessao);

                entity.ToTable("faqtb004_sessao");

                entity.Property(e => e.NuSessao).HasColumnName("nu_sessao");

                entity.Property(e => e.DhSessao)
                    .HasColumnName("dh_sessao")
                    .HasColumnType("datetime");

                entity.Property(e => e.NoUsuario)
                    .IsRequired()
                    .HasColumnName("no_usuario")
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.NuDialogo).HasColumnName("nu_dialogo");

                entity.HasOne(d => d.NuDialogoNavigation)
                    .WithMany(p => p.Faqtb004Sessao)
                    .HasForeignKey(d => d.NuDialogo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb004_sessao_faqtb001_dialogo");
            });

            modelBuilder.Entity<Faqtb005Resposta>(entity =>
            {
                entity.HasKey(e => e.NuReposta);

                entity.ToTable("faqtb005_resposta");

                entity.Property(e => e.NuReposta).HasColumnName("nu_reposta");

                entity.Property(e => e.DeReposta)
                    .IsRequired()
                    .HasColumnName("de_reposta")
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.DhResposta)
                    .HasColumnName("dh_resposta")
                    .HasColumnType("datetime");

                entity.Property(e => e.NuConversa).HasColumnName("nu_conversa");

                entity.Property(e => e.NuSessao).HasColumnName("nu_sessao");

                entity.Property(e => e.NuVariavel).HasColumnName("nu_variavel");

                entity.HasOne(d => d.NuConversaNavigation)
                    .WithMany(p => p.Faqtb005Resposta)
                    .HasForeignKey(d => d.NuConversa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb005_resposta_faqtb002_conversa");

                entity.HasOne(d => d.NuSessaoNavigation)
                    .WithMany(p => p.Faqtb005Resposta)
                    .HasForeignKey(d => d.NuSessao)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb005_resposta_faqtb004_sessao");

                entity.HasOne(d => d.NuVariavelNavigation)
                    .WithMany(p => p.Faqtb005Resposta)
                    .HasForeignKey(d => d.NuVariavel)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb005_resposta_faqtb009_variavel");
            });

            modelBuilder.Entity<Faqtb006Envio>(entity =>
            {
                entity.HasKey(e => e.NuEnvio);

                entity.ToTable("faqtb006_envio");

                entity.Property(e => e.NuEnvio).HasColumnName("nu_envio");

                entity.Property(e => e.DhEnvio)
                    .HasColumnName("dh_envio")
                    .HasColumnType("datetime");

                entity.Property(e => e.NuConversa).HasColumnName("nu_conversa");

                entity.Property(e => e.NuSessao).HasColumnName("nu_sessao");

                entity.HasOne(d => d.NuConversaNavigation)
                    .WithMany(p => p.Faqtb006Envio)
                    .HasForeignKey(d => d.NuConversa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb006_envio_faqtb002_conversa");

                entity.HasOne(d => d.NuSessaoNavigation)
                    .WithMany(p => p.Faqtb006Envio)
                    .HasForeignKey(d => d.NuSessao)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb006_envio_faqtb004_sessao");
            });

            modelBuilder.Entity<Faqtb007TipoConversa>(entity =>
            {
                entity.HasKey(e => e.IcTipoConversa);

                entity.ToTable("faqtb007_tipo_conversa");

                entity.Property(e => e.IcTipoConversa)
                    .HasColumnName("ic_tipo_conversa")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NoTipoConversa)
                    .IsRequired()
                    .HasColumnName("no_tipo_conversa")
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Faqtb008Cartao>(entity =>
            {
                entity.HasKey(e => e.NuCartao);

                entity.ToTable("faqtb008_cartao");

                entity.HasIndex(e => new { e.NuConversa, e.VrCartao })
                    .HasName("IX_faqtb008_cartao")
                    .IsUnique();

                entity.Property(e => e.NuCartao).HasColumnName("nu_cartao");

                entity.Property(e => e.DeCartao)
                    .IsRequired()
                    .HasColumnName("de_cartao")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NuConversa).HasColumnName("nu_conversa");

                entity.Property(e => e.VrCartao)
                    .IsRequired()
                    .HasColumnName("vr_cartao")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.NuConversaNavigation)
                    .WithMany(p => p.Faqtb008Cartao)
                    .HasForeignKey(d => d.NuConversa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb008_cartao_faqtb002_conversa");
            });

            modelBuilder.Entity<Faqtb009Variavel>(entity =>
            {
                entity.HasKey(e => e.NuVariavel);

                entity.ToTable("faqtb009_variavel");

                entity.Property(e => e.NuVariavel).HasColumnName("nu_variavel");

                entity.Property(e => e.IcTipoVariavel)
                    .IsRequired()
                    .HasColumnName("ic_tipo_variavel")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NoVariavel)
                    .IsRequired()
                    .HasColumnName("no_variavel")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NuDialogo).HasColumnName("nu_dialogo");

                entity.HasOne(d => d.NuDialogoNavigation)
                    .WithMany(p => p.Faqtb009Variavel)
                    .HasForeignKey(d => d.NuDialogo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_faqtb009_variavel_faqtb001_dialogo");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
