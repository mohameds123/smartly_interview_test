import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Store/presentation/components/get_all_products_components.dart';
import 'package:movies/Store/presentation/controllers/products_bloc.dart';
import 'package:movies/Store/presentation/controllers/products_events.dart';
import 'package:movies/core/service/service_locator.dart';
import 'package:movies/core/utils/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>sl<StoreBloc>()..add(GetAllProductsEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('homeScrollView'),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(AppString.home,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              AllProductsComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
