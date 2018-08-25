using DTU.Data.Repositories;
using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IErrorService
    {
        IEnumerable<Error> GetAll();
        Error Create(Error error);
        void Save();
    }
    public class ErrorService : IErrorService
    {
        private readonly IErrorRepository _errorRepository;
        private readonly IUnitOfWork _unitOfWork;
        public ErrorService(IErrorRepository errorRepository,IUnitOfWork unitOfWork)
        {
            this._errorRepository = errorRepository;
            this._unitOfWork = unitOfWork;
        }
        public Error Create(Error error)
        {
            return _errorRepository.Add(error);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public IEnumerable<Error> GetAll()
        {
            return _errorRepository.GetAll();
        }
    }
}
