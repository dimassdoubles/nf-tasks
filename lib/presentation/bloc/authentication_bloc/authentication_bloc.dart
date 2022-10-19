import 'package:bloc/bloc.dart';

import '../../../domain/usecases/get_user_signed_in.dart';
import '../../../domain/usecases/is_sign_in.dart';
import '../../../domain/usecases/sign_in_with_google.dart';
import '../../../domain/usecases/sign_out.dart';
import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetUserSignedIn _getUserSignedIn;
  final SignInWithGoogle _signInWithGoogle;
  final IsSignIn _isSignIn;
  final SignOut _signOut;

  AuthenticationBloc({
    required SignInWithGoogle signInWithGoogle,
    required SignOut signOut,
    required IsSignIn isSignIn,
    required GetUserSignedIn getUserSignedIn,
  })  : _signOut = signOut,
        _isSignIn = isSignIn,
        _getUserSignedIn = getUserSignedIn,
        _signInWithGoogle = signInWithGoogle,
        super(Uninitialized()) {
    on<AppStart>(
      (event, emit) async {
        try {
          bool isSignIn = await _isSignIn();
          if (isSignIn) {
            final user = await _getUserSignedIn();
            emit(Authenticated(user: user!));
          } else {
            emit(Unauthenticated());
          }
        } catch (_) {
          emit(Unauthenticated());
        }
      },
    );
    on<LoggedIn>(
      (event, emit) async {
        await _signInWithGoogle();
        final user = await _getUserSignedIn();
        emit(Authenticated(user: user!));
      },
    );

    on<LoggedOut>(
      (event, emit) {
        _signOut();
        emit(Unauthenticated());
      },
    );
  }
}
