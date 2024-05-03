import 'package:flutter/material.dart';

class EmptySearchComponent extends StatelessWidget {
  const EmptySearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Nenhum endereço encontrado.'),
    );
  }
}
