using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ILichSuKhamService
    {
        LichSuKham GetById(int id);
        IEnumerable<LichSuKham> GetAllWithIdThuCungKhams(int id);
        IEnumerable<LichSuKham> GetAllKeySearch(string keySearch);
        LichSuKham Add(LichSuKham lichSuKham);
        void Update(LichSuKham lichSuKham);
        LichSuKham Delete(int id);
        void SaveChange();
    }
    public class LichSuKhamService: ILichSuKhamService
    {
        private readonly ILichSuKhamRepository _lichSuKhamRepository;
        private readonly IUnitOfWork _unitOfWork;

        public LichSuKhamService(ILichSuKhamRepository lichSuKhamRepository, IUnitOfWork unitOfWork)
        {
            _lichSuKhamRepository = lichSuKhamRepository;
            _unitOfWork = unitOfWork;
        }


        public LichSuKham GetById(int id)
        {
            return _lichSuKhamRepository.GetSingleByCondition(x => x.IdLichSuKham == id, new string[] { });
        }

        public IEnumerable<LichSuKham> GetAllWithIdThuCungKhams(int id)
        {
            return _lichSuKhamRepository.GetMulti(x => x.IdThuCung == id, new string[] { }).OrderByDescending(x => x.NgayThang);
        }

        public IEnumerable<LichSuKham> GetAllKeySearch(string keySearch)
        {
            return _lichSuKhamRepository.SearchWithKey(keySearch).OrderByDescending(x => x.NgayThang);
        }

        public LichSuKham Add(LichSuKham lichSuKham)
        {
            return _lichSuKhamRepository.Add(lichSuKham);
        }

        public void Update(LichSuKham lichSuKham)
        {
            _lichSuKhamRepository.Update(lichSuKham);
        }

        public LichSuKham Delete(int id)
        {
            return _lichSuKhamRepository.Delete(id);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }
    }
}

