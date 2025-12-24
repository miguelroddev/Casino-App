import 'package:hive/hive.dart';
part 'user_session.g.dart';

@HiveType(typeId: 10)
class Session {
  @HiveField(0)
  int? idPlayer;

  Session({this.idPlayer});
}