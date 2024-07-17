import 'package:todo_list/todo_list.dart' as todo_list;
import 'dart:io';

Future<void> main(List<String> arguments) async {
  List<String> tasks = [];
  bool running = true;
  while (running) {
    print("\x1B[2J\x1B[0;0H");
    todo_list.viewTasks(tasks);
    print('---------------');
    print('Options: ');
    print('1: Add task');
    print('2: Delete task');
    print('3: Save tasks to "tasks.txt" file');
    print('4: Exit program\n');

    stdout.write('Choose an option: ');

    String? option = stdin.readLineSync();
    switch (option) {
      case '1':
        todo_list.addTask(tasks);
        continue;
      case '2':
        todo_list.deleteTasks(tasks);
        continue;
      case '3':
        await todo_list.saveTasksToFile(tasks);
        continue;
      case '4':
        print("\x1B[2J\x1B[0;0H");
        running = false;
    }
  }
}
