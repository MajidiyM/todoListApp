import '../models/priorities_model/priority.dart';

abstract class PrioritiesServices {
  Future<List<Priority>> getPriorirties();
}
