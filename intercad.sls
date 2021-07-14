# Atlas Labs CAD-to-CAD integration software. This program runs on customer sites and synchronizes 
# Computer aided dispatch systems between different vendors

{% set SOURCE_PATH = 'http://cdn1.atlaslabs.io/downloads/windows' %}
{% set PROGRAM_FILES = "%Program Files%" %}
{% set VERSIONS = (('2.1.4.1', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}'),
                   ('2.1.5.3', '{5A872D2F-98A0-4182-BAF0-EC3DDE00C324}')
                  ) %}

intercad:
  'latest':
    full_name: 'InterCAD'
    installer: '{{ SOURCE_PATH }}/InterCAD-v2.1.5.3.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart'
    uninstall_flags: '/x {5A872D2F-98A0-4182-BAF0-EC3DDE00C324} /qn /quiet /norestart'
    msiexec: False
    locale: en_US
    reboot: False

  {% for version, guid in VERSIONS %}
  '{{ version }}':
    full_name: 'InterCAD'
    installer: '{{ SOURCE_PATH }}/InterCAD-v{{ version }}.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart'
    uninstall_flags: '/x {{ guid }} /qn /quiet /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}