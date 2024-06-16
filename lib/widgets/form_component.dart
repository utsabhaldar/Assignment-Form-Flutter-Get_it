import 'package:assignment_form/manager/form_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormComponentWidget extends StatelessWidget {
  final int index;

  const FormComponentWidget(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final formManager = context.read<FormManager>();
    final component = formManager.components[index];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  formManager.removeComponent(index);
                },
                child: const Text('Remove'),
              ),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Label *'),
              onChanged: (value) {
                component.label = value;
                formManager.updateComponent(index, component);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Info-Text'),
              onChanged: (value) {
                component.infoText = value;
                formManager.updateComponent(index, component);
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: component.required,
                  onChanged: (value) {
                    component.required = value!;
                    formManager.updateComponent(index, component);
                  },
                ),
                const Text('Required'),
                Checkbox(
                  value: component.readonly,
                  onChanged: (value) {
                    component.readonly = value!;
                    formManager.updateComponent(index, component);
                  },
                ),
                const Text('Readonly'),
                Checkbox(
                  value: component.hidden,
                  onChanged: (value) {
                    component.hidden = value!;
                    formManager.updateComponent(index, component);
                  },
                ),
                const Text('Hidden Field'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
