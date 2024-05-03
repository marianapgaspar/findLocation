import 'package:app/src/modules/home/model/address.dart';
import 'package:flutter/material.dart';

class LastAddressComponent extends StatelessWidget {
  final Address lastAddress;

  const LastAddressComponent({Key? key, required this.lastAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(lastAddress.logradouro),
      subtitle: Text('${lastAddress.localidade}, ${lastAddress.uf} - ${lastAddress.cep}'),
    );
  }
}
