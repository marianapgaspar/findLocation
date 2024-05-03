import 'package:app/src/modules/home/service/home_service.dart';
import 'package:mobx/mobx.dart';
import 'package:app/src/modules/home/model/address.dart';


class HomeController with Store {
  final HomeService _homeService = HomeService();

  @observable
  Address? address;

  @action
  Future<void> getAddressFromApi(String cep) async {
    try {
      address = await _homeService.getAddressFromApi(cep);
      print(address?.cep);
      await saveAddressToLocal();
    } catch (e) {
      // Tratar erro, como exibir uma mensagem de erro na UI
      address = null;
      print('Erro ao obter o endereço da API: $e');
    }
  }

  @action
  Future<void> saveAddressToLocal() async {
    if (address != null) {
      await _homeService.saveAddressToLocal(address!);
    }
  }

  @action
  Future<void> getAddressFromLocal(String cep) async {
    try {
      address = await _homeService.getAddressFromLocal(cep);
    } catch (e) {
      // Tratar erro, como exibir uma mensagem de erro na UI
      print('Erro ao obter o endereço do armazenamento local: $e');
    }
  }
}
