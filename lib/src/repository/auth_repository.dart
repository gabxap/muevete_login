import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String uid;
  final String? email;

  AuthUser(this.uid, this.email);

  @override
  List<Object?> get props => [uid];
}

abstract class AuthRepositoryBase {
  Stream<AuthUser?> get onAuthStateChanged;

  Future<AuthUser?> createWithEmailAndPassword(String email, String password);

  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}
