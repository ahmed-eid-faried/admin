

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerModel {
  String id;
  String title;
  Function onTapinfo;
  LatLng position = const LatLng(0, 0);
  bool draggable = false;
  Function onDrag;
  Function onDragEnd;
  Function onDragStart;
  BitmapDescriptor icon = BitmapDescriptor.defaultMarker;
  Function onTap;
  bool visible = true;
  bool flat = true;
  double zIndex = 0;
  double rotation = 0;
  double alpha = 1;
  Offset anchor = const Offset(0.5, 1);
  bool consumeTapEvents = false;
  MarkerModel({
    required this.id,
    required this.title,
    required this.onTapinfo,
    required this.position,
    this.draggable = true,
    required this.onDrag,
    required this.onDragEnd,
    required this.onDragStart,
    required this.icon,
    required this.onTap,
    required this.visible,
    required this.flat,
    required this.zIndex,
    required this.rotation,
    required this.alpha ,
     this.consumeTapEvents  = false
  });
}

  Set<Marker> markerList = {};

  Set<Marker> createMarkerList() {
    for (var item in markers) {
      markerList.add(Marker(
          markerId: MarkerId(item.id),
          infoWindow: InfoWindow(
            title: item.title,
            onTap: () {
              item.onTapinfo;
            },
          ),
          position: item.position,
          draggable: item.draggable,
          onDrag: (value) {
            item.onDrag(value);
          },
          onDragEnd: (value) {
            item.onDragEnd(value);
          },
          onDragStart: (value) {
            item.onDragStart(value);
          },
          icon: item.icon,
          // icon: BitmapDescriptor.defaultMarkerWithHue(
          //     BitmapDescriptor.hueMagenta),
          // icon: BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assetName"),
          onTap: () {
            item.onTap;
          },
          visible: item.visible,
          flat: item.flat,
          zIndex: item.zIndex,
          rotation: item.rotation,
          alpha: item.alpha,
          anchor: item.anchor,
          consumeTapEvents: item.consumeTapEvents));
    }

    return markerList;
  }  Set<MarkerModel> markers = {};
