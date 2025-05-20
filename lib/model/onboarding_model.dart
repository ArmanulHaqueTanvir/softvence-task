class OnboardingModel {
  String image;
  String title;
  String subTitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
      image: 'assets/imgs/morninggif1.png',
      title: 'Sync with Nature’s Rhythm',
    subTitle:
        'Experience a peaceful transition into the evening with an alarm that aligns with the sunset."Your perfect reminder, always 15 minutes before sundown',
  ),
  OnboardingModel(
    image: 'assets/imgs/morning _walk _gif_1.png',
    title: 'Effortless & Automatic',
    subTitle:
        'No need to set alarms manually. Wakey calculates the sunset time for your location and alerts you on time.',
  ),
  OnboardingModel(
    image: 'assets/imgs/mask_group.png',
    title: 'Relax & Unwind',
    subTitle: 'hope to take the courage to pursue your dreams.',
  ),
];
