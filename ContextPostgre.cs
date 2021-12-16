using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ApiWindows.Models
{
    public class ContextPostgre : DbContext
    {
        public ContextPostgre(DbContextOptions<ContextPostgre> options)
           : base(options)
        {

        }
        public DbSet<Mision> Misions { get; set; }
    }
}
