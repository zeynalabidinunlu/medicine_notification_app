import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';

class CommonPageTransition {
  /// Basit kullanım için static method
  static Future<T?> navigateTo<T>(
    BuildContext context,
    Widget page, {
    TransitionType type = TransitionType.slideRight,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.push<T>(
      context,
      _createRoute<T>(page, type, duration, curve),
    );
  }

  /// Replace navigation
  static Future<T?> navigateToReplace<T, TO>(
    BuildContext context,
    Widget page, {
    TransitionType type = TransitionType.slideRight,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.pushReplacement<T, TO>(
      context,
      _createRoute<T>(page, type, duration, curve),
    );
  }

  /// Clear stack and navigate
  static Future<T?> navigateToAndClear<T>(
    BuildContext context,
    Widget page, {
    TransitionType type = TransitionType.slideRight,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      _createRoute<T>(page, type, duration, curve),
      (route) => false,
    );
  }

  /// Custom PageRouteBuilder oluştur
  static PageRouteBuilder<T> _createRoute<T>(
    Widget page,
    TransitionType type,
    Duration duration,
    Curve curve,
  ) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildTransition(
          animation,
          secondaryAnimation,
          child,
          type,
          curve,
        );
      },
    );
  }

  /// Animasyon türüne göre geçiş oluştur
  static Widget _buildTransition(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    TransitionType type,
    Curve curve,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    switch (type) {
      case TransitionType.slideRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      case TransitionType.slideLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      case TransitionType.slideUp:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      case TransitionType.slideDown:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );

      case TransitionType.fade:
        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );

      case TransitionType.scale:
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(curvedAnimation),
          child: child,
        );

      case TransitionType.rotation:
        return RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );

      case TransitionType.slideRightWithFade:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );
    }
  }
}

/// Extension ile Navigator'a kolay erişim
extension NavigatorExtension on BuildContext {
  /// Slide right ile sayfa geçişi
  Future<T?> slideToPage<T>(Widget page) {
    return CommonPageTransition.navigateTo<T>(
      this,
      page,
      type: TransitionType.slideRight,
    );
  }

  /// Fade ile sayfa geçişi
  Future<T?> fadeToPage<T>(Widget page) {
    return CommonPageTransition.navigateTo<T>(
      this,
      page,
      type: TransitionType.fade,
    );
  }

  /// Scale ile sayfa geçişi
  Future<T?> scaleToPage<T>(Widget page) {
    return CommonPageTransition.navigateTo<T>(
      this,
      page,
      type: TransitionType.scale,
    );
  }

  /// Slide up ile sayfa geçişi
  Future<T?> slideUpToPage<T>(Widget page) {
    return CommonPageTransition.navigateTo<T>(
      this,
      page,
      type: TransitionType.slideUp,
    );
  }

  /// Custom geçiş
  Future<T?> customTransitionToPage<T>(
    Widget page, {
    TransitionType type = TransitionType.slideRight,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return CommonPageTransition.navigateTo<T>(
      this,
      page,
      type: type,
      duration: duration,
      curve: curve,
    );
  }
}
