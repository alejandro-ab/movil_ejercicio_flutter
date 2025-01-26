import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

class ImagePreferencesHelper {
  static const String _imageKey = 'image';

  Future<void> setImageBytes(Uint8List bytes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String base64Image = base64Encode(bytes);

    await prefs.setString(_imageKey, base64Image);
  }

  Future<Uint8List?> getImageBytes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? base64Image = prefs.getString(_imageKey);

    if (base64Image != null) {
      return base64Decode(base64Image);
    }

    return null;
  }
}
