import 'package:flutter/material.dart';
import 'package:jumia_clone/features/product/presentation/widgets/subregion_drop_down.dart';
import '../../../../core/theme/colors.dart';
import 'location_data.dart';
import 'location_drop_down.dart';

class LocationSelectorSection extends StatelessWidget {
  final LocationData? selectedLocation;
  final String? selectedSubregion;
  final List<LocationData> locations;
  final void Function(LocationData?) onLocationChanged;
  final void Function(String?) onSubregionChanged;

  const LocationSelectorSection({
    super.key,
    required this.selectedLocation,
    required this.selectedSubregion,
    required this.locations,
    required this.onLocationChanged,
    required this.onSubregionChanged,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Location',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.black87,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),

        LocationDropdown(
          locations: locations,
          selectedLocation: selectedLocation,
          onChanged: onLocationChanged,
        ),

        const SizedBox(height: 12),

        if (selectedLocation != null &&
            selectedLocation!.subregions.isNotEmpty) ...[
          SubregionDropdown(
            subregions: selectedLocation!.subregions,
            selectedSubregion: selectedSubregion,
            onChanged: onSubregionChanged,
          )
        ] else
          ...[
            const Text(
              'No delivery areas available for this location',
              style: TextStyle(color: Colors.grey),
            )
          ]
      ],
    );
  }
}
