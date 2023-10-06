// import 'package:chopper/chopper.dart';

// import 'package:edu_app/core/constants/app_strings.dart';
// import 'package:edu_app/ui_student/tabs/tabs/timetable_tab/model/udea_timetable.dart';

// part 'timetable_service.chopper.dart';

// @ChopperApi(baseUrl: AppStrings.baseLive)
// abstract class TimetableService extends ChopperService {
//   static TimetableService create([ChopperClient? client]) => _$TimetableService(client ?? ChopperClient());

//   @Get(path: '${AppStrings.timetable}?groupID={group_id}&roomID={room_id}&teacherID={teacher_id}')
//   Future<Response<TimetableResponse>> getTimetableInfo(
//       {@Path('group_id') int? groupID, @Path('room_id') int? roomID, @Path('teache_id') int? teacherID});
// }
