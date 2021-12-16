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
    public class NavesController : ControllerBase
    {
        private readonly AllContext _context;

        public NavesController(AllContext context)
        {
            _context = context;
        }

        // GET: api/Naves
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Nave>>> GetAllContexts()
        {
            return await _context.AllContexts.ToListAsync();
        }

        // GET: api/Naves/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Nave>> GetNave(int id)
        {
            var nave = await _context.AllContexts.FindAsync(id);

            if (nave == null)
            {
                return NotFound();
            }

            return nave;
        }

        // PUT: api/Naves/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNave(int id, Nave nave)
        {
            if (id != nave.idNave)
            {
                return BadRequest();
            }

            _context.Entry(nave).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NaveExists(id))
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

        // POST: api/Naves
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Nave>> PostNave(Nave nave)
        {
            _context.AllContexts.Add(nave);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNave", new { id = nave.idNave }, nave);
        }

        // DELETE: api/Naves/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteNave(int id)
        {
            var nave = await _context.AllContexts.FindAsync(id);
            if (nave == null)
            {
                return NotFound();
            }

            _context.AllContexts.Remove(nave);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool NaveExists(int id)
        {
            return _context.AllContexts.Any(e => e.idNave == id);
        }
    }
}
