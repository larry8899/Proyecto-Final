using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ApiWindows.Models;

namespace ApiWindows.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DistribucionMineralsController : ControllerBase
    {
        private readonly AllContext _context;

        public DistribucionMineralsController(AllContext context)
        {
            _context = context;
        }

        // GET: api/DistribucionMinerals
        [HttpGet]
        public async Task<ActionResult<IEnumerable<DistribucionMineral>>> GetDistribucionMineral()
        {
            return await _context.DistribucionMineral.ToListAsync();
        }

        // GET: api/DistribucionMinerals/5
        [HttpGet("{id}")]
        public async Task<ActionResult<DistribucionMineral>> GetDistribucionMineral(int id)
        {
            var distribucionMineral = await _context.DistribucionMineral.FindAsync(id);

            if (distribucionMineral == null)
            {
                return NotFound();
            }

            return distribucionMineral;
        }

        // PUT: api/DistribucionMinerals/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDistribucionMineral(int id, DistribucionMineral distribucionMineral)
        {
            if (id != distribucionMineral.idDistribucionMineral)
            {
                return BadRequest();
            }

            _context.Entry(distribucionMineral).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DistribucionMineralExists(id))
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

        // POST: api/DistribucionMinerals
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<DistribucionMineral>> PostDistribucionMineral(DistribucionMineral distribucionMineral)
        {
            _context.DistribucionMineral.Add(distribucionMineral);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDistribucionMineral", new { id = distribucionMineral.idDistribucionMineral }, distribucionMineral);
        }

        // DELETE: api/DistribucionMinerals/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDistribucionMineral(int id)
        {
            var distribucionMineral = await _context.DistribucionMineral.FindAsync(id);
            if (distribucionMineral == null)
            {
                return NotFound();
            }

            _context.DistribucionMineral.Remove(distribucionMineral);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DistribucionMineralExists(int id)
        {
            return _context.DistribucionMineral.Any(e => e.idDistribucionMineral == id);
        }
    }
}
