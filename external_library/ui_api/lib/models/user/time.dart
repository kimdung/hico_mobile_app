import 'package:get/get.dart';

class Time {
  String content = '';
  int experienceCode = 0;
  bool isFeatured = false;

  Time(
      {required this.content,
      required this.experienceCode,
      required this.isFeatured});
}

final translatationExperiences = [
  Time(
      content: 'profile.update.number_years_in_japan.all'.tr,
      experienceCode: 0,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.none'.tr,
      experienceCode: 1,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.one_to_three_year'.tr,
      experienceCode: 2,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.four_to_six_year'.tr,
      experienceCode: 3,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.seven_to_ten_year'.tr,
      experienceCode: 4,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.more_than_ten_year'.tr,
      experienceCode: 5,
      isFeatured: false),
];

final interpretationExperiences = [
  Time(
      content: 'profile.update.number_years_in_japan.all'.tr,
      experienceCode: 0,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.none'.tr,
      experienceCode: 1,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.one_to_three_year'.tr,
      experienceCode: 2,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.four_to_six_year'.tr,
      experienceCode: 3,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.seven_to_ten_year'.tr,
      experienceCode: 4,
      isFeatured: false),
  Time(
      content: 'profile.update.experience.more_than_ten_year'.tr,
      experienceCode: 5,
      isFeatured: false),
];

final numberYearsInJapanList = [
  Time(
      content: 'profile.update.number_years_in_japan.all'.tr,
      experienceCode: 0,
      isFeatured: false),
  Time(
      content: 'profile.update.number_years_in_japan.none'.tr,
      experienceCode: 1,
      isFeatured: false),
  Time(
      content: 'profile.update.number_years_in_japan.one_to_three_year'.tr,
      experienceCode: 2,
      isFeatured: false),
  Time(
      content: 'profile.update.number_years_in_japan.four_to_six_year'.tr,
      experienceCode: 3,
      isFeatured: false),
  Time(
      content: 'profile.update.number_years_in_japan.seven_to_ten_year'.tr,
      experienceCode: 4,
      isFeatured: false),
  Time(
      content: 'profile.update.number_years_in_japan.more_than_ten_year'.tr,
      experienceCode: 5,
      isFeatured: false),
];
