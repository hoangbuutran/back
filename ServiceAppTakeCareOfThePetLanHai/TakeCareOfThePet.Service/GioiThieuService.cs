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
    public interface IGioiThieuService
    {
        GioiThieu GetById(int id);
        GioiThieu Add(GioiThieu gioiThieu);
        void Update(GioiThieu gioiThieu);
        void SaveChange();
    }
    public class GioiThieuService: IGioiThieuService
    {
        private readonly IGioiThieuRepository _gioiThieuRepository;
        private readonly IUnitOfWork _unitOfWork;

        public GioiThieuService(IGioiThieuRepository gioiThieuRepository, IUnitOfWork unitOfWork)
        {
            _gioiThieuRepository = gioiThieuRepository;
            _unitOfWork = unitOfWork;
        }

        public GioiThieu GetById(int id)
        {
            return _gioiThieuRepository.GetSingleById(id);
        }

        public GioiThieu Add(GioiThieu gioiThieu)
        {
            return _gioiThieuRepository.Add(gioiThieu);
        }

        public void Update(GioiThieu gioiThieu)
        {
            _gioiThieuRepository.Update(gioiThieu);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }
    }
}
