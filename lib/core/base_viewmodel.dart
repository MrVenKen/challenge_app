import 'package:flutter/material.dart';
import 'enum.dart';

class BaseViewModel extends ChangeNotifier {
  //ViewModellerin Türediği Yer

  ViewState get viewState => _viewState;
  ViewState _viewState = ViewState.Idle;
  void setViewState(ViewState viewState) {
    _viewState = viewState;

    notifyListeners();
  }
}