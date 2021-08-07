import 'package:employee_info/model/employee_info_model.dart';
import 'package:employee_info/screens/employee_info_screen.dart';
import 'package:employee_info/screens/repo/employee_repo.dart';
import 'package:employee_info/screens/widgets/loading_design.dart';
import 'package:employee_info/screens/widgets/textfield_design.dart';
import 'package:employee_info/utils/string_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  String searchKey;
  TextEditingController searchController = TextEditingController();
  EmployeeRepo employeeRepo = EmployeeRepo();
  ScrollController scrollController = ScrollController();
  bool isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    employeeRepo.fetchInitialEmployeeData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    employeeRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          StringUtils.employeeDirectory,
          style: GoogleFonts.roboto(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFieldDesign(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                validator: (String value) {},
                onChanged: (value) {
                  if (value.toString().trim().length > 1) {
                    setState(() {
                      isSearch = true;
                    });
                    employeeRepo.searchEmployeeData(query: value.toString());
                  } else {
                    employeeRepo.fetchInitialEmployeeData();
                  }
                },
                usercontroller: searchController,
                sufficIcon: Container(
                    padding: EdgeInsets.all(12),
                    child: InkWell(
                        onTap: () {
                          if (isSearch) {
                            setState(() {
                              searchController.clear();
                              isSearch = false;
                            });
                            employeeRepo.fetchInitialEmployeeData();
                          }
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ))),
                hintText: StringUtils.searchEmployee),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: employeeRepo.feedsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<EmployeeInformation> employeeDate = snapshot.data;
                      return employeeDate.isEmpty
                          ? emptyData()
                          : ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                        height: 10,
                                      ),
                              physics: AlwaysScrollableScrollPhysics(),
                              controller: scrollController,
                              itemCount: employeeDate.length,
                              itemBuilder: (BuildContext context, int snap) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmployeeInfoScreen(
                                                  employeeInformation:
                                                      employeeDate[snap],
                                                )));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey,
                                      child: ClipRRect(
                                          borderRadius:
                                              new BorderRadius.circular(100.0),
                                          child:
                                              employeeDate[snap].profileImage ==
                                                      null
                                                  ? Container(
                                                      color: Colors.grey,
                                                      height: 50,
                                                      width: 50)
                                                  : Image.network(
                                                      employeeDate[snap]
                                                          .profileImage,
                                                      fit: BoxFit.cover,
                                                    )),
                                    ),
                                    title: Text(
                                      employeeDate[snap]?.name ?? "",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    isThreeLine: true,
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          employeeDate[snap]?.company?.name ??
                                              "",
                                          style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black),
                                        ),
                                        Text(
                                            employeeDate[snap]?.email ?? "",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.black),
                                          )
                                      ],
                                    ),
                                  ),
                                );
                              });
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return EmployeeLoadingDesign();
                    } else if (!snapshot.hasData) {
                      return emptyData();
                    } else {
                      return Container();
                    }
                  }))
        ],
      ),
    );
  }

  Widget emptyData() {
    return Center(
      child: Text(
        isSearch
            ? "${StringUtils.noDataFoundOnSearch} '${searchController.value.text.toString()}'"
            : StringUtils.noDataFoundOnApi,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}
