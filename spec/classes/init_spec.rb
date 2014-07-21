require 'spec_helper'

describe 'syslog_ng' do

  context 'With not default params' do
    let(:params) {{
      :config_file => '/tmp/puppet-test/syslog-ng.conf',
      :sbin_path => '/home/tibi/install/syslog-ng',
      :purge_syslog_ng_conf => true
    }}
    it {
      should contain_file('/tmp/puppet-test/syslog-ng.conf')
      should contain_package('syslog-ng-core')
      should contain_service('syslog-ng')
    }
  end
end
