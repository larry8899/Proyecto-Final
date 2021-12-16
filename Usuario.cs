using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ApiWindows.Models
{
    [Table("Usuario")]
    public class Usuario
    {
        [Key]
        public int idUsuario { get; set; }
        public string nombres { get; set; }
        public string apellidoPat { get; set; }
        public string apellidoMat { get; set; }
        public double ocupacion { get; set; }
        public double tipoUsuario { get; set; }
        public double nombreUsuario { get; set; }
        public double contrasena { get; set; }
        public bool estatus { get; set; }
        public double capOxigeno { get; set; }  
        public int idNave { get; set; }
        public int idMision { get; set; }


    }
}
