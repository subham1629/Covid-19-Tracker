import 'package:flutter/material.dart';



class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0.0,
      actions: <Widget>[]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
