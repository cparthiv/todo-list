import 'dart:io';

List<String> addTask(List<String> initialTasks) {
  print('Enter a task to add to the list: ');
  String? inputtedTask = stdin.readLineSync();
  if (inputtedTask != null && inputtedTask.isNotEmpty) {
    initialTasks.add(inputtedTask);
  } else {
    print('Nothing has been inputted, returning.');
  }
  return initialTasks;
}

void viewTasks(List<String> tasks) {
  List<int> taskIndexes = List.generate(tasks.length, (int index) => index + 1);
  print('Tasks: ');
  for (final taskIndex in taskIndexes) {
    print('$taskIndex: ${tasks[taskIndex - 1]}');
  }
  print('\n');
}

void deleteTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to delete');
    return;
  }
  print('Enter the task number to delete: ');
  String? lineNumber = stdin.readLineSync();
  int? taskNumber = int.tryParse(lineNumber ?? '');
  if (taskNumber != null && taskNumber > 0 && taskNumber <= tasks.length) {
    tasks.removeAt(taskNumber - 1);
    print('Task $lineNumber removed successfully!');
    return;
  } else {
    print('Invalid input!');
    return;
  }
}

Future<void> saveTasksToFile(List<String> tasks) async {
  final file = File('tasks.txt');
  final sink = file.openWrite();
  List<int> taskIndices = List.generate(tasks.length, (i) => i);
  for (final int index in taskIndices) {
    String friendlyIndex = (index + 1).toString();
    String task = tasks[index];
    sink.writeln('$friendlyIndex: $task');
  }
  await sink.flush();
  await sink.close();
}
