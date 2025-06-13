import 'dart:ui';

class Promotion {
  final String text;
  final VoidCallback? onTap;

  const Promotion({
    required this.text,
    this.onTap,
  });
}