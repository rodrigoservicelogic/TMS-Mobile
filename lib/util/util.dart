import 'package:intl/intl.dart';

class Util {
  
  static String formataValor(double valor) {
    num vlr = 0;
    num vlrAbs = valor.abs();
    String valorFormatado = '';
    var formatoMoeda =
      new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

    if(vlrAbs >= 1000 && vlrAbs < 1000000) {
      vlr = valor / 1000;
      valorFormatado = '${formatoMoeda.format(vlr)} K';
    } else if(vlrAbs >= 1000000 && vlrAbs < 1000000000) {
      vlr = valor / 1000000;
      valorFormatado = '${formatoMoeda.format(vlr)} M';
    } else if(vlrAbs >= 1000000000 && vlrAbs < 1000000000000) {
      vlr = valor / 1000000000;
      valorFormatado = '${formatoMoeda.format(vlr)} B';
    } else {
      valorFormatado = '${formatoMoeda.format(vlr)}';
    }

    return valorFormatado;
  }
}
