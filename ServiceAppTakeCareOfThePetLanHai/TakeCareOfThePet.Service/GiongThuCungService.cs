using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IGiongThuCungService
    {
        GiongThuCung GetById(int id);
        IEnumerable<GiongThuCung> GetAll();
        IEnumerable<GiongThuCung> GetAllForTrue();
        IEnumerable<GiongThuCung> GetAllKeySearch(string keySearch);
        int ListCountGiongThuCung();
        GiongThuCung Add(GiongThuCung giongThuCung);
        void Update(GiongThuCung giongThuCung);
        void KhoaMo(int id);
        GiongThuCung Delete(int id);
        void SaveChange();
    }
    public class GiongThuCungService : IGiongThuCungService
    {
        private readonly IGiongThuCungRepository _giongThuCungRepository;
        private readonly IUnitOfWork _unitOfWork;

        public GiongThuCungService(IGiongThuCungRepository giongThuCungRepository, IUnitOfWork unitOfWork)
        {
            _giongThuCungRepository = giongThuCungRepository;
            _unitOfWork = unitOfWork;
        }

        public GiongThuCung GetById(int id)
        {
            return _giongThuCungRepository.GetSingleById(id);
        }

        public IEnumerable<GiongThuCung> GetAll()
        {
            return _giongThuCungRepository.GetAll(new string[] { });
        }

        public GiongThuCung Add(GiongThuCung giongThuCung)
        {
            return _giongThuCungRepository.Add(giongThuCung);
        }

        public void Update(GiongThuCung giongThuCung)
        {
            _giongThuCungRepository.Update(giongThuCung);
        }

        public void KhoaMo(int id)
        {
            _giongThuCungRepository.KhoaMo(id);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public GiongThuCung Delete(int id)
        {
            return _giongThuCungRepository.Delete(id);
        }


        public int ListCountGiongThuCung()
        {
            return _giongThuCungRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }


        public IEnumerable<GiongThuCung> GetAllKeySearch(string keySearch)
        {
            return _giongThuCungRepository.SearchWithKey(keySearch);
        }


        public IEnumerable<GiongThuCung> GetAllForTrue()
        {
            return _giongThuCungRepository.GetMulti(x => x.TrangThai == true);
        }
    }
}
