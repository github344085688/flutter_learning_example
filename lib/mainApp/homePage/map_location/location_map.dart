import 'package:flutter/material.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_location/amap_location.dart';
// import 'package:latlng/latlng.dart';
import 'const_config.dart';

class LocationMap extends StatefulWidget {
  LocationMap({Key key}) : super(key: key);

  @override
  _LocationMap createState() => _LocationMap();
}

class _LocationMap extends State<LocationMap> {

  static final LatLng markerPosition = const LatLng(24.514626779306325,118.18376761402496);
  final Map<String, Marker> _initMarkerMap = <String, Marker>{};
  bool _hasInitMarker = false;
  // static final String _startIconPath = 'assets/start.png';
  // String _iconPath = _startIconPath;
  void _initMarker(BuildContext context) async {
    if (_hasInitMarker) {
      return;
    }
    Marker marker = Marker(
      position: markerPosition,
      // icon: BitmapDescriptor.fromIconPath(_iconPath)
    );
    setState(() {
      _hasInitMarker = true;
      _initMarkerMap[marker.id] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    _initMarker(context);
    final AMapWidget map = AMapWidget(
      apiKey: ConstConfig.amapApiKeys,
      myLocationStyleOptions: MyLocationStyleOptions(
        true,
        circleFillColor: Colors.lightBlue,
        circleStrokeColor: Colors.blue,
        circleStrokeWidth: 1,
        // icon: BitmapDescriptor.fromIconPath('assets/start.png'),
      ),
      initialCameraPosition: CameraPosition(target: LatLng(24.484626779306183,118.18376761402496), zoom: 13),
      onMapCreated: onMapCreated,
      mapType: MapType.bus,
      buildingsEnabled:true,
      compassEnabled:true,
      markers: Set<Marker>.of(_initMarkerMap.values),
    );
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: map,
            ),

          ],
        ),
      ),
    );
  }
  AMapController _mapController;
  void onMapCreated(AMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

/// 获取审图号
/*void getApprovalNumber() async {
    //普通地图审图号
    String mapContentApprovalNumber =
    await _mapController?.getMapContentApprovalNumber();
    //卫星地图审图号
    String satelliteImageApprovalNumber =
    await _mapController?.getSatelliteImageApprovalNumber();
    setState(() {
      if (null != mapContentApprovalNumber) {
        _approvalNumberWidget.add(Text(mapContentApprovalNumber));
      }
      if (null != satelliteImageApprovalNumber) {
        _approvalNumberWidget.add(Text(satelliteImageApprovalNumber));
      }
    });
    print('地图审图号（普通地图）: $mapContentApprovalNumber');
    print('地图审图号（卫星地图): $satelliteImageApprovalNumber');
  }*/
}