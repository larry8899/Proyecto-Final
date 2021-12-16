using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ApiWindows.Models
{
    [Table("CuerpoCeleste")]
    public class CuerpoCeleste
    {
        [Key]
        public int idCuerpoCeleste { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public double areaSuperficie { get; set; }
        public double diametro { get; set; }
        public double masa { get; set; }
        public string galaxia { get; set; }
        public string sistemaPlanetario { get; set; }

        public Boolean estatus { get; set; }
        public int idDistribucionMineral { get; set; }


    }
}