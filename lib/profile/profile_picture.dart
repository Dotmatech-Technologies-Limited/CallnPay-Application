// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:callnpay_app/components/customBlueButton.dart';

import '../dashboard/main_home_screen.dart';
import '../providers/functions/auth.dart';

class ProfilePicture extends StatefulWidget {
  final String country;
  final String state;
  final String zipCode;
  final String city;
  final String addressLine1;
  final String addressLine2;
  // final String addressLine3;
  final String dateOfBirth;
  // final String gender;
  const ProfilePicture({
    Key? key,
    required this.country,
    required this.state,
    required this.zipCode,
    required this.city,
    required this.addressLine1,
    required this.addressLine2,
    required this.dateOfBirth,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text(
              'Profile Picture',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 31, 120, 1)),
            ),
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 10, 10),
                child: Text(
                  'Set your profile picture',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const imageProfile(),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "Take Picture",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900]),
          )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
            child: CustomBlueButton(
                text: "Continue",
                onPressed: () async {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomeScreen(),
                    ),
                    (route) => false,
                  );
                  // if (_checked) {
                  //   setState(() {
                  //     _loading = true;
                  //   });
                  // await AuthFunctions().basicDetails(
                  //   context: context,
                  //   country: widget.country,
                  //   state: widget.state,
                  //   zipCode: widget.zipCode,
                  //   city: widget.city,
                  //   addressLine1: widget.addressLine1,
                  //   addressLine2: widget.addressLine2,
                  //   dateOfBirth: widget.dateOfBirth,
                  //   photoUrl: photoUrl,
                  // );
                  //   if (mounted) {
                  //     setState(() {
                  //       _loading = false;
                  //     });
                  //   }
                  // }
                }),
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile;
    });
  }
}

Widget bottomSheet() {
  return Container(
    height: 100,
    width: 400,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        const Text(
          "Choose Profile Picture",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.camera,
                color: Colors.indigo[900],
                size: 25,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Camera",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.photo_camera_back,
                color: Colors.indigo[900],
                size: 25,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Gallery",
              style: TextStyle(fontSize: 20),
            )
          ],
        )
      ],
    ),
  );
}

class imageProfile extends StatelessWidget {
  const imageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[50]),
            child: InkWell(
                onTap: () {
                  showBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.indigo[900],
                  size: 30,
                )),
          ),
        ),
      ],
    );
  }
}
