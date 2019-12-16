# just 64-bit x86 installer used for now.
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
    {% set EXTENSION = 'Installer.x64.exe' %}
    {% set NAME_SUFFIX = '(64-bit x64)' %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
    {% set EXTENSION = 'Installer.exe' %}
    {% set NAME_SUFFIX = '(32-bit x86)' %}
{% endif %}
npp_x64:
  {% for version in ['7.8.9', '7.8.8'] %}
  {% set maj_version = version[0] ~ '.x' %}
  '{{ version }}':
    full_name: 'Notepad++ {{ NAME_SUFFIX }}'
    installer: 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.{{ EXTENSION }}'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
