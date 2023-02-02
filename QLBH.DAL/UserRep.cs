using QLBH.Common.DAL;
using QLBH.Common.Rsp;
using QLBH.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Helpers;


namespace QLBH.DAL
{
    public class UserRep : GenericRep<qlbhContext, User>
    {
        #region Overrides
        public override User Read(int id)
        {
            return base.Read(id);
        }

        public int Remove(int id)
        {
            var m = base.All.First(i => i.Id == id);
            m = base.Delete(m);
            return m.Id;
        }
        #endregion

        #region methods: registeruser, login , logout, authentication
        public User Read(String name)
        {
            return base.Read(name);
        }
        public SingleRsp RegisterUser(User user)
        {
            
            var res = new SingleRsp();
            using (var context = new qlbhContext())
            {
                using ( var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var checkUserName = context.Users.FirstOrDefault(s => s.Username == user.Username);
                        var checkPhone = context.Users.FirstOrDefault(s => s.Phone == user.Phone);
                        if(checkUserName == null && checkPhone == null)
                        {
                            user.Pwd = Crypto.HashPassword(user.Pwd);
                            var p = context.Users.Add(user);
                            context.SaveChanges();
                            tran.Commit();
                        }
                       
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                       
                    }
                }
            }
            return res;

        }
        public SingleRsp Login(User user)
        {
            var res = new SingleRsp();
            using (var context = new qlbhContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var checkUser = context.Users.Where( s => s.Username.Equals(user.Username) && Crypto.VerifyHashedPassword(s.Pwd, user.Pwd));
                        if (checkUser != null)
                        {
                            User currentUser = this.Read(user.Id);
                            res.Data = currentUser;
                        }
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);

                    }
                }
            }
            return res;

        }
        #endregion
    }
}
