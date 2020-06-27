# SmartProxyRhsm

This plugin aims to do service discovery for the RHSM endpoint. This allows Katello to know where to direct clients.

## Installation

See [How_to_Install_a_Smart-Proxy_Plugin](https://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Smart-Proxy_Plugin)
for how to install Smart Proxy plugins

This plugin is compatible with Smart Proxy 2.0 or higher.

## Configuration

To enable this DNS provider, edit `/etc/foreman-proxy/settings.d/rhsm.yml` and set:

```yaml
:enable: https
:rhsm_base_url: https://rhsm.example.com/
```

## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) 2020 Ewoud Kohl van Wijngaarden

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

