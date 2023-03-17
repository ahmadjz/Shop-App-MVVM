import 'package:shop_app_mvvm/data/network/error_handler.dart';
import 'package:shop_app_mvvm/data/response/responses.dart';

const cacheHomeKey = "CACHE_HOME_KEY";
const cacheHomeInterval = 60 * 1000;
const cacheStoreDetailsKey = "CACHE_STORE_DETAILS_KEY";
const cacheStoreDetailsInterval = 60 * 1000;

abstract class LocalDataSource {
  Future<HomeResponse> getHomeData();
  Future<void> saveHomeToCache(HomeResponse homeResponse);

  void clearCache();

  void removeFromCache(String key);

  Future<StoreDetailsResponse> getStoreDetails();

  Future<void> saveStoreDetailsToCache(StoreDetailsResponse response);
}

class LocalDataSourceImplementer implements LocalDataSource {
  Map<String, CachedItem> cachedMap = {};
  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cachedMap[cacheHomeKey];
    if (cachedItem != null && cachedItem.isValid(cacheHomeInterval)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cachedMap[cacheHomeKey] = CachedItem(data: homeResponse);
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    CachedItem? cachedItem = cachedMap[cacheStoreDetailsKey];

    if (cachedItem != null && cachedItem.isValid(cacheStoreDetailsInterval)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveStoreDetailsToCache(StoreDetailsResponse response) async {
    cachedMap[cacheStoreDetailsKey] = CachedItem(data: response);
  }

  @override
  void clearCache() {
    cachedMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cachedMap.remove(key);
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem({
    required this.data,
  });
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeMillisecond) {
    int currentTimeInMilliSecond = DateTime.now().millisecondsSinceEpoch;

    bool isValid =
        currentTimeInMilliSecond - cacheTime <= expirationTimeMillisecond;
    return isValid;
  }
}
