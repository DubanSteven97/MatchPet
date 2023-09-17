using System.Data.Entity.Core.EntityClient;
using System.IO;
using System.Threading.Tasks; // Agrega esta directiva para usar tareas asincrónicas

namespace webapi.Models
{
    public class Conexion
    {
        public MatchPetDal.DBMatchpet Context = null;
        public static EntityConnectionStringBuilder cb = null;

        public async Task DataBaseConfigAsync() // Cambia el nombre y agrega la palabra clave 'async'
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
            IConfiguration configuracion = builder.Build();
            cb = new EntityConnectionStringBuilder();
            cb.Metadata = "res://*/ModelMatchPet.csdl|res://*/ModelMatchPet.ssdl|res://*/ModelMatchPet.msl";
            cb.Provider = "System.Data.SqlClient";
            cb.ProviderConnectionString = configuracion["ConnectionStrings:cadenaSQL"];
            Context = new MatchPetDal.DBMatchpet(cb.ToString());

           
        }
    }
}
