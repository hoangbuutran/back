using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ICanNangService
    {
        CanNang GetById(int id);
        IEnumerable<CanNang> GetAll();
        IEnumerable<CanNang> GetAllCanNangWithIdThuCung(int id);
        int ListCountCanNang();
        CanNang Add(CanNang canNang);
        void Update(CanNang canNang);
        CanNang Delete(int id);
        void SaveChange();
    }
    public class CanNangService: ICanNangService
    {
        private readonly ICanNangRepository _canNangRepository;
        private readonly IUnitOfWork _unitOfWork;

        public CanNangService(ICanNangRepository canNangRepository, IUnitOfWork unitOfWork)
        {
            _canNangRepository = canNangRepository;
            _unitOfWork = unitOfWork;
        }
        public CanNang GetById(int id)
        {
            return _canNangRepository.GetSingleById(id);
        }

        public IEnumerable<CanNang> GetAll()
        {
            return _canNangRepository.GetAll(new string[] { });
        }

        public CanNang Add(CanNang canNang)
        {
            return _canNangRepository.Add(canNang);
        }

        public void Update(CanNang canNang)
        {
            _canNangRepository.Update(canNang);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public CanNang Delete(int id)
        {
            return _canNangRepository.Delete(id);
        }


        public int ListCountCanNang()
        {
            return _canNangRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }



        public IEnumerable<CanNang> GetAllCanNangWithIdThuCung(int id)
        {
            return _canNangRepository.GetMulti(x => x.IdThuCung == id).OrderByDescending(y => y.NgayCapNhat);
        }
    }
}
