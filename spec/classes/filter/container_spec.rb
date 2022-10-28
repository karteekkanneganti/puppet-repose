require 'spec_helper'
describe 'repose::filter::container' do
  let :pre_condition do
    'include repose'
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts
      end

      it { is_expected.to compile.with_all_deps }

      ### Tests are currently commented due to unavoidable dependency loop (init->filter->container)

      # context 'with ensure absent' do
      #   let(:title) { 'default' }
      #   let(:params) do
      #     {
      #       ensure: 'absent',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties').with_ensure(
      #       'absent',
      #     )
      #   }
      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml').with_ensure(
      #       'absent',
      #     )
      #   }
      # end

      # context 'with defaults with app_name' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties')
      #       .with_content(%r{log4j\.rootLogger=WARN})
      #       .with_content(%r{log4j\.appender\.defaultFile\.File=\/var\/log\/repose\/app\.log})
      #   }
      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #   }
      # end

      # context 'configure logging' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_dir: '/mypath',
      #       log_level: 'DEBUG',
      #       syslog_server: 'syslog.example.com',
      #       syslog_port: 515,
      #       syslog_protocol: 'tcp',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties')
      #       .with_content(%r{log4j\.appender\.defaultFile\.File=\/mypath\/app\.log})
      #       .with_content(%r{log4j\.rootLogger=DEBUG, syslog, defaultFile})
      #       .with_content(%r{log4j.logger.http=INFO, httpSyslog})
      #       .with_content(%r{syslog.syslogHost=syslog.example.com})
      #       .with_content(%r{syslog.port=515})
      #       .with_content(%r{syslog.protocol=tcp})
      #       .with_content(%r{httpSyslog.syslogHost=syslog.example.com})
      #       .with_content(%r{httpSyslog.port=515})
      #       .with_content(%r{httpSyslog.protocol=tcp})
      #   }
      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #   }
      # end

      # context 'configure container' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       deployment_directory: '/deployment_dir',
      #       deployment_directory_auto_clean: false,
      #       artifact_directory: '/artifact_dir',
      #       artifact_directory_check_interval: 10_000,
      #       logging_configuration: 'mylog4j.properties',
      #       ssl_enabled: true,
      #       ssl_keystore_filename: 'keystore.name',
      #       ssl_keystore_password: 'mypassword',
      #       ssl_key_password: 'keypassword',
      #       ssl_include_cipher: ['include'],
      #       ssl_exclude_cipher: ['exclude'],
      #       ssl_include_protocol: ['include'],
      #       ssl_exclude_protocol: ['exclude'],
      #       ssl_tls_renegotiation: true,
      #       content_body_read_limit: 10_240_000,
      #       jmx_reset_time: 3_600_000,
      #     }
      #   end

      #   it { is_expected.to contain_file('/etc/repose/mylog4j.properties') }
      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #       .with_content(%r{content-body-read-limit="10240000"})
      #       .with_content(%r{jmx-reset-time="3600000"})
      #       .with_content(%r{<deployment-directory auto-clean=\"false\">\/deployment_dir<\/deployment-directory>})
      #       .with_content(%r{<artifact-directory check-interval="10000">\/artifact_dir<\/artifact-directory>})
      #       .with_content(%r{<logging-configuration href="mylog4j.properties"\/>})
      #       .with_content(%r{<ssl-configuration>})
      #       .with_content(%r{<keystore-filename>keystore.name<\/keystore-filename>})
      #       .with_content(%r{<keystore-password>mypassword<\/keystore-password>})
      #       .with_content(%r{<key-password>keypassword<\/key-password>})
      #       .with_content(%r{<included-ciphers>})
      #       .with_content(%r{<excluded-ciphers>})
      #       .with_content(%r{<included-protocols>})
      #       .with_content(%r{<excluded-protocols>})
      #       .with_content(%r{<tls-renegotiation-allowed>true<\/tls-renegotiation-allowed>})
      #       .with_content(%r{<\/ssl-configuration>})
      #   }
      # end

      # context 'configure access log local default settings' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_dir: '/mypath',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties')
      #       .with_content(%r{log4j\.appender\.defaultFile\.File=\/mypath\/app\.log})
      #       .with_content(%r{log4j\.logger\.http=INFO, httpLocal})
      #       .with_content(%r{httpLocal=org\.apache\.log4j\.DailyRollingFileAppender})
      #       .with_content(%r{httpLocal.File=\/mypath\/http_repose\.log})
      #   }
      #   it { is_expected.to contain_file('/etc/repose/container.cfg.xml') }
      # end

      # context 'configure access log local rotation on size' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_local_policy: 'size',
      #       log_local_size: '50MB',
      #       log_local_rotation_count: 2,
      #       log_access_local_name: 'repose_access',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties')
      #       .with_content(%r{log4j\.logger\.http=INFO, httpLocal})
      #       .with_content(%r{httpLocal=org\.apache\.log4j\.RollingFileAppender})
      #       .with_content(%r{httpLocal\.maxFileSize=50MB})
      #       .with_content(%r{httpLocal\.maxBackupIndex=2})
      #       .with_content(%r{httpLocal.File=\/var\/log\/repose\/repose_access\.log})
      #   }
      #   it { is_expected.to contain_file('/etc/repose/container.cfg.xml') }
      # end

      # context 'configure access log syslog only' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_dir: '/mypath',
      #       log_level: 'DEBUG',
      #       syslog_server: 'syslog.example.com',
      #       syslog_port: 515,
      #       syslog_protocol: 'tcp',
      #       log_access_local: false,
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties')
      #       .with_content(%r{log4j\.appender\.defaultFile\.File=\/mypath\/app\.log})
      #       .with_content(%r{log4j\.rootLogger=DEBUG, syslog, defaultFile})
      #       .with_content(%r{log4j.logger.http=INFO, httpSyslog$})
      #       .with_content(%r{syslog.syslogHost=syslog.example.com})
      #       .with_content(%r{syslog.port=515})
      #       .with_content(%r{syslog.protocol=tcp})
      #       .with_content(%r{httpSyslog.syslogHost=syslog.example.com})
      #       .with_content(%r{httpSyslog.port=515})
      #       .with_content(%r{httpSyslog.protocol=tcp})
      #       .with_content(%r{log4j.appender.httpSyslog.Facility=local1})
      #       .without_content(%r{log4j.appender.httpLocal.layout=org.apache.log4j.PatternLayout})
      #   }
      #   it { is_expected.to contain_file('/etc/repose/container.cfg.xml') }
      # end

      # context 'configure repose log to syslog and access to local' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_dir: '/mypath',
      #       log_level: 'DEBUG',
      #       syslog_server: 'syslog.example.com',
      #       syslog_port: 515,
      #       syslog_protocol: 'tcp',
      #       log_access_syslog: false,
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties')
      #       .with_content(%r{log4j\.appender\.defaultFile\.File=\/mypath\/app\.log})
      #       .with_content(%r{log4j\.rootLogger=DEBUG, syslog, defaultFile})
      #       .with_content(%r{syslog.syslogHost=syslog.example.com})
      #       .with_content(%r{syslog.port=515})
      #       .with_content(%r{syslog.protocol=tcp})
      #       .with_content(%r{log4j.logger.http=INFO, httpLocal})
      #       .without_content(%r{httpSyslog.syslogHost=syslog.example.com})
      #       .without_content(%r{httpSyslog.port=515})
      #       .without_content(%r{httpSyslog.protocol=tcp})
      #       .with_content(%r{httpLocal.File=\/mypath\/http_repose.log})
      #       .with_content(%r{log4j.appender.syslog.Facility=local0})
      #   }
      #   it { is_expected.to contain_file('/etc/repose/container.cfg.xml') }
      # end

      # context 'configure syslog facilities' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_dir: '/mypath',
      #       log_level: 'DEBUG',
      #       syslog_server: 'syslog.example.com',
      #       log_access_syslog: true,
      #       log_access_facility: 'local3',
      #       log_repose_facility: 'local4',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j.properties')
      #       .with_content(%r{log4j\.appender\.defaultFile\.File=\/mypath\/app\.log})
      #       .with_content(%r{log4j\.rootLogger=DEBUG, syslog, defaultFile})
      #       .with_content(%r{syslog.syslogHost=syslog.example.com})
      #       .with_content(%r{syslog.port=514})
      #       .with_content(%r{log4j.logger.http=INFO, httpSyslog, httpLocal})
      #       .with_content(%r{httpSyslog.syslogHost=syslog.example.com})
      #       .with_content(%r{httpSyslog.port=514})
      #       .with_content(%r{httpLocal.File=\/mypath\/http_repose.log})
      #       .with_content(%r{log4j.appender.syslog.Facility=local4})
      #       .with_content(%r{log4j.appender.httpSyslog.Facility=local3})
      #   }
      #   it { is_expected.to contain_file('/etc/repose/container.cfg.xml') }
      # end

      # context 'configure log4j2' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_use_log4j2: true,
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j2.xml')
      #       .with_content(%r{RollingFile name="defaultFile"})
      #       .with_content(%r{filename="\/var\/log\/repose\/app.log"})
      #       .with_content(%r{filePattern="\/var\/log\/repose\/app.log.%d\{yyyy-MM-dd\}"})
      #       .with_content(%r{RollingFile name="httpLocal"})
      #       .with_content(%r{filename="\/var\/log\/repose\/http_repose.log"})
      #       .with_content(%r{filePattern="\/var\/log\/repose\/http_repose.log.%d\{yyyy-MM-dd\}"})
      #       .with_content(%r{Root level="WARN"})
      #       .with_content(%r{AppenderRef ref="defaultFile"})
      #       .with_content(%r{Logger name="http" level="info"})
      #       .with_content(%r{AppenderRef ref="httpLocal"})
      #       .with_content(%r{Logger name="intrafilter-logging" level="info"})
      #       .with_content(%r{Logger name="org.openrepose" level="info"})
      #       .with_content(%r{Logger name="org.apache.http.wire" level="off"})
      #   }
      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #       .with_content(%r{logging-configuration href="file:\/\/\/etc\/repose\/log4j2.xml"})
      #   }
      # end

      # context 'configure log4j2 log_local_policy is size' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_use_log4j2: true,
      #       log_local_policy: 'size',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j2.xml')
      #       .with_content(%r{RollingFile name="defaultFile"})
      #       .with_content(%r{filename="\/var\/log\/repose\/app.log"})
      #       .with_content(%r{filePattern="\/var\/log\/repose\/app.log.%i"})
      #       .with_content(%r{SizeBasedTriggeringPolicy size=\"100MB\"})
      #       .with_content(%r{DefaultRolloverStrategy max="4"})
      #       .with_content(%r{RollingFile name="httpLocal"})
      #       .with_content(%r{filename="\/var\/log\/repose\/http_repose.log"})
      #       .with_content(%r{filePattern="\/var\/log\/repose\/http_repose.log.%i"})
      #       .with_content(%r{Root level="WARN"})
      #       .with_content(%r{AppenderRef ref="defaultFile"})
      #       .with_content(%r{Logger name="http" level="info"})
      #       .with_content(%r{AppenderRef ref="httpLocal"})
      #   }

      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #       .with_content(%r{logging-configuration href="file:\/\/\/etc\/repose\/log4j2.xml"})
      #   }
      # end

      # context 'configure log4j2 without log_access_local' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_use_log4j2: true,
      #       log_access_local: false,
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j2.xml')
      #       .with_content(%r{RollingFile name="defaultFile"})
      #       .with_content(%r{filename="\/var\/log\/repose\/app.log"})
      #       .with_content(%r{filePattern="\/var\/log\/repose\/app.log.%d\{yyyy-MM-dd\}"})
      #       .without_content(%r{RollingFile name="httpLocal"})
      #       .with_content(%r{Root level="WARN"})
      #       .with_content(%r{AppenderRef ref="defaultFile"})
      #       .with_content(%r{Logger name="http" level="info"})
      #       .without_content(%r{AppenderRef ref="httpLocal"})
      #   }

      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #       .with_content(%r{logging-configuration href="file:\/\/\/etc\/repose\/log4j2.xml"})
      #   }
      # end

      # context 'configure log4j2 with syslog' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_use_log4j2: true,
      #       syslog_server: 'syslog.example.com',
      #       syslog_port: 515,
      #       syslog_protocol: 'tcp',
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j2.xml')
      #       .with_content(%r{RollingFile name="defaultFile"})
      #       .with_content(%r{Syslog name="syslog" format="RFC5424"})
      #       .with_content(%r{host="syslog.example.com"})
      #       .with_content(%r{port="515"})
      #       .with_content(%r{protocol="tcp"})
      #       .with_content(%r{facility="local0"})
      #       .with_content(%r{Syslog name="httpSyslog" format="RFC5424"})
      #       .with_content(%r{facility="local1"})
      #       .with_content(%r{Root level="WARN"})
      #       .with_content(%r{AppenderRef ref="defaultFile"})
      #       .with_content(%r{AppenderRef ref="syslog"})
      #       .with_content(%r{Logger name="http" level="info"})
      #       .with_content(%r{AppenderRef ref="httpLocal"})
      #       .with_content(%r{AppenderRef ref="httpSyslog"})
      #   }

      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #       .with_content(%r{logging-configuration href="file:\/\/\/etc\/repose\/log4j2.xml"})
      #   }
      # end

      # context 'configure log4j2 with intrafilter trace logging true' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       log_use_log4j2: true,
      #       log_intrafilter_trace: true,
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/log4j2.xml')
      #       .with_content(%r{RollingFile name="defaultFile"})
      #       .with_content(%r{filename="\/var\/log\/repose\/app.log"})
      #       .with_content(%r{filePattern="\/var\/log\/repose\/app.log.%d\{yyyy-MM-dd\}"})
      #       .with_content(%r{RollingFile name="httpLocal"})
      #       .with_content(%r{filename="\/var\/log\/repose\/http_repose.log"})
      #       .with_content(%r{filePattern="\/var\/log\/repose\/http_repose.log.%d\{yyyy-MM-dd\}"})
      #       .with_content(%r{Root level="WARN"})
      #       .with_content(%r{AppenderRef ref="defaultFile"})
      #       .with_content(%r{Logger name="http" level="info"})
      #       .with_content(%r{AppenderRef ref="httpLocal"})
      #       .with_content(%r{Logger name="intrafilter-logging" level="trace"})
      #       .with_content(%r{Logger name="org.openrepose" level="debug"})
      #       .with_content(%r{Logger name="org.apache.http.wire" level="trace"})
      #   }

      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #       .with_content(%r{logging-configuration href="file:\/\/\/etc\/repose\/log4j2.xml"})
      #   }
      # end

      # context 'define via_header option' do
      #   let(:params) do
      #     {
      #       app_name: 'app',
      #       via_header: { 'response-header' => 'Salad', 'repose-version' => 'false' },
      #     }
      #   end

      #   it {
      #     is_expected.to contain_file('/etc/repose/container.cfg.xml')
      #       .with_content(%r{response-header="Salad"})
      #       .with_content(%r{repose-version="false"})
      #   }
      # end
    end
  end
end
