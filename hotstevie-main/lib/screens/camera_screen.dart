import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  final BarcodeScanner _barcodeScanner =
      BarcodeScanner(formats: [BarcodeFormat.qrCode]);

  Future<void> _capturePhoto() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Process the captured image for barcode scanning
      final inputImage = InputImage.fromFilePath(image.path);
      _processImage(inputImage);
    }
  }

  Future<void> _processImage(InputImage inputImage) async {
    try {
      final List<Barcode> barcodes =
          await _barcodeScanner.processImage(inputImage);
      // Handle the detected barcodes
      _handleBarcodes(barcodes);
    } catch (e) {
      // Handle any errors that occur during barcode scanning
      print('Error scanning barcodes: $e');
    }
  }

  void _handleBarcodes(List<Barcode> barcodes) {
    // Process the list of detected barcodes
    for (final barcode in barcodes) {
      // Handle each detected barcode according to your application's logic
      print('Detected Barcode: ${barcode.rawValue}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _capturePhoto,
              child: Text('Capture Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
