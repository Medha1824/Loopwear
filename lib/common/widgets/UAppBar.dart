import 'package:flutter/material.dart';

class UAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackArrow;
  final Widget title;

  const UAppBar({
    super.key,
    this.showBackArrow = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF9F7F88),
      iconTheme: IconThemeData(color: Colors.white),
      leading: showBackArrow
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      )
          : null,
      title: title,
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}