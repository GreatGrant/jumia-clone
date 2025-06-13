import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/features/product/presentation/widgets/products_section_header.dart';
import 'package:jumia_clone/core/theme/colors.dart';
import 'package:jumia_clone/features/product/presentation/widgets/return_policy_card.dart';

import 'delivery_option_card.dart';
import 'jumia_express_section.dart';
import 'location_data.dart';
import 'location_selector_section.dart';

class DeliveryReturnsInfo extends StatefulWidget {
  final List<LocationData> locations;
  final String currency;
  final String returnPolicy;
  final VoidCallback? onDetailsPressed;

  const DeliveryReturnsInfo({
    super.key,
    required this.locations,
    this.currency = '₦',
    this.returnPolicy = 'Free return within 7 days for ALL eligible items',
    this.onDetailsPressed,
  });

  @override
  State<DeliveryReturnsInfo> createState() => _DeliveryReturnsInfoState();
}

class _DeliveryReturnsInfoState extends State<DeliveryReturnsInfo> {
  LocationData? selectedLocation;
  String? selectedSubregion;

  @override
  void initState() {
    super.initState();

    selectedLocation = widget.locations.firstWhere(
          (location) => location.name.toLowerCase() == 'lagos',
      orElse: () => widget.locations.first,
    );

    selectedSubregion = selectedLocation?.subregions.isNotEmpty == true
        ? selectedLocation!.subregions.first
        : null;
  }

  void onLocationChanged(LocationData? location) {
    setState(() {
      selectedLocation = location;
      selectedSubregion = location?.subregions.isNotEmpty == true
          ? location!.subregions.first
          : null;
    });
  }

  void onSubregionChanged(String? subregion) {
    setState(() {
      selectedSubregion = subregion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductSectionHeader(title: 'Delivery and Returns Info', showIcon: false),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            const JumiaExpressSection(),
            const SizedBox(height: 24),
            LocationSelectorSection(
              selectedLocation: selectedLocation,
              selectedSubregion: selectedSubregion,
              locations: widget.locations,
              onLocationChanged: onLocationChanged,
              onSubregionChanged: onSubregionChanged,
            ),
            const SizedBox(height: 16),
            if (selectedLocation != null) ...[
              DeliveryOptionCard(
                option: selectedLocation!.deliveryOptions,
                currency: widget.currency,
                onDetailsPressed: widget.onDetailsPressed,
              ),
              const SizedBox(height: 4),
              ReturnPolicyCard(
                policyText: widget.returnPolicy,
                onDetailsPressed: widget.onDetailsPressed!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
