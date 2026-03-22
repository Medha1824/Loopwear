import 'package:get_storage/get_storage.dart';

class TLocalStorage {

  late final GetStorage storage;
  static TLocalStorage? _instance;

  TLocalStorage.internal();
  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage.internal();
    return _instance!;
  }
  Future<void> init(String bucketName) async{
    await GetStorage.init(bucketName);
    _instance=TLocalStorage.internal();
    _instance!.storage=GetStorage(bucketName);
  }

  Future<void> saveData<T>(String key,T value) async{
    await storage.write(key,value);
  }
  T? readData<T>(String key){
    return storage.read<T>(key);
  }
  Future<void> removeData<T>(String key) async{
    await storage.remove(key);
  }
  Future<void> clearAll() async{
    await storage.erase();
}
}