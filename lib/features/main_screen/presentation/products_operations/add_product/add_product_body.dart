import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/core/theming/styles.dart';
import 'package:dashboard/features/main_screen/presentation/products_operations/add_product/cubit/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 30.h),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(height: 35.h),
                    Text("Add New Product",
                        style: TextStyles.cardDetailsLightMode),
                    SizedBox(height: 50.h),

                    // Title
                    TextField(
                      onChanged: (value) =>
                          context.read<AddProductCubit>().setTitle(value),
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    SizedBox(height: 20.h),

                    // Description
                    TextField(
                      onChanged: (value) =>
                          context.read<AddProductCubit>().setDescription(value),
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                    SizedBox(height: 20.h),

                    // Price
                    TextField(
                      onChanged: (value) =>
                          context.read<AddProductCubit>().setPrice(value),
                      decoration: const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.h),

                    // Stock
                    TextField(
                      onChanged: (value) =>
                          context.read<AddProductCubit>().setStock(value),
                      decoration: const InputDecoration(labelText: 'Stock'),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.h),

                    // Brand
                    TextField(
                      onChanged: (value) =>
                          context.read<AddProductCubit>().setBrand(value),
                      decoration: const InputDecoration(labelText: 'Brand'),
                    ),
                    SizedBox(height: 20.h),

                    // Category (Dropdown)
                    DropdownButtonFormField<String>(
                      dropdownColor: ColorsManager.cartDetailsLightColor,
                      decoration: const InputDecoration(),
                      value: state.category,
                      hint: Text(
                        "Select Category",
                        style: TextStyles.cardSmallLabelLightMode,
                      ),
                      onChanged: (String? newValue) {
                        context.read<AddProductCubit>().setCategory(newValue);
                      },
                      items: context
                          .watch<AddProductCubit>()
                          .categories
                          .map<DropdownMenuItem<String>>(
                        (String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(
                              category,
                              style: TextStyles.cardSmallLabelLightMode,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: 20.h),

                    // Discount Percentage
                    TextField(
                      onChanged: (value) =>
                          context.read<AddProductCubit>().setDiscount(value),
                      decoration: const InputDecoration(
                          labelText: 'Discount Percentage'),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.h),

                    // Image Picker (File Picker)
                    TextField(
                      onChanged: (value) =>
                          context.read<AddProductCubit>().setImage(value),
                      decoration:
                          const InputDecoration(labelText: 'Image Path'),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(height: 20.h),
                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        context.read<AddProductCubit>().submitProduct();
                      },
                      child: const Text('Add Product'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
