// ignore_for_file: non_constant_identifier_names

class OnboardingModel {
  late String title;
  late String subtitle;
  late String Image;
  OnboardingModel(
      {required this.title, required this.subtitle, required this.Image});
}

List<OnboardingModel> onboarding = [
  OnboardingModel(
      title: "Fresh and Relevant Items",
      subtitle: "Taste is the first priority.",
      Image: "images/onboard3.jpg"),
  OnboardingModel(
      title: "Quick Responses",
      subtitle: "Unexceptional Foody Services !",
      Image: "images/onboard2.jpg"),
  OnboardingModel(
      title: "Delicious Dishes",
      subtitle: "Explore Our Menu of Exquisite Meals",
      Image: "images/onboard1.jpg"),
];
