import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final model = TaskBoard(
    Uuid.v4(),
    'Titulo da lista 1',
  );

  test('Calculate progress', () {
    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), '', completed: true),
    ];
    final progress = TaskCard(board: model).getProgress(tasks);
    expect(progress, 0.5);
  });
}
