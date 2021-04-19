using MailKit;
using Microsoft.AspNetCore.Mvc;
using Realtors_Portal.Models.DTOs.Requests;
using System;
using System.Threading.Tasks;
using Realtors_Portal.Services;
using IMailService = Realtors_Portal.Services.IMailService;

namespace Realtors_Portal.Controllers.System
{
    [Route("api/[controller]")]
    [ApiController]
    public class MailController : ControllerBase
    {
        private readonly IMailService mailService;
        public MailController(IMailService mailService)
        {
            this.mailService = mailService;
        }
        [HttpPost("send")]
        public async Task<IActionResult> SendMail([FromForm] MailRequest request)
        {
            try
            {
                await mailService.SendEmailAsync(request);
                return Ok();
            }
            catch (Exception ex)
            {
                throw;
            }

        }
    }
}
