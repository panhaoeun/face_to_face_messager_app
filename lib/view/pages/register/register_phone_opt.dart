import 'package:animate_do/animate_do.dart';
import 'package:face_to_face_messager_app/view/pages/register/opt_verify_phonenumber.dart';
import 'package:flutter/material.dart';

class RegisterPhoneOPT extends StatefulWidget {
  const RegisterPhoneOPT({Key? key}) : super(key: key);

  @override
  State<RegisterPhoneOPT> createState() => _RegisterPhoneOPTState();
}

class _RegisterPhoneOPTState extends State<RegisterPhoneOPT> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;

  String initialCountry = 'EN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://res.cloudinary.com/devappmediakh/image/upload/v1662648561/opensource/verification_phone/verify01_exzrrs.jpg"),
                SizedBox(height: 10,),
                //Input Number
                OPTVerifyPhoneNumber(phoneNumber: '',),
              ],
            ),
          ),
        )
    );
  }
}
