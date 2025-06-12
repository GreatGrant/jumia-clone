import 'delivery_option.dart';

class LocationData {
  final String name;
  final List<String> subregions;
  final List<DeliveryOption> deliveryOptions;

  LocationData({
    required this.name,
    required this.subregions,
    required this.deliveryOptions,
  });
}