import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String label;
  final Function()? action;

  const CustomButtom({
    Key? key,
    required this.label,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: action,
        child: Text(label),
      ),
    );
  }
}