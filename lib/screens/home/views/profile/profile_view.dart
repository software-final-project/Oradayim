import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:oradayim/core/base/init/config/app_environment.dart';
import '../../../../core/base/views/base_view.dart';
import '../../../auth/views/login/login_view.dart';
import 'profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    MapboxOptions.setAccessToken(AppEnvironmentItems.apiKey.value);
    return BaseView<ProfileViewModel>(
      vmBuilder: (context) => ProfileViewModel(),
      builder: _buildScreenContent,
    );
  }

  Widget _buildScreenContent(BuildContext context, ProfileViewModel viewModel) {
    final List<Widget> listViewChildren = <Widget>[];

    listViewChildren.addAll(
      <Widget>[
        _cancelCameraAnimation(viewModel),
        _easeTo(viewModel),
        _flyTo(viewModel),
        _moveBy(viewModel),
        _rotateBy(viewModel),
        _scaleBy(viewModel),
        _pitchBy(viewModel),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await viewModel.logout();
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width:600,
            height: 600,
            child: MapWidget(

              cameraOptions: CameraOptions(

                  zoom: 5,
                  center: Point(coordinates: Position(41.233526, 28.7843994))),
              //key: ValueKey("mapWidget"),
              onMapCreated: viewModel.onMapCreated,
            ),
          ),
          Expanded(
            child: ListView(
              children: listViewChildren,
            ),
          )
        ],
      ),
    );
  }

  Widget _easeTo(ProfileViewModel viewModel) {
    return TextButton(
      child: Text('easeTo'),
      onPressed: () {
        viewModel.controller.easeTo(
            CameraOptions(
                center: Point(coordinates: viewModel.currentCameraPosition),
                zoom: 15,
                bearing: 0,
                pitch: 3),
            MapAnimationOptions(duration: 2000, startDelay: 0));
      },
    );
  }

  Widget _flyTo(ProfileViewModel viewModel) {
    return TextButton(
      child: Text('flyTo'),
      onPressed: () {
        viewModel.controller.flyTo(
            CameraOptions(
                anchor: ScreenCoordinate(x: 0, y: 0),
                zoom: 17,
                bearing: 180,
                pitch: 30),
            MapAnimationOptions(duration: 2000, startDelay: 0));
      },
    );
  }

  Widget _moveBy(ProfileViewModel viewModel) {
    return TextButton(
      child: Text('moveBy'),
      onPressed: () {
        viewModel.controller.moveBy(ScreenCoordinate(x: 500.0, y: 500.0),
            MapAnimationOptions(duration: 2000, startDelay: 0));
      },
    );
  }

  Widget _rotateBy(ProfileViewModel viewModel) {
    return TextButton(
      child: Text('rotateBy'),
      onPressed: () {
        viewModel.controller.rotateBy(
            ScreenCoordinate(x: 0, y: 0),
            ScreenCoordinate(x: 500.0, y: 500.0),
            MapAnimationOptions(duration: 2000, startDelay: 0));
      },
    );
  }

  Widget _scaleBy(ProfileViewModel viewModel) {
    return TextButton(
      child: Text('scaleBy'),
      onPressed: () {
        viewModel.controller.scaleBy(15.0, ScreenCoordinate(x: 10.0, y: 10.0),
            MapAnimationOptions(duration: 2000, startDelay: 0));
      },
    );
  }

  Widget _pitchBy(ProfileViewModel viewModel) {
    return TextButton(
      child: Text('pitchBy'),
      onPressed: () {
        viewModel.controller
            .pitchBy(70.0, MapAnimationOptions(duration: 2000, startDelay: 0));
      },
    );
  }

  Widget _cancelCameraAnimation(ProfileViewModel viewModel) {
    return TextButton(
      child: Text('cancelCameraAnimation'),
      onPressed: () {
        viewModel.controller.cancelCameraAnimation();
      },
    );
  }
}
