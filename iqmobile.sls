# IQMobile MCT software

{% set SOURCE_PATH = 'http://ota.atlaslabs.io/downloads/windows' %}
{% set INSTALL_PATH = "C:\iqmobilev4" %}
{% set VERSIONS = (('4.4.2E', 'iqmobile442E_scu_setup.exe', 'RadioMobile Mobile Applications 4.4.2E'),
                   ('4.4.2F', 'iqmobile442F_scu_amb_setup.exe', 'RadioMobile Mobile Applications 4.4.2F-AMB')
                  ) %}

iqmobile:
  {% for version, exe, name in VERSIONS %}
  '{{ version }}':
    full_name: '{{ name }}'
    installer: '{{ SOURCE_PATH }}/{{ exe }}'
    uninstaller: '{{ INSTALL_PATH }}\unins000.exe'
    install_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /MERGETASKS=!RUNCODE /LOG={{ INSTALL_PATH }}\install.log'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
