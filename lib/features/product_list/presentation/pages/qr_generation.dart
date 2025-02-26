import 'package:flutter/material.dart';
import 'package:merchant_app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:merchant_app/features/authentication/presentation/pages/profile_screen.dart';
import 'package:merchant_app/features/products/presentation/pages/merchant_product_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
class QrGeneration extends StatefulWidget {
  const QrGeneration({super.key});

  @override
  State<QrGeneration> createState() => _QrGenerationState();
}

class _QrGenerationState extends State<QrGeneration> {
  GlobalKey _globalKey=GlobalKey();
  int _currentIndex = 0;
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initiate() {
    super.initState();
    _currentIndex = 0;
   // _checkPermissions();
  }
    Future<void> _checkPermissions() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      print("Storage permission granted");
    } else if (status.isDenied) {
      print("Storage permission denied");
    } else if (status.isPermanentlyDenied) {
      // Open app settings to allow the user to manually enable the permission
      openAppSettings();
    }
  }

_saveLocalImage() async {
  // Ensure that the widget is fully built before trying to capture the image
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final context = _globalKey.currentContext;

    if (context != null) {
      // Proceed with capturing the image
      RenderRepaintBoundary boundary = context.findRenderObject() as RenderRepaintBoundary;
      boundary.toImage().then((ui.Image image) async {
        ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
          print(result);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.toString())));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error saving the image.")));
        }
      });
    } else {
      // Context still null, handle accordingly
      print("Context is null, unable to capture the QR code image.");
    }
  });
}


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Generation'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 400, // Set the width of the TextField
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Text To generate qr',
                      hintText: 'Type something',
                    ),
                    onChanged: (text) {
                      setState(() {}); // Update the UI when text changes
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                if (_textEditingController.text.isNotEmpty)
                 RepaintBoundary(
                key: _globalKey,  // Attach the key to the RepaintBoundary
                child: QrImageView(
                  data: _textEditingController.text,  // The data to encode into the QR code
                  size: 200,  // Set the size of the QR code
                  version: QrVersions.auto,
                  gapless: false,
                  foregroundColor: Color(0xFF025AA2),
                  embeddedImage: const AssetImage('assets/images/star.png'),
                ),
              ),
               const  SizedBox(
                  height: 20,
                ),
                if (_textEditingController.text.isEmpty)
                  const Text(
                    'please enter text',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){
                   _saveLocalImage();
                  },
                  child: const Text('Generate QR',style: TextStyle(color: Colors.blue),)),
              ],
            )),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF025AA2),
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
            });
            // Handle navigation based on the selected index
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MerchantProductScreen()),
              );
            } else if (index == 4) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            }
          }
        },
      ),
    );
  }
}
