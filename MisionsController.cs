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
    public class MisionsController : ControllerBase
    {
        private readonly AllContext _context;

        public MisionsController(AllContext context)
        {
            _context = context;
        }

        // GET: api/Misions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Mision>>> GetMisiones()
        {
            return await _context.Misiones.ToListAsync();
        }

        // GET: api/Misions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Mision>> GetMision(int id)
        {
            var mision = await _context.Misiones.FindAsync(id);

            if (mision == null)
            {
                return NotFound();
            }

            return mision;
        }

        // PUT: api/Misions/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMision(int id, Mision mision)
        {
            if (id != mision.idMision)
            {
                return BadRequest();
            }

            _context.Entry(mision).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MisionExists(id))
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

        // POST: api/Misions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Mision>> PostMision(Mision mision)
        {
            _context.Misiones.Add(mision);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMision", new { id = mision.idMision }, mision);
        }

        // DELETE: api/Misions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMision(int id)
        {
            var mision = await _context.Misiones.FindAsync(id);
            if (mision == null)
            {
                return NotFound();
            }

            _context.Misiones.Remove(mision);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MisionExists(int id)
        {
            return _context.Misiones.Any(e => e.idMision == id);
        }
    }
}
