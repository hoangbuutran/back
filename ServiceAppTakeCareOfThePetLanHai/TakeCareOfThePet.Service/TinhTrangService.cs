using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ITinhTrangService
    {
        TinhTrang GetById(int id);
        IEnumerable<TinhTrang> GetAll();
        IEnumerable<TinhTrang> GetAllByIdThuCung(int id);
        int ListCountTinhTrang();
        TinhTrang Add(TinhTrang quyen);
        void Update(TinhTrang quyen);
        void KhoaMo(int id);
        TinhTrang Delete(int id);
        void SaveChange();
    }
    public class TinhTrangService : ITinhTrangService
    {
        private readonly ITinhTrangRepository _tinhTrangRepository;
        private readonly IUnitOfWork _unitOfWork;

        public TinhTrangService(ITinhTrangRepository tinhTrangRepository, IUnitOfWork unitOfWork)
        {
            _tinhTrangRepository = tinhTrangRepository;
            _unitOfWork = unitOfWork;
        }

        public TinhTrang GetById(int id)
        {
            return _tinhTrangRepository.GetSingleById(id);
        }

        public IEnumerable<TinhTrang> GetAll()
        {
            return _tinhTrangRepository.GetAll(new string[] { });
        }

        public TinhTrang Add(TinhTrang quyen)
        {
            return _tinhTrangRepository.Add(quyen);
        }

        public void Update(TinhTrang quyen)
        {
            _tinhTrangRepository.Update(quyen);
        }

        public void KhoaMo(int id)
        {
            _tinhTrangRepository.KhoaMo(id);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public TinhTrang Delete(int id)
        {
            return _tinhTrangRepository.Delete(id);
        }


        public int ListCountTinhTrang()
        {
            return _tinhTrangRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }


        public IEnumerable<TinhTrang> GetAllByIdThuCung(int id)
        {
            return _tinhTrangRepository.GetMulti(x => x.IdThuCung == id).OrderByDescending(y => y.NgayCapNhat);
        }
    }
}
