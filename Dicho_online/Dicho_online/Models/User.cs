//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Dicho_online.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public string Username { get; set; }
        public string HashString { get; set; }
        public string Salt { get; set; }
        public string CustomerID { get; set; }
        public Nullable<int> Privilege { get; set; }
    
        public virtual Customer Customer { get; set; }
    }
}
