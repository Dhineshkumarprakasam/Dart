import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();

  Future<XFile?> pickImage({required ImageSource source}) async {}
}

class _PickImageState extends State<PickImage> {
  @override
  XFile? file;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      Permission.storage.request();
      Permission.mediaLibrary.request();
      Permission.photos.request();
      Permission.camera.request();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 300,
              color: Colors.grey.shade300,
              child:
                  file == null
                      ? Center(child: Text("Image not Picked"))
                      : Image.file(File(file!.path)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    maximumSize: Size(100, 50),
                  ),
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? photo = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    setState(() {
                      file = photo;
                    });
                  },
                  child: Center(child: Text("Camera")),
                ),

                SizedBox(width: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    maximumSize: Size(100, 50),
                  ),
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? photo = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    setState(() {
                      file = photo;
                    });
                  },
                  child: Center(child: Text("Gallery")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
