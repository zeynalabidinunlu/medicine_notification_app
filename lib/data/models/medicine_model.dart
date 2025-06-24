import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';



part 'medicine_model.g.dart';

@collection
class Medicine {
 // late int id;

  Id? id;

  String? name;
  String? description;

  @Enumerated(EnumType.name)
  UsageTypes? usageTypes;

  @Enumerated(EnumType.name)
  HungerSituation? hungerSituation;

  String? notificationText;

  
  List<DateTime>? reminderTimes;

  int? numberOfPills;
}
