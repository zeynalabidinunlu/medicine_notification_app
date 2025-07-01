
import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/examination/examination_model.dart';
import 'package:medicine_notification_app/repository/examination/examination_repository.dart';

class ExaminationViewModel extends ChangeNotifier{
  final IExaminationRepository _examinationRepository;

  ExaminationViewModel(this._examinationRepository);

  Future<List<Examination>> getAllExaminations() async {
    return await _examinationRepository.getAllExaminations();
  
  }
  Future<void> saveExamination(Examination examination) async {
    await _examinationRepository.saveExamination(examination);
    notifyListeners();
  }
  Future<void> updateExamination(int id, Examination examination) async {
    await _examinationRepository.updateExamination(id, examination);
    notifyListeners();
  }

  Future<void> deleteExamination(int id) async {
    await _examinationRepository.deleteExamination(id);
    notifyListeners();
  }
  
}