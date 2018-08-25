using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    #region Interface Tài khoản service 
    public interface ITaiKhoanService
    {
        TaiKhoan Add(TaiKhoan taiKhoan);

        void SenEmail(string toEmailAddress, string subject, string content);

        void Update(TaiKhoan taiKhoan);

        TaiKhoan Delete(int id);

        //void KhoaMo(int id);

        IEnumerable<TaiKhoan> GetAll();

        /// <summary>
        /// xóa với id quyền truyền vào
        /// </summary>
        /// <param name="id"></param>
        void DeleteMulti(int id);

        TaiKhoan GetById(int id);

        TaiKhoan GetSingerCondition(string userName, string pass);

        int ListCountTaiKhoanCheckLogin(string userName, string pass);

        TaiKhoan DoiMatKhau(string passNew, string passOld, string userName);

        TaiKhoan Login(string userName, string pass);

        void SaveChange();
    }
    #endregion
    #region Tài khoản service
    public class TaiKhoanService : ITaiKhoanService
    {
        private readonly ITaiKhoanRepository _taiKhoanRepository;
        private readonly IUnitOfWork _unitOfWork;

        public TaiKhoanService(ITaiKhoanRepository taiKhoanRepository, IUnitOfWork unitOfWork)
        {
            _taiKhoanRepository = taiKhoanRepository;
            _unitOfWork = unitOfWork;
        }

        public TaiKhoan GetById(int id)
        {
            return _taiKhoanRepository.GetSingleById(id);
        }

        public TaiKhoan GetSingerCondition(string userName, string pass)
        {
            return _taiKhoanRepository.GetSingleByCondition(x => x.UserName == userName && x.Pass == pass && x.Quyen.TrangThai == true, new string[] { "Quyen" });
        }

        public int ListCountTaiKhoanCheckLogin(string userName, string pass)
        {
            return _taiKhoanRepository.Count(x => x.UserName == userName && x.Pass == pass && x.TrangThai == true);
        }

        public TaiKhoan DoiMatKhau(string passNew, string passOld, string userName)
        {
            TaiKhoan taiKhoanModel = null;
            taiKhoanModel = GetSingerCondition(userName, passOld);
            if (taiKhoanModel == null) return null;
            taiKhoanModel.Pass = passNew;
            _taiKhoanRepository.Update(taiKhoanModel);
            return taiKhoanModel;

        }

        public TaiKhoan Add(TaiKhoan taiKhoan)
        {
            return _taiKhoanRepository.Add(taiKhoan);
        }

        public void Update(TaiKhoan taiKhoan)
        {
            _taiKhoanRepository.Update(taiKhoan);
        }

        public TaiKhoan Delete(int id)
        {
            return _taiKhoanRepository.Delete(id);
        }

        //public void KhoaMo(int id)
        //{
        //    _taiKhoanRepository.KhoaMo(id);
        //}

        public IEnumerable<TaiKhoan> GetAll()
        {
            return _taiKhoanRepository.GetAll(new string[] { "Quyen" });
        }


        public TaiKhoan Login(string userName, string pass)
        {

            return GetSingerCondition(userName, pass);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public void DeleteMulti(int id)
        {
            _taiKhoanRepository.DeleteMulti(x => x.IdQuyen == id);
        }


        public void SenEmail(string toEmailAddress, string subject, string content)
        {
            _taiKhoanRepository.sendEmailViaWebApi(toEmailAddress, subject, content);
        }
    }
    #endregion
}
