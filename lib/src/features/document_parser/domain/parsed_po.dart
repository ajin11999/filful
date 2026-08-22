class ParsedPoItem {
  final int itemIndex;
  final String description;
  final double requestedQty;
  final String uom;
  final double targetUnitPrice;
  final double targetTotalPrice;
  final String? category;

  const ParsedPoItem({
    required this.itemIndex,
    required this.description,
    required this.requestedQty,
    required this.uom,
    required this.targetUnitPrice,
    required this.targetTotalPrice,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemIndex': itemIndex,
      'description': description,
      'requestedQty': requestedQty,
      'uom': uom,
      'targetUnitPrice': targetUnitPrice,
      'targetTotalPrice': targetTotalPrice,
      'category': category,
    };
  }
}

class ParsedPo {
  final String poNumber;
  final String companyName;
  final String vendorName;
  final String vendorAddress;
  final String deliveryDestination;
  final String? referencePro;
  final DateTime poDate;
  final DateTime? deliveryDate;
  final double subtotal;
  final double discount;
  final double tax;
  final double grandTotal;
  final String? notes;
  final List<ParsedPoItem> items;

  const ParsedPo({
    required this.poNumber,
    required this.companyName,
    required this.vendorName,
    required this.vendorAddress,
    required this.deliveryDestination,
    this.referencePro,
    required this.poDate,
    this.deliveryDate,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.grandTotal,
    this.notes,
    required this.items,
  });
}
