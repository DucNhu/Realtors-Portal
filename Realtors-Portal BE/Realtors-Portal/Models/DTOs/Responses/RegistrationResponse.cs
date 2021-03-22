using Realtors_Portal.Configuration;

namespace Realtors_Portal.Models.DTOs.Responses
{
    public class RegistrationResponse : AuthResult
    {
        public object Infor { get; set; }
    }
}
