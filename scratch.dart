
import 'dart:io';

void main(){
  performTasks();
}

void performTasks() async {
  task1();
  String task2Data = await task2();
  task3(task2Data);
}

void task1(){
  String result = 'task 1 data';
  print('Task 1 completed');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String? result;
  await Future.delayed(threeSeconds, (){
    result = 'task 2 data';
    print('Task 2 completed');
  });
  return result!;
}

void task3(String task2Data){
  String result = 'task 3 data';
  print('Task 3 completed $task2Data');
}