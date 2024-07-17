import 'package:todo_list/todo_list.dart' as todo_list;
import 'dart:io';

void main(List<String> arguments) {
  List<String> tasks = [];
  while (true) {
    print("\x1B[2J\x1B[0;0H");
    todo_list.viewTasks(tasks);
    print('---------------');
    print('Options: ');
    print('1: Add task');
    print('2: Delete task');
    print('3: Save tasks to file');
    print('4: Exit program');

    String? option = stdin.readLineSync();
    switch (option) {
      case '1':
        todo_list.addTask(tasks);
        continue;
      case '2':
        todo_list.deleteTasks(tasks);
        continue;
      case '3':
        todo_list.saveTasksToFile(tasks);
        continue;
      case '4':
        break;
    }
  }
}
