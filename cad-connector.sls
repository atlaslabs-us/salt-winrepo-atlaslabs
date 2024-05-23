# Atlas Labs CAD integration software. This program runs on customer sites and synchronizes 
# Computer aided dispatch information with the Atlas Labs MobileCAD server

{% set SOURCE_PATH = 'https://ota.atlaslabs.io/downloads/windows' %}
{% set PROGRAM_FILES = "%Program Files%" %}
{% set VERSIONS = (('2.4.10.5198', '{FAADE8B1-CE88-4840-93DC-C96E0F6FEC79}'), 
                   ('2.4.9.14', '{D5C2644D-0089-4C8C-AEED-6AAA0EA83839}'), 
                   ('2.4.6.2', '{32E06E8A-2226-4619-B981-1E4C233DADB2}'), 
                   ('2.4.6.1', '{32E06E8A-2226-4619-B981-1E4C233DADB2}'), 
                   ('2.4.6.0', '{32E06E8A-2226-4619-B981-1E4C233DADB2}'), 
                   ('2.4.4.0', '{32E06E8A-2226-4619-B981-1E4C233DADB2}') 
                  ) %}
cad-connector:
  'latest':
    full_name: 'CAD Connector'
    installer: '{{ SOURCE_PATH }}/CADConnector-v2.4.10.5198.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart /Li "C:\\Atlas Labs LLC\\CADConnector-2.4.10.5198.log"'
    uninstall_flags: '/x {D5C2644D-0089-4C8C-AEED-6AAA0EA83839} /qn /quiet /norestart'
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
