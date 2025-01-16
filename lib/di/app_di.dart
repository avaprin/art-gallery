import 'package:dio/dio.dart';

import '../src/data/repositories/art/art_repository.dart';
import '../src/data/repositories/art/art_repository_impl.dart';
import '../src/navigation/router.dart';

final Dio _dio = Dio(
  BaseOptions(
    followRedirects: false,
    baseUrl: 'https://api.artic.edu/api/v1',
  ),
);

final ArtRepository artRepository = ArtRepositoryImpl(
  _dio,
);

final AppRouter appRouter = AppRouter();
