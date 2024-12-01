
import 'package:flutter/material.dart';


class appbarFloatingButton extends StatefulWidget {
  const appbarFloatingButton({Key? key}) : super(key: key);

  @override
  State<appbarFloatingButton> createState() => _appbarFloatingButtonState();
}

class _appbarFloatingButtonState extends State<appbarFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: CircleAvatar(
          radius: 21,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart_outlined,color: Colors.green,),
          ),
        ),
      ),
      onPressed: () {
        
      },
    );
  }
}