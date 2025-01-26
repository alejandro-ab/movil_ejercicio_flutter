import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:movil_ejercicio_flutter/data/helper/image_preferences_helper.dart';
import 'package:movil_ejercicio_flutter/screens/home_screen.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cambiar Imagen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _pickFile(context),
              child: const Text('Subir imagen'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pickFile(BuildContext context) async {
    ImagePreferencesHelper imagePreferencesHelper = ImagePreferencesHelper();
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      Uint8List? bytes = result.files.single.bytes;

      if (bytes != null) {
        await imagePreferencesHelper.setImageBytes(bytes);

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }
}
