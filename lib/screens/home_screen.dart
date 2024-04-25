import 'package:api_projects/bloc/employee/bloc/employee_list_bloc.dart';
import 'package:api_projects/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late EmployeeListBloc _employeeListBloc; // Declare bloc instance

  @override
  void initState() {
    super.initState();
    //context.read<EmployeeListBloc>().add(const LoadEmpListEvent());

    _employeeListBloc = context.read<EmployeeListBloc>(); // Access bloc from context
    _employeeListBloc.add(const LoadEmpListEvent()); // Trigger event to load data
  }

  @override //LoadEmpListEvent
  Widget build(BuildContext context) {
    //final
    return Scaffold(
      backgroundColor: Colors.orange.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.orange.withOpacity(0.5),
        title: const Center(child: Text("Home Screen")),
      ),
      drawer: MyDrawer(),
      body: BlocConsumer<EmployeeListBloc, EmployeeListState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          //print('State..............${state}');
          if (state is PageInit || state is EmployeeLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.orange,));
          } else if (state is EmployeeLoadedState) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: state.empResponseModel.data.length,
                itemBuilder: (context,index) {
                  var EmpList = state.empResponseModel.data[index];

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [ Color(0xFF846AFF), Color(0xFF755EE8), Colors.purpleAccent,Colors.amber,],
                            ),
                            borderRadius: BorderRadius.circular(16)), // Adds a gradient background and rounded corners to the container
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  children: [
                                    Text(EmpList.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.white, fontFamily: "monospace"
                                    )), // Adds a title to the card
                                    const Spacer(),
                                    Stack(
                                      children: List.generate(
                                        2,
                                            (index) => Container(
                                          margin: EdgeInsets.only(left: (15 * index).toDouble()),
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white54),
                                        ),
                                      ),
                                    ) // Adds a stack of two circular containers to the right of the title
                                  ],
                                ),
                                Text(EmpList.emailId, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "monospace"
                                )) // Adds a subtitle to the card
                              ],
                            ),
                            Text(EmpList.designation, style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            )) // Adds a price to the bottom of the card
                          ],
                        ),
                      ),
                    )
                  );
                }
              ),
            );
          } else if (state is EmployeeErrorState) {
            return const Center(
              child: Text('Error loading data'),
            );
          } else {
            return const Center(child: Text('Unknown state'),);
          }
        },
      ),
    );
  }
}
