using System;
using TakeCareOfThePet.Data.Models;

namespace TakeCareOfThePet.Data.Infrastructure
{
    public interface IDbFactory : IDisposable
    {
        DataBaseAppPetDbContext Init();
    }
}