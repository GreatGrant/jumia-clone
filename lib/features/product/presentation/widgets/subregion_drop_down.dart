import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class SubregionDropdown extends StatelessWidget {
  final List<String> subregions;
  final String? selectedSubregion;
  final ValueChanged<String?> onChanged;

  const SubregionDropdown({
    super.key,
    required this.subregions,
    required this.selectedSubregion,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey400),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedSubregion,
          hint: const Text('Select Area'),
          onChanged: onChanged,
          items: subregions.map((subregion) {
            return DropdownMenuItem<String>(
              value: subregion,
              child: Text(subregion),
            );
          }).toList(),
        ),
      ),
    );
  }
}
