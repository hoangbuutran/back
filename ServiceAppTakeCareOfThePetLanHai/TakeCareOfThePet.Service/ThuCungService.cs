using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IThuCungService
    {
        ThuCung GetById(int id);
        IEnumerable<ThuCung> GetAll();
        int ListCountThuCung();
        ThuCung Add(ThuCung thuCung);
        void Update(ThuCung thuCung);
        IEnumerable<ThuCung> GetAllByIdNguoiDung(int id);
        void KhoaMo(int id);
        ThuCung Delete(int id);
        void SaveChange();
    }
    public class ThuCungService: IThuCungService
    {
        private readonly IThuCungRepository _thuCungRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ThuCungService(IThuCungRepository thuCungRepository, IUnitOfWork unitOfWork)
        {
            _thuCungRepository = thuCungRepository;
            _unitOfWork = unitOfWork;
        }

        public ThuCung GetById(int id)
        {
            return _thuCungRepository.GetSingleByCondition(x => x.IdThuCung == id, new string[] { "CanNangs", "GiongThuCung", "NguoiDung", "TinhTrangs" });
        }

        public IEnumerable<ThuCung> GetAll()
        {
            return _thuCungRepository.GetAll(new string[] { "CanNangs", "GiongThuCung", "NguoiDung", "TinhTrangs" });
        }

        public ThuCung Add(ThuCung thuCung)
        {
            return _thuCungRepository.Add(thuCung);
        }

        public void Update(ThuCung thuCung)
        {
            _thuCungRepository.Update(thuCung);
        }

        public void KhoaMo(int id)
        {
            _thuCungRepository.KhoaMo(id);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public ThuCung Delete(int id)
        {
            return _thuCungRepository.Delete(id);
        }


        public int ListCountThuCung()
        {
            return _thuCungRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }


        public IEnumerable<ThuCung> GetAllByIdNguoiDung(int id)
        {
            return _thuCungRepository.GetMulti(x => x.IdNguoiDung == id, new string[] { "CanNangs", "GiongThuCung", "NguoiDung", "TinhTrangs" }).OrderByDescending(y => y.NgayNuoi);
        }
    }
}
