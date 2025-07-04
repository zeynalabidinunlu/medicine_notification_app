import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final ThemeData theme;

  const DetailAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onPrimary,
        ),
      ),
      backgroundColor: theme.primaryColor,
      foregroundColor: theme.colorScheme.onPrimary,
      elevation: 0,
      centerTitle: true,
      leading: onBackPressed != null
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBackPressed,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
