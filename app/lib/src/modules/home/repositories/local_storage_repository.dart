import 'package:app/src/modules/home/model/address.dart';
import 'package:app/src/shared/storage/local_storage.dart';

class LocalStorageRepository {
  final LocalStorage _localStorage = LocalStorage();

  Future<void> saveAddress(Address address) async {
    await _localStorage.saveHistory([address]);
  }

  Future<Address?> getAddress(String cep) async {
    final List<dynamic>? addresses = await _localStorage.loadHistory();
    if (addresses != null) {
      return addresses.firstWhere((address) => address.cep == cep);
    }
    return null;
  }
}