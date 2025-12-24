import 'package:casino_app/data/user_session.dart';
import 'package:hive/hive.dart';


class SessionRepository {
  final Box<Session> box;
  SessionRepository(this.box);

  Session? getSession() => box.get('state');

  int? get currentPlayerId =>
      box.get('state')?.idPlayer;

  Future<void> setCurrentPlayerId(int? id) async {
    await box.put('state', Session(idPlayer: id));
  }

  Future<void> clear() async => box.delete('state');
}

