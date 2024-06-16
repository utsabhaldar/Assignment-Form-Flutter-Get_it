import 'package:flutter/material.dart';

class FormManager extends ChangeNotifier {
  List<FormComponent> components = [FormComponent()];

  void addComponent() {
    components.add(FormComponent());
    notifyListeners();
  }

  void removeComponent(int index) {
    if (components.length > 1) {
      components.removeAt(index);
      notifyListeners();
    }
  }

  void updateComponent(int index, FormComponent component) {
    components[index] = component;
    notifyListeners();
  }
}

class FormComponent {
  String label;
  String infoText;
  bool required;
  bool readonly;
  bool hidden;

  FormComponent({
    this.label = '',
    this.infoText = '',
    this.required = false,
    this.readonly = false,
    this.hidden = false,
  });
}
