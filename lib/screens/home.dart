import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/components/card/color.dart';
import 'package:inv_araujo_mobile/components/product_card/mini.dart';
import 'package:inv_araujo_mobile/core/helpers/main.dart';
import 'package:inv_araujo_mobile/core/providers/data.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/shadows.dart';
import 'package:inv_araujo_mobile/core/styles/texts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    final data = Provider.of<DataProvider>(context, listen: false);

    if (!(data.controller["home"] ?? false)) {
      setState(() => isLoading = true);
      data.loadOnHome(context).then((_) {
        setState(() => isLoading = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);

    return isLoading
        ? Center(child: CircularProgressIndicator(color: AppColors.gray))
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Inicio", style: TextStyles.title),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardColor(
                        backgroundColor: AppColors.blue,
                        title: "Entregas hoy",
                        subtitle: "${data.totalDeliver}",
                      ),
                      SizedBox(width: 30),
                      CardColor(
                        backgroundColor: AppColors.persian,
                        title: data.currentWarehouse == null ? "Activa la ubicación" : "Almacén actual",
                        subtitle: data.currentWarehouse == null ? "" : data.currentWarehouse?.name ?? "",
                        icon: data.currentWarehouse == null ? Icons.location_off_rounded : Icons.location_on_rounded,
                        onClick: () => context.go("/warehouses"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [Shadows.shadow(90)],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pedidos",
                                  style: TextStyle(
                                    color: AppColors.persian,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  "Resumen 5 más recientes",
                                  style: TextStyle(
                                    color: AppColors.dim,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () => context.go("/deliveries"),
                              child: Row(
                                children: [
                                  Text(
                                    "Ver todo",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.dim,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(
                                    Icons.play_circle,
                                    color: AppColors.dim,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              width: 1,
                              color: AppColors.platinium,
                            ),
                            verticalInside: BorderSide(
                              width: 1,
                              color: AppColors.platinium,
                            ),
                          ),
                          columnWidths: {
                            0: FlexColumnWidth(1.5),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                          },
                          children: [
                            tableRow(["Cliente", "Total S/.", "Entrega"],
                                isHeader: true),
                            ...data.orderDeliveries.map(
                              (order) => tableRow([
                                order.client.rsocial,
                                "${order.total}",
                                Helpers.parseDate(order.maxShipDate),
                              ], onClick: () {
                                context.go("/deliveries/order/${order.id}");
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [Shadows.shadow(90)],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Plántulas invitro",
                                  style: TextStyle(
                                    color: AppColors.persian,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  "Resumen 5 más recientes",
                                  style: TextStyle(
                                    color: AppColors.dim,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () => context.go("/deliveries"),
                              child: Row(
                                children: [
                                  Text(
                                    "Ver todo",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.dim,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(
                                    Icons.play_circle,
                                    color: AppColors.dim,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              width: 1,
                              color: AppColors.platinium,
                            ),
                            verticalInside: BorderSide(
                              width: 1,
                              color: AppColors.platinium,
                            ),
                          ),
                          columnWidths: {
                            0: FlexColumnWidth(1.5),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                          },
                          children: [
                            tableRow(["Cliente", "Total S/.", "Entrega"],
                                isHeader: true),
                            ...data.vitroOrderDeliveries.map(
                              (order) => tableRow([
                                order.client.rsocial,
                                "${order.total}",
                                Helpers.parseDate(order.finishDate),
                              ], onClick: () {
                                context.go("/deliveries/invitro/${order.id}");
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [Shadows.shadow(90)],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Productos con bajo stock",
                                  style: TextStyle(
                                    color: AppColors.orange,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  "Resumen de productos",
                                  style: TextStyle(
                                    color: AppColors.dim,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () => context.go("/products"),
                              child: Row(
                                children: [
                                  Text(
                                    "Ver todo",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.dim,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(
                                    Icons.play_circle,
                                    color: AppColors.dim,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              spacing: 6,
                              runSpacing: 20,
                              alignment: WrapAlignment.spaceAround,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: data.productsLowStock.map((product) => MiniProductCard(
                                name: product.name,
                                stock: product.stock,
                                img: product.images?.first.image,
                              )).toList(),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  TableRow tableRow(List<String> cells,
      {bool isHeader = false, VoidCallback? onClick}) {
    return TableRow(
      children: cells.map((cell) {
        Color cellColor = isHeader
            ? AppColors.gray
            : ((cell.contains("Hoy") || cell.contains("Mañana"))
                ? AppColors.orange
                : AppColors.dim);

        return TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: InkWell(
              onTap: () => {onClick!()},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: Text(
                  cell,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: isHeader ? FontWeight.w700 : FontWeight.w600,
                    fontSize: isHeader ? 16 : 15,
                    color: cellColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ));
      }).toList(),
    );
  }
}
