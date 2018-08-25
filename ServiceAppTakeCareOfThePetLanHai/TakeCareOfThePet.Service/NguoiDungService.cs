using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface INguoiDungService
    {
        NguoiDung GetById(int id);
        IEnumerable<NguoiDung> GetAll();
        IEnumerable<NguoiDung> GetAllCoEmail(string email);
        IEnumerable<NguoiDung> GetAllByIdCoSoYTe(int id);
        int ListCountNguoiDung();
        NguoiDung Add(NguoiDung nguoiDung);
        void Update(NguoiDung nguoiDung);
        string ThayDoiChuoi(string text);
        void KhoaMo(int id);
        //int FindByEmail(String email);
        NguoiDung GetByIdTaiKhoan(int id);
        NguoiDung Delete(int id);
        void SaveChange();
    }
    public class NguoiDungService : INguoiDungService
    {
        private readonly INguoiDungRepository _nguoiDungRepository;
        private readonly IUnitOfWork _unitOfWork;

        public NguoiDungService(INguoiDungRepository nguoiDungRepository, IUnitOfWork unitOfWork)
        {
            _nguoiDungRepository = nguoiDungRepository;
            _unitOfWork = unitOfWork;
        }

        public NguoiDung GetById(int id)
        {
            return _nguoiDungRepository.GetSingleById(id);
        }

        public IEnumerable<NguoiDung> GetAll()
        {
            return _nguoiDungRepository.GetAll(new string[] { "ThuCungs" });
        }

        public NguoiDung Add(NguoiDung nguoiDung)
        {
            return _nguoiDungRepository.Add(nguoiDung);
        }

        public void Update(NguoiDung nguoiDung)
        {
            _nguoiDungRepository.Update(nguoiDung);
        }

        public void KhoaMo(int id)
        {
            _nguoiDungRepository.KhoaMo(id);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public string ThayDoiChuoi(string text)
        {
            return _nguoiDungRepository.ThayDoiChuoi(text);
        }

        public NguoiDung Delete(int id)
        {
            return _nguoiDungRepository.Delete(id);
        }


        public int ListCountNguoiDung()
        {
            return _nguoiDungRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }


        public IEnumerable<NguoiDung> GetAllByIdCoSoYTe(int id)
        {
            return _nguoiDungRepository.GetMulti(x => x.IdCoSoThuY == id, new string[] { "ThuCungs" });
        }


        public NguoiDung GetByIdTaiKhoan(int id)
        {
            return _nguoiDungRepository.GetByIdTaiKhoan(id);
        }


        //public int FindByEmail(string email)
        //{
        //    return _nguoiDungRepository.FindByEmail(email);
        //}


        public IEnumerable<NguoiDung> GetAllCoEmail(string email)
        {
            return _nguoiDungRepository.GetAllCoEmail(email);
        }
    }
}
