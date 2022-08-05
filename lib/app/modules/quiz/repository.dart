
import '../../data/providers/api.dart';

class QuizRepositry{
  final MyApi api;

  QuizRepositry(this.api);

  getQuestions(int categories, String difficulty) => api.getQuestions(categories, difficulty);
}