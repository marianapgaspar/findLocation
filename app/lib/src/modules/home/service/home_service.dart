import 'package:app/src/modules/home/model/address.dart';
import 'package:app/src/modules/home/repositories/api_repository.dart';
import 'package:app/src/modules/home/repositories/local_storage_repository.dart';

class HomeService {
  final ApiRepository _apiRepository = ApiRepository();
  final LocalStorageRepository _localStorageRepository = LocalStorageRepository();

  Future<Address> getAddressFromApi(String cep) async {
    return await _apiRepository.getAddress(cep);
  }

  Future<void> saveAddressToLocal(Address address) async {
    await _localStorageRepository.saveAddress(address);
  }

  Future<Address?> getAddressFromLocal(String cep) async {
    return await _localStorageRepository.getAddress(cep);
  }
}
