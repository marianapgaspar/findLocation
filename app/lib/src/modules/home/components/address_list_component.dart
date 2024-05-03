import 'package:app/src/modules/home/model/address.dart';
import 'package:flutter/material.dart';

class AddressListComponent extends StatelessWidget {
  final List<Address> addresses;

  const AddressListComponent({Key? key, required this.addresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(addresses[index].logradouro),
          subtitle: Text('${addresses[index].localidade}, ${addresses[index].uf} - ${addresses[index].cep}'),
        );
      },
    );
  }
}
