import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:badasi/Model/homeModel.dart';
export 'package:badasi/Model/homeModel.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() =>
      _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.pushNamed('Home');
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Incidencias cerca de ti.',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0,
                ),
              ),
            ].divide(SizedBox(height: 4)),
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 72,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                      hintStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                      errorStyle:
                      FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).error,
                        fontSize: 12,
                        letterSpacing: 0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: (_model.textFieldFocusNode?.hasFocus ?? false)
                          ? FlutterFlowTheme.of(context).accent1
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: (_model.textFieldFocusNode?.hasFocus ?? false)
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator:
                    _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    'Filtrar por tipos de Incidencias',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('Accidentes'),
                            ChipData('Deterioros'),
                            ChipData('Señales de Tráfico'),
                            ChipData('Incendios'),
                            ChipData('Otros')
                          ],
                          onChanged: (val) => setState(
                                  () => _model.choiceChipsValue = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                            FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              color:
                              FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0,
                            ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18,
                            elevation: 0,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderWidth: 2,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryText,
                              letterSpacing: 0,
                            ),
                            iconColor:
                            FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18,
                            elevation: 0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          chipSpacing: 12,
                          rowSpacing: 12,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                                ['Filter One'],
                              ),
                          //wrapped: false, AQUI DA ERROR
                        ),
                      ),
                    ]
                        .divide(SizedBox(width: 8))
                        .addToStart(SizedBox(width: 16))
                        .addToEnd(SizedBox(width: 16)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      0,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                        child: Container(
                          width: 190,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Post');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1486299267070-83823f5448dd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxsb25kb258ZW58MHx8fHwxNzA2NjI3NjE0fDA&ixlib=rb-4.0.3&q=80&w=400',
                                        width: 300,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 4),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Location, Address',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        Text(
                                          'Card Title',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 4)),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                        child: Container(
                          width: 190,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Post');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1534695215921-52f8a19e7909?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxncmVlY2V8ZW58MHx8fHwxNzA2NjI3NTkwfDA&ixlib=rb-4.0.3&q=80&w=400',
                                        width: 300,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 4),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Location, Address',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        Text(
                                          'Card Title',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 4)),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                        child: Container(
                          width: 190,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1560969184-10fe8719e047?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxiZXJsaW58ZW58MHx8fHwxNzA2NjI3NjAxfDA&ixlib=rb-4.0.3&q=80&w=400',
                                      width: 300,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location, Address',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Text(
                                        'Card Title',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 4)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8)),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    'Category Title',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                //
                // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      44,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Post');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1593692557859-b209f9f4ced4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOXx8c291dGglMjBhbWVyaWNhfGVufDB8fHx8MTcwNjYyNTU2N3ww&ixlib=rb-4.0.3&q=80&w=400',
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location, Address',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Text(
                                        'Card Title',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Text(
                                        'A small description about this card that helps users understand the importance of what makes this so special.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 4)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Post');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1593692557859-b209f9f4ced4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOXx8c291dGglMjBhbWVyaWNhfGVufDB8fHx8MTcwNjYyNTU2N3ww&ixlib=rb-4.0.3&q=80&w=400',
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location, Address',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Text(
                                        'Card Title',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Text(
                                        'A small description about this card that helps users understand the importance of what makes this so special.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 4)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 8)),
                  ),
                ),
              ].addToEnd(SizedBox(height: 32)),
            ),
          ),
        ),
      ),
    );
  }
}
