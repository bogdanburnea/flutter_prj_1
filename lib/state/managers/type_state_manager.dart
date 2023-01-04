import 'package:flutter_prj_1/state/notifiers/type_state_notifier.dart';

class TypeStateManager {
  final typeStateNotifier = TypeStateNotifier();

  List<String> getTypeList() {
    return typeStateNotifier.value;
  }

  void setTypeList(List<String> typeList) {
    typeStateNotifier.setTypeList(typeList);
  }

  void deleteType(String type) {
    typeStateNotifier.deleteType(type);
  }

  void addType(String type) {
    typeStateNotifier.addType(type);
  }
}
