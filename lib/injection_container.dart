import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:neon_spaces/core/api/api_consumer.dart';
import 'package:neon_spaces/core/api/app_interceptors.dart';
import 'package:neon_spaces/core/api/dio_consumer.dart';
import 'package:neon_spaces/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final sl = GetIt.instance;
final GetIt sl = GetIt.instance;

// void init() async {
init() async {
  //! Features
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Blocs
  // sl.registerFactory(() => UserLoginCubit(userLoginUseCase: sl()));
  // sl.registerFactory(
  //     () => UserRecoveryPasswordCubit(userRecoveryPasswordUseCase: sl()));
  // sl.registerFactory(() => UserCheckCodeCubit(userCheckCodeUseCase: sl()));
  //
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// UseCases
  // sl.registerLazySingleton(() => UserLoginUseCase(userLoginRepository: sl()));
  // sl.registerLazySingleton(
  //     () => UserRecoveryPasswordUseCase(userRecoveryPasswordRepository: sl()));
  // sl.registerLazySingleton(
  //     () => UserCheckCodeUseCase(userCheckCodeRepository: sl()));

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Repository
  // sl.registerLazySingleton<UserLoginRepository>(() => UserLoginRepositoryImpl(
  //       networkInfo: sl(),
  //       userLoginRemoteDataSource: sl(),
  //     ));
  // sl.registerLazySingleton<UserRecoveryPasswordRepository>(
  //     () => UserRecoveryPasswordRepositoryImpl(
  //           networkInfo: sl(),
  //           userRecoveryPasswordRemoteDataSource: sl(),
  //         ));
  // sl.registerLazySingleton<UserCheckCodeRepository>(
  //     () => UserCheckCodeRepositoryImpl(
  //           networkInfo: sl(),
  //           userCheckCodeRemoteDataSource: sl(),
  //         ));

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Data Source
  // sl.registerLazySingleton<UserLoginRemoteDataSource>(
  //     () => UserLoginRemoteDataSourceImpl(apiConsumer: sl()));
  // sl.registerLazySingleton<UserRecoveryPasswordRemoteDataSource>(
  //     () => UserRecoveryPasswordRemoteDataSourceImpl(apiConsumer: sl()));
  // sl.registerLazySingleton<UserCheckCodeRemoteDataSource>(
  //     () => UserCheckCodeRemoteDataSourceImpl(apiConsumer: sl()));

  //! Core
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  //! External
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
