import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onBackPressed;
  final String? hintText;
  final Color backButtonColor;
  final Color fillColor;

  const SearchField({
    super.key,
    required this.focusNode,
    this.onChanged,
    this.onBackPressed,
    this.hintText,
    this.backButtonColor = Colors.green,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8.0),
      child: Stack(
        children: [
          TextField(
            focusNode: focusNode,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              fillColor: fillColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 50),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              isDense: true,
            ),
            onChanged: onChanged,
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onBackPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Icon(
                  Icons.arrow_back,
                  color: backButtonColor,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}