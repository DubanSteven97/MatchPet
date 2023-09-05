using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatchPetDal
{
    public partial class DBMatchpet
    {
        public string ConnectionString { get; set; }

        public DBMatchpet(string connectionString)
            : base(connectionString)
        {
            ConnectionString = connectionString;
        }
        public Organizacion GetOrganizacion(int idOrganizacion)
        {
            try
            {
                var res = from o in this.Organizacion
                          where o.idOrganizacion == idOrganizacion
                          select o;
                return res.First();
            }
            catch (Exception)
            {
                throw;
            }

        }

        static void Main(string[] args)
        {
            Console.WriteLine("Hola");

        }
    }
}
