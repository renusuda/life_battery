import 'package:life_battery/src/features/share/data/api/share_api_data_source.dart';
import 'package:life_battery/src/features/share/data/api/share_plus_share_api_data_source.dart';
import 'package:life_battery/src/features/share/data/share_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'share_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ShareApiDataSource shareApiDataSource(Ref ref) {
  return SharePlusShareApiDataSource(sharePlus: SharePlus.instance);
}

@Riverpod(keepAlive: true)
ShareRepository shareRepository(Ref ref) {
  final apiDataSource = ref.watch(shareApiDataSourceProvider);
  return ShareRepository(apiDataSource: apiDataSource);
}
