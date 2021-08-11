# Atlas Labs CAD integration software. This program runs on customer sites and synchronizes 
# Computer aided dispatch information with the Atlas Labs MobileCAD server

{% set SOURCE_PATH = 'http://cdn1.atlaslabs.io/downloads/windows' %}
{% set PROGRAM_FILES = "%Program Files%" %}
{% set VERSIONS = (('2.4.7.10', '{32E06E8A-2226-4619-B981-1E4C233DADB2}'), 
                   ('2.4.6.2', '{32E06E8A-2226-4619-B981-1E4C233DADB2}'), 
                   ('2.4.6.1', '{32E06E8A-2226-4619-B981-1E4C233DADB2}'), 
                   ('2.4.6.0', '{32E06E8A-2226-4619-B981-1E4C233DADB2}'), 
                   ('2.4.4.0', '{32E06E8A-2226-4619-B981-1E4C233DADB2}') 
                  ) %}
cad-connector:
  'latest':
    full_name: 'CAD Connector'
    installer: '{{ SOURCE_PATH }}/CADConnector-v2.4.7.10.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart'
    uninstall_flags: '/x {32E06E8A-2226-4619-B981-1E4C233DADB2} /qn /quiet /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% for version, guid in VERSIONS %}
  '{{ version }}':
    full_name: 'CAD Connector'
    installer: '{{ SOURCE_PATH }}/CADConnector-v{{ version }}.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart'
    uninstall_flags: '/x {{ guid }} /qn /quiet /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
