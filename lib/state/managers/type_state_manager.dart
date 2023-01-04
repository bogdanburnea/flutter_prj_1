import 'package:flutter_prj_1/state/notifiers/type_state_notifier.dart';

class TypeStateManager {
  final typeStateNotifier = TypeStateNotifier();

  List<String> getTypeList() {
    return typeStateNotifier.value;
  }

  void setTypeList(List<String> typeList) {
    typeStateNotifier.setTypeList(typeList);
  }

  void deleteTypeFromTypeList(String type) {
    // print('[TypeStateManager] deleteTypeFromTypeList.type: ${type}');
    typeStateNotifier.deleteTypeFromTypeList(type);
  }

  void addTypeToTypeList(String type) {
    // print('[TypeStateManager] addTypeToTypeList.type: ${type}');
    typeStateNotifier.addTypeToTypeList(type);
  }
}
