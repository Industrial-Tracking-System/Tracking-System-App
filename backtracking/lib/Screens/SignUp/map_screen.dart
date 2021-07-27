import 'package:backtracking/Screens/Login/login_options.dart';
import 'package:backtracking/api/api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../modules/place.dart';

class MapScreen extends StatefulWidget {
  static const routeName = "/Map-Screen";

  final PlaceLocation initialLocation;
  final bool isSelecting;
  MapScreen(
      {this.initialLocation = const PlaceLocation(
          latitude: 30.03157086455431, longitude: 31.210762020621434),
      this.isSelecting = true});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;
  bool _isLoading = false;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as List;
    print(args);

    // [email, password, company_name, phone, name]
    return _isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Your Map'),
              actions: [
                if (widget.isSelecting)
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: _pickedLocation == null
                        ? null
                        : () {
                            setState(() {
                              _isLoading = true;
                            });
                            CallApi().postData({
                              "email": args[0],
                              "password": args[1],
                              "company_name": args[2],
                              "phone": args[3],
                              "name": args[4],
                              "latitude": _pickedLocation.latitude,
                              "longitude": _pickedLocation.longitude,
                            }, "register").then((respValue) {
                              print(_pickedLocation.latitude);
                              print(_pickedLocation.longitude);
                              print(respValue.body);
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pushReplacementNamed(
                                  context, LoginOptions.routeName);
                            });
                            //Navigator.of(context).pop(_pickedLocation);
                          },
                  )
              ],
            ),
            body: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.initialLocation.latitude,
                  widget.initialLocation.longitude,
                ),
                zoom: 16,
              ),
              onTap: widget.isSelecting ? _selectLocation : null,
              markers: _pickedLocation == null
                  ? {}
                  : {
                      Marker(
                        markerId: MarkerId('m1'),
                        position: _pickedLocation,
                      ),
                    },
            ),
          );
  }
}
