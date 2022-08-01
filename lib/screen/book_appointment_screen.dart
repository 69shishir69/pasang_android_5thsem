import 'package:flutter/material.dart';
import 'package:nailroom/model/book_appointment.dart';
import 'package:nailroom/repository/appointment_repository.dart';
import 'package:nailroom/screen/bottomnav.dart';
import 'package:nailroom/utils/showmessage.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  const AppointmentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  Color blue = const Color.fromRGBO(11, 86, 222, 5);
  Color grey = Colors.grey;
  String? appointmentFor;

  final _fullnameEditingController = TextEditingController();
  final _mobileEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appointment = ModalRoute.of(context)!.settings.arguments as List;
    debugPrint(appointment.toString());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      appBar: AppBar(
        title: const Text("Appointment Details"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Date and Time",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          appointment[0] + " " + appointment[1],
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Please provide following information",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        TextFormField(
                          controller: _fullnameEditingController,
                          decoration: const InputDecoration(
                            hintText: "FullName",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            labelText: "FullName*",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            border: UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Full Name";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _mobileEditingController,
                          decoration: const InputDecoration(
                            hintText: "Mobile",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            labelText: "Mobile*",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            border: UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Mobile";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailEditingController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            labelText: "Email*",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            border: UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              BookAppointment bookAppointment = BookAppointment(
                                date: appointment[0],
                                time: appointment[1],
                                email: _emailEditingController.text,
                                fullname: _fullnameEditingController.text,
                                mobile: _mobileEditingController.text,
                              );
                              _bookAppointment(bookAppointment);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(11, 86, 222, 5),
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: const Center(
                              child: Text(
                                "Book An Appointment",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _bookAppointment(BookAppointment bookAppointment) async {
    bool isBooked =
        await AppointmentRepository().bookAppointment(bookAppointment);
    if (isBooked) {
      bool isDeleted = await AppointmentRepository()
          .deleteTime(bookAppointment.date!, bookAppointment.time!);
      debugPrint("Time Deleted: " + isDeleted.toString());
    }
    _displayMessage(isBooked);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      displaySuccessMessage(context, "Appointment Booked");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNav()),
        );
      });
    } else {
      displayErrorMessage(context, "Failed to book Appointment");
    }
  }
}
