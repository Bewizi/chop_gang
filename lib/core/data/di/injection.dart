import 'package:chop_gang/core/data/api_client.dart';
import 'package:chop_gang/features/auth/data/auth_data.dart';
import 'package:chop_gang/features/auth/domain/auth_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> initInjection() async {
  // 1. Core Data
  sl
    ..registerLazySingleton<ApiClient>(ApiClient.new)
    // 2. Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthData(sl<ApiClient>()), // Injects the ApiClient automatically
    );

  // As you add features, add them here:
  // sl.registerLazySingleton<ProductRepository>(() => ProductData(sl()));
}
