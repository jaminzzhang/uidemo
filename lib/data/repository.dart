import 'demo_data.dart';
import 'local_data_provider.dart';
import 'remote_data_provider.dart';

class  Repository {
  final LocalDataProvider localDataProvider;
  final RemoteDataProvider remoteDataProvider;

  Repository()
      : localDataProvider = LocalDataProvider(),
        remoteDataProvider = RemoteDataProvider();

  Future<DemoData> loadLocalData() async {
    return this.localDataProvider.loadData();
  }

  Future<DemoData> loadRemoteData() async {
    var homeData = await this.remoteDataProvider.loadData();
    this.localDataProvider.saveData(homeData);
    return homeData;
  }



}