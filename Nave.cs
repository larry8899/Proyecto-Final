using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ApiWindows.Models
{
    [Table("Nave")]
    public class Nave
    {
        [Key]
        public int idNave { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string tipoNave { get; set; }
        public double velocidadMax { get; set; }
        public double cargaMax { get; set; }
        public double combustibleMax { get; set; }
        public double tripulacionMax { get; set; }
        public double capOxigeno { get; set; }
        public bool estatus { get; set; }

        public int idMision { get; set; }

    

    }
}
    