import '../entity/firebase_user.dart';

abstract class UserRepository {
  signInWithGoogle();
  signOut();
  Future<bool> isSignIn();
  Future<FirebaseUser?> getUser();
}
