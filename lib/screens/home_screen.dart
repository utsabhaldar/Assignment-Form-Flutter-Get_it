import 'package:assignment_form/manager/form_manager.dart';
import 'package:assignment_form/widgets/form_component.dart';
import 'package:assignment_form/widgets/form_data_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Form'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final formManager = context.read<FormManager>();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Form Data'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: formManager.components
                        .asMap()
                        .entries
                        .map((entry) => FormDataCard(entry.key, entry.value))
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<FormManager>(
                builder: (context, formManager, child) {
                  return ListView.builder(
                    itemCount: formManager.components.length,
                    itemBuilder: (context, index) {
                      return FormComponentWidget(index);
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<FormManager>().addComponent();
              },
              child: const Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}
