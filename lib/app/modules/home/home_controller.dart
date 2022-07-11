import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/config/utils.dart';
import 'package:bringideas/app/models/notice.dart';
import 'package:bringideas/app/models/place.dart';
import 'package:bringideas/app/repository/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  String strClimate = '';
  String strLocality = '';
  String strState = '';
  String strCountry = '';
  bool loading = false;
  int indexPage = 0;
  int indexPageDetail = 0;
  late Place itemPlace;
  List<Notice> listNotice = [
    Notice(
        'Alcalde de Torreón realiza nuevos cambios en su gabinete',
        'El alcalde de Torreón, Román Alberto Cepeda, admitió durante este sábado que habrá más cambios en su gabinete, esto luego de seis meses de transcurrida su administración y debido a múltiples factores que se evalúan de su parte, todo con el objetivo de que el servicio a la ciudadanía sea de mayor calidad.',
        'image1.png'),
    Notice(
        'Plaza de Toros Torreón tendrá mega función de lucha este domingo',
        'Una constelación de estrellas del pancracio regional, se presentará este domingo 10 de julio en la Plaza de Toros Torreón, donde a partir de las 20:00 horas se dará paso a una cartelera que promete emociones al límite para la conocedora afición lagunera.',
        'image2.png'),
    Notice(
        'José Guadalupe Galván, obispo emérito de Torreón, está en terapia intensiva',
        'La Diócesis de Torreón informó que el obispo emérito, José Guadalupe Galván Galindo, continúa en observación y en terapia intensiva.',
        'image3.png'),
    Notice(
        'Altas temperaturas no dan tregua a La Laguna',
        'Este fin de semana se espera un ambiente caluroso con temperaturas de 38 a 39 grados centígrados en las máximas, cielo despejado, sin posibilidad de precipitación, mínimas de 22 a 24 grados.',
        'image4.png'),
  ];

  List<Place> listPlace = [
    Place(
        'Museo Arocena',
        'Av. Juarez 1249, Centro Histórico Torreón, México',
        '25.5380267',
        '-103.4970798',
        'arocena1.jpg',
        DetailPlace(
            'De Lunes a Domingo',
            'De 10:00 AM a 6:00 PM',
            'El Museo Arocena es un amplio y moderno museo con interesantes salas de arte contemporáneo, arte europeo, arte de la Nueva España e historia regional, ubicado en el antiguo edificio del Casino de la Laguna, sitio de gran valor histórico construido en el año de 1910 y situado frente a la Plaza de Armas de la ciudad de Torreón. Tiene como base una colección de más de 300 obras de arte virreinal, europeo y mexicano que fueron adquiridas durante los últimos cien años por la familia Arocena y sus descendientes.',
            [
              'arocena1.jpg',
              'arocena2.jpg',
              'arocena3.jpg',
              'arocena4.jpg',
            ])),
    Place(
        'Museo Casa del Cerro',
        'Calzada Industria s/n, Col. Durangueña. Torreón México ',
        '25.5320588',
        '-103.4672875',
        'cerro1.jpg',
        DetailPlace(
            'De Lunes a Sábado',
            'De 10:00 AM a 6:00 PM',
            'La Casa del Cerro es un castillo de estilo alemán, construida por el ingeniero y arquitecto Federico Wulff Olivarri, quien llegó a la entonces Villa de torreón invitado a trabajar por el empresario Andrés Eppen, quien le hizo el encargo de realizar el trazo de las calles de la futura ciudad. Decidido a fijar su residencia, compró los terrenos de una escarpada colina frente a la estación del ferrocarril, esto con el fin de construir una casa para su familia de siete integrantes. Para la fachada se utilizó cantera traída de Durango, mientras que para el interior se usó madera de pino y mosaicos italianos. La casa de terminó de construir en 1905 y desde 1994 alberga al Museo Histórico, testigo vivo del nacimiento y desarrollo de la ciudad de Torreón.',
            [
              'cerro1.jpg',
              'cerro2.jpg',
              'cerro3.jpg',
              'cerro4.jpg',
            ])),
    Place(
        'Teatro Nazas',
        'Calle Cepeda # 155 Sur Esq. con Av. Matamoros 27000 Torreón. México ',
        '25.5397412',
        '-103.464048',
        'nazas1.jpg',
        DetailPlace(
            'De Lunes a Sábado',
            'De 10:00 AM a 6:00 PM',
            'El Teatro Nazas es uno de los atractivos culturales de Torreón en el estado de Coahuila. Considerado uno de los teatros más modernos de todo México, captura el transcurso de la historia de la Comarca Lagunera porque ha permanecido en su lugar desde 1952. El proyecto de remodelación estuvo a cargo del sector privado representado en su actual Patronato, y a cargo del Gobierno del Estado de Coahuila, siendo entonces Enrique Martínez y Martínez gobernador. El Teatro Nazas abrió sus puertas el 2 de octubre de 2004 con la presentación del Ballet de Montecarlo, interpretando "La Cenicienta" (Cendrillon).',
            [
              'nazas1.jpg',
              'nazas2.jpg',
              'nazas3.jpg',
              'nazas4.jpg',
            ])),
    Place(
        'Museo de los Metales',
        'Blvd. Laguna 3200 Pte Col. Metalúrgica, Torreón, México',
        '25.5232289',
        '-103.4484512',
        'metales1.jpg',
        DetailPlace(
            'De Lunes a Viernes',
            'De 9:00 AM a 1:00 PM y 5:00 PM a 8:00 PM',
            'El Museo de los Metales de Peñoles tiene por objeto dar a conocer y educar, de manera atractiva y divertida, acerca de la importancia de la industria metalúrgica y minera para la vida personal y la comunidad. Mediante actividades diversas, se propone inspirar al espectador para enfrentar grandes retos, despertar la curiosidad por los fenómenos naturales y fomentar el amor hacia la naturaleza. Los ejes temáticos de la museografía son: ciencias de la tierra, metalurgia, Peñoles, procesos industriales, desarrollo sustentable socialmente responsable y los usos de los metales en la vida diaria y el futuro. El proyecto museográfico está a cargo de Alfonso Soto Soria y Sebastián Soto.',
            [
              'metales1.jpg',
              'metales2.jpg',
              'metales3.jpg',
              'metales4.jpg',
            ])),
  ];

  @override
  void onInit() {
    super.onInit();
    loadLocation();
  }

  loadLocation() async {
    strClimate = '';
    if (loading) return;
    loading = true;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();

    var position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .timeout(Duration(seconds: 4));

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      await Get.find<MainRepository>()
          .getClimate(placemarks[0].locality.toString());
      strClimate = Utils.clima + ' ° C';
      strLocality = placemarks[0].locality.toString();
      strCountry = placemarks[0].country.toString();
      strState = placemarks[0].administrativeArea.toString();
      print(placemarks[0]);
    } catch (err) {
      strClimate = '-1 ° C';
      strLocality = 'Known locality';
      strState = 'Known state';
      strCountry = 'Known country';
    }
    loading = false;
    update();
  }

  setIndexPage(int index) {
    indexPage = index;
    indexPageDetail = 0;
    update();
  }

  setPageDetail(int index, Place item) {
    indexPageDetail = index;
    itemPlace = item;
    update();
  }

  setBackDetail(int index) {
    indexPageDetail = index;
    update();
  }

  void closeSession() {
    Get.dialog(getContent());
  }

  Widget getContent() {
    return Container(
        child: AlertDialog(
      contentPadding: EdgeInsets.all(5.0),
      content: Container(
        width: 300.0,
        height: 160.0,
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image(
                    image: AssetImage(ICON_SOPORTE),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "¿Estas seguro que deseas salir de tu cuenta?",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  confirmBtn(),
                  cancelBtn(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget confirmBtn() {
    return SizedBox(
      width: 120.0,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            Utils.userName = '';
            Utils.mailName = '';
            Get.back();
            Get.back();
          },
          child: Text(
            "Aceptar",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          )),
    );
  }

  Widget cancelBtn() {
    return SizedBox(
      width: 120,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancelar",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
