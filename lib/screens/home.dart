import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/components/card/color.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/shadows.dart';
import 'package:inv_araujo_mobile/core/styles/texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  subtitle: "10",
                ),
                SizedBox(width: 30),
                CardColor(
                  backgroundColor: AppColors.persian,
                  title: "Almacén actual",
                  subtitle: "Sapallanga",
                  icon: Icons.location_on_rounded,
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
                boxShadow: [
                  Shadows.shadow(90)
                ],
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
                            "Recojo en almacén",
                            style: TextStyle(
                              color: AppColors.persian,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                          Text(
                            "Huancayo - Sapallanga",
                            style: TextStyle(
                              color: AppColors.dim,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => {},
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
                      tableRow(["Cliente", "Total S/.", "Entrega"], isHeader: true),
                      tableRow(["Enmanuel Chipana", "345.50", "Hoy"]),
                      tableRow(["Luis Fernando", "1345.50", "Mañana"]),
                      tableRow(["Carlos Alcantara", "845.00", "1 Mar. 2025"]),
                      tableRow(["Carlos Manrique", "745.20", "2 Mar. 2025"]),
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
                boxShadow: [
                  Shadows.shadow(90)
                ],
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
                            "Recojo en almacén",
                            style: TextStyle(
                              color: AppColors.persian,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                          Text(
                            "Huancayo - El Tambo",
                            style: TextStyle(
                              color: AppColors.dim,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => {},
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
                      tableRow(["Cliente", "Total S/.", "Entrega"], isHeader: true),
                      tableRow(["Enmanuel Chipana", "345.50", "Hoy"]),
                      tableRow(["Luis Fernando", "1345.50", "Mañana"]),
                      tableRow(["Carlos Alcantara", "845.00", "1 Mar. 2025"]),
                      tableRow(["Carlos Manrique", "745.20", "2 Mar. 2025"]),
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
                boxShadow: [
                  Shadows.shadow(90)
                ],
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
                        onTap: () => {},
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow tableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        Color cellColor = isHeader ? AppColors.gray : ((cell.contains("Hoy") || cell.contains("Mañana")) ? AppColors.orange : AppColors.dim);

        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Text(
              cell,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.w700 : FontWeight.w600,
                fontSize: isHeader ? 16 : 15,
                color: cellColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
