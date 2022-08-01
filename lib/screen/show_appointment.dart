import 'package:flutter/material.dart';
import 'package:nailroom/repository/appointment_repository.dart';
import 'package:nailroom/response/appointment_response.dart';
import 'package:nailroom/screen/bottomnav.dart';
import 'package:nailroom/utils/showmessage.dart';

class ShowAppointment extends StatefulWidget {
  const ShowAppointment({Key? key}) : super(key: key);

  @override
  State<ShowAppointment> createState() => _ShowAppointmentState();
}

class _ShowAppointmentState extends State<ShowAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Upcoming Schedule",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 36, 58, 96),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<AppointmentResponse?>>(
                  future: AppointmentRepository().getBookedAppointment(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      debugPrint("data: " + snapshot.data.toString());

                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: ListView.separated(
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (BuildContext context, index) {
                            return const SizedBox(height: 20);
                          },
                          itemBuilder: (BuildContext context, index) {
                            return scheduleContainer(snapshot.data![index]);
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scheduleContainer(AppointmentResponse? appointmentResponse) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // color: const Color.fromARGB(255, 222, 222, 222).withOpacity(0.5),
              color: const Color.fromARGB(255, 218, 226, 255).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          // color: const Color.fromRGBO(11, 86, 222, 5),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointmentResponse!.fullname!,
                      style: const TextStyle(
                        // color: Colors.black87,
                        color: Color.fromARGB(248, 0, 71, 203),

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        deleteAppointment(appointmentResponse);
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          // backgroundColor: Colors.white,
                          backgroundColor: Colors.grey[100],
                          child: const Center(
                            child: Icon(
                              Icons.delete,
                              size: 22,
                              color: Color.fromARGB(255, 227, 51, 39),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/updateAppointmentScreen",
                            arguments: appointmentResponse);
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          // backgroundColor: Colors.white,
                          backgroundColor: Colors.grey[100],

                          child: const Center(
                            child: Icon(Icons.edit, size: 22),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: const Color.fromARGB(248, 0, 71, 203),
                color: const Color.fromRGBO(11, 86, 222, 5),

                // color: Colors.grey[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.lock_clock,
                        // color: Color.fromARGB(248, 0, 71, 203),
                        color: Colors.white,
                      ),
                      Text(
                        appointmentResponse.date! +
                            " " +
                            appointmentResponse.time!,
                        style: const TextStyle(
                          // color: Color.fromARGB(248, 0, 71, 203),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  deleteAppointment(AppointmentResponse appointmentResponse) async {
    bool isDeleted;
    bool isAdded = await AppointmentRepository().reAddAppointmentTime(
      appointmentResponse.date!,
      appointmentResponse.time!,
    );
    // debugPrint(isAdded.toString());
    if (isAdded) {
      isDeleted = await AppointmentRepository()
          .deleteAppointment(appointmentResponse.id!);
      if (isDeleted) {
        // debugPrint(isDeleted.toString());
        displaySuccessMessage(context, "Appointment deleted successfully");

        Future.delayed(
          const Duration(milliseconds: 1500),
          () {
            // Navigator.pushNamed(context, '/bottomNavBar');
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BottomNav()),
            );
          },
        );
      }
    }
  }
}
