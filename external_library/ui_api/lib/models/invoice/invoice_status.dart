class InvoiceStatus {
  static InvoiceStatus all = InvoiceStatus('invoice.all', 0);
  static InvoiceStatus requested = InvoiceStatus('invoice.requested', 1);
  static InvoiceStatus accepted = InvoiceStatus('invoice.accepted', 2);
  static InvoiceStatus successed = InvoiceStatus('invoice.successed', 3);
  static InvoiceStatus canceled = InvoiceStatus('invoice.canceled', 4);

  static List<InvoiceStatus> status = [
    requested,
    accepted,
    successed,
    canceled
  ];

  final String name;
  final int id;

  InvoiceStatus(this.name, this.id);
}
