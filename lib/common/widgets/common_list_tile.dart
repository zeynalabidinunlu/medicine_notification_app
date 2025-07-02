
import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  const CommonListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: leadingIcon != null ? Icon(leadingIcon) : null,
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: trailingIcon != null ? Icon(trailingIcon) : null,
        onTap: onTap,
      ),
    );
  }
} 