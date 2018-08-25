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
    public interface IDichVuService
    {
        DichVu GetById(int id);
        IEnumerable<DichVu> GetAllWithIdCoSoThuY(int id);
        IEnumerable<DichVu> GetAllWithIdCoSoThuYForTrue(int id);
        IEnumerable<DichVu> GetAllKeySearch(string keySearch);
        DichVu Add(DichVu dichVu);
        void Update(DichVu dichVu);
        void KhoaMo(int id);
        DichVu Delete(int id);
        void SaveChange();
    }
    public class DichVuService : IDichVuService
    {
        private readonly IDichVuRepository _dichVuRepository;
        private readonly IUnitOfWork _unitOfWork;

        public DichVuService(IDichVuRepository dichVuRepository, IUnitOfWork unitOfWork)
        {
            _dichVuRepository = dichVuRepository;
            _unitOfWork = unitOfWork;
        }
        public DichVu GetById(int id)
        {
            return _dichVuRepository.GetSingleByCondition(x => x.IdDichVu == id, new string[] { });
        }

        public IEnumerable<DichVu> GetAllForTrue()
        {
            return _dichVuRepository.GetMulti(x => x.TinhTrang == true, new string[] { });
        }

        public IEnumerable<DichVu> GetAllKeySearch(string keySearch)
        {
            return _dichVuRepository.SearchWithKey(keySearch);
        }

        public DichVu Add(DichVu dichVu)
        {
            return _dichVuRepository.Add(dichVu);
        }

        public void Update(DichVu dichVu)
        {
            _dichVuRepository.Update(dichVu);
        }

        public void KhoaMo(int id)
        {
            _dichVuRepository.KhoaMo(id);
        }

        public DichVu Delete(int id)
        {
            return _dichVuRepository.Delete(id);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public IEnumerable<DichVu> GetAllWithIdCoSoThuY(int id)
        {
            return _dichVuRepository.GetMulti(x => x.IdCoSoThuY == id, new string[] { });
        }


        public IEnumerable<DichVu> GetAllWithIdCoSoThuYForTrue(int id)
        {
            return _dichVuRepository.GetMulti(x => x.IdCoSoThuY == id && x.TinhTrang == true, new string[] { });
        }
    }
}
