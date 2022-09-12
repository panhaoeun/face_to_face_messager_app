import 'package:face_to_face_messager_app/view/pages/register/pincode_verify/pincode_verify_screen.dart';
import 'package:face_to_face_messager_app/view/pages/register/verify/verify_opt_auto_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../onboarding/onboarding_page.dart';

class OPTVerifyPhoneNumber extends StatefulWidget {
  final String phoneNumber;
   OPTVerifyPhoneNumber({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  List<Object> get props => [phoneNumber];
  State<OPTVerifyPhoneNumber> createState() => _OPTVerifyPhoneNumberState();
}

class _OPTVerifyPhoneNumberState extends State<OPTVerifyPhoneNumber> {
  TextEditingController phoneController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;

  String optPin = " ";
  String countryDial = "+855";
  String verId = " ";

  int screenState = 0;
  Color blue = const Color(0xff8cccff);

  //Verify phone number with Firebase
  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Auth Completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e);
        showSnackBarText("Auth Failed!");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("OPT Sent!");
        verId = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      timeout: const Duration(seconds: 20),
      phoneNumber: number,
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("Time Out!");
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: optPin,
      ),
    )
        .whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const onBoardingPage(),
        ),
      );
    });
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Screen Responsive
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.height;
    bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: AnimatedContainer(
        height: bottom > 0 ? screenHeight : screenHeight / 2,
        width: screenWidth,
        duration: Duration(milliseconds: 800),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Column(
          children: [
            Text(
              "Registration",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Text(
                "Enter your phone number to  continue, \nwe send you OTP to verify.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: 30),
            //Check If Verify phone number already
            screenState == 0 ? _stateRegisterPhonenumber() : VerifyOPTAutoFiled(),
            SizedBox(height: 100),
            //Continue verify
            InkWell(
              child: Text(
                "By continuing, you agree with out Term & \nCondition and Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shadowColor: Colors.blue,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(200, 50), //////// HERE
                        ),
                        onPressed: () {
                           // if(screenState == 0){
                           //    if(phoneController.text.isEmpty){
                           //      showSnackBarText("Phone number is still empty!");
                           //    }else{
                           //      verifyPhone(countryDial + phoneController.text);
                           //    }
                           // }else{
                           //   if(optPin.length >= 6){
                           //     verifyOTP();
                           //   }else{
                           //     showSnackBarText("Enter OPT correctly!");
                           //   }
                           // }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => VerifyOPTAutoFiled())
                          );
                        },
                        child: Text('Continue'),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //Register Phone number
  Widget _stateRegisterPhonenumber(){
    return Column(
      children: [
        IntlPhoneField(
          controller: phoneController,
          showCountryFlag: false,
          showDropdownIcon: false,
          decoration: InputDecoration(
              labelText: 'Phone Number',
              prefixStyle: TextStyle(color: Colors.green),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.only(
                  left: 10, top: 20, right: 20, bottom: 20)),
          searchText: "Search Country",
          initialCountryCode: 'KH',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
          keyboardType: TextInputType.number,
          dropdownTextStyle: TextStyle(color: Colors.black87),
          onCountryChanged: (country) {
            setState(() {
              countryDial = "+" + country.dialCode;
            });
          },
        ),
      ],
    );
  }
}
