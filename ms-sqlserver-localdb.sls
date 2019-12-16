# Microsoft SQL Server
{% set arch = 'win64' if grains['cpuarch'] == 'AMD64' else 'win32' %}
{% set PROGRAM_FILES = "%Program Files%" %}

ms-sqlserver-localdb:
  '12.0.2000.8': &ms-sqlserver-localdb
    full_name: 'Microsoft SQL Server 2014 Express LocalDB '
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/E/A/E/EAE6F7FC-767A-4038-A954-49B8B05D04EB/LocalDB%2064BIT/SqlLocalDB.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/E/A/E/EAE6F7FC-767A-4038-A954-49B8B05D04EB/LocalDB%2032BIT/SqlLocalDB.msi'
    {% endif %}
    install_flags: &flags
      /qn
      /norestart
      IACCEPTSQLLOCALDBLICENSETERMS=YES
    uninstall_flags: '/S'
    msiexec: True
    locale: en_US
    reboot: False