import 'package:face_to_face_messager_app/view/pages/getstarted/getstart_page.dart';
import 'package:face_to_face_messager_app/view/pages/register/pincode_verify/pincode_verify_screen.dart';
import 'package:flutter/material.dart';
import '../register_phone_opt.dart';

class VerifyOPTAutoFiled extends StatefulWidget {
  const VerifyOPTAutoFiled({Key? key}) : super(key: key);

  @override
  State<VerifyOPTAutoFiled> createState() => _VerifyOPTAutoFiledState();
}

class _VerifyOPTAutoFiledState extends State<VerifyOPTAutoFiled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBodyVerify(),
    );
  }

  Widget _buildBodyVerify() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only( left: 20, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RegisterPhoneOPT())
                );
              },
              child: Padding(
                padding: EdgeInsets.only(top: 53),
                child: Image.network(
                  "https://res.cloudinary.com/devappmediakh/image/upload/v1662796393/opensource/verification_phone/arrow_right_qfyw2c.png",
                  color: Colors.black,
                  width: 18,
                ),
              ),
            ),
            InkWell(
              child: Container(
                child: Image.network(
                    "https://res.cloudinary.com/devappmediakh/image/upload/v1662648561/opensource/verification_phone/opt-verify-02_kvbwkk.webp"),
              ),
            ),
            SizedBox(height: 2),
            PinCodeVerificationScreen()
          ],
        ),
      ),
    );
  }

}
