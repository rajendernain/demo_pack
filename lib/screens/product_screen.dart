import 'package:api_projects/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/drawer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvevt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Product Screen")),
      ),
      drawer: MyDrawer(),
      body: BlocConsumer<ProductsBloc, ProductsState>(
             listener: (context, state){
                if(state is ProductsLoadedState){
                  //Display toast message on screen
                  Fluttertoast.showToast(
                      msg: "Data Loaded",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  //Display snack-bar on data loaded
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data Loaded")),
                  );
                }else if(state is ProductsErrorState){
                  //Display toast message on screen
                  Fluttertoast.showToast(
                      msg: "Data Not Loaded",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  //Display snack-bar on data loaded
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data Not Loaded")),
                  );
                }
             },
        builder: (context, state) {
              if(state is ProductsLoadingState){
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }else if(state is ProductsLoadedState){
                return ListView.builder(
                    itemCount: state.productsModel.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.lightGreenAccent,
                        child: ListTile(
                            leading: Text(state.productsModel[index].category.toString()),
                        ),
                      );
                    }
                );
              } else if(state is ProductsErrorState){
                return Center(
                  child: Text(state.errorMessage),
                );
              }else{
                return const SizedBox();
              }
        },
      ),
      // body: BlocListener<ProductsBloc, ProductsState>(
      //    listener: (context, state){
      //       if(state is ProductsLoadedState){
      //
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           const SnackBar(content: Text("Data Loaded")),
      //         );
      //       }else if(state is ProductsErrorState){
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           const SnackBar(content: Text("Data Not Loaded")),
      //         );
      //       }
      //    },
      //    child: const Center(
      //       child: Text("Bloc Listener"),
      //     ),
      // ),
      // body: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {
      //     if(state is ProductsLoadingState){
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     }else if(state is ProductsLoadedState){
      //       return ListView.builder(
      //           itemCount: state.productsModel.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               color: Colors.lightGreenAccent,
      //               child: ListTile(
      //                   leading: Text(state.productsModel[index].category.toString()),
      //               ),
      //             );
      //           }
      //       );
      //     } else if(state is ProductsErrorState){
      //       return Center(
      //         child: Text(state.errorMessage),
      //       );
      //     }else{
      //       return const SizedBox();
      //     }
      //   },
      // ),
    );
  }
}
