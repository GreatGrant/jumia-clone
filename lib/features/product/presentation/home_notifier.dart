import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jumia_clone/features/product/data/models/product_model.dart';

import '../home_section_model.dart';
import '../home_section_type.dart';
import 'home_services.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeService _homeService;
  static const int _initialSectionCount = 8;
  static const int _sectionsPerBatch = 4;

  HomeNotifier(this._homeService) : super(const HomeState()) {
    _initializeSections();
    loadInitialSections();
  }

  void _initializeSections() {
    final allSections = [
      HomeSectionModel(
        id: 'banner',
        title: 'CALL TO ORDER: 07006000000, 02018883300',
        type: HomeSectionType.banner,
      ),
      HomeSectionModel(
        id: 'promo_slider',
        title: 'Promo Slider',
        type: HomeSectionType.promoSlider,
      ),
      HomeSectionModel(
        id: 'promo_cards_1',
        title: 'Promotional Cards 1',
        type: HomeSectionType.promotionalCards,
      ),
      HomeSectionModel(
        id: 'promo_cards_2',
        title: 'Promotional Cards 2',
        type: HomeSectionType.promotionalCards,
      ),
      HomeSectionModel(
        id: 'flash_sale',
        title: 'Flash Sale',
        type: HomeSectionType.flashSale,
      ),
      HomeSectionModel(
        id: 'sponsored_products',
        title: 'Sponsored Products',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'top_sellers',
        title: 'Top Sellers',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'nivea_store',
        title: 'Nivea Official Store',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'phone_tablet_deals',
        title: 'Anniversary Deals on Phones & Tablets',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'fashion_deals',
        title: 'Anniversary Deals on Fashion',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'appliance_deals',
        title: 'Anniversary Deals on Appliances',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'home_deals',
        title: 'Anniversary Deals for Your Home',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'everything_must_go',
        title: 'Everything Must Go',
        subtitle: 'Up to 60% OFF',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'itel_store',
        title: 'Itel Official Store',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'electronics_deals',
        title: 'Anniversary Deals on Electronics',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'anniversary_celebrations',
        title: 'Anniversary Celebrations',
        subtitle: 'Enjoyment Overload',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'xiaomi_store',
        title: 'Xiaomi Official Store',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'defacto_store',
        title: 'Defacto Official Store',
        subtitle: '30% off at checkout when you buy 2+',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'tv_deals',
        title: 'Anniversary Deals on TVs',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'beauty_deals',
        title: 'Anniversary Deals on Beauty Products',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'computing_deals',
        title: 'Anniversary Deals on Computing',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'casual_to_formal',
        title: 'From Casual to Formal',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'handpicked',
        title: 'Handpicked for you',
        subtitle: 'Up to 50% Off',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'half_price_store',
        title: 'Half Price Store',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'jumia_bar',
        title: 'Jumia Bar',
        type: HomeSectionType.productRow,
      ),
      HomeSectionModel(
        id: 'top_selling_grid',
        title: 'Top Selling Products',
        type: HomeSectionType.topSellingGrid,
      ),
    ];

    state = state.copyWith(sections: allSections);
  }

  Future<void> loadInitialSections() async {
    try {
      final sectionsToLoad = state.sections.take(_initialSectionCount).toList();
      final loadedSections = <HomeSectionModel>[];

      for (final section in sectionsToLoad) {
        final loadedSection = await _loadSectionData(section);
        loadedSections.add(loadedSection);
      }

      final updatedSections = List<HomeSectionModel>.from(state.sections);
      for (int i = 0; i < loadedSections.length; i++) {
        updatedSections[i] = loadedSections[i];
      }

      state = state.copyWith(
        sections: updatedSections,
        loadedSectionCount: _initialSectionCount,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> loadMoreSections() async {
    if (state.isLoadingMore || state.loadedSectionCount >= state.sections.length) {
      return;
    }

    state = state.copyWith(isLoadingMore: true);

    try {
      final startIndex = state.loadedSectionCount;
      final endIndex = (startIndex + _sectionsPerBatch).clamp(0, state.sections.length);

      final sectionsToLoad = state.sections.sublist(startIndex, endIndex);
      final loadedSections = <HomeSectionModel>[];

      for (final section in sectionsToLoad) {
        final loadedSection = await _loadSectionData(section);
        loadedSections.add(loadedSection);
      }

      final updatedSections = List<HomeSectionModel>.from(state.sections);
      for (int i = 0; i < loadedSections.length; i++) {
        updatedSections[startIndex + i] = loadedSections[i];
      }

      state = state.copyWith(
        sections: updatedSections,
        loadedSectionCount: endIndex,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoadingMore: false,
      );
    }
  }

  Future<HomeSectionModel> _loadSectionData(HomeSectionModel section) async {
    try {
      List<ProductModel> products = [];

      switch (section.id) {
        case 'flash_sale':
          products = await _homeService.getFlashSaleProducts();
          break;
        case 'sponsored_products':
          products = await _homeService.getSponsoredProducts();
          break;
        case 'top_sellers':
          products = await _homeService.getTopSellers();
          break;
        case 'nivea_store':
          products = await _homeService.getNiveaProducts();
          break;
        case 'phone_tablet_deals':
          products = await _homeService.getPhoneTabletDeals();
          break;
        case 'fashion_deals':
          products = await _homeService.getFashionDeals();
          break;
        case 'appliance_deals':
          products = await _homeService.getApplianceDeals();
          break;
        case 'xiaomi_store':
          products = await _homeService.getXiaomiProducts();
          break;
        case 'top_selling_grid':
          products = await _homeService.getTopSellingGridProducts();
          break;
        default:
          products = await _homeService.getGenericProducts(section.id);
      }

      return section.copyWith(
        products: products,
        isLoaded: true,
        isLoading: false,
      );
    } catch (e) {
      return section.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  void refreshSection(String sectionId) async {
    final sectionIndex = state.sections.indexWhere((s) => s.id == sectionId);
    if (sectionIndex == -1) return;

    final updatedSections = List<HomeSectionModel>.from(state.sections);
    updatedSections[sectionIndex] = updatedSections[sectionIndex].copyWith(
      isLoading: true,
      error: null,
    );

    state = state.copyWith(sections: updatedSections);

    try {
      final loadedSection = await _loadSectionData(state.sections[sectionIndex]);
      updatedSections[sectionIndex] = loadedSection;
      state = state.copyWith(sections: updatedSections);
    } catch (e) {
      updatedSections[sectionIndex] = updatedSections[sectionIndex].copyWith(
        error: e.toString(),
        isLoading: false,
      );
      state = state.copyWith(sections: updatedSections);
    }
  }
}
