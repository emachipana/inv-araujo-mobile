import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/components/button/filter.dart';
import 'package:inv_araujo_mobile/components/button/main.dart';
import 'package:inv_araujo_mobile/components/product_card/main.dart';
import 'package:inv_araujo_mobile/core/models/product.dart';
import 'package:inv_araujo_mobile/core/providers/data.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/texts.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  bool isLoading = false;
  String currentFilter = "";

  @override
  void initState() {
    super.initState();

    final data = Provider.of<DataProvider>(context, listen: false);

    setState(() => isLoading = true);
    data
        .loadProducts(context, currentFilter)
        .then((data) => {setState(() => isLoading = false)});
  }

  onClick(DataProvider data, String filter) async {
    if (currentFilter == filter) return;

    setState(() {
      currentFilter = filter;
      isLoading = true;
    });

    await data.loadProductsAtClick(context, currentFilter);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: true);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Productos", style: TextStyles.title),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Filter(
                    name: "Filtrar",
                    onClick: () => {},
                    icon: Icons.tune_rounded,
                  ),
                  Filter(
                    name: "Todo",
                    onClick: () async {
                      if (currentFilter == "") return;

                      setState(() {
                        currentFilter = "";
                        isLoading = true;
                      });

                      await data.loadProducts(context, currentFilter);
                      setState(() => isLoading = false);
                    },
                    isActive: currentFilter == "",
                  ),
                  Filter(
                    name: "Stock bajo",
                    onClick: () => onClick(data, "lowStock"),
                    isActive: currentFilter == "lowStock",
                  ),
                  Filter(
                    name: "Mayor precio a menor",
                    onClick: () => onClick(data, "orderByPriceDesc"),
                    isActive: currentFilter == "orderByPriceDesc",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                runSpacing: 20,
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Button(
                    size: 16,
                    text: "Nuevo lote", 
                    onClick: () => {},
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(color: AppColors.gray))
                : SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceAround,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: data.products.content.map((product) => ProductCard(
                        product: Product.fromJson(product),
                        withStock: currentFilter == "lowStock",
                        onClick: () => {},
                      )).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
