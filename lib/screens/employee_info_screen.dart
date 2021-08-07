import 'package:employee_info/model/employee_info_model.dart';
import 'package:employee_info/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeInfoScreen extends StatefulWidget {
  EmployeeInformation employeeInformation;

  EmployeeInfoScreen({this.employeeInformation});

  @override
  _EmployeeInfoScreenState createState() => _EmployeeInfoScreenState();
}

class _EmployeeInfoScreenState extends State<EmployeeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(100.0),
                  child: widget.employeeInformation.profileImage == null
                      ? Container(color: Colors.grey)
                      : Image.network(
                          widget.employeeInformation.profileImage,
                          fit: BoxFit.cover,
                        )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringUtils.name + " : " + widget.employeeInformation?.name ??
                    "",
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringUtils.userName +
                        " : " +
                        widget.employeeInformation?.username ??
                    "",
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringUtils.email + " : " + widget.employeeInformation?.email ??
                    "",
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringUtils.address +
                    " : " +
                    (widget.employeeInformation?.address != null
                        ? (widget.employeeInformation?.address?.city ?? "") +
                            " , " +
                            (widget.employeeInformation?.address?.street ??
                                "") +
                            " , " +
                            (widget.employeeInformation?.address?.suite ?? "") +
                            " , " +
                            (widget.employeeInformation?.address?.zipcode ?? "")
                        : ""),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringUtils.phone +
                    " : " +
                    (widget.employeeInformation?.phone == null
                        ? "Not Given"
                        : widget.employeeInformation?.phone ?? ""),
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringUtils.website +
                        " : " +
                        widget.employeeInformation?.website ??
                    "",
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringUtils.companyDetails +
                    " : " +
                    (widget.employeeInformation?.company != null
                        ? (widget.employeeInformation?.company?.name ?? "") +
                            " , " +
                            (widget.employeeInformation?.company?.bs ?? "") +
                            " , " +
                            (widget.employeeInformation?.company?.catchPhrase ??
                                "")
                        : ""),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
