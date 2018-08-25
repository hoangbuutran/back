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
    public interface IHoatDongService
    {
        HoatDong GetById(int id);
        IEnumerable<HoatDong> GetAllWithIdCoSoThuYForTrue(int id);
        IEnumerable<HoatDong> GetAllWithIdCoSoThuY(int id);
        IEnumerable<HoatDong> GetAllKeySearch(string keySearch);
        HoatDong Add(HoatDong hoatDong);
        void Update(HoatDong hoatDong);
        void KhoaMo(int id);
        HoatDong Delete(int id);
        void SaveChange();
    }
    public class HoatDongService : IHoatDongService
    {
        private readonly IHoatDongRepository _hoatDongRepository;
        private readonly IUnitOfWork _unitOfWork;
        public HoatDongService(IHoatDongRepository hoatDongRepository, IUnitOfWork unitOfWork)
        {
            _hoatDongRepository = hoatDongRepository;
            _unitOfWork = unitOfWork;
        }
        public HoatDong GetById(int id)
        {
            return _hoatDongRepository.GetSingleByCondition(x => x.IdHoatDong == id, new string[] { });
        }

        public IEnumerable<HoatDong> GetAllKeySearch(string keySearch)
        {
            return _hoatDongRepository.SearchWithKey(keySearch).OrderByDescending(x => x.NgayThang);
        }

        public HoatDong Add(HoatDong hoatDong)
        {
            return _hoatDongRepository.Add(hoatDong);
        }

        public void Update(HoatDong hoatDong)
        {
            _hoatDongRepository.Update(hoatDong);
        }

        public void KhoaMo(int id)
        {
            _hoatDongRepository.KhoaMo(id);
        }

        public HoatDong Delete(int id)
        {
            return _hoatDongRepository.Delete(id);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public IEnumerable<HoatDong> GetAllWithIdCoSoThuYForTrue(int id)
        {
            return _hoatDongRepository.GetMulti(x => x.IdCoSoThuY == id && x.TinhTrang == true, new string[] { }).OrderByDescending(x => x.NgayThang);
        }


        public IEnumerable<HoatDong> GetAllWithIdCoSoThuY(int id)
        {
            return _hoatDongRepository.GetMulti(x => x.IdCoSoThuY == id, new string[] { }).OrderByDescending(x => x.NgayThang);
        }
    }
}
