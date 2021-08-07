import 'dart:async';

import 'package:employee_info/model/employee_info_model.dart';
import 'package:employee_info/services/api_fetch.dart';

class EmployeeRepo {
  ApiFetch _apiFetch = ApiFetch();
  List<EmployeeInformation> documentList = List.empty(growable: true);
  StreamController<List<EmployeeInformation>> feedsController =
      StreamController<List<EmployeeInformation>>();

  Stream<List<EmployeeInformation>> get feedsStream => feedsController.stream;

  fetchInitialEmployeeData() async {
    List<EmployeeInformation> _myList;
    await _apiFetch.getEmployeeFeeds().then((value) {
      _myList = value;
    });
    documentList = _myList;

    //print('documennn ${documentList.length}');
    feedsController.sink.add(documentList);
  }

  searchEmployeeData({String query}) async {
    List<EmployeeInformation> _myList;
    await _apiFetch.getEmployeeFeeds().then((value) {
      _myList = value;
    });
    documentList = _myList
        .where((element) =>
    element.name
        .toLowerCase()
        .trim()
        .contains(query.toLowerCase().trim()) ||
        element.email
            .toLowerCase()
            .trim()
            .contains(query.toLowerCase().trim()))
        .toList();

    //print('documennn ${documentList.length}');
    feedsController.sink.add(documentList);
  }

  Future scrollEmployeeData() async {
    List<EmployeeInformation> _myList;

    await _apiFetch.getEmployeeFeeds().then((value) {
      _myList = value;
    });
    List<EmployeeInformation> document = [];
    document = _myList;
    documentList = documentList..addAll(document);
    //print('Documentlist ${documentList.length}');
    feedsController.sink.add(documentList);
  }

  dispose() {
    feedsController.close();
  }
}
