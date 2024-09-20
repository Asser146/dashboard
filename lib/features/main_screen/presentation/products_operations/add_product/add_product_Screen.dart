import 'package:dashboard/core/widgets/my_app_bar.dart';
import 'package:dashboard/features/main_screen/presentation/products_operations/add_product/add_product_body.dart';
import 'package:dashboard/features/main_screen/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        drawer: OptionsDrawer(context: context),
        body: const SingleChildScrollView(
          child: AddProductBody(),
        ));
  }
}
