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
