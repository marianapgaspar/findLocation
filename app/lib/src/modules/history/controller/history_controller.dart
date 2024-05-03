import 'package:app/src/modules/home/model/address.dart';
import 'package:app/src/shared/storage/local_storage.dart';
import 'package:mobx/mobx.dart';


class HistoryControllerBase with Store {
  final LocalStorage _localStorage = LocalStorage();

  @observable
  ObservableList<dynamic> historyList = ObservableList<dynamic>();

  @action
  Future<void> loadHistory() async {
    try {
      final loadedHistory = await _localStorage.loadHistory();
      if (loadedHistory != null) {
        historyList.clear();
        historyList.addAll(loadedHistory);
      }
    } catch (e) {
      // Tratar erro, como exibir uma mensagem de erro na UI
      print('Erro ao carregar o histórico: $e');
    }
  }

  @action
  Future<void> saveHistory(List<Address> history) async {
    try {
      await _localStorage.saveHistory(history);
    } catch (e) {
      // Tratar erro, como exibir uma mensagem de erro na UI
      print('Erro ao salvar o histórico: $e');
    }
  }
}
