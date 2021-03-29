using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Realtors_Portal.Data;
using Realtors_Portal.Models.Customer;

namespace Realtors_Portal.Controllers.Product
{
    [Route("api/[controller]")]
    [ApiController]
    public class PackagePurchasedsController : ControllerBase
    {
        private readonly Realtors_PortalContext _context;

        public PackagePurchasedsController(Realtors_PortalContext context)
        {
            _context = context;
        }

        // GET: api/PackagePurchaseds
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PackagePurchased>>> GetPackagePurchased()
        {
            return await _context.PackagePurchased.ToListAsync();
        }

        // GET: api/PackagePurchaseds/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PackagePurchased>> GetPackagePurchased(int id)
        {
            var packagePurchased = await _context.PackagePurchased.FindAsync(id);

            if (packagePurchased == null)
            {
                return NotFound();
            }

            return packagePurchased;
        }

        // PUT: api/PackagePurchaseds/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPackagePurchased(int id, PackagePurchased packagePurchased)
        {
            if (id != packagePurchased.ppID)
            {
                return BadRequest();
            }

            _context.Entry(packagePurchased).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PackagePurchasedExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/PackagePurchaseds
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PackagePurchased>> PostPackagePurchased(PackagePurchased packagePurchased)
        {
            _context.PackagePurchased.Add(packagePurchased);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPackagePurchased", new { id = packagePurchased.ppID }, packagePurchased);
        }

        // DELETE: api/PackagePurchaseds/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePackagePurchased(int id)
        {
            var packagePurchased = await _context.PackagePurchased.FindAsync(id);
            if (packagePurchased == null)
            {
                return NotFound();
            }

            _context.PackagePurchased.Remove(packagePurchased);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PackagePurchasedExists(int id)
        {
            return _context.PackagePurchased.Any(e => e.ppID == id);
        }
    }
}
