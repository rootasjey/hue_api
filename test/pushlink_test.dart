import 'dart:async';

import 'package:hue_api/src/configuration/pushlink_bloc.dart';
import 'package:hue_api/src/core/bridge_exception.dart';
import 'package:hue_api/src/core/discovery_result.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'mock.dart';

void main() {
  late PushlinkBloc sut;
  late MockPushlinkStorage storage;
  late MockBridgeDiscovery bridgeDiscovery;

  setUp(() {
    storage = MockPushlinkStorage();
    bridgeDiscovery = MockBridgeDiscovery();
    sut = PushlinkBloc(storage, bridgeDiscovery);
  });

  mockHasUsername(bool hasUsername) {
    when(storage.usernameExists()).thenAnswer((_) => Future.value(hasUsername));
  }

  mockAutomaticBridgeResult(int amount) {
    final results = List.generate(amount, (index) {
      return DiscoveryResult();
    });
    when(bridgeDiscovery.automatic()).thenAnswer((_) {
      return Future.value(results);
    });
    return results;
  }

  mockFailingAutomaticBridgeResult() {
    final result = BridgeException();
    when(bridgeDiscovery.automatic()).thenThrow(result);
    return result;
  }

  mockManualBridgeResult() {
    final result = DiscoveryResult();
    when(bridgeDiscovery.manual('')).thenAnswer((_) {
      return Future.value(result);
    });
    return result;
  }

  mockFailingManualBridgeResult(String ip) {
    final result = BridgeException();
    when(bridgeDiscovery.manual(ip)).thenThrow(result);
    return result;
  }

  test('storage has username', () {
    mockHasUsername(true);
    sut.dispose();
    expect(sut.hasUsername, emitsInOrder([true]));
  });

  test('storage has no username', () {
    mockHasUsername(false);
    sut.dispose();
    expect(sut.hasUsername, emitsInOrder([false]));
  });
  test('automatic search returns search results on listen', () {
    final result = mockAutomaticBridgeResult(3);
    expect(sut.discoveryResults, emits(result));
  });

  test('automatic search fails on listen', () {
    final result = mockFailingAutomaticBridgeResult();
    expect(sut.discoveryResults, emitsError(result));
  });

  test('manual search returns search result', () {
    final result = mockManualBridgeResult();
    sut.manualSearch.add('192.1.1.1');
    expect(sut.manualSearchResult, emits(result));
  });

  test('manual search fails search result', () {
    final ip = '192.1.1.1';
    final result = mockFailingManualBridgeResult(ip);
    sut.manualSearch.add(ip);
    expect(sut.manualSearchResult, emitsError(result));
  });
}
