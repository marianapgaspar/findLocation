import 'package:app/src/modules/history/controller/history_controller.dart';
import 'package:app/src/shared/colors/app_colors.dart';
import 'package:app/src/shared/metrics/app_metrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HistoryPage extends StatelessWidget {
  final HistoryControllerBase controller = HistoryControllerBase();

  @override
  Widget build(BuildContext context) {
    // Carregar automaticamente os dados históricos ao acessar a página
    controller.loadHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppMetrics.mediumSpacing),
        child: Observer(
          builder: (_) {
            if (controller.historyList.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.historyList.length,
                itemBuilder: (context, index) {
                  final item = controller.historyList[index];
                  final lines = item.toString().split(',');
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: AppMetrics.smallSpacing),
                    padding: EdgeInsets.all(AppMetrics.smallSpacing),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(AppMetrics.smallSpacing),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: lines.map((line) {
                        final cleanLine = line.replaceAll(RegExp(r"[\([{})\]]"), ''); // Remover os colchetes
                        return Text(
                          cleanLine.trim(),
                          style: TextStyle(fontSize: AppMetrics.mediumSpacing),
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Nenhum histórico encontrado.'),
              );
            }
          },
        ),
      ),
    );
  }
}
