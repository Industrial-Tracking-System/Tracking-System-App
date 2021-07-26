import 'dart:async';
import 'dart:typed_data';

import 'package:backtracking/api/GoogleService.dart';
import 'package:backtracking/api/api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DriverOrderDetail extends StatefulWidget {
  static const routeName = "/employee-Oder-screen";

  // static const LatLng _center = const LatLng(30.0410682, 31.208571);

  @override
  _DriverOrderDetailState createState() => _DriverOrderDetailState();
}

class _DriverOrderDetailState extends State<DriverOrderDetail> {
  @override
  void initState() {
    setState(() {
      _getCurrentLocation();
    });

    // getLocation();
    super.initState();
  }

  // Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controller;
  bool loading = true;
  static LatLng latLng;
  LocationData currentLocation;
  final Set<Marker> _markers = {};
  StreamSubscription _locationSubscription;
  Marker marker;
  Circle circle;
  Location _locationTracker = Location();

  // void _onAddMarkerButtonPressed() async {
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: MarkerId("111"),
  //       position: latLng,
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //     ));
  //   });
  // }

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/icons/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();

       await Location().getLocation().then((value) {
        latLng = LatLng(value.latitude, value.longitude);
        print("lat : " + value.latitude.toString());
        print("long : " + value.longitude.toString());
        //_onAddMarkerButtonPressed();
        setState(() {
          loading = false;
          updateMarkerAndCircle(value, imageData);
        });
      });
      // updateMarkerAndCircle(location, imageData);
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } catch (error) {
      return;
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  // getLocation() async {
  //   var location = new Location();

  //   location.onLocationChanged.listen((currentLocation) {
  //     print(currentLocation.latitude);
  //     print(currentLocation.longitude);
  //     setState(() {
  //       latLng = LatLng(currentLocation.latitude, currentLocation.longitude);
  //       loading = false;
  //     });
  //     print("getLocation:   **********************$latLng");
  //     //loading = false;
  //   });
  // }

  final Set<Polyline> _polyLines = {};
  Set<Polyline> get polyLines => _polyLines;
  void createRoute(String encondedPoly) {
    _polyLines.add(Polyline(
        polylineId: PolylineId(latLng.toString()),
        width: 4,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.red));
  }

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    List lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];
    print(lList.toString());
    return lList;
  }

  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  void sendRequest(double latitude, double longtude) async {
    // LatLng destination = LatLng(37.4214688,-122.0875444);
    LatLng destination = LatLng(latitude, longtude);
    String route =
        await _googleMapsServices.getRouteCoordinates(latLng, destination);
    createRoute(route);
    _addMarker(destination, "KTHM Collage");
  }

  void _addMarker(LatLng location, String address) {
    _markers.add(Marker(
        markerId: MarkerId("112"),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "go here"),
        icon: BitmapDescriptor.defaultMarker));
  }

  void onCameraMove(CameraPosition position) {
    latLng = position.target;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as List;
    final customer = args[0];
    final orderId = args[1];
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Details"),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              CallApi().postData({"order_id": orderId}, "driver_confirm").then((value){
                print(value.body);
                Navigator.of(context).pop();
              });
            },
            icon: Icon(Icons.check),
            label: Text("Arrived"),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                sendRequest(customer.latitude, customer.longtude);
              },
              label: Text('Destination'),
              icon: Icon(Icons.directions_boat),
            ),
            FloatingActionButton(
                child: Icon(Icons.location_searching),
                onPressed: () {
                  _getCurrentLocation();
                }),
          ],
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              polylines: polyLines,
              markers: Set.of((marker != null) ? [marker] : []),
              // markers: _markers,
              circles: Set.of((circle != null) ? [circle] : []),
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              initialCameraPosition: CameraPosition(
                target: latLng,
                // target: DriverOrderDetail._center,
                zoom: 11.0,
              ),
              onCameraMove: onCameraMove,
            ),
    );
  }
}
