
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;
namespace DTU.Data.Repositories
{
    public interface IErrorRepository : IRepository<Error>
    {
    }

    public class ErrorRepository : RepositoryBase<Error>, IErrorRepository
    {
        public ErrorRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}