using Microsoft.AspNetCore.Mvc.Rendering;

namespace myfincance_web_dotnet.Models
{
    public class TransacaoModel
    {
        public int? Id { get; set; }
        public DateTime Data { get; set; }
        public decimal Valor { get; set; }
        public String? Historico { get; set; }
        public int PlanoContaId { get; set; }
        public PlanoContaModel ItemPlanoConta { get; set; }
        public IEnumerable<SelectListItem>? PlanoContas { get; set; }
    }
}