import 'package:flutter/material.dart';
/*
FFRoute(
              name: 'LogInSignUp',
              path: 'logInSignUp',
              builder: (context, params) => LogInSignUpWidget(),
            ),
            FFRoute(
              name: 'AddDeviceQRScan',
              path: 'addDeviceQRScan',
              builder: (context, params) => AddDeviceQRScanWidget(),
            ),
            FFRoute(
              name: 'AddDeviceQRScanPravah',
              path: 'addDeviceQRScanPravah',
              builder: (context, params) => AddDeviceQRScanPravahWidget(),
            ),
            FFRoute(
              name: 'Dashboard',
              path: 'dashboard',
              builder: (context, params) => DashboardWidget(),
            ),
            FFRoute(
              name: 'CubeOrCy',
              path: 'cubeOrCy',
              builder: (context, params) => CubeOrCyWidget(
                tankKey: params.getParam('tankKey', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AddDevice',
              path: 'addDevice',
              builder: (context, params) => AddDeviceWidget(
                tankKey: params.getParam('tankKey', ParamType.String),
                isCuboid: params.getParam('isCuboid', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'AddDevicePravah',
              path: 'addDevicePravah',
              builder: (context, params) => AddDevicePravahWidget(
                meterKey: params.getParam('meterKey', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'EditDevice',
              path: 'editDevice',
              builder: (context, params) => EditDeviceWidget(),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'CuboidalTankEdit',
              path: 'cuboidalTankEdit',
              asyncParams: {
                'tankReference':
                    getDoc(['users', 'tank'], TankRecord.serializer),
              },
              builder: (context, params) => CuboidalTankEditWidget(
                tankReference:
                    params.getParam('tankReference', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'MeterEdit',
              path: 'meterEdit',
              asyncParams: {
                'meterReference':
                    getDoc(['users', 'meter'], MeterRecord.serializer),
              },
              builder: (context, params) => MeterEditWidget(
                meterReference:
                    params.getParam('meterReference', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'TankSummary',
              path: 'tankSummary',
              builder: (context, params) => TankSummaryWidget(
                water: params.getParam('water', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'MeterSummary',
              path: 'meterSummary',
              builder: (context, params) => MeterSummaryWidget(
                reading: params.getParam('reading', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'IndividualSummary',
              path: 'individualSummary',
              asyncParams: {
                'docReference':
                    getDoc(['users', 'tank'], TankRecord.serializer),
              },
              builder: (context, params) => IndividualSummaryWidget(
                  docReference:
                      params.getParam('docReference', ParamType.Document),
                  waterLevel: params.getParam('waterLevel', ParamType.double),
                  temperature:
                      params.getParam('temperature', ParamType.double)),
            ),
            FFRoute(
              name: 'IndividualMeterSummary',
              path: 'individualMeterSummary',
              asyncParams: {
                'docReference':
                    getDoc(['users', 'meter'], MeterRecord.serializer),
              },
              builder: (context, params) => IndividualMeterSummaryWidget(
                docReference:
                    params.getParam('docReference', ParamType.Document),
                totalFlow: params.getParam('totalFlow', ParamType.double),
                flowRate: params.getParam('flowRate', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'PrimaryTank',
              path: 'primaryTank',
              builder: (context, params) => PrimaryTankWidget(),
            ),
*/