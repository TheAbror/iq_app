import 'package:chopper/chopper.dart';
import 'package:iq_app/ui/home_page/tabs/take_iq_test_page/model/questions_model.dart';

part 'questions_service.chopper.dart';

@ChopperApi(baseUrl: 'assets/json_question.json')
abstract class QuestionsService extends ChopperService {
  static QuestionsService create([ChopperClient? client]) => _$QuestionsService(client ?? ChopperClient());

  @Get()
  Future<Response<List<QuestionsResponse>>> getQuestions();
}
