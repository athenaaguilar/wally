import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    this.logoUrl,
    this.title,
  }) : super(key: key);

  final String? logoUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logoUrl != null) Flexible(child: Image.asset(logoUrl!, height: 40)),
          Text(title ?? 'Wally'),
          if (logoUrl != null) const SizedBox(width: 12.0),
        ],
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
