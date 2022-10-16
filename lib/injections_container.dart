import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'data/datasources/task_remote_datasource.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/task_reporitory.dart';
import 'domain/usecases/get_tasks.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user_signed_in.dart';
import 'domain/usecases/is_sign_in.dart';
import 'domain/usecases/sign_in_with_google.dart';
import 'domain/usecases/sign_out.dart';
import 'firebase_options.dart';
import 'presentation/bloc/authentication_bloc/authentication_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      "email",
    ],
  );
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // datasources
  getIt.registerSingleton<TaskRemoteDataSource>(
    FirestoreTaskDataSource(
      firestore: firestore,
    ),
  );

  // repositories
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      firebaseAuth: firebaseAuth,
      googleSignIn: googleSignIn,
    ),
  );

  getIt.registerSingleton<TaskRepository>(
    TaskRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  // usecases
  getIt.registerLazySingleton<SignInWithGoogle>(
    () => SignInWithGoogle(
      repository: getIt(),
    ),
  );
  getIt.registerLazySingleton<SignOut>(
    () => SignOut(
      repository: getIt(),
    ),
  );
  getIt.registerLazySingleton<IsSignIn>(
    () => IsSignIn(
      repository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetUserSignedIn>(
    () => GetUserSignedIn(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetTasks>(
    () => GetTasks(
      repository: getIt(),
    ),
  );

  // bloc
  getIt.registerSingleton<AuthenticationBloc>(
    AuthenticationBloc(
      signInWithGoogle: getIt(),
      signOut: getIt(),
      isSignIn: getIt(),
      getUserSignedIn: getIt(),
    ),
  );
}
