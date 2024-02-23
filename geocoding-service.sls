# Atlas Labs Geocoding Service for InterCAD incidents

{% set SOURCE_PATH = 'http://ota.atlaslabs.io/downloads/windows' %}
{% set VERSIONS = (('1.0.1.0', '{7EA88FD7-9457-47BF-BBA6-F9DD04D46276}'),
                   ('1.0.2.0', '{7EA88FD7-9457-47BF-BBA6-F9DD04D46276}'),
                   ('1.0.3.0', '{7EA88FD7-9457-47BF-BBA6-F9DD04D46276}'),
                  ) %}

geocoding-service:
  {% for version, guid in VERSIONS %}
  '{{ version }}':
    full_name: 'Atlas Labs Geocoding Service {{ version }}'
    installer: '{{ SOURCE_PATH }}/Atlas.GeocodingService-v{{ version }}.exe'
    uninstaller: 'msiexec'
    install_flags: '/qn /quiet /norestart /log C:\Atlas.GeocodingService-{{ version }}.log'
    uninstall_flags: '/x {{ guid }} /qn /quiet /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
