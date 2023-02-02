using QLBH.Common.BLL;
using QLBH.Common.Req;
using QLBH.Common.Rsp;
using QLBH.DAL;
using QLBH.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Helpers;

namespace QLBH.BLL
{
    public class UserSvc : GenericSvc<UserRep, User>
    {
        private UserRep userRep;
        public UserSvc()
        {
            userRep = new UserRep();
        }

        #region Override
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();
            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }
        public override SingleRsp Update(User u)
        {
            var res = new SingleRsp();

            var m1 = u.Id > 0 ? _rep.Read(u.Id) : _rep.Read(u.UserRole);
            if (m1 == null)
            {
                res.SetError("EZ103", "No data.");
            }
            else
            {
                res = base.Update(u);
                res.Data = u;
            }

            return res;
        }
        #endregion
        #region methods
        public SingleRsp RegisterUser(UserReq userReq)
        {
            var res = new SingleRsp();
            User user = new User();
         
            user.FirstName = userReq.FirstName;
            user.LastName = userReq.LastName;
            user.Username = userReq.Username;
            user.Phone = userReq.Phone;
            user.UserAddress = userReq.UserAddress;
            user.Pwd = userReq.Pwd;
            res = userRep.RegisterUser(user);
            return res;
        }

        public SingleRsp Login(User user)
        {
            var res = new SingleRsp();
            res = userRep.Login(user);
            return res;
        }
        #endregion
    }
}
