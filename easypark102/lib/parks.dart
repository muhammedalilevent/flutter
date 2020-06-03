import 'package:google_maps_flutter/google_maps_flutter.dart';

class Park {
  String parkName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Park(
      {this.parkName,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<Park> parkingLots = [
  Park(
      parkName: 'İspark Otopark Fatih',
      address: 'Fatih/İstanbul',
      description: 'kalabalık olur gitme',
      locationCoords: LatLng(41.0068839, 28.9794263),
      thumbNail:
          'https://static.daktilo.com/sites/71/uploads/2019/09/05/large/1433263.jpg'),
  Park(
      parkName: 'Haydarpaşa Otoparkı',
      address: 'Üsküdar/İstanbul',
      description: 'boş yer çoktur',
      locationCoords: LatLng(41.0049019, 29.0228731),
      thumbNail:
          'https://i2.haber7.net//haber/haber7/photos/2019/36/istanbulda_zam_yagmuru_parktan_sonra_bir_zam_daha_geliyor_1567498495_3114.jpg'),
  Park(
      parkName: 'Kadıköy Otoparkı',
      address: 'Kadıköy/İstanbul',
      description: 'manzara güzelkee',
      locationCoords: LatLng(41.0048979, 29.0250618),
      thumbNail:
          'https://haberport.com/images/haberler/2020/02/2020-ispark-ucretlerine-yuzde-40-zam-ispark-surelerine-gore-otopark-ucretleri-ne-kadar-oldu.jpg'),
  Park(
      parkName: 'Çemberlitaş Otoparkı',
      address: 'Fatih/İstanbul',
      description: 'haftaiçi haftasonu girilmez ',
      locationCoords: LatLng(41.0090255, 28.9689764),
      thumbNail: 'https://pbs.twimg.com/media/B0u_lEaCUAAPmPZ.jpg'),
  Park(
      parkName: 'Karaköy Otoparkı',
      address: 'Beyoğlu/İstanbul',
      description: 'karaköygüllüoğludenizkeyf',
      locationCoords: LatLng(41.0137764, 28.9572744),
      thumbNail:
          'https://ispark.istanbul/wp-content/uploads/2014/07/1181-300x200.jpg')
];
