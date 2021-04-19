using Realtors_Portal.Models;
using System.Threading.Tasks;

namespace Realtors_Portal.Services
{
    public interface IMailService
    {
        Task SendEmailAsync(MailRequest mailRequest);
    }
}
