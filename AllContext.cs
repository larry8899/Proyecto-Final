using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ApiWindows.Models
{
    public class AllContext: DbContext 
    {
        public AllContext(DbContextOptions<AllContext> options)
            : base(options)
        {

        }
        public DbSet<Nave> AllContexts { get; set; }
        public DbSet<Mision> Misiones { get; set; }
        public DbSet<Usuario> Usarios { get; set; }
        public DbSet<CuerpoCeleste> CuerpoCelestes { get; set; }
        public DbSet<DistribucionMineral> DistribucionMineral { get; set; }
    }
}
