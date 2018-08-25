using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ISucKhoeThuCungService
    {
        SucKhoeThuCung GetById(int id);
        IEnumerable<SucKhoeThuCung> GetAllForTrue();
        IEnumerable<SucKhoeThuCung> GetAllWithIdCoSoThuY(int id);
        IEnumerable<SucKhoeThuCung> GetAllWithIdCoSoThuYForTrue(int id);
        IEnumerable<SucKhoeThuCung> GetAllKeySearch(string keySearch);
        SucKhoeThuCung Add(SucKhoeThuCung sucKhoeThuCung);
        void Update(SucKhoeThuCung sucKhoeThuCung);
        void KhoaMo(int id);
        SucKhoeThuCung Delete(int id);
        void SaveChange();
    }
    public class SucKhoeThuCungService : ISucKhoeThuCungService
    {
        private readonly ISucKhoeThuCungRepository _sucKhoeThuCungRepository;
        private readonly IUnitOfWork _unitOfWork;

        public SucKhoeThuCungService(ISucKhoeThuCungRepository sucKhoeThuCungRepository, IUnitOfWork unitOfWork)
        {
            _sucKhoeThuCungRepository = sucKhoeThuCungRepository;
            _unitOfWork = unitOfWork;
        }
        public SucKhoeThuCung GetById(int id)
        {
            return _sucKhoeThuCungRepository.GetSingleByCondition(x => x.IdSKTC == id, new string[] { });
        }

        public IEnumerable<SucKhoeThuCung> GetAllForTrue()
        {
            return _sucKhoeThuCungRepository.GetMulti(x => x.TinhTrang == true, new string[] { }).OrderByDescending(x => x.NgayThang);
        }

        public IEnumerable<SucKhoeThuCung> GetAllKeySearch(string keySearch)
        {
            return _sucKhoeThuCungRepository.SearchWithKey(keySearch).OrderByDescending(x => x.NgayThang);
        }

        public SucKhoeThuCung Add(SucKhoeThuCung sucKhoeThuCung)
        {
            return _sucKhoeThuCungRepository.Add(sucKhoeThuCung);
        }

        public void Update(SucKhoeThuCung sucKhoeThuCung)
        {
            _sucKhoeThuCungRepository.Update(sucKhoeThuCung);
        }

        public void KhoaMo(int id)
        {
            _sucKhoeThuCungRepository.KhoaMo(id);
        }

        public SucKhoeThuCung Delete(int id)
        {
            return _sucKhoeThuCungRepository.Delete(id);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }

        public IEnumerable<SucKhoeThuCung> GetAllWithIdCoSoThuY(int id)
        {
            return _sucKhoeThuCungRepository.GetMulti(x => x.IdCoSoThuY == id, new string[] { }).OrderByDescending(x => x.NgayThang);
        }

        public IEnumerable<SucKhoeThuCung> GetAllWithIdCoSoThuYForTrue(int id)
        {
            return _sucKhoeThuCungRepository.GetMulti(x => x.IdCoSoThuY == id && x.TinhTrang == true, new string[] { }).OrderByDescending(x => x.NgayThang);
        }
    }
}
