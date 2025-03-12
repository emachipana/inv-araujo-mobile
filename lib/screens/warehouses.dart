import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/components/card/warehouse.dart';
import 'package:inv_araujo_mobile/core/providers/data.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/texts.dart';
import 'package:provider/provider.dart';

class WarehousesScreen extends StatefulWidget {
  const WarehousesScreen({super.key});

  @override
  State<WarehousesScreen> createState() => WarehousesScreenState();
}

class WarehousesScreenState extends State<WarehousesScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    final data = Provider.of<DataProvider>(context, listen: false);

    setState(() => isLoading = true);
    data
        .loadWarehouses(context)
        .then((data) => {setState(() => isLoading = false)});
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
            Text("Elegir manualmente", style: TextStyles.title),
            SizedBox(height: 15),
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
                      children: data.warehouses
                          .map((warehouse) => WarehouseCard(
                                address:
                                    "${warehouse.department}, ${warehouse.province}, ${warehouse.district}",
                                name: warehouse.name,
                                products: warehouse.products,
                                isActive:
                                    data.currentWarehouse?.id == warehouse.id,
                                onClick: () {
                                  if (data.currentWarehouse?.id == warehouse.id) return;

                                  setState(() => data.currentWarehouse = warehouse);
                                },
                              ))
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
