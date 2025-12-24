import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/services/session_repository.dart';

class AuthService {
  final CasinoManager casinoManager;
  final SessionRepository sessionRepo;

  AuthService({ required this.casinoManager, required this.sessionRepo,});

  Future<Player> login(String username, String password) async {
    final player = casinoManager.loginPlayer(username, password);
    await sessionRepo.setCurrentPlayerId(player.idPlayer);
    return player;
  }

  Future<void> signUp (String username, String password) async{
    casinoManager.createPlayer(username, password);
    await casinoManager.saveCasino();
  }

  Future<void> logout() => sessionRepo.setCurrentPlayerId(null);
}