using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Core.Repositories;
using SOFCO.Core.Services;
using SOFCO.Repositories;

namespace SOFCO.Service
{
    public class BaseService<T> : IService<T>
    {
        protected IRepository<T> _repository;

        public T GetById(int id)
        {
            return _repository.GetById(id);
        }

        public IQueryable<T> GetAll()
        {
            return _repository.GetAll();
        }

        public IQueryable<T> GetAllReadOnly()
        {
            return _repository.GetAllReadOnly();
        }

        public void Insert(T entity)
        {
            _repository.Insert(entity);
            _repository.Save();
        }

        public void Update(T entity)
        {
            _repository.Update(entity);
            _repository.Save();
        }

        public virtual void SaveOrUpdate(T entity)
        {
            _repository.SaveOrUpdate(entity);
            _repository.Save();
        }

        public void Delete(T entity)
        {
            _repository.Delete(entity);
            _repository.Save();
        }

        public void Delete(int id)
        {
            _repository.Delete(id);
            _repository.Save();
        }

        public void InsertWithTransaction(T entity)
        {
            _repository.Insert(entity);
        }

        public void UpdateWithTransaction(T entity)
        {
            _repository.Update(entity);
        }

        public void BeginTransaction()
        {
            _repository.BeginTransaction();
        }

        public void Rollback()
        {
            _repository.Rollback();
        }

        public void Commit()
        {
            _repository.Commit();
        }
    }
}
