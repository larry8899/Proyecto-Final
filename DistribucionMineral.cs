using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ApiWindows.Models
{
    [Table("DistribucionMineral")]
    public class DistribucionMineral
    {
        [Key]
        public int idDistribucionMineral { get; set; }
        public double silicioPorcentaje { get; set; }
        public double rodioPorcentaje { get; set; }
        public double cobaltoPorcentaje { get; set; }
        public double uranioPorcentaje { get; set; }
        public double platinoPorcentaje { get; set; }
        public double titanioPorcentaje { get; set; }
        public double oroPorcentaje { get; set; }
        public double niquelPorcentaje { get; set; }
        public double litioPorcentaje { get; set; }
        public double otroProcentaje { get; set; }
        public Boolean estatus { get; set; }
    }
}