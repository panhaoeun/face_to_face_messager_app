import 'package:face_to_face_messager_app/common/colors.dart';
import 'package:face_to_face_messager_app/view/pages/chat_app/messager/reply_comment/chart_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ConversationListPage extends StatefulWidget {
  String name;
  String messageText;
  String imageURL;
  String time;
  bool isMessageRead;

  ConversationListPage(
      {Key? key,
      required this.name,
      required this.messageText,
      required this.imageURL,
      required this.isMessageRead,
      required this.time})
      : super(key: key);

  @override
  State<ConversationListPage> createState() => _ConversationListPageState();
}

class _ConversationListPageState extends State<ConversationListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 10),
      child: GestureDetector(
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(10, 5,20, 10),
                autofocus: true,
                mouseCursor: MouseCursor.uncontrolled,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                hoverColor: Color.fromRGBO(153, 255, 255, 10),
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChartDetailPage()),
                    );
                },
                title: Row(
                  children: [
                    //User Online or offline
                    _buildAvatar(),
                    SizedBox(width: 10),
                    _buildLastNameCaption(),
                    _buildLastMsgTime(),
                  ],
                ),
            )),
      ),
    );
  }

  //Build Avatar
  Widget _buildAvatar() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(0, 5),
                blurRadius: 25
            ),
          ]),
      child: Stack(
        children: [
          Positioned.fill(
              child: CircleAvatar(
              backgroundImage: NetworkImage(widget.imageURL),
          )),
          //Check Online or Offline
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle,
                  color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  //Build Name and Caption Aviator
  Widget _buildLastNameCaption() {
    return Expanded(
        child: Container(
      child: GestureDetector(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 7),
          Text(
            widget.messageText,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ],
      )),
    ));
  }

  //Build Last time Message
  Widget _buildLastMsgTime() {
    return Container(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            height: 20,
            width: 20,
            decoration: BoxDecoration(color: colorBlue, shape: BoxShape.circle),
            child: Text(
              "6",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: Icon(
                  Iconsax.tick_circle,
                  size: 10,
                ),
              ),
              SizedBox(width: 2),
              Text(
                "18:44",
                style: TextStyle(color: colorBlack, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
