import 'package:assignment_form/manager/form_manager.dart';
import 'package:flutter/material.dart';

class FormDataCard extends StatelessWidget {
  final int index;
  final FormComponent component;

  const FormDataCard(this.index, this.component, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Component ${index + 1}:'),
            Text('Label: ${component.label}'),
            Text('Info-Text: ${component.infoText}'),
            Text('Settings: '
                '${component.required ? 'Required ' : ''}'
                '${component.readonly ? 'Readonly ' : ''}'
                '${component.hidden ? 'Hidden Field' : ''}'),
          ],
        ),
      ),
    );
  }
}
