import 'package:face_to_face_messager_app/common/colors.dart';
import 'package:face_to_face_messager_app/view/widgets/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../chat_app/messager/chatapp_page.dart';

class FaceIdMainPage extends StatefulWidget {
  const FaceIdMainPage({Key? key}) : super(key: key);

  @override
  State<FaceIdMainPage> createState() => _FaceIdMainPageState();
}

class _FaceIdMainPageState extends State<FaceIdMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarGlobal(),
      body: _buildBodyFaceId(),
    );
  }

  Widget _buildBodyFaceId() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Image.network(
                "https://res.cloudinary.com/devappmediakh/image/upload/v1662785570/opensource/verification_phone/faceid_ptr1ba.png",
                width: 250,
              ),
            ),
            SizedBox(height: 18),
            Text("Face ID for faster",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: colorBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)
                ),
            ),
            SizedBox(height: 5),
            Text("Enable Face ID to save time later,speed up \nprocess and easy transition.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: colorBlack,
                      fontSize: 12
                  )
              ),
            ),
            SizedBox(height: 200),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MessengerList())
                );
              },
              child: Text("Skip,I`ll do later",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: colorGrey,
                        fontSize: 12
                    )
                ),
              ),
            ),
            SizedBox(height: 10),
            //Button
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MessengerList())
                );
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 113, 255, 1.0),
                        Color.fromRGBO(0, 123, 253, 1.0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: Center(
                  child: GestureDetector(
                    child: Text(
                      'Enabl Face ID',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Netflix",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
