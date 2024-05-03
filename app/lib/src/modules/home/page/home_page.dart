import 'package:app/src/shared/components/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:app/src/modules/home/components/address_list_component.dart';
import 'package:app/src/modules/home/components/empty_search_component.dart';
import 'package:app/src/modules/home/components/last_address_component.dart';
import 'package:app/src/modules/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();
  final TextEditingController _cepController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Endereços'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _cepController,
              decoration: InputDecoration(
                labelText: 'CEP',
                hintText: 'Digite o CEP',
              ),
            ),
            SizedBox(height: 16),
            CustomButtom(
              label: 'Nova Consulta',
              action: _isLoading ? null : () async {
                setState(() {
                  _isLoading = true;
                });
                final enteredCep = _cepController.text;
                await controller.getAddressFromApi(enteredCep);
                setState(() {
                  _isLoading = false;
                });
              },
            ),
            SizedBox(height: 16),
            _buildAddressComponent(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/history');
        },
        child: Icon(Icons.history),
      ),
    );
  }

  Widget _buildAddressComponent() {
    if (_isLoading) {
      return CircularProgressIndicator();
    } else if (controller.address != null) {
      return LastAddressComponent(lastAddress: controller.address!);
    } else {
      return EmptySearchComponent();
    }
  }
}
