# Atlas Labs CAD-to-CAD integration software. This program runs on customer sites and synchronizes 
# Computer aided dispatch systems between different vendors

{% set SOURCE_PATH = 'https://ota.atlaslabs.io/downloads/windows' %}
{% set INSTALL_PATH = '%ProgramFiles%\Atlas Labs LLC\InterCAD' %}
{% set VERSIONS = (('2.4.5.45', '{00691248-2E17-4C9D-A2F7-692B89428373}'),
                   ('2.4.2.36', '{A8E14B50-E473-4843-B115-3C02F69F14CC}'),
                   ('2.4.0.28', '{56E1C228-BE33-4FF0-80C6-DA7B1EF1DB0C}'),
                   ('2.3.2.26', '{E3148BD3-11F9-4691-A554-C849246C7C12}'),
                   ('2.1.7.6', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.1.6.5', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.1.4.1', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}')
                  ) %}

intercad:
  'test':
    full_name: 'Atlas Labs InterCAD {{ pillar['intercad']['version'] }}'
    installer: '{{ SOURCE_PATH }}/InterCAD-v{{ pillar['intercad']['version'] }}'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart APPDIR="{{ INSTALL_PATH }}\{{ pillar['intercad']['version'] }}"'
    uninstall_flags: '/x {99430955-15B6-42DE-B9E8-D8C21D21F0A1} /qn /quiet /norestart'
    msiexec: False
    locale: en_US
    reboot: False

  {% for version, guid in VERSIONS %}
  '{{ version }}':
    full_name: 'InterCAD {{ version }}'
    installer: '{{ SOURCE_PATH }}/InterCAD-v{{ version }}.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart /log C:\Atlas.InterCAD-{{ version }}.log APPDIR="{{ INSTALL_PATH }}\{{ version }}"'
    uninstall_flags: '/x {{ guid }} /qn /quiet /norestart /log C:\AtlasInterCAD-v{{ version }}.log'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}

  '2.4.1.30':
    full_name: 'Atlas Labs InterCAD 2.4.1.30'
    installer: '{{ SOURCE_PATH }}/InterCAD-v2.4.1.30'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart APPDIR="{{ INSTALL_PATH }}\2.4.1.30"'
    uninstall_flags: '/x {99430955-15B6-42DE-B9E8-D8C21D21F0A1} /qn /quiet /norestart /log C:\Atlas.InterCAD-2.4.1.30-uninst.log'
    msiexec: False
    locale: en_US
    reboot: False

  '2.3.1.14':
    full_name: 'InterCAD 2.3.1.14'
    installer: '{{ SOURCE_PATH }}/InterCAD-v2.3.1.14.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart /log C:\AtlasInterCAD-v2.3.1.14-install.log'
    uninstall_flags: '/x {E3148BD3-11F9-4691-A554-C849246C7C12} /qn /quiet /norestart /log C:\AtlasInterCAD-v2.3.1.14-uninstall.log'
    msiexec: False
    locale: en_US
    reboot: False
