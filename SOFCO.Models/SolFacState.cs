using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFCO.Models
{
    public class SolFacState
    {
        [Key]
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string ProfileAllowed { get; set; }
        public string NextState { get; set; }
        public string PrevState { get; set; }
        public string ShortName { get; set; }
    }
}
