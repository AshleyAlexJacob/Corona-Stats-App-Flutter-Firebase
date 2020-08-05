import 'package:flutter/material.dart';
import 'package:coronastats/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:coronastats/ui/aap_Drawer.dart';
import 'dart:math';
class AppMap extends StatefulWidget {
  static String id= "sixth";
  @override
  _AppMapState createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  final CameraPosition _initial = CameraPosition(target: LatLng(33.9846898,71.5367858), zoom:10.0,);
  GoogleMapController _controller;
  List<Marker>marker=[];
  addMarker(coordinates){
    int idMap= Random().nextInt(100);
    setState(() {
      marker.add(Marker(position:coordinates, markerId: MarkerId(idMap.toString())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColor4,
          elevation: 0,
        ),
        drawer: AppDrawer(),
        backgroundColor: kColor4,
       body: GoogleMap(
         markers: marker.toSet(),
         initialCameraPosition: _initial,
         mapType: MapType.normal,
         onMapCreated: (controller){
           setState(() {
             _controller=controller;
           });
         },
         onTap: (coordinates){
           _controller.animateCamera(CameraUpdate.newLatLng(coordinates));
         },
       ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kColor4,
          onPressed: (){
            _controller.animateCamera(CameraUpdate.zoomOut());
          },
          child: Icon(Icons.zoom_out),
        ),
      ),
    );
  }
}
