import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import 'location_data.dart';

class LocationDropdown extends StatelessWidget {
  final List<LocationData> locations;
  final LocationData? selectedLocation;
  final ValueChanged<LocationData?> onChanged;

  const LocationDropdown({
    super.key,
    required this.locations,
    required this.selectedLocation,
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
        child: DropdownButton<LocationData>(
          isExpanded: true,
          value: selectedLocation,
          hint: const Text('Select Location'),
          onChanged: onChanged,
          items: locations.map((location) {
            return DropdownMenuItem<LocationData>(
              value: location,
              child: Text(location.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
