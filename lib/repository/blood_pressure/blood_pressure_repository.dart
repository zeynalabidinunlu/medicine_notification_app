import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/blood_pressure/blood_pressure_model.dart';
import 'package:medicine_notification_app/init/database/database_manager.dart';

abstract class IBloodRepository {
  Future<List<BloodPressure>> getAllBloodPressures();
  Future<BloodPressure?> getBloodPressureById(int id);
  Future<void> addBloodPressure(BloodPressure bloodPressure);
  Future<void> updateBloodPressure(BloodPressure bloodPressure);
  Future<void> deleteBloodPressure(int id);
}

class BloodPressureRepository implements IBloodRepository {
  final Future<Isar> _isar = DatabaseManager().db;

  @override
  Future<void> addBloodPressure(BloodPressure bloodPressure) async {
    try {
      debugPrint('Adding blood pressure: $bloodPressure');
      final isar = await _isar;
      debugPrint('Isar instance obtained: $isar');
      
      await isar.writeTxn(() async {
        final result = await isar.bloodPressures.put(bloodPressure);
        debugPrint('Blood pressure added with ID: $result');
      });
      
      debugPrint('Blood pressure successfully added to database');
    } catch (e) {
      debugPrint('Error adding blood pressure: $e');
      rethrow; // Hatayı yeniden fırlat ki ViewModel yakalasın
    }
  }

  @override
  Future<void> deleteBloodPressure(int id) async {
    try {
      final isar = await _isar;
      await isar.writeTxn(() async {
        final success = await isar.bloodPressures.delete(id);
        debugPrint('Delete operation result: $success');
      });
    } catch (e) {
      debugPrint('Error deleting blood pressure: $e');
      rethrow;
    }
  }

  @override
  Future<List<BloodPressure>> getAllBloodPressures() async {
    try {
      debugPrint('Fetching all blood pressures');
      final isar = await _isar;
      debugPrint('Isar instance: $isar');
      
      final results = await isar.bloodPressures.where().findAll();
      debugPrint('Found ${results.length} blood pressure records');
      
      return results;
    } catch (e) {
      debugPrint('Error fetching blood pressures: $e');
      rethrow;
    }
  }

  @override
  Future<BloodPressure?> getBloodPressureById(int id) async {
    try {
      final isar = await _isar;
      final bloodPressure = await isar.bloodPressures.get(id);
      debugPrint('Retrieved blood pressure by ID $id: $bloodPressure');
      return bloodPressure;
    } catch (e) {
      debugPrint('Error getting blood pressure by ID: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateBloodPressure(BloodPressure bloodPressure) async {
    try {
      debugPrint('Updating blood pressure: $bloodPressure');
      final isar = await _isar;
      
      await isar.writeTxn(() async {
        final existingBloodPressure = isar.bloodPressures.getSync(bloodPressure.id!);
        if (existingBloodPressure != null) {
          existingBloodPressure.systolic = bloodPressure.systolic;
          existingBloodPressure.diastolic = bloodPressure.diastolic;
          existingBloodPressure.pulse = bloodPressure.pulse;
          existingBloodPressure.measurementDate = bloodPressure.measurementDate;
          isar.bloodPressures.putSync(existingBloodPressure);
          debugPrint('Blood pressure updated successfully');
        } else {
          debugPrint('Blood pressure with ID ${bloodPressure.id} not found');
          throw Exception('Blood pressure with ID ${bloodPressure.id} not found');
        }
      });
    } catch (e) {
      debugPrint('Error updating blood pressure: $e');
      rethrow;
    }
  }
}