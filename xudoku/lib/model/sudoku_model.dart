import 'package:xudoku/model/review_model.dart';

class SudokuModel {
  String title;
  String image;
  String rule;
  String fullRule;
  List<ReviewModel> reviews;

  SudokuModel({
    required this.title,
    required this.image,
    required this.rule,
    required this.fullRule,
    required this.reviews,
  });
  
}
