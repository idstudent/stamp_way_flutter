import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionDialog {
  static Future<bool> checkAndRequestLocationPermission(BuildContext context) async {
    LocationPermission permission  = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        _showToast('위치 권한이 거부되었습니다.');
        await _showDeniedDialog(context);
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showToast('위치 권한이 거부되었습니다.');
      await _showDeniedDialog(context);
      return false;
    }

    return true;
  }


  static Future<void> _showDeniedDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('위치 권한 필요'),
        content: const Text(
          '정확한 위치 권한을 받지 않으면 몇몇 기능을 사용하지 못해요!\n정확한 위치를 켜시려면 설정 > 권한 > 위치 > 정확한 위치사용을 켜주세요'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      )
    );
  }

  static void _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM
    );
  }
}