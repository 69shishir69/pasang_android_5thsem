import 'package:nailroom/api/appointment_api.dart';
import 'package:nailroom/model/book_appointment.dart';
import 'package:nailroom/model/date_time.dart';
import 'package:nailroom/response/appointment_response.dart';

class AppointmentRepository {
  Future<List<DateAndTime?>> loadAppointmentHDT() async {
    return await AppointmentApi().loadAppointmentHDT();
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    return await AppointmentApi().bookAppointment(appointment);
  }

  Future<bool> deleteTime(String date, String time) async {
    return await AppointmentApi().deleteTime(date, time);
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    return await AppointmentApi().getBookedAppointment();
  }

  Future<bool> reAddAppointmentTime(String date, String time) async {
    return await AppointmentApi().reAddAppointmentTime(date, time);
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    return await AppointmentApi().deleteAppointment(appointmentId);
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    return await AppointmentApi().updateAppointment(appointmentResponse);
  }
}
