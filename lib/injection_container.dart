import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/user_remote_datasource.dart';
import 'data/repositories/user_repository_imp.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_all_users.dart';
import 'presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

void init() {
  // BLoC
  sl.registerFactory(() => UserBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllUsers(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(client: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}
