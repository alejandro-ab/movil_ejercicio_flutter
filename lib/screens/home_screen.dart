import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movil_ejercicio_flutter/data/helper/image_preferences_helper.dart';
import 'package:movil_ejercicio_flutter/screens/configuration_screen.dart';
import 'package:movil_ejercicio_flutter/screens/information_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePreferencesHelper _imagePreferencesHelper = ImagePreferencesHelper();
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _getImageBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: _buildImage()),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, InformationScreen.route);
                },
                child: Text('Ver información'),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) => ConfigurationScreen()));
                },
                child: Text('Cambiar imagen'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future _getImageBytes() async {
    final Uint8List? bytes = await _imagePreferencesHelper.getImageBytes();

    setState(() {
      _imageBytes = bytes;
    });
  }

  Widget _buildImage() {
    if (_imageBytes != null) {
      return Image.memory(_imageBytes!, fit: BoxFit.cover);
    }

    return Image.asset('images/default.jpg', fit: BoxFit.cover);
  }
}
