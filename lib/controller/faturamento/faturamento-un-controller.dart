import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/models/FaturamentoUn.dart';
import 'package:tms_mobile/models/cliente-faturamento.dart';
import 'package:tms_mobile/models/filial-model.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/models/grupoCliente.dart';
import 'package:tms_mobile/util/http_helper.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../global.dart';
part 'faturamento-un-controller.g.dart';

class FaturamentoUnController = FaturamentoUnControllerBase
    with _$FaturamentoUnController;

abstract class FaturamentoUnControllerBase with Store {
  @observable
  int idUsuario;

  @observable
  bool isLoad = false;

  @observable
  bool loadCliente = false;

  @observable
  List<charts.Series<ListaFiliais, String>> seriesUn = List();

  @observable
  List<DataColumn> columnsUn = List();

  @observable
  List<DataRow> rowsUn = List();

  @observable
  List<charts.Series<ListaTipoTransporte, String>> seriesTipoTransp = List();

  @observable
  List<DataColumn> columnsTipoTransp = List();

  @observable
  List<DataRow> rowsTipoTransp = List();

  @observable
  List<charts.Series<ListaClientes, String>> seriesCli = List();

  @observable
  List<DataColumn> columnsCli = List();

  @observable
  List<DataRow> rowsCli = List();

  @observable
  FaturamentoUn faturamento = FaturamentoUn();

  @observable
  List<Filial> filiais = List();

  @observable
  List<String> tiposFrete = List();

  @observable
  List<ClienteFaturamento> clientes = List();

  @observable
  List<GrupoCliente> gruposCliente = List();

  @observable
  int selectedUnidade;

  @observable
  String selectedFrete;

  @observable
  String selectedCliente;

  @observable
  int selectedGrupoCliente;

  @observable
  bool visible = false;

  @observable
  int current = 0;

  @observable
  TextEditingController valorTotalCtrl = TextEditingController();

  @observable
  TextEditingController pesoTotalCtrl = TextEditingController();

  @observable
  bool sortAscUn = true;

  Http _http = Http();

  @action
  changeCurrent(int index) => current = index;

  @action
  changeUnidadeNegocio(int value) {
    selectedUnidade = value;
    selectedUnidade = selectedUnidade;
  }

  @action
  changeTipoFrete(String value) {
    selectedFrete = value;
    selectedFrete = selectedFrete;
  }

  @action
  changeCliente(String value) {
    selectedCliente = value;
    selectedCliente = selectedCliente;
  }

  @action
  Future<void> changeGrupoCliente(int value) async {
    selectedGrupoCliente = value;
    selectedGrupoCliente = selectedGrupoCliente;

    await getCliente(selectedGrupoCliente);
  }

  @action
  Future<String> getListaFilial() async {
    try {
      isLoad = true;
      filiais = [];
      tiposFrete = [];
      clientes = [];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      int idEmpresa = prefs.getInt("Empresa");

      Http _http = Http();

      Response response =
          await _http.get(API_URL + "empresa/unidade-negocio/$idEmpresa");

      if (response.data != null) {
        Filial filial = Filial();
        filial.idFilial = 0;
        filial.nomeFantasia = "Todos";

        filiais.add(filial);

        for (Map map in response.data) {
          filiais.add(Filial.fromJson(map));
        }

        selectedUnidade = 0;
      }

      Response responseTipoFrete =
          await _http.get(API_URL + "faturamento/tipo-transporte");

      if (responseTipoFrete.data != null) {
        tiposFrete.add("Todos");
        for (String map in responseTipoFrete.data) {
          tiposFrete.add(map);
        }

        selectedFrete = "Todos";
      }

      Response responseGrupoCliente =
          await _http.get(API_URL + "faturamento/GrupoCliente");

      if (responseGrupoCliente.data != null) {
        GrupoCliente cliente = GrupoCliente();
        cliente.idGrupoCliente = 0;
        cliente.nome = "Todos";

        gruposCliente.add(cliente);

        for (Map map in responseGrupoCliente.data) {
          gruposCliente.add(GrupoCliente.fromJson(map));
        }

        selectedGrupoCliente = 0;
      }

      isLoad = false;

      return "OK";
    } catch (e) {
      isLoad = false;
      print(e);

      return "Ocorreu um erro ao obter as listas!";
    }
  }

  Future<void> getCliente(int idGrupoCliente) async {
    loadCliente = true;

    Http _http = Http();
    clientes = [];

    Response responseClientes = await _http
        .get(API_URL + "faturamento/clientes?idGrupoCliente=$idGrupoCliente");

    if (responseClientes.data != null) {
      ClienteFaturamento cliente = ClienteFaturamento();
      cliente.codCliente = "-1";
      cliente.nomeCliente = "Todos";

      clientes.add(cliente);

      for (Map map in responseClientes.data) {
        clientes.add(ClienteFaturamento.fromJson(map));
      }

      clientes = clientes;

      selectedCliente = "0";
    }

    loadCliente = false;
  }

  @action
  Future<String> getFaturamento(
      ModelFiltroFaturamento filtroFaturamento) async {
    try {
      isLoad = true;
      faturamento = new FaturamentoUn();
      NumberFormat formatValor =
          NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
      NumberFormat format = NumberFormat.currency(locale: "pt_BR", symbol: "");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      idUsuario = prefs.getInt("Usuario");
      //filtroFaturamento.idUnidadeNegocio = prefs.getInt('Empresa');

      Response response = await _http.get(API_URL +
          'faturamento/un/$idUsuario?${filtroFaturamento.asQueryParams()}');

      if (response.data != null) {
        faturamento = FaturamentoUn.fromJson(response.data);
        faturamento.listaFiliais
            .sort((a, b) => b.valorTotal.compareTo(a.valorTotal));
        faturamento.listaClientes
            .sort((a, b) => b.valorTotal.compareTo(a.valorTotal));
        faturamento.listaTipoTransporte
            .sort((a, b) => b.valorTotal.compareTo(a.valorTotal));
      }

      valorTotalCtrl.text = formatValor.format(faturamento.valorTotal);
      pesoTotalCtrl.text = "${format.format(faturamento.pesoTotal)} T";

      isLoad = false;
      visible = true;

      return Future.value('ok');
    } on DioError catch (e) {
      isLoad = false;
      visible = false;
      Map response = e.response.data;
      return Future.value(response["Message"]);
    }
  }

  @action
  void buildTableTipoTransporte() {
    var formatoMoeda = new NumberFormat.currency(locale: "pt_BR", symbol: "");
    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");

    columnsTipoTransp.clear();
    rowsTipoTransp.clear();

    buildTableColumnTipoTransporte();

    if (this.faturamento != null) {
      this.faturamento.listaTipoTransporte.forEach((element) {
        rowsTipoTransp.add(DataRow(cells: <DataCell>[
          DataCell(
              Container(width: 110, child: Text('${element.tipoTransporte}'))),
          DataCell(
            Container(
              width: 80,
              child: Text(
                "${element.peso < 0 ? '-' : formatoMoeda.format((element.peso / 1000))}",
                textAlign: TextAlign.end,
              ),
            ),
          ),
          DataCell(Container(
              width: 50,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 50.0,
                  maxWidth: 50.0,
                ),
                child: AutoSizeText(
                  '${element.valorTotal < 0 ? '-' : toCurrencyString(element.valorTotal.toStringAsFixed(2), thousandSeparator: ThousandSeparator.Period, shorteningPolicy: ShorteningPolicy.RoundToThousands)}',
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 14,
                ),
              ))),
          DataCell(
            Text(
              "${element.perCresValor < 0 ? '-' : formatoPercentual.format(element.perCresValor)}",
              textAlign: TextAlign.end,
            ),
          )
        ]));
      });
    } else {
      rowsTipoTransp.add(DataRow(cells: <DataCell>[]));
    }

    rowsTipoTransp = rowsTipoTransp;
  }

  @action
  void buildTableColumnTipoTransporte() {
    columnsTipoTransp.clear();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columnsTipoTransp.add(
      DataColumn(
          label: Text(
            "Tipo Contratação",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaTipoTransporte> tipoTransporte = List();
            tipoTransporte = List.from(faturamento.listaTipoTransporte);

            if (sortAscUn) {
              tipoTransporte
                  .sort((a, b) => b.tipoTransporte.compareTo(a.tipoTransporte));
            } else {
              tipoTransporte
                  .sort((a, b) => a.tipoTransporte.compareTo(b.tipoTransporte));
            }

            faturamento.listaTipoTransporte = tipoTransporte;

            buildTableTipoTransporte();
          }),
    );

    columnsTipoTransp.add(
      DataColumn(
          label: Text(
            "Peso (T)",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaTipoTransporte> tipoTransporte = List();
            tipoTransporte = List.from(faturamento.listaTipoTransporte);

            if (sortAscUn) {
              tipoTransporte.sort((a, b) => b.peso.compareTo(a.peso));
            } else {
              tipoTransporte.sort((a, b) => a.peso.compareTo(b.peso));
            }

            faturamento.listaTipoTransporte = tipoTransporte;

            buildTableTipoTransporte();
          }),
    );

    columnsTipoTransp.add(
      DataColumn(
          label: Text(
            "R\$",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaTipoTransporte> tipoTransporte = List();
            tipoTransporte = List.from(faturamento.listaTipoTransporte);

            if (sortAscUn) {
              tipoTransporte
                  .sort((a, b) => b.valorTotal.compareTo(a.valorTotal));
            } else {
              tipoTransporte
                  .sort((a, b) => a.valorTotal.compareTo(b.valorTotal));
            }

            faturamento.listaTipoTransporte = tipoTransporte;

            buildTableTipoTransporte();
          }),
    );

    columnsTipoTransp.add(
      DataColumn(
          label: Text(
            "%",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaTipoTransporte> tipoTransporte = List();
            tipoTransporte = List.from(faturamento.listaTipoTransporte);

            if (sortAscUn) {
              tipoTransporte
                  .sort((a, b) => b.perCresValor.compareTo(a.perCresValor));
            } else {
              tipoTransporte
                  .sort((a, b) => a.perCresValor.compareTo(b.perCresValor));
            }

            faturamento.listaTipoTransporte = tipoTransporte;

            buildTableTipoTransporte();
          }),
    );
  }

  @action
  void buildChartTipoTransporte() {
    seriesTipoTransp.clear();

    if (this.faturamento != null) {
      var formatoMoeda =
          new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

      seriesTipoTransp.add(charts.Series(
        data: this.faturamento.listaTipoTransporte,
        domainFn: (ListaTipoTransporte task, _) =>
            task.tipoTransporte.substring(0, 9),
        measureFn: (ListaTipoTransporte task, _) => task.perCresValor,
        id: 'Faturamento Cli',
        labelAccessorFn: (ListaTipoTransporte row, _) =>
            '${formatoMoeda.format(row.valorTotal)}',
      ));
    } else {
      seriesTipoTransp.add(charts.Series(
          data: <ListaTipoTransporte>[],
          domainFn: (ListaTipoTransporte task, _) {
            return null;
          },
          id: null,
          measureFn: (ListaTipoTransporte task, _) {
            return null;
          }));
    }
  }

  @action
  void buildTableUn() {
    var formatoMoeda =
        new NumberFormat.currency(locale: "pt_BR", symbol: "");
    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");
    columnsUn.clear();
    rowsUn.clear();

    buildTableColumnsUn();

    if (faturamento != null && faturamento.listaFiliais != null) {
      faturamento.listaFiliais.forEach((element) {
        rowsUn.add(DataRow(cells: <DataCell>[
          DataCell(Container(
            child: Text(
                "${element.nomeFilial.contains('-') ? element.nomeFilial.split('-')[1] : element.nomeFilial}"),
          )),
          DataCell(
            Container(
              child: Text(
                "${element.peso < 0 ? '-' : formatoMoeda.format((element.peso / 1000))}",
                textAlign: TextAlign.end,
              ),
            ),
          ),
          DataCell(Container(
            width: 50,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50.0,
                maxWidth: 50.0,
              ),
              child: AutoSizeText(
                '${element.valorTotal < 0 ? '-' : toCurrencyString(element.valorTotal.toStringAsFixed(2), thousandSeparator: ThousandSeparator.Period, shorteningPolicy: ShorteningPolicy.RoundToThousands)}',
                textAlign: TextAlign.end,
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 14,
              ),
            ))),
          DataCell(
            Container(
              width: 50,
              child: Text(
                "${element.perCresValor < 0 ? '-' : formatoPercentual.format(element.perCresValor)}",
                textAlign: TextAlign.end,
              ),
            ),
          )
        ]));
      });
    } else {
      rowsUn.add(DataRow(cells: <DataCell>[]));
    }

    rowsUn = rowsUn;
  }

  @action
  void buildTableColumnsUn() {
    columnsUn.clear();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columnsUn.add(
      DataColumn(
          label: Text(
            "U.N.",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaFiliais> filiais = List();
            filiais = List.from(faturamento.listaFiliais);

            if (sortAscUn) {
              filiais.sort((a, b) => b.nomeFilial.compareTo(a.nomeFilial));
            } else {
              filiais.sort((a, b) => a.nomeFilial.compareTo(b.nomeFilial));
            }

            faturamento.listaFiliais = filiais;

            buildTableUn();
          }),
    );

    columnsUn.add(
      DataColumn(
          label: Text(
            "Peso (T)",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaFiliais> filiais = List();
            filiais = List.from(faturamento.listaFiliais);

            if (sortAscUn) {
              filiais.sort((a, b) => b.peso.compareTo(a.peso));
            } else {
              filiais.sort((a, b) => a.peso.compareTo(b.peso));
            }

            faturamento.listaFiliais = filiais;

            buildTableUn();
          }),
    );

    columnsUn.add(
      DataColumn(
          label: Text(
            "R\$",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaFiliais> filiais = List();
            filiais = List.from(faturamento.listaFiliais);

            if (sortAscUn) {
              filiais.sort((a, b) => b.valorTotal.compareTo(a.valorTotal));
            } else {
              filiais.sort((a, b) => a.valorTotal.compareTo(b.valorTotal));
            }

            faturamento.listaFiliais = filiais;

            buildTableUn();
          }),
    );

    columnsUn.add(
      DataColumn(
          label: Text(
            "%",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaFiliais> filiais = List();
            filiais = List.from(faturamento.listaFiliais);

            if (sortAscUn) {
              filiais.sort((a, b) => b.perCresValor.compareTo(a.perCresValor));
            } else {
              filiais.sort((a, b) => a.perCresValor.compareTo(b.perCresValor));
            }

            faturamento.listaFiliais = filiais;

            buildTableUn();
          }),
    );
  }

  @action
  void buildChartsUn() {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

    seriesUn.clear();
    if (faturamento != null) {
      seriesUn.add(charts.Series(
        data: faturamento.listaFiliais,
        domainFn: (ListaFiliais task, _) => task.nomeFilial.contains('-')
            ? task.nomeFilial.split('-')[1]
            : task.nomeFilial.substring(0, 10),
        measureFn: (ListaFiliais task, _) => task.valorTotal,
        id: 'Faturamento Und',
        labelAccessorFn: (ListaFiliais row, _) =>
            '${toCurrencyString(row.valorTotal.toStringAsFixed(2), thousandSeparator: ThousandSeparator.Period, shorteningPolicy: ShorteningPolicy.RoundToThousands)}',
      ));
    } else {
      seriesUn.add(charts.Series(
          data: <ListaFiliais>[],
          domainFn: (ListaFiliais task, _) {
            return null;
          },
          id: null,
          measureFn: (ListaFiliais task, _) {
            return null;
          }));
    }
  }

  @action
  void buildTableCli() {
    var formatoMoeda = new NumberFormat.currency(locale: "pt_BR", symbol: "");
    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");
    columnsCli.clear();
    rowsCli.clear();

    buildTableColumnsCli();

    if (faturamento != null) {
      faturamento.listaClientes.forEach((element) {
        rowsCli.add(DataRow(cells: <DataCell>[
          DataCell(
              Container(width: 120, child: Text("${element.nomeCliente}"))),
          DataCell(Container(
              width: 50,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 50.0,
                  maxWidth: 50.0,
                ),
                child: AutoSizeText(
                  '${element.valorTotal < 0 ? '-' : toCurrencyString(element.valorTotal.toStringAsFixed(2), thousandSeparator: ThousandSeparator.Period, shorteningPolicy: ShorteningPolicy.RoundToThousands)}',
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 14,
                ),
              ))),
          DataCell(
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 80.0,
                  maxWidth: 80.0,
                ),
                child: AutoSizeText(
                  "${element.peso < 0 ? '-' : formatoMoeda.format((element.peso / 1000))}",
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 14,
                ),
              ),
            ),
          ),
          DataCell(
            Text(
              "${element.perCresValor < 0 ? '-' : formatoPercentual.format(element.perCresValor)}",
              textAlign: TextAlign.end,
            ),
          )
        ]));
      });
    } else {
      rowsCli.add(DataRow(cells: <DataCell>[]));
    }

    rowsCli = rowsCli;
  }

  @action
  void buildTableColumnsCli() {
    columnsCli.clear();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columnsCli.add(
      DataColumn(
          label: Text(
            "Cliente",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaClientes> clientes = List();
            clientes = List.from(faturamento.listaClientes);

            if (sortAscUn) {
              clientes.sort((a, b) => b.nomeCliente.compareTo(a.nomeCliente));
            } else {
              clientes.sort((a, b) => a.nomeCliente.compareTo(b.nomeCliente));
            }

            faturamento.listaClientes = clientes;

            buildTableCli();
          }),
    );

    columnsCli.add(
      DataColumn(
          label: Text(
            "R\$",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaClientes> clientes = List();
            clientes = List.from(faturamento.listaClientes);

            if (sortAscUn) {
              clientes.sort((a, b) => b.valorTotal.compareTo(a.valorTotal));
            } else {
              clientes.sort((a, b) => a.valorTotal.compareTo(b.valorTotal));
            }

            faturamento.listaClientes = clientes;

            buildTableCli();
          }),
    );

    columnsCli.add(
      DataColumn(
          label: Text(
            "Peso (T)",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaClientes> clientes = List();
            clientes = List.from(faturamento.listaClientes);

            if (sortAscUn) {
              clientes.sort((a, b) => b.peso.compareTo(a.peso));
            } else {
              clientes.sort((a, b) => a.peso.compareTo(b.peso));
            }

            faturamento.listaClientes = clientes;

            buildTableCli();
          }),
    );

    columnsCli.add(
      DataColumn(
          label: Text(
            "%",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscUn = !sortAscUn;

            List<ListaClientes> clientes = List();
            clientes = List.from(faturamento.listaClientes);

            if (sortAscUn) {
              clientes.sort((a, b) => b.perCresValor.compareTo(a.perCresValor));
            } else {
              clientes.sort((a, b) => a.perCresValor.compareTo(b.perCresValor));
            }

            faturamento.listaClientes = clientes;

            buildTableCli();
          }),
    );
  }

  void buildChartsCli() {
    seriesCli.clear();
    if (this.faturamento != null) {
      var formatoMoeda =
          new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

      seriesCli.add(charts.Series(
        data: this.faturamento.listaClientes,
        domainFn: (ListaClientes task, _) => task.nomeCliente.substring(0, 9),
        measureFn: (ListaClientes task, _) => task.perCresValor,
        id: 'Faturamento Cli',
        labelAccessorFn: (ListaClientes row, _) =>
            '${formatoMoeda.format(row.valorTotal)}',
      ));
    } else {
      seriesCli.add(charts.Series(
          data: <ListaClientes>[],
          domainFn: (ListaClientes task, _) {
            return null;
          },
          id: null,
          measureFn: (ListaClientes task, _) {
            return null;
          }));
    }
  }

  Future<void> createPdf() async {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
          build: (pw.Context context) => pw.ListView(children: [
                pw.Center(
                    child: pw.Text("Visão por Unidade de Negócio",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.SizedBox(
                    child: pw.Chart(
                        grid: pw.CartesianGrid(
                            xAxis: pw.FixedAxis.fromStrings(
                                List<String>.generate(
                                    faturamento.listaFiliais.length,
                                    (index) => faturamento
                                        .listaFiliais[index].nomeFilial),
                                ticks: true,
                                divisions: true,
                                axisTick: true),
                            yAxis: pw.FixedAxis(
                              [0, 50, 100],
                              format: (v) => 'R\$$v',
                              divisions: true,
                            )),
                        datasets: [
                      pw.BarDataSet(
                          color: PdfColors.blue100,
                          data: List<pw.LineChartValue>.generate(
                              faturamento.listaFiliais.length, (i) {
                            final num v =
                                faturamento.listaFiliais[i].perCresValor;
                            return pw.LineChartValue(i.toDouble(), v);
                          }))
                    ]))
              ])),
    );

    await Printing.sharePdf(bytes: doc.save(), filename: 'faturamento.pdf');
  }
}
