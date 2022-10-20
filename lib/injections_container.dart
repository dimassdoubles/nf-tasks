import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nf_tasks/domain/usecases/update_app_task.dart';
import 'domain/usecases/synchronize_task_with_user_task.dart';
import 'data/datasources/user_task_remote_datasource.dart';
import 'data/repositories/user_task_repository.dart';
import 'domain/repositories/user_task_repository.dart';
import 'domain/usecases/get_user_tasks.dart';
import 'domain/usecases/initialize_user_tasks.dart';
import 'domain/usecases/update_user_tasks.dart';
import 'presentation/cubit/app_task_cubit.dart';
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

  getIt.registerSingleton<UserTaskRemoteDataSource>(
    FirestoreUserTaskDataSource(
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

  getIt.registerSingleton<UserTaskRepository>(
    UserTaskRepositoryImpl(
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

  getIt.registerLazySingleton<GetUserTasks>(
    () => GetUserTasks(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<InitializeUserTasks>(
    () => InitializeUserTasks(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<UpdateUserTasks>(
    () => UpdateUserTasks(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<SynchronizeTaskWithUserTask>(
    () => SynchronizeTaskWithUserTask(),
  );

  getIt.registerLazySingleton<UpdateAppTask>(() => UpdateAppTask());

  // bloc
  getIt.registerSingleton<AuthenticationBloc>(
    AuthenticationBloc(
      signInWithGoogle: getIt(),
      signOut: getIt(),
      isSignIn: getIt(),
      getUserSignedIn: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AppTaskCubit(
      getUserTasks: getIt(),
      initializeUserTasks: getIt(),
      updateUserTasks: getIt(),
      getTasks: getIt(),
      updateAppTask: getIt(),
      synchronizeTask: getIt(),
    ),
  );
}
