import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../parks.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controllerr = Completer();
  GoogleMapController _controller;
  List<Marker> allMarkers = [];
  PageController _pageController;
  int prevPage;

  @override
  void initState() {
    super.initState();
    parkingLots.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.parkName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.parkName, snippet: element.address),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: parkingLots[_pageController.page.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  double zoomVal = 5.0;

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }

  _parkingLotList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          parkingLots[index].thumbNail),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  parkingLots[index].parkName,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  parkingLots[index].address,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    parkingLots[index].description,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ])
                        ]))))
          ])),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controllerr.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controllerr.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Set<Polyline> _polylines = {};

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
        //  top: MediaQuery.of((context)).size.width,
        //  bottom: MediaQuery.of((context)).size.height,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Yusuf Kolcuk"),
                  accountEmail: Text("yusuf@gmail.com"),
                  currentAccountPicture: Icon(
                    Icons.accessibility_new,
                    size: 60,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Ana Sayfa"),
                        trailing: Icon(Icons.check),
                      ),
                      ListTile(
                        leading: Icon(Icons.computer),
                        title: Text("Profil"),
                        trailing: Icon(Icons.check),
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite),
                        title: Text("Favorilerim"),
                        trailing: Icon(Icons.check),
                      ),
                      ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text("Cüzdanım"),
                        trailing: Icon(Icons.check),
                      ),
                      ListTile(
                        leading: Icon(Icons.backspace),
                        title: Text("Çıkış"),
                        trailing: Icon(Icons.check),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Center(
              child: Text('Istanbul',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic)),
            ),
          ),
          body: Stack(
            children: <Widget>[
              _buildGoogleMap(context),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "ChangeMapType",
                        tooltip: "ChangeMapType",
                        onPressed: _onMapTypeButtonPressed,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: Colors.lightBlueAccent,
                        child: const Icon(Icons.satellite, size: 36.0),
                      ),
                      SizedBox(height: 16.0),
                      FloatingActionButton(
                        heroTag: "getLocation",
                        tooltip: "getLocation",
                        onPressed: _getLocation,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: Colors.lightBlueAccent,
                        child: const Icon(Icons.accessibility, size: 36.0),
                      ),
                      SizedBox(height: 16.0),
                      FloatingActionButton(
                        onPressed: _getLocation2,
                        tooltip: 'Get Location',
                        child: Icon(Icons.flag),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  final Map<String, Marker> _markersyusuf = {};
  void _getLocation2() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _markersyusuf.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markersyusuf["Current Location"] = marker;
    });
  }

  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  Map<MarkerId, Marker> markerss = <MarkerId, Marker>{};
  final Map<String, Marker> _marker = {};

  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    final GoogleMapController controller = await _controllerr.future;

    setState(() {
      markerss.clear();
      final MarkerId markerId1 = MarkerId("curr_loc");
      final marker = Marker(
        markerId: markerId1,
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(
            title: 'Sizin konumunuz',
            snippet: 'Buradasınız.' +
                currentLocation.latitude.toString() +
                " " +
                currentLocation.longitude.toString()),
      );
      markerss[markerId1] = marker;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 17,
          ),
        ),
      );
    });
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 50,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            //markers: _markersyusuf.values.toSet(),
            mapType: _currentMapType,
            initialCameraPosition: CameraPosition(
              target: LatLng(40.688841, -74.044015),
              zoom: 11,
            ),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        Positioned(
          bottom: 20.0,
          child: Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: parkingLots.length,
              itemBuilder: (BuildContext context, int index) {
                return _parkingLotList(index);
              },
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controllerr.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}
