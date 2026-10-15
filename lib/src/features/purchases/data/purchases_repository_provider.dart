import 'package:life_battery/src/features/purchases/data/api/purchases_api_data_source.dart';
import 'package:life_battery/src/features/purchases/data/api/revenue_cat_purchases_api_data_source.dart';
import 'package:life_battery/src/features/purchases/data/purchases_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchases_repository_provider.g.dart';

@Riverpod(keepAlive: true)
PurchasesApiDataSource purchasesApiDataSource(Ref ref) {
  return const RevenueCatPurchasesApiDataSource();
}

@Riverpod(keepAlive: true)
PurchasesRepository purchasesRepository(Ref ref) {
  final apiDataSource = ref.watch(purchasesApiDataSourceProvider);
  return PurchasesRepository(apiDataSource: apiDataSource);
}
