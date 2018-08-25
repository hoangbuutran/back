using TakeCareOfThePet.Data.Models;
namespace TakeCareOfThePet.Data.Infrastructure
{
    public class DbFactory : Disposable, IDbFactory
    {
        private DataBaseAppPetDbContext dbContext;

        public DataBaseAppPetDbContext Init()
        {
            return dbContext ?? (dbContext = new DataBaseAppPetDbContext());
        }

        protected override void DisposeCore()
        {
            if (dbContext != null)
                dbContext.Dispose();
        }
    }
}