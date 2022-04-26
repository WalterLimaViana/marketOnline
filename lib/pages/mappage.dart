import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marketonline/helpers/appcolors.dart';

const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.744421, -71.1698939);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? sourceIcon;
  BitmapDescriptor? destinationIcon;
  Set<Marker> _markers = Set<Marker>();

  LatLng? currentLocation;
  LatLng? destinationLocation;

  @override
  void initState() {
    super.initState();
    //set up o local inicial
    this.setInitialLocation();
    //set uo o local de destino
    this.setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/source_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/destination_pin.png');
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              showPinsOnMap();
            },
          ),
        ),
        Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/imgs/shopping-venture.jpg'),
                              fit: BoxFit.cover))),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    children: [
                      Text('Walter',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                      Text(
                        'Minha Localização',
                        style: TextStyle(color: AppColors.SECUNDARY_COLOR),
                      )
                    ],
                  )),
                  Icon(Icons.location_pin,
                      color: AppColors.SECUNDARY_COLOR, size: 40)
                ],
              ),
            ))
      ]),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        // position: currentLocation,
        // icon: sourceIcon,
      ));

      _markers.add(Marker(
        markerId: MarkerId('destinationPin'),
        // position: currentLocation,
        // icon: sourceIcon,
      ));
    });
  }
}
