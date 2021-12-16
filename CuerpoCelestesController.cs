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
    public class CuerpoCelestesController : ControllerBase
    {
        private readonly AllContext _context;

        public CuerpoCelestesController(AllContext context)
        {
            _context = context;
        }

        // GET: api/CuerpoCelestes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CuerpoCeleste>>> GetCuerpoCelestes()
        {
            return await _context.CuerpoCelestes.ToListAsync();
        }

        // GET: api/CuerpoCelestes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CuerpoCeleste>> GetCuerpoCeleste(int id)
        {
            var cuerpoCeleste = await _context.CuerpoCelestes.FindAsync(id);

            if (cuerpoCeleste == null)
            {
                return NotFound();
            }

            return cuerpoCeleste;
        }

        // PUT: api/CuerpoCelestes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCuerpoCeleste(int id, CuerpoCeleste cuerpoCeleste)
        {
            if (id != cuerpoCeleste.idCuerpoCeleste)
            {
                return BadRequest();
            }

            _context.Entry(cuerpoCeleste).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CuerpoCelesteExists(id))
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

        // POST: api/CuerpoCelestes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CuerpoCeleste>> PostCuerpoCeleste(CuerpoCeleste cuerpoCeleste)
        {
            _context.CuerpoCelestes.Add(cuerpoCeleste);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCuerpoCeleste", new { id = cuerpoCeleste.idCuerpoCeleste }, cuerpoCeleste);
        }

        // DELETE: api/CuerpoCelestes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCuerpoCeleste(int id)
        {
            var cuerpoCeleste = await _context.CuerpoCelestes.FindAsync(id);
            if (cuerpoCeleste == null)
            {
                return NotFound();
            }

            _context.CuerpoCelestes.Remove(cuerpoCeleste);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CuerpoCelesteExists(int id)
        {
            return _context.CuerpoCelestes.Any(e => e.idCuerpoCeleste == id);
        }
    }
}
