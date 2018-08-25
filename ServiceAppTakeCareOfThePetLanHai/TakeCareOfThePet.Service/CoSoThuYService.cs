using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ICoSoThuYService
    {
        CoSoThuY GetById(int id);
        IEnumerable<CoSoThuY> GetAll();
        IEnumerable<CoSoThuY> GetAllForTrue();
        IEnumerable<CoSoThuY> GetAllSearchKey(string searchKey);
        int ListCountCoSoThuY();
        CoSoThuY GetByIdTaiKhoan(int id);
        CoSoThuY Add(CoSoThuY coSoThuY);
        void Update(CoSoThuY coSoThuY);
        string ThayDoiChuoi(string text);
        IEnumerable<CoSoThuY> GetAllCoEmail(string email);
        CoSoThuY Delete(int id);
        void KhoaMo(int id);
        void SaveChange();
    }
    public class CoSoThuYService : ICoSoThuYService
    {
        private readonly ICoSoThuYRepository _coSoThuYRepository;
        private readonly IUnitOfWork _unitOfWork;

        public CoSoThuYService(ICoSoThuYRepository coSoThuYRepository, IUnitOfWork unitOfWork)
        {
            _coSoThuYRepository = coSoThuYRepository;
            _unitOfWork = unitOfWork;
        }
        public CoSoThuY GetById(int id)
        {
            return _coSoThuYRepository.GetSingleByCondition(x => x.IdCoSoThuY == id, new string[] { "NguoiDungs"} );
        }

        public IEnumerable<CoSoThuY> GetAll()
        {
            return _coSoThuYRepository.GetAll(new string[] { "NguoiDungs" });
        }

        public CoSoThuY Add(CoSoThuY coSoThuY)
        {
            return _coSoThuYRepository.Add(coSoThuY);
        }

        public void Update(CoSoThuY coSoThuY)
        {
            _coSoThuYRepository.Update(coSoThuY);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public CoSoThuY Delete(int id)
        {
            return _coSoThuYRepository.Delete(id);
        }


        public int ListCountCoSoThuY()
        {
            return _coSoThuYRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }



        public IEnumerable<CoSoThuY> GetAllSearchKey(string searchKey)
        {
            return _coSoThuYRepository.SearchWithKey(searchKey);
        }


        public void KhoaMo(int id)
        {
            _coSoThuYRepository.KhoaMo(id);
        }


        public string ThayDoiChuoi(string text)
        {
            return _coSoThuYRepository.ThayDoiChuoi(text);
        }


        public CoSoThuY GetByIdTaiKhoan(int id)
        {
            return _coSoThuYRepository.GetByIdTaiKhoan(id);
        }


        public IEnumerable<CoSoThuY> GetAllForTrue()
        {
            return _coSoThuYRepository.GetMulti(x => x.TrangThai == true);
        }


        public IEnumerable<CoSoThuY> GetAllCoEmail(string email)
        {
            return _coSoThuYRepository.GetAllCoEmail(email);
        }
    }
}
