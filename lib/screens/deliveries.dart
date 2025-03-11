import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/components/button/filter.dart';
import 'package:inv_araujo_mobile/components/card/order.dart';
import 'package:inv_araujo_mobile/core/providers/data.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/texts.dart';
import 'package:provider/provider.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => DeliveriesScreenState();
}

class DeliveriesScreenState extends State<DeliveriesScreen> {
  bool isLoading = false;
  Map<String, bool> activeMainCategories = {
    "invitro": false,
    "products": true,
  };

  Map<String, bool> activeSecCategories = {
    "today": true,
    "tomorrow": false,
  };

  @override
  void initState() {
    super.initState();

    final data = Provider.of<DataProvider>(context, listen: false);

    setState(() => isLoading = true);
    data
        .loadDeliveries(context, activeMainCategories)
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
            Text("Entregas", style: TextStyles.title),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                runSpacing: 20,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Filter(
                    name: "Filtrar",
                    onClick: () => {},
                    icon: Icons.tune_rounded,
                  ),
                  Filter(
                    name: "Productos",
                    onClick: () async {
                      if (activeMainCategories["products"] ?? false) return;

                      setState(() {
                        activeMainCategories = {
                          "invitro": false,
                          "products": true,
                        };

                        isLoading = true;
                      });
                      await data.loadDeliveriesAtClick(
                          context, activeMainCategories);
                      setState(() => isLoading = false);
                    },
                    isActive: activeMainCategories["products"] ?? false,
                  ),
                  Filter(
                    name: "Invitro",
                    onClick: () async {
                      if (activeMainCategories["invitro"] ?? false) return;

                      setState(() {
                        activeMainCategories = {
                          "invitro": true,
                          "products": false,
                        };

                        isLoading = true;
                      });
                      await data.loadDeliveriesAtClick(
                          context, activeMainCategories);
                      setState(() => isLoading = false);
                    },
                    isActive: activeMainCategories["invitro"] ?? false,
                  ),
                  Filter(
                    name: "Hoy",
                    onClick: () => {},
                    isActive: activeSecCategories["today"] ?? false,
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
                      children: data.deliveries.content
                          .map((order) => OrderCard(
                                clientName: order["client"]["rsocial"],
                                documentType: order["client"]["documentType"],
                                document: order["client"]["document"],
                                date: (activeMainCategories["invitro"] ?? false)
                                    ? (order["finishDate"] != null
                                        ? DateTime.parse(order["finishDate"])
                                        : null)
                                    : (order["maxShipDate"] != null
                                        ? DateTime.parse(order["maxShipDate"])
                                        : null),
                                type: (activeMainCategories["invitro"] ?? false)
                                    ? "INVITRO"
                                    : "PRODUCTOS",
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
