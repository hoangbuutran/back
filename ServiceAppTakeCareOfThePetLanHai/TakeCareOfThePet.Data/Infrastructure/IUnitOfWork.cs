namespace TakeCareOfThePet.Data.Infrastructure
{
    public interface IUnitOfWork
    {
        void Commit();
    }
}