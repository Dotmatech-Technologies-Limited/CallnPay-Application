import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../dashboard/main_home_screen.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text(
              'Profile Picture',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 31, 120, 1)),
            ),
          ),
          Column(
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
          SizedBox(height: 30,),
          imageProfile(),
          SizedBox(height: 20,),
          Center(child: Text("Take Picture", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[900]
          ),)),
          Spacer(),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
            child: CustomBlueButton(text: "Continue", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen()));
            }),
          )
        ],
      ),
    );
  }


  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile  = pickedFile as PickedFile;
    });
  }
}

Widget bottomSheet() {
  return Container(
    height: 100,
    width: 400,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20
    ),
    child: Column(
      children: [
        Text("Choose Profile Picture", style: TextStyle(
          fontSize: 20
        ),
        ),
        SizedBox(height: 20,),
        Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(Icons.camera, color: Colors.indigo[900], size: 25,),
            ),
            SizedBox(width: 5,),
            Text("Camera", style: TextStyle(
              fontSize: 20
            ),),
              SizedBox(width: 30,),
            InkWell(
              onTap: () {},
              child: Icon(Icons.photo_camera_back, color: Colors.indigo[900], size: 25,),
            ),
            SizedBox(width: 5,),
            Text("Gallery", style: TextStyle(
              fontSize: 20
            ),)
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
                      showBottomSheet(context: context, builder: ((builder) => bottomSheet()));
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
