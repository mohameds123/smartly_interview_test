import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Movies/presentation/controllers/products_state.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc,ProductsState>(
      listener:(context,state){},
      builder: (context,state)=>ConditionalBuilder(
        condition: ProductBloc.get(context).shopCategoriesModel!=null,
        builder:ListView.separated(
          itemBuilder: (context,index)=>FavoriteItem(
            Product: ProductBloc.get(context).ProductModel?.data!.data![index],
          ),
          separatorBuilder:(context,index)=>Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: ProductBloc.get(context).shopFavoriteModel!.data!.data!.length,
        ),
        fallback: Center(child: CircularProgressIndicator()),
      ),

    );
  }
}
class CartItem extends StatelessWidget {
  CartItem? Product;
  CartItem({
    this.Product,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Image(
              image: NetworkImage(Product!.products.image),
              height: 120.0,
              width: 120.0,
              fit:BoxFit.cover,
            ),
            SizedBox(
              width:20.0 ,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Product!.products.title,
                    style:Theme.of(context).textTheme.subtitle1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Product!.products.price,
                        style:Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: (){
                          ProductBloc.get(context).changeFavoriteData(Product!.products.id);
                        },
                        icon:Icon(Icons.shopping_cart_checkout_sharp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}