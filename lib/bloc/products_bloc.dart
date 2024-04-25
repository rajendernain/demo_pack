import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../models/products_model.dart';
import '../repo/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvevt, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvevt>((event, emit) async{
      try{
        emit(ProductsLoadingState());
        var data = await productsRepo.getProducts();
          emit(ProductsLoadedState(data));
      }catch(e){
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
