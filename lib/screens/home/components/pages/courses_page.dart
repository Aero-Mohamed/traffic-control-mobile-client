import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CoursesPage extends StatelessWidget {
  var pointsGradient = <LatLng>[
    LatLng( 30.026737002775945 ,  31.210936099523135 ),
    LatLng( 30.026754306910533 ,  31.210904024084215 ),
    LatLng( 30.026787939412365 ,  31.210906418529742 ),
    LatLng( 30.026838010177123 ,  31.2109099832893 ),
    LatLng( 30.026901900043683 ,  31.210914531895202 ),
    LatLng( 30.026987541651067 ,  31.21092216963268 ),
    LatLng( 30.02708594893777 ,  31.210934308855656 ),
    LatLng( 30.027200204842366 ,  31.210948403139664 ),
    LatLng( 30.02732461384049 ,  31.210959557343337 ),
    LatLng( 30.027469886582242 ,  31.21097066100464 ),
    LatLng( 30.027608051045636 ,  31.21096117326751 ),
    LatLng( 30.027711253565943 ,  31.210934220581528 ),
    LatLng( 30.02777536350453 ,  31.210916155203286 ),
    LatLng( 30.027859676860512 ,  31.210891341256087 ),
    LatLng( 30.027958213041543 ,  31.21084761338172 ),
    LatLng( 30.028071080769244 ,  31.210796149396067 ),
    LatLng( 30.028203771676594 ,  31.210735646517733 ),
    LatLng( 30.02835808158949 ,  31.21066528581899 ),
    LatLng( 30.028533384835015 ,  31.210586516717857 ),
    LatLng( 30.028727807875104 ,  31.210504741381335 ),
    LatLng( 30.02894396042812 ,  31.21041728860049 ),
    LatLng( 30.029173540246337 ,  31.210332462940194 ),
    LatLng( 30.029369257774633 ,  31.210267520025415 ),
    LatLng( 30.029527422034597 ,  31.210220774849113 ),
    LatLng( 30.029645900644578 ,  31.210187072206512 ),
    LatLng( 30.029725447619093 ,  31.210163333584557 ),
    LatLng( 30.029761504929308 ,  31.21014130025158 ),
    LatLng( 30.029766133456363 ,  31.21008606911513 ),
    LatLng( 30.029746640568415 ,  31.210013975842532 ),
    LatLng( 30.02972154672738 ,  31.209921308234126 ),
    LatLng( 30.029692394816504 ,  31.209813683380855 ),
    LatLng( 30.029657464540897 ,  31.209684497002282 ),
    LatLng( 30.02961666110223 ,  31.209533672142864 ),
    LatLng( 30.029571736092294 ,  31.209367558385225 ),
    LatLng( 30.02952409166718 ,  31.20918962879376 ),
    LatLng( 30.029472097357246 ,  31.20899474719634 ),
    LatLng( 30.02941361244213 ,  31.208775330669464 ),
    LatLng( 30.029350132892908 ,  31.208537177711474 ),
    LatLng( 30.02931335006904 ,  31.208283011053858 ),
    LatLng( 30.029239106537947 ,  31.208006895665825 ),
    LatLng( 30.029159812329553 ,  31.207726924002152 ),
    LatLng( 30.029081356303436 ,  31.207445748316783 ),
    LatLng( 30.02900137056123 ,  31.207158473025274 ),
    LatLng( 30.02892075793398 ,  31.206868948938673 ),
    LatLng( 30.028847654436696 ,  31.206599986088076 ),
    LatLng( 30.028769965456824 ,  31.206315656284097 ),
    LatLng( 30.02869371029801 ,  31.20603779305045 ),
    LatLng( 30.028614306107052 ,  31.205747506413832 ),
    LatLng( 30.02854593452827 ,  31.205500752201804 ),
    LatLng( 30.028467587464934 ,  31.20521360744695 ),
    LatLng( 30.02839312093095 ,  31.204933834225265 ),
    LatLng( 30.028316656120033 ,  31.20464241113138 ),
    LatLng( 30.028240843682383 ,  31.20436304791493 ),
    LatLng( 30.028175723742642 ,  31.20406867473414 ),
    LatLng( 30.028120840884316 ,  31.203818762857537 ),
    LatLng( 30.028072127355493 ,  31.203615304964277 ),
    LatLng( 30.028033438610215 ,  31.20345733712258 ),
    LatLng( 30.028005320346054 ,  31.203344546266923 ),
    LatLng( 30.02800526770065 ,  31.20327677441179 ),
    LatLng( 30.028058768110526 ,  31.203246323495 ),
    LatLng( 30.028137808730683 ,  31.203219976075317 ),
    LatLng( 30.02822866133445 ,  31.20318969118734 ),
    LatLng( 30.028333540878407 ,  31.203154730468423 ),
    LatLng( 30.028453381485065 ,  31.203114782501796 ),
    LatLng( 30.028573439843 ,  31.203074761839716 ),
    LatLng( 30.028698133083203 ,  31.20303319605396 ),
    LatLng( 30.02882096029208 ,  31.202992124055527 ),
    LatLng( 30.02894040365563 ,  31.202952156839658 ),
    LatLng( 30.029063978355612 ,  31.20291080529748 ),
    LatLng( 30.029181178279103 ,  31.202871586825463 ),
    LatLng( 30.029276129670762 ,  31.202839813276363 ),
    LatLng( 30.029336916837938 ,  31.20281743619854 ),
    LatLng( 30.029369263551327 ,  31.202792770579936 ),
    LatLng( 30.029384976732867 ,  31.20273837684687 ),
    LatLng( 30.02937155715165 ,  31.202665226809486 ),
    LatLng( 30.02935084645537 ,  31.202576668102363 ),
    LatLng( 30.029324633644578 ,  31.202464582828686 ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlutterMap(
          options: new MapOptions(
            center: new LatLng(30.027303, 31.208596),
            zoom: 12.2,
            maxZoom: 17.0,
            onTap: (tapPosition, point){
              print(tapPosition);
              print(point);
            },
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']
            ),
            PolylineLayerOptions(
              polylines: [
                Polyline(
                  points: pointsGradient,
                  strokeWidth: 8.0,
                  gradientColors: [
                    Color(0xff3870d1),
                    Color(0xff4094ed),
                    Color(0xff4673fa),
                  ],
                ),
              ],
            ),

            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 40.0,
                  height: 40.0,
                  point: new LatLng(30.026737002775945 ,  31.210936099523135),
                  builder: (ctx) =>
                  new Container(
                    child: IconButton(
                        icon: Icon(Icons.circle),
                        iconSize: 30.0,
                        color: Color.fromRGBO(0, 255, 255, 0.5),
                        onPressed:(){}),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

