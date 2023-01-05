import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Store/presentation/controllers/products_bloc.dart';
import 'package:movies/Store/presentation/controllers/products_state.dart';
import 'package:movies/Store/presentation/screens/product_detail_screen.dart';
import 'package:movies/core/utils/enums.dart';

class AllProductsComponent extends StatelessWidget {
  const AllProductsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, ProductsState>(
      //buildWhen: ((previous, current) => previous.nowPlayingState != current.nowPlayingState),
      builder: (context, state) {
        switch (state.allProductsState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height:2000.0,
                child: ListView.builder(

                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.allProducts.length,
                  itemBuilder: (context, index) {
                    final product = state.allProducts[index];
                    return Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetailScreen(id:index)));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(product.image,
                            width: 200,
                              height: 200,
                            ),
                            SizedBox(height: 10,),
                            Text(product.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),

                            ),
                            SizedBox(height: 10,),
                            Text('Price - ${product.price} LE',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestStates.error:
            return Container(
              child: Center(child: Text(state.message)),
            );
        }
      },
    );
  }
}
