using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ApiWindows.Models
{
    [Table("Mision")]
    public class Mision
    {
        [Key]
        public int idMision { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int nTripulantes { get; set; }
        public int nNaves { get; set; }
        public int duracionDias { get; set; }
        public Boolean estatus { get; set; }
        public int idCuerpoCeleste { get; set; }
    }
}
