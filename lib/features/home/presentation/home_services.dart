// services/home_service.dart
import 'package:jumia_clone/models/product_model.dart';
import 'package:jumia_clone/jumia_data.dart';

class HomeService {
  // Simulate network delay
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<List<ProductModel>> getFlashSaleProducts() async {
    await _simulateNetworkDelay();
    return JumiaData.productItems;
  }

  Future<List<ProductModel>> getSponsoredProducts() async {
    await _simulateNetworkDelay();
    return JumiaData.sponsoredProducts;
  }

  Future<List<ProductModel>> getTopSellers() async {
    await _simulateNetworkDelay();
    return JumiaData.electronics;
  }

  Future<List<ProductModel>> getNiveaProducts() async {
    await _simulateNetworkDelay();
    return JumiaData.niveaOfficialStoreItems;
  }

  Future<List<ProductModel>> getPhoneTabletDeals() async {
    await _simulateNetworkDelay();
    return JumiaData.phonesAndTablet;
  }

  Future<List<ProductModel>> getFashionDeals() async {
    await _simulateNetworkDelay();
    return JumiaData.anniversaryDeals;
  }

  Future<List<ProductModel>> getApplianceDeals() async {
    await _simulateNetworkDelay();
    return JumiaData.electronics;
  }

  Future<List<ProductModel>> getXiaomiProducts() async {
    await _simulateNetworkDelay();
    return JumiaData.xiaomiOfficialStoreItems;
  }

  Future<List<ProductModel>> getTopSellingGridProducts() async {
    await _simulateNetworkDelay();
    return JumiaData.jumiaTopSellersItems;
  }

  Future<List<ProductModel>> getGenericProducts(String sectionId) async {
    await _simulateNetworkDelay();

    // Return different product sets based on section ID
    switch (sectionId) {
      case 'home_deals':
      case 'everything_must_go':
      case 'anniversary_celebrations':
      case 'handpicked':
      case 'half_price_store':
      case 'jumia_bar':
        return JumiaData.productItems;
      case 'itel_store':
        return JumiaData.jumiaTopSellersItems;
      case 'electronics_deals':
        return JumiaData.electronics;
      case 'defacto_store':
      case 'tv_deals':
      case 'computing_deals':
      case 'casual_to_formal':
        return JumiaData.productItems;
      case 'beauty_deals':
        return JumiaData.niveaOfficialStoreItems;
      default:
        return JumiaData.productItems;
    }
  }

  Future<List<String>> getPromoImages() async {
    await _simulateNetworkDelay();
    return JumiaData.promoImages;
  }
}