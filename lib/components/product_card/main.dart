import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/components/button/main.dart';
import 'package:inv_araujo_mobile/core/models/button_type.dart';
import 'package:inv_araujo_mobile/core/models/product.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onClick;
  final bool withStock;

  const ProductCard({
    required this.product,
    required this.onClick,
    this.withStock = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 210,
        height: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.platinium,
            width: 1.5,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  product.images?.first.image.url ??
                      "assets/img/default_product.png",
                  height: 150,
                ),
                SizedBox(
                  height: 167,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.categoryName.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 13,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.taupe,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                              decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  product.brand.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11,
                                    letterSpacing: 0.1,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.name,
                          style: TextStyle(
                            color: AppColors.gray,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.description,
                          maxLines: 2,
                          style: TextStyle(
                            color: AppColors.taupe,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "S/. ${product.price}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: product.discount != null
                                    ? AppColors.taupe
                                    : AppColors.persian,
                                decoration: product.discount != null
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            if (product.discount != null) ...[
                              SizedBox(width: 8),
                              Text(
                                "S/. ${product.discount?.price}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.orange,
                                ),
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          height: 28,
                          child: Button(
                            text: "Ver detalle",
                            onClick: () => {},
                            type: ButtonType.secondary,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if(product.discount != null) ...[
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.red.withAlpha(500),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "-${product.discount?.percentage ?? 0}%",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
            if(withStock) ...[
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.taupe.withAlpha(500),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Stock: ${product.stock}",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
