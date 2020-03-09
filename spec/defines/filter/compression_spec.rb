require 'spec_helper'
describe 'repose::filter::compression', :type => :define do
  let :pre_condition do
    'include repose'
  end
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts
      end

      context 'with ensure absent' do
        let(:title) { 'default' }
        let(:params) { {
          :ensure => 'absent'
        } }
        it {
          should contain_file('/etc/repose/compression.cfg.xml').with_ensure(
            'absent')
        }
      end

      context 'default parameters' do
        let(:title) { 'default' }
        it {
          should contain_file('/etc/repose/compression.cfg.xml').
            with_content(/compression compression-threshold=\"1024\" debug=\"false\" include-content-types=\"text\/html\"/)
        }
      end
    end
  end
end