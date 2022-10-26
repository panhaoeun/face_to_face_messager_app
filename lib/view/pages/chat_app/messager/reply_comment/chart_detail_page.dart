import 'package:face_to_face_messager_app/common/colors.dart';
import 'package:face_to_face_messager_app/view/pages/chat_app/chat_input_field.dart';
import 'package:face_to_face_messager_app/view/pages/chat_app/messager/reply_comment/comment_replay_detail_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ChartDetailPage extends StatefulWidget {
  const ChartDetailPage({Key? key}) : super(key: key);

  @override
  State<ChartDetailPage> createState() => _ChartDetailPageState();
}

class _ChartDetailPageState extends State<ChartDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  //AppBar
  //Build AppBar
  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
            child: Container(
              alignment: Alignment.center,
              color: colorBlue,
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(right: 2, bottom: 10, top: 10),
              child: Column(
                children: [
                  _buidMoreAction(),
                ],
              ),
            ),
          ),
          //Build Comment OR Reply Detail
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(keepScrollOffset: true),
              physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.start,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CommentReplyDetail(),
            ),
          ),
          //Input Message Filed
          ChartInputField(),
         // CommentReplyDetail
        ],
      ));
  }
  //Build More Actions
  Widget _buidMoreAction() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.network(
                "https://res.cloudinary.com/devappmediakh/image/upload/v1662796393/opensource/verification_phone/arrow_right_qfyw2c.png",
                width: 17,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/a-/ACNPEu-Xvkiq8j0YxXKivoWBpUwzj7I_gJpV-Z_gKtoHag=s192-c-rg-br100"),
                maxRadius: 22,
              ),
              _buildTitleMoreAction(),
              _buildListActions()
            ],
          ),
        )
      ],
    );
  }

  //Build Title More Action
  Widget _buildTitleMoreAction() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 10, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Panha DevApp ",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 2,
          ),
          Text("Online",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.normal))),
        ],
      ),
    );
  }
  //Build List Action
  Widget _buildListActions() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Icon(Iconsax.call, color: Colors.white, size: 25),
          ),
          SizedBox(width: 23),
          InkWell(
            onTap: () {},
            child: Icon(Iconsax.video, color: Colors.white, size: 25),
          ),
          SizedBox(width: 23),
          InkWell(
            onTap: () {},
            child: Icon(Iconsax.more_circle, color: Colors.white, size: 25),
          ),
        ],
      ),
    );
  }
}
