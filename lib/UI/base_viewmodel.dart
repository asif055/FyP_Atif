import 'package:flutter/foundation.dart';
import 'package:jobportal/core/enums.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState) {
    _state = state;
    notifyListeners();
  }
}
