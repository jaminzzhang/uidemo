import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../data/repository.dart';
import '../data/demo_data.dart';

enum LoadEvent {
  loadAll,
  loadLocal,
  loadRemote
}

abstract class LoadPageState extends Equatable {
  const LoadPageState();

  @override
  List<Object> get props => [];
}

enum LoadDataSource {
  local,
  remote
}
class LoadPageInitial extends LoadPageState {}
class LoadPageLoading extends LoadPageState {}
class LoadPageLoadFailure extends LoadPageState {}
class LoadPageLoadSuccess extends LoadPageState {


  final DemoData homeData;
  final LoadDataSource source;
  const LoadPageLoadSuccess.Local({@required this.homeData, this.source = LoadDataSource.local});
  const LoadPageLoadSuccess.Remote({@required this.homeData, this.source = LoadDataSource.remote});

  @override
  List<Object> get props => [homeData];
}



class LoadPageBloc extends Bloc<LoadEvent, LoadPageState> {

  final Repository loadRepository;
  DemoData homeData;

  LoadPageBloc(): loadRepository = Repository();

  @override
  LoadPageState get initialState => LoadPageInitial();

  @override
  Stream<LoadPageState> mapEventToState(LoadEvent event) async* {
    switch(event) {
      case LoadEvent.loadLocal:
        {
          yield* _mapLoadLocalToState();
        }
        break;
      case LoadEvent.loadRemote:
        {
          yield* _mapLoadRemoteToState();
        }
        break;
      default:
        {
          developer.log('_mapLoadAllToState', name: '$event');
          yield* _mapLoadAllToState();
        }
    }
  }

  Stream<LoadPageState> _mapLoadLocalToState () async* {
    final DemoData data = await this.loadRepository.loadLocalData();
    developer.log('Load Local Data', name: 'Load', error: jsonEncode(data));
    if (this.homeData == null) {
      this.homeData = data;
    }
    yield LoadPageLoadSuccess.Local(homeData: data);
  }

  Stream<LoadPageState> _mapLoadRemoteToState () async* {
    if (this.homeData == null || this.homeData.isEmpty) {
      yield LoadPageLoading();
    }
    try {
      final DemoData data = await this.loadRepository.loadRemoteData();
//      developer.log('Load Remote Data', name: 'Load', error: jsonEncode(data));
      if (data != null) {
        this.homeData = data;
      }
      yield LoadPageLoadSuccess.Remote(homeData: data);
    } catch (e) {
      stderr.writeln(e);
      developer.log('Load Remote Data Failed', error: e);
      yield LoadPageLoadFailure();
    }
  }

  Stream<LoadPageState> _mapLoadAllToState () async* {
    developer.log('Start Load Local');
    yield* _mapLoadLocalToState();
    developer.log('End Load Local');
    developer.log('Start Load Remote');
    yield* _mapLoadRemoteToState();
    developer.log('End Load Remote');
  }





}