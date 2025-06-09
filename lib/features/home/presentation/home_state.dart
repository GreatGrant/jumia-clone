import '../home_section_model.dart';

class HomeState {
  final List<HomeSectionModel> sections;
  final int loadedSectionCount;
  final bool isLoadingMore;
  final String? error;

  const HomeState({
    this.sections = const [],
    this.loadedSectionCount = 0,
    this.isLoadingMore = false,
    this.error,
  });

  HomeState copyWith({
    List<HomeSectionModel>? sections,
    int? loadedSectionCount,
    bool? isLoadingMore,
    String? error,
  }) {
    return HomeState(
      sections: sections ?? this.sections,
      loadedSectionCount: loadedSectionCount ?? this.loadedSectionCount,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error ?? this.error,
    );
  }
}
