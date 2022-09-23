import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/colors.dart';
class PopupMenuButtonPage extends StatefulWidget {
  String title;
  IconData iconData;
  int position;


  PopupMenuButtonPage({Key? key, required this.title, required this.iconData, required this.position}) : super(key: key);

  @override
  State<PopupMenuButtonPage> createState() => _PopupMenuButtonPageState();
}

class _PopupMenuButtonPageState extends State<PopupMenuButtonPage> {
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Iconsax.more_circle,  color: Colors.white,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        )
      ),
      onSelected: (value){
        
      },
      initialValue: 2,
      itemBuilder: (context) => [
        //Build Popup Menu Item
        PopupMenuItem(
          value: widget.position,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(widget.iconData),
                Text(widget.title)
              ],
          )
        ),
      ],
      offset: Offset(0.0, 45),
    );
  }


}
