import 'package:flutter_prj_1/state/type_state_notifier.dart';

class TypeStateManager {
  final typeStateNotifier = TypeStateNotifier();

  List<String> getTypeList() {
    return typeStateNotifier.value;
  }

  void setTypeList(List<String> typeList) {
    typeStateNotifier.setTypeList(typeList);
  }
}

