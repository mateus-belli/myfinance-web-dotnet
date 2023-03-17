using myfincance_web_dotnet.Models;

namespace myfincance_web_dotnet.Domain.Services.Interfaces
{
    public interface ITransacaoService
    {
        List<TransacaoModel> ListarRegistros();
        void Salvar(TransacaoModel model);
        TransacaoModel RetornarRegistro(int id);
        void Excluir(int id);
    }
}