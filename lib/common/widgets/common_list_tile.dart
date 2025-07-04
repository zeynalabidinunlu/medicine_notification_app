// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? doctorName;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final Color? cardColor;
  final bool isSelected;
  final String? clinic;

  const CommonListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leadingIcon,
    this.clinic,
    this.trailingIcon,
    this.doctorName,
    this.onTap,
    this.cardColor,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: _getCardColor(theme, isDarkMode),
              borderRadius: BorderRadius.circular(16),
              border: isSelected 
                  ? Border.all(color: theme.primaryColor, width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: isDarkMode 
                      ? Colors.black.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (doctorName != null) ...[
                    _buildDoctorHeader(theme),
                    const SizedBox(height: 12),
                  ],
                  Row(
                    children: [
                      if (leadingIcon != null) ...[
                        _buildLeadingIcon(theme),
                        const SizedBox(width: 16),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isSelected 
                                    ? theme.primaryColor 
                                    : theme.textTheme.titleMedium?.color,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            _buildClinicHeader(theme)
                          ],
                        ),
                      ),
                      if (trailingIcon != null) ...[
                        const SizedBox(width: 12),
                        _buildTrailingIcon(theme),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.medical_services,
            size: 16,
            color: theme.primaryColor,
          ),
          const SizedBox(width: 6),
          Text(
            doctorName!,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClinicHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_hospital,
            size: 16,
            color: theme.primaryColor,
          ),
          const SizedBox(width: 6),
          Text(
            clinic ?? 'Bilinmiyor',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon(ThemeData theme) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        leadingIcon,
        color: theme.primaryColor,
        size: 24,
      ),
    );
  }

  Widget _buildTrailingIcon(ThemeData theme) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Icon(
        trailingIcon,
        color: theme.colorScheme.onSurface.withOpacity(0.6),
        size: 20,
      ),
    );
  }

  Color _getCardColor(ThemeData theme, bool isDarkMode) {
    if (cardColor != null) return cardColor!;
    
    if (isSelected) {
      return theme.primaryColor.withOpacity(0.05);
    }
    
    return isDarkMode 
        ? theme.colorScheme.surface
        : Colors.white;
  }
}