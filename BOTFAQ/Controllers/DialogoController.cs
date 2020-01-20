using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BOTFAQ.Models;

namespace BOTFAQ.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DialogoController : ControllerBase
    {
        private readonly FAQDB001Context _context;

        public DialogoController(FAQDB001Context context)
        {
            _context = context;
        }

        // GET: api/Dialogo
        [HttpGet]
        public IEnumerable<Faqtb001Dialogo> GetFaqtb001Dialogo()
        {
            return _context.Faqtb001Dialogo;
        }

        // GET: api/Dialogo/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetFaqtb001Dialogo([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var faqtb001Dialogo = await _context.Faqtb001Dialogo.FindAsync(id);

            if (faqtb001Dialogo == null)
            {
                return NotFound();
            }

            return Ok(faqtb001Dialogo);
        }

        // PUT: api/Dialogo/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFaqtb001Dialogo([FromRoute] int id, [FromBody] Faqtb001Dialogo faqtb001Dialogo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != faqtb001Dialogo.NuDialogo)
            {
                return BadRequest();
            }

            _context.Entry(faqtb001Dialogo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Faqtb001DialogoExists(id))
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

        // POST: api/Dialogo
        [HttpPost]
        public async Task<IActionResult> PostFaqtb001Dialogo([FromBody] Faqtb001Dialogo faqtb001Dialogo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.Faqtb001Dialogo.Add(faqtb001Dialogo);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetFaqtb001Dialogo", new { id = faqtb001Dialogo.NuDialogo }, faqtb001Dialogo);
        }

        // DELETE: api/Dialogo/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFaqtb001Dialogo([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var faqtb001Dialogo = await _context.Faqtb001Dialogo.FindAsync(id);
            if (faqtb001Dialogo == null)
            {
                return NotFound();
            }

            _context.Faqtb001Dialogo.Remove(faqtb001Dialogo);
            await _context.SaveChangesAsync();

            return Ok(faqtb001Dialogo);
        }

        private bool Faqtb001DialogoExists(int id)
        {
            return _context.Faqtb001Dialogo.Any(e => e.NuDialogo == id);
        }
    }
}