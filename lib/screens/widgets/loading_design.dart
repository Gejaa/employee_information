import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeLoadingDesign extends StatefulWidget {
  @override
  _EmployeeLoadingDesign createState() => _EmployeeLoadingDesign();
}

class _EmployeeLoadingDesign extends State<EmployeeLoadingDesign> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: _enabled,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          Container(
                            width: 40.0,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}