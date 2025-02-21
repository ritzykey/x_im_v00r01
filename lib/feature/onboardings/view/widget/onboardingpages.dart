class OnboardingPage {
  // "top" veya "bottom"

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.titlePosition,
  });
  final String title;
  final String description;
  final dynamic imageAsset;
  final String titlePosition;
}
