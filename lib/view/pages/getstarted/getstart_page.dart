import 'dart:async';

import 'package:face_to_face_messager_app/view/pages/register/register_phone_opt.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  //Push to Home page
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => RegisterPhoneOPT()),
      );
    });
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Align(
            alignment: Alignment.center,
            child: Image.network(
              "https://letsdovideo.com/wp-content/uploads/2016/03/Agora_logo.jpg",
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: Color(0xFF4D94F5),
              ),
            )
          ],
        )
      ],
    );
  }
}
