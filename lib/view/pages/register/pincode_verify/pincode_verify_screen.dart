import 'package:face_to_face_messager_app/view/pages/register/pincode_verify/countdown_resend_code.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;
  String? optPin = " ";

  PinCodeVerificationScreen({Key? key, this.phoneNumber})
      : super(key: key);

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen>
    with SingleTickerProviderStateMixin {
  // Animation Resend code
  AnimationController? _animationController;
  int levelClock = 1 * 60;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
    _animationController!.forward();
    _listenSMSCode();
  }

  void dispose() {
    SmsAutoFill().unregisterListener();
    _animationController!.dispose();
    super.dispose();
  }

  _listenSMSCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: PinFieldAutoFill(
                    cursor: Cursor(color: Colors.black),
                    onCodeSubmitted: (code){
                        print(code);
                    },
                    onCodeChanged: (value){
                      setState(() {

                      });
                    },
                    codeLength: 4,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    decoration: UnderlineDecoration(
                      textStyle: TextStyle(color: Colors.black, fontSize: 20),
                        lineHeight: 2,
                        lineStrokeCap: StrokeCap.round,
                        bgColorBuilder: PinListenColorBuilder(
                            Colors.grey.shade200, Colors.grey.shade200),
                        colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.1))),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Resend Code after:"),
              CountResendCode(animation: StepTween(begin: levelClock, end: 0).animate(_animationController!)),
            ],
          ),
        ],
      ),
    );
  }
}
