using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TakeCareOfThePet.Model.Models
{
    [Table("Error")]
    public class Error
    {
        [Key]
        public int ID { set; get; }

        [Column(TypeName = "ntext")]
        public string Message { set; get; }

        [Column(TypeName = "ntext")]
        public string StackTrace { set; get; }

        public DateTime CreatedDate { set; get; }
    }
}