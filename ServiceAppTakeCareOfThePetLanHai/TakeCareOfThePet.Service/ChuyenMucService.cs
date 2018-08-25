using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IChuyenMucService
    {
        ChuyenMuc GetById(int id);
        IEnumerable<ChuyenMuc> GetAll();
        IEnumerable<ChuyenMuc> GetAllForTrue();
        int ListCountChuyenMuc();
        ChuyenMuc Add(ChuyenMuc chuyenMuc);
        void Update(ChuyenMuc chuyenMuc);
        ChuyenMuc Delete(int id);
        void KhoaMo(int id);
        void SaveChange();
    }
    public class ChuyenMucService : IChuyenMucService
    {
        private readonly IChuyenMucRepository _chuyenMucRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ChuyenMucService(IChuyenMucRepository chuyenMucRepository, IUnitOfWork unitOfWork)
        {
            _chuyenMucRepository = chuyenMucRepository;
            _unitOfWork = unitOfWork;
        }
        public ChuyenMuc GetById(int id)
        {
            return _chuyenMucRepository.GetSingleById(id);
        }

        public IEnumerable<ChuyenMuc> GetAll()
        {
            return _chuyenMucRepository.GetAll(new string[] { });
        }

        public ChuyenMuc Add(ChuyenMuc chuyenMuc)
        {
            return _chuyenMucRepository.Add(chuyenMuc);
        }

        public void Update(ChuyenMuc chuyenMuc)
        {
            _chuyenMucRepository.Update(chuyenMuc);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public ChuyenMuc Delete(int id)
        {
            return _chuyenMucRepository.Delete(id);
        }


        public int ListCountChuyenMuc()
        {
            return _chuyenMucRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }

        public void KhoaMo(int id)
        {
            _chuyenMucRepository.KhoaMo(id);
        }


        public IEnumerable<ChuyenMuc> GetAllForTrue()
        {
            return _chuyenMucRepository.GetMulti(x => x.TrangThai == true);
        }
    }
}
