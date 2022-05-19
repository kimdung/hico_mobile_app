class InvoiceRequest { 
  int? id;
  bool? extend = false;
  bool? rating = false;

  InvoiceRequest({
    this.id,
    this.extend,
    this.rating,
  });
}
