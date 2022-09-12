
import 'package:flutter/material.dart';
//Global AppBar with Arrow Back
dynamic appBarGlobal(){
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(onPressed: (){}, icon: Image.network("https://res.cloudinary.com/devappmediakh/image/upload/v1662796393/opensource/verification_phone/arrow_right_qfyw2c.png",width: 17,)),

      ],
    ),
    iconTheme: IconThemeData(
      color: Colors.transparent,
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}