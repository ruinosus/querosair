using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Subgurim.Controles;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack )
       {
        
            // Habilitando o zoom no mapa
            GoogleMaps.enableHookMouseWheelToZoom = true;
            GoogleMaps.enableGoogleBar = false;
            GoogleMaps.enableDragging = false;
            GoogleMaps.enableDoubleClickZoom = false;
            GoogleMaps.Version = "3";

            // Definir o tipo do mapa
            // Satellite, Hybrid, Physical, Normal

            GoogleMaps.mapType = GMapType.GTypes.Normal;

            //GLatLng latitudeLongitude = new GLatLng("Recife Brasil");

            GoogleMaps.setCenter(GoogleMaps.getGeoCodeRequest("Recife Pernambuco").Placemark.coordinates, 10);
            //mudando o tamanho do mapa
            //GoogleMaps.Height = 200;
            //GoogleMaps.Width = 800;

            // Ver imagem para entender quais sao os controles adicionados
            GControl mapType = new GControl(GControl.preBuilt.MapTypeControl);
            GControl overview = new GControl(GControl.preBuilt.GOverviewMapControl);
            GControl small = new GControl(GControl.preBuilt.SmallMapControl);
            //GoogleMaps.addControl(mapType); // Ver imagem
            //GoogleMaps.addControl(overview); // Ver imagem
            GoogleMaps.addControl(small); // Ver imagem
        }
    }
}
