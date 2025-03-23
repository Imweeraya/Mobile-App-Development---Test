import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_test/features/task_board/presentation/bloc/task_bloc.dart';
import '../widgets/task_card.dart';

class TaskBoardScreen extends StatefulWidget {
  const TaskBoardScreen({super.key});

  @override
  State<TaskBoardScreen> createState() => _TaskBoardScreenState();
}

class _TaskBoardScreenState extends State<TaskBoardScreen> {
  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(GetTaskList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Firstname Lastname",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(radius: 25, backgroundColor: Colors.grey),
                  ],
                ),
              ),
              state is TaskLoaded && state.taskList.isNotEmpty
                  ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: state.taskList.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          title: state.taskList[index].name,
                          description: state.taskList[index].description,
                          goal: state.taskList[index].goal,
                          status: state.taskList[index].status,
                        );
                      },
                    ),
                  )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
