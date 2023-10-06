import 'package:chopper/chopper.dart';
import 'package:iq_app/core/app_strings.dart';
import 'package:iq_app/ui/home_page/tabs/take_iq_test_page/model/questions_model.dart';

part 'questions_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class QuestionsService extends ChopperService {
  static QuestionsService create([ChopperClient? client]) => _$QuestionsService(client ?? ChopperClient());

  @Get(path: '${AppStrings.timetable}?groupID={group_id}&roomID={room_id}&teacherID={teacher_id}')
  Future<Response<List<QuestionsResponse>>> getTimetableInfo();
}
