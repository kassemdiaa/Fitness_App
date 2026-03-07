import 'package:fitness_app/data/models/couches_models/transformation_model.dart';

class CouchModel {
  String name;
  String imagePath;
  String age;
  String experience;
  String bio;
  double rate;
  List<TransformationModel> transformations;
  Map<String, int> budgets;
  CouchModel({
    required this.name,
    required this.imagePath,
    required this.age,
    required this.experience,
    required this.bio,
    required this.rate,
    required this.transformations,
    required this.budgets,
  });

  static List<CouchModel> couches = [
    CouchModel(
      name: 'Yousef Fathy',
      imagePath: 'assets/images/fathy.png',
      age: '21',
      experience: '+3 Years of Experience',
      bio:
          'I don’t believe in "quick fixes" or soul-crushing diets. My mission is to help you build a body that feels as good as it looks. With five years of experience in functional strength training and corrective exercise, I focus on building foundations that last—whether you’re lifting your first barbell or training for your tenth marathon.',
      rate: 4.5,
      transformations: [
        TransformationModel(
          beforeImagePath: 'assets/images/before1.jpg',
          afterImagePath: 'assets/images/after1.jpg',
          time: '3 Months',
          description:
              'I don’t believe in "quick fixes" or soul-crushing diets. My mission is to help you build a body that feels as good as it looks. With five years of experience in functional strength training and corrective exercise, I focus on building foundations that last—whether you’re lifting your first barbell or training for your tenth marathon.',
        ),
        TransformationModel(
          beforeImagePath: 'assets/images/before2.jpg',
          afterImagePath: 'assets/images/after2.jpg',
          time: '3 Months',
          description:
              'I don’t believe in "quick fixes" or soul-crushing diets. My mission is to help you build a body that feels as good as it looks. With five years of experience in functional strength training and corrective exercise, I focus on building foundations that last—whether you’re lifting your first barbell or training for your tenth marathon.',
        ),
      ],
      budgets: {
        '1 Month': 1000,
        '3 Months': 2500,
        '6 Months': 4500,
        '1 Year': 8000,
      },
    ),
    CouchModel(
      name: 'Kassem Diaa',
      imagePath: 'assets/images/kassem.png',
      age: '21',
      experience: '+3 Years of Experience',
      bio:
          'I don’t believe in "quick fixes" or soul-crushing diets. My mission is to help you build a body that feels as good as it looks. With five years of experience in functional strength training and corrective exercise, I focus on building foundations that last—whether you’re lifting your first barbell or training for your tenth marathon.',
      rate: 4.5,
      transformations: [
        TransformationModel(
          beforeImagePath: 'assets/images/before1.jpg',
          afterImagePath: 'assets/images/after1.jpg',
          time: '3 Months',
          description:
              'I don’t believe in "quick fixes" or soul-crushing diets. My mission is to help you build a body that feels as good as it looks. With five years of experience in functional strength training and corrective exercise, I focus on building foundations that last—whether you’re lifting your first barbell or training for your tenth marathon.',
        ),
        TransformationModel(
          beforeImagePath: 'assets/images/before2.jpg',
          afterImagePath: 'assets/images/after2.jpg',
          time: '3 Months',
          description:
              'I don’t believe in "quick fixes" or soul-crushing diets. My mission is to help you build a body that feels as good as it looks. With five years of experience in functional strength training and corrective exercise, I focus on building foundations that last—whether you’re lifting your first barbell or training for your tenth marathon.',
        ),
      ],
      budgets: {
        '1 Month': 1000,
        '3 Months': 2500,
        '6 Months': 4500,
        '1 Year': 8000,
      },
    ),
  ];
}
