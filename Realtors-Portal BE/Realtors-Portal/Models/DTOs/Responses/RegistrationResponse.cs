using Realtors_Portal.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Models.DTOs.Responses
{
    public class RegistrationResponse : AuthResult
    {
        public string User_type { get; set; }

    }
}
