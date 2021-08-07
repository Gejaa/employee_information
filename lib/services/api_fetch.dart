import 'package:employee_info/model/employee_info_model.dart';
import 'package:employee_info/utils/string_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiFetch {
  Future<List<EmployeeInformation>> getEmployeeFeeds() async {
    return await http.get(
      Uri.parse(StringUtils.endPointUrl + StringUtils.urlId),
      headers: {"Content-Type": "application/json"},
    ).then((http.Response response) {
//            print(response.body);
      if (response.statusCode == 200) {
        var resReturnCode =
            employeeInformationModelFromJson((response.body));
        if (resReturnCode != null) {
          return employeeInformationModelFromJson((response.body));
        } else {
          throw Exception('Failed to fetch');
        }
      } else {
        throw Exception('Failed to fetch');
      }
    });
  }
}
