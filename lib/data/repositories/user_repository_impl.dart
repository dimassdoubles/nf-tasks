import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entity/firebase_user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  @override
  signInWithGoogle() async {
    // trigger authentication
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // obtain the authentication detail
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // create credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // once signed in, return the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    return _firebaseAuth.currentUser;
  }

  @override
  signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<bool> isSignIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<FirebaseUser> getUser() async {
    final currentUser = _firebaseAuth.currentUser;
    return FirebaseUser(
      uid: currentUser!.uid,
      name: currentUser.displayName,
      email: currentUser.email,
    );
  }
}
