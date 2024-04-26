import 'package:api_projects/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../bloc/profile/bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _employeeProfileBloc; // Declare bloc instance

  @override
  void initState() {
    _employeeProfileBloc = context.read<ProfileBloc>();
    _employeeProfileBloc.add(const LoadEmpProfileEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: MyDrawer(),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
            if (state is ProfileLoadingState) {
            //return const Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.orange,));
            return Center(child: SizedBox(
              height: 150,
                child: Lottie.asset('assets/loading.json')));
            } else if (state is ProfileLoadedState) {

              print('state is.........');
              print(state);

              final profileData = state.profileResponseModel.data?[0];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // height: 170,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: SizedBox(height:100,
                      //       //child: Lottie.asset('assets/Animation - 1714039509229.json')),
                      //       child: Lottie.asset('assets/Animation - 1714040593694.json')),
                      // ),
                      Row(
                        children: [
                          Text(profileData!.name.toString(),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white, fontFamily: "poppins",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                          )), // Adds a title to the card
                          const Spacer(),
                          SizedBox(height:100,child: Lottie.asset('assets/Animation - 1714040593694.json')),
                          // Stack(
                          //   children: List.generate(
                          //     2,
                          //         (index) => Container(
                          //       margin: EdgeInsets.only(left: (15 * index).toDouble()),
                          //       height: 30,
                          //       width: 30,
                          //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white54),
                          //     ),
                          //   ),
                          // ) // Adds a stack of two circular containers to the right of the title
                        ],
                      ),
                      Center(
                        child: Text(profileData!.emailId.toString(),
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white, fontFamily: "poppins", fontSize: 20
                        )),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Designation",
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),const SizedBox(width: 30,),
                          Expanded(
                            flex: 1,
                            child: Text(profileData!.designation.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Employee id",
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),const SizedBox(width: 30,),
                          Expanded(
                            flex: 1,
                            child: Text(profileData!.userid.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Joining Date",
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),const SizedBox(width: 30,),
                          Expanded(
                            flex: 1,
                            child: Text(profileData!.joiningDate.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Appraisal Name",
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),const SizedBox(width: 30,),
                          Expanded(
                            flex: 1,
                            child: Text(profileData!.appraisarName.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Next Appraisal Date",
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),const SizedBox(width: 30,),
                          Expanded(
                            flex: 1,
                            child: Text(profileData!.nextAppraisalDate.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Pan Number",
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),const SizedBox(width: 30,),
                          Expanded(
                            flex: 1,
                            child: Text(profileData!.panNo.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Address",
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),const SizedBox(width: 30,),
                          Expanded(
                            flex: 1,
                            child: Text(profileData!.cAddress.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white, fontFamily: "poppins",fontWeight: FontWeight.w500
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }else if (state is ProfileErrorState) {
              return const Center(
                child: Text('Error loading data'),
              );
            }else{
              return const Center(child: Text('Something went wrong'),);
            }
        },
      ),
    );
  }
}
