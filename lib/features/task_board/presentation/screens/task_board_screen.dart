import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_test/features/task_board/presentation/bloc/task_bloc.dart';
import 'package:mobile_app_test/features/task_board/presentation/widgets/user_profile_dialog.dart';
import '../widgets/profile.dart';
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

  void logout() {
    Navigator.of(context).pop();
    context.replace('/login');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Log Out'),
        backgroundColor: Colors.black,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1.0),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskFailure) {
            if (state.statusCode == 401 || state.statusCode == 403 || state.statusCode == 500) {
            context.replace('/login');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Session expired. Please log in again.'),
                backgroundColor: Colors.black,
              ),
            );
          }
          }
        },
        builder: (context, state) {
          return
            state is TaskLoaded ?
            Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),

                ),
                child: Column(
                  children: [
                    SizedBox(height: 54,),
                    Row(
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
                              "${state.userData.firstName} ${state.userData.lastName}",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return UserProfileDialog(
                                    user: state.userData,
                                    onLogout: logout,
                                  );
                                },
                              );
                            },
                            child: Profile(firstLetter: state.userData.firstName[0],))
                      ],
                    ),
                    SizedBox(height: 16,)
                  ],
                ),
              ),
              state.taskList.isNotEmpty
                  ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: state.taskList.length,
                      itemBuilder: (context, index) {
                        return ExpandableCard(
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
          ) :
          Center(child: CircularProgressIndicator(color: Colors.black,),);
        },
      ),
    );
  }
}
