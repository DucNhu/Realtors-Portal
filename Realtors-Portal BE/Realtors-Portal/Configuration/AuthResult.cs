using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Realtors_Portal.Configuration
{
    public class AuthResult
    {
        public string Token { get; set; }
        //public string RefreshToken { get; set; }
        public bool Success { get; set; }
        public List<string> Errors { get; set; }
    }
}
