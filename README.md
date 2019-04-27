# DeviceTrack

A sinatra based MVC CRUD web app for users to track their numerous devices.

A device has:

* Name
* Description and a
* Type (which has a Name)

The app will list your devices (totally or per device type). Devices and/or device types can be created, listed, edited and deleted. Users can manage their own devices and device types. Users can sign up, login and logout of the system.

Front-end assets and layout "borrowed" from project Expensy, found here: (https://github.com/aprietof/Expensy) Thank You!

## Usage

To use this app, just clone, run `bundle install`, `rake db:migrate` and then run `shotgun`.
Everything should be set up.

## Contributing Bugfixes or Features

For submitting something back, be it a patch, some documentation, or new feature requires some level of
community interactions.

Committing code is easy:

- Fork the this repository
- Create a local development branch for the bugfix or feature
- Commit and push changes to github
- Submit a pull request for your changes to be included

## License
DeviceTrack is licensed under the MIT license. (http://opensource.org/licenses/MIT)
