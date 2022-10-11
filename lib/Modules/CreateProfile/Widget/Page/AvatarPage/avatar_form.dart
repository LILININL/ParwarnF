import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plawarn/modules/createprofile/widget/utils/appbar/create_profile.dart';

import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class AvatarPage extends StatefulWidget {
  static const String routeName = '/AvatarPage';
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  PickedFile? _imagefile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const Profilebar(),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 24, 10, 0),
            child: Text('มาเริ่มสร้างโปรไฟล์กันเถอะ', style: titletext24),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 30),
            child: Text('รูปภาพโปรไฟล์ (ไม่บังคับ)', style: subtitletext18),
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: _imagefile == null
                  ? const AssetImage(
                          'assets/images/profile/avatar/empty-avatar.png')
                      as ImageProvider
                  : FileImage(File(_imagefile!.path)),
              radius: 90,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      height: 70,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()));
                        },
                        child: Container(
                          height: 20,
                          width: 30,
                          color: const Color.fromRGBO(0, 0, 0, .35),
                          child: const Center(
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
          child: GFButton(
            onPressed: () async {
              // await uplode();

              Navigator.pushNamed(context, '/SearchJop');
            },
            text: 'ดำเนินการต่อ',
            textStyle: buttonContinua,
            color: yell,
            fullWidthButton: true,
            size: 49,
          ),
        ),
      ),
    );
  }

  Future uplode() async {
    String fileName = base64Encode(utf8.encode(_imagefile!.path));
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api2.plawarn.com/profile/avatar'));
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        _imagefile!.path,
        filename: fileName,
      ),
    );
    request.send().then((response) {
      if (response.statusCode == 200) print('Uploaded!');
    });
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
      maxWidth: 400,
      maxHeight: 400,
    );

    setState(() {
      _imagefile = pickedFile!;
    });
  }

  bottomSheet() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text('ใช้รูปภาพจากกล้องหรืออัลบั้ม', style: textStyle18bold),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                icon: const Icon(
                  Icons.camera,
                  size: 50,
                ),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text('กล้อง'),
              ),
              const SizedBox(
                width: 55,
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                icon: const Icon(
                  Icons.image,
                  size: 50,
                ),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text('อัลบั้ม'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
