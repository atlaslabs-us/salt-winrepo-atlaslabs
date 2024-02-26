# Atlas Labs CAD-to-CAD integration software. This program runs on customer sites and synchronizes 
# Computer aided dispatch systems between different vendors

{% set SOURCE_PATH = 'https://ota.atlaslabs.io/downloads/windows' %}
{% set PROGRAM_FILES = "%Program Files%" %}
{% set VERSIONS = (('2.1.4.1', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.1.6.5', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.1.7.6', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.3.0.9', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.3.1.10', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.3.1.14', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.3.2.20', '{E3148BD3-11F9-4691-A554-C849246C7C12}'),
                   ('2.3.2.26', '{E3148BD3-11F9-4691-A554-C849246C7C12}')
                  ) %}

intercad:
  'latest':
    full_name: 'Atlas Labs InterCAD'
    installer: '{{ SOURCE_PATH }}/InterCAD-v2.1.7.6.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart /log C:\Atlas.InterCAD-2.1.7.6'
    uninstall_flags: '/x {5A872D2F-98A0-4182-BAF0-EC3DDE00C324} /qn /quiet /norestart'
    msiexec: False
    locale: en_US
    reboot: False

  '2.3.2.20':
    full_name: 'InterCAD'
    installer: '{{ SOURCE_PATH }}/InterCAD-v2.3.2.20.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart /fa REINSTALL=all REINSTALLMODE=A'
    uninstall_flags: '/x {E3148BD3-11F9-4691-A554-C849246C7C12} /qn /quiet /norestart /log C:\AtlasInterCAD-v2.3.2.20.log'
    msiexec: False
    locale: en_US
    reboot: False

  '2.3.2.26':
    full_name: 'InterCAD'
    installer: '{{ SOURCE_PATH }}/InterCAD-v2.3.2.26.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart /log C:\AtlasInterCAD-v2.3.2.26-install.log'
    uninstall_flags: '/x {E3148BD3-11F9-4691-A554-C849246C7C12} /qn /quiet /norestart /log C:\AtlasInterCAD-v2.3.2.26-uninstall.log'
    msiexec: False
    locale: en_US
    reboot: False

#  {% for version, guid in VERSIONS %}
#  '{{ version }}':
#    full_name: 'Atlas Labs InterCAD'
#    installer: '{{ SOURCE_PATH }}/InterCAD-v{{ version }}.exe'
#    uninstaller: 'msiexec'
#    install_flags: '/qn /quiet /norestart /log C:\Atlas.InterCAD-{{ version }}.log'
#    uninstall_flags: '/x {{ guid }} /qn /quiet /norestart /log C:\AtlasInterCAD-v{{ version }}.log'
#    msiexec: False
#    locale: en_US
#    reboot: False
#  {% endfor %}
