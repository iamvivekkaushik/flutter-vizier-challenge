part of 'stock.dart';

class _StockLegends extends StatelessWidget {
  final StockLegend legend;

  const _StockLegends({
    required this.legend,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (legend.items.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: legend.settings.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: legend.items
            .map(
              (item) => [
                _LegendItem(
                  color: item.color,
                  label: item.label,
                  sizeIcon: legend.settings.sizeIcon,
                  textStyle: legend.settings.textStyle,
                ),
                SizedBox(
                  width: legend.settings.paddingBetweenItems,
                ),
              ],
            )
            .flattened
            .toList()
          ..removeLast(),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final double sizeIcon;
  final TextStyle textStyle;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.sizeIcon,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.fromSize(
          size: Size.square(sizeIcon),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          label,
          style: textStyle,
        ),
      ],
    );
  }
}
