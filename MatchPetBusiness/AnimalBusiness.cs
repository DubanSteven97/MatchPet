using MatchPetDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetBusiness
{
    public class AnimalBusiness
    {
        public AnimalBusiness()
        {
        }

        public List<spGetAnimales_Result> GetSpGetAnimales()
        {
            try
            {
                List<spGetAnimales_Result> result = null;
                using (var dbContext = new DBMatchpet())
                {
                    result = dbContext.spGetAnimales().ToList();
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
