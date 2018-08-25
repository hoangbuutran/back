using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IShopService
    {
        Shop GetById(int id);
        IEnumerable<Shop> GetAll();
        IEnumerable<Shop> GetAllChuaDuyet();
        //IEnumerable<Shop> GetAllSearchKey(string searchKey);
        int ListCountShop();
        Shop GetByIdTaiKhoan(int id);
        Shop Add(Shop shop);
        void Update(Shop shop);
        string ThayDoiChuoi(string text);
        Shop Delete(int id);
        void KhoaMo(int id);
        Shop Duyet(int id);
        Shop Xoa(int id);
        IEnumerable<Shop> GetAllCoEmail(string email);
        void SaveChange();
    }
    public class ShopService : IShopService
    {
        private readonly IShopRepository _shopRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ShopService(IShopRepository shopRepository, IUnitOfWork unitOfWork)
        {
            _shopRepository = shopRepository;
            _unitOfWork = unitOfWork;
        }
        public Shop GetById(int id)
        {
            return _shopRepository.GetSingleByCondition(x => x.IdShop == id, new string[] { });
        }

        public IEnumerable<Shop> GetAll()
        {
            return _shopRepository.GetAll(new string[] { });
        }

        public Shop Add(Shop shop)
        {
            return _shopRepository.Add(shop);
        }

        public void Update(Shop shop)
        {
            _shopRepository.Update(shop);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public Shop Delete(int id)
        {
            return _shopRepository.Delete(id);
        }


        public int ListCountShop()
        {
            return _shopRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }



        //public IEnumerable<Shop> GetAllSearchKey(string searchKey)
        //{
        //    return _shopRepository.SearchWithKey(searchKey);
        //}


        public void KhoaMo(int id)
        {
            _shopRepository.KhoaMo(id);
        }


        public string ThayDoiChuoi(string text)
        {
            return _shopRepository.ThayDoiChuoi(text);
        }


        public Shop GetByIdTaiKhoan(int id)
        {
            return _shopRepository.GetByIdTaiKhoan(id);
        }


        public IEnumerable<Shop> GetAllCoEmail(string email)
        {
            return _shopRepository.GetAllCoEmail(email);
        }


        public Shop Duyet(int id)
        {
            return _shopRepository.Duyet(id);
        }

        public Shop Xoa(int id)
        {
            return _shopRepository.Xoa(id);
        }


        public IEnumerable<Shop> GetAllChuaDuyet()
        {
            return _shopRepository.GetMulti(x => x.PheDuyet == false, new string[] { });
        }
    }
}
