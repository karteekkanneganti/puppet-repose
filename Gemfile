source ENV['GEM_SOURCE'] || "https://rubygems.org"

def location_for(place, fake_version = nil)
  if place =~ /^(git[:@][^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false }]
  else
    [place, { :require => false }]
  end
end

group :development, :test do
  gem 'CFPropertyList', '~>2.2.0',                        :require => false
  gem 'activesupport', '~>3.2.0',                         :require => false
  gem 'addressable', '~>2.3.0',                           :require => false
  gem 'autoparse', '~>0.3.0',                             :require => false
  gem 'aws-sdk', '~>1.66.0',                              :require => false
  gem 'aws-sdk-v1', '~>1.66.0',                           :require => false
  gem 'builder', '~>3.2.0',                               :require => false
  gem 'coderay', '~>1.1.0',                               :require => false
  gem 'diff-lcs', '~>1.2.0',                              :require => false
  gem 'docile', '~>1.1.0',                                :require => false
  gem 'docker-api', '~>1.31.0',                           :require => false
  gem 'excon', '~>0.52.0',                                :require => false
  gem 'extlib', '~>0.9.0',                                :require => false
  gem 'facterdb', '~>0.3.0',                              :require => false
  gem 'faraday', '~>0.9.0',                               :require => false
  gem 'fission', '~>0.5.0',                               :require => false
  gem 'fog', '~>1.34.0',                                  :require => false
  gem 'fog-atmos', '~>0.1.0',                             :require => false
  gem 'fog-aws', '~>0.11.0',                              :require => false
  gem 'fog-brightbox', '~>0.11.0',                        :require => false
  gem 'fog-core', '~>1.42.0',                             :require => false
  gem 'fog-dynect', '~>0.0.0',                            :require => false
  gem 'fog-ecloud', '~>0.3.0',                            :require => false
  gem 'fog-google', '~>0.0.0',                            :require => false
  gem 'fog-json', '~>1.0.0',                              :require => false
  gem 'fog-local', '~>0.3.0',                             :require => false
  gem 'fog-powerdns', '~>0.1.0',                          :require => false
  gem 'fog-profitbricks', '~>0.0.0',                      :require => false
  gem 'fog-radosgw', '~>0.0.0',                           :require => false
  gem 'fog-riakcs', '~>0.1.0',                            :require => false
  gem 'fog-sakuracloud', '~>1.7.0',                       :require => false
  gem 'fog-serverlove', '~>0.1.0',                        :require => false
  gem 'fog-softlayer', '~>1.1.0',                         :require => false
  gem 'fog-storm_on_demand', '~>0.1.0',                   :require => false
  gem 'fog-terremark', '~>0.1.0',                         :require => false
  gem 'fog-vmfusion', '~>0.1.0',                          :require => false
  gem 'fog-voxel', '~>0.1.0',                             :require => false
  gem 'fog-xml', '~>0.1.0',                               :require => false
  gem 'formatador', '~>0.2.0',                            :require => false
  gem 'google-api-client', '~>0.8.0',                     :require => false
  gem 'googleauth', '~>0.5.0',                            :require => false
  gem 'hiera', '~>1.3.0',                                 :require => false
  gem 'hocon', '<0.9.0',                                  :require => false
  gem 'i18n', '~>0.6.0',                                  :require => false
  gem 'inflecto', '~>0.0.0',                              :require => false
  gem 'inifile', '~>2.0.0',                               :require => false
  gem 'ipaddress', '~>0.8.0',                             :require => false
  gem 'jgrep', '~>1.4.0',                                 :require => false
  gem 'json', '~>1.8.0',                                  :require => false
  gem 'json_pure', '~>1.8.0',                             :require => false
  gem 'jwt', '~>1.5.0',                                   :require => false
  gem 'launchy', '~>2.4.0',                               :require => false
  gem 'little-plugger', '~>1.1.0',                        :require => false
  gem 'logging', '~>2.1.0',                               :require => false
  gem 'mcollective-client', '~>2.9.0',                    :require => false
  gem 'memoist', '~>0.15.0',                              :require => false
  gem 'metaclass', '~>0.0.0',                             :require => false
  gem 'metadata-json-lint', '~>0.0.0',                    :require => false
  gem 'method_source', '~>0.8.0',                         :require => false
  gem 'mime-types', '~>1.25.0',                           :require => false
  gem 'minitest', '~>5.9.0',                              :require => false
  gem 'mocha', '~>1.1.0',                                 :require => false
  gem 'multi_json', '~>1.12.0',                           :require => false
  gem 'multipart-post', '~>2.0.0',                        :require => false
  gem 'net-scp', '~>1.2.0',                               :require => false
  gem 'net-ssh', '~>2.9.0',                               :require => false
  gem 'net-telnet', '~>0.1.0',                            :require => false
  gem 'nokogiri', '~>1.5.0',                              :require => false
  gem 'open_uri_redirections', '~>0.2.0',                 :require => false
  gem 'os', '~>0.9.0',                                    :require => false
  gem 'pry', '~>0.10.0',                                  :require => false
  gem 'puppet-lint', '~>1.1.0',                           :require => false
  gem 'puppet-lint-absolute_classname-check', '~>0.2.0',  :require => false
  gem 'puppet-lint-absolute_template_path', '~>1.0.0',    :require => false
  gem 'puppet-lint-leading_zero-check', '~>0.1.0',        :require => false
  gem 'puppet-lint-numericvariable', '~>1.0.0',           :require => false
  gem 'puppet-lint-param-docs', '~>1.4.0',                :require => false
  gem 'puppet-lint-trailing_newline-check', '~>1.0.0',    :require => false
  gem 'puppet-lint-unquoted_string-check', '~>0.3.0',     :require => false
  gem 'puppet-lint-variable_contains_upcase', '~>1.0.0',  :require => false
  gem 'puppet-syntax', '~>2.1.0',                         :require => false
  gem 'puppet_facts', '~>0.2.0',                          :require => false
  gem 'puppetlabs_spec_helper', '~>1.1.0',                :require => false
  gem 'rainbow', '~>1.99.0',                              :require => false
  gem 'rake', '~>10.5.0',                                 :require => false
  gem 'rbvmomi', '~>1.9.0',                               :require => false
  gem 'require_all', '~>1.3.0',                           :require => false
  gem 'retriable', '~>1.4.0',                             :require => false
  gem 'rspec', '~>3.0.0',                                 :require => false
  gem 'rspec-core', '~>3.0.0',                            :require => false
  gem 'rspec-expectations', '~>3.0.0',                    :require => false
  gem 'rspec-its', '~>1.2.0',                             :require => false
  gem 'rspec-mocks', '~>3.0.0',                           :require => false
  gem 'rspec-puppet', '~>2.2.0',                          :require => false
  gem 'rspec-puppet-augeas', '~>0.4.0',                   :require => false
  gem 'rspec-puppet-facts', '~>1.6.0',                    :require => false
  gem 'rspec-puppet-utils', '~>2.2.0',                    :require => false
  gem 'rspec-support', '~>3.0.0',                         :require => false
  gem 'rsync', '~>1.0.0',                                 :require => false
  gem 'ruby-augeas', '~>0.5.0',                           :require => false
  gem 'sfl', '~>2.0',                                     :require => false
  gem 'signet', '~>0.7.0',                                :require => false
  gem 'simplecov', '~>0.12.0',                            :require => false
  gem 'simplecov-html', '~>0.10.0',                       :require => false
  gem 'slop', '~>3.6.0',                                  :require => false
  gem 'spdx-licenses', '~>1.1.0',                         :require => false
  gem 'specinfra', '~>2.61.0',                            :require => false
  gem 'stomp', '~>1.4.0',                                 :require => false
  gem 'stringify-hash', '~>0.0.0',                        :require => false
  gem 'systemu', '~>2.6.0',                               :require => false
  gem 'trollop', '~>2.1.0',                               :require => false
  gem 'unf', '~>0.1.0',                                   :require => false
  gem 'unf_ext', '~>0.0.7.0',                             :require => false
  gem 'unicode-display_width', '~>0.3.0',                 :require => false
  gem 'yarjuf', '~>2.0.0',                                :require => false
end

group :system_test do
  gem 'serverspec', '~>2.36.0',     :require => false
  gem 'beaker', '~>2.29.0',         :require => false
  gem 'beaker-answers', '~>0.4.0',  :require => false
  gem 'beaker-hiera', '~>0.1.0',    :require => false
  if beaker_version = ENV['BEAKER_VERSION']
    gem 'beaker', *location_for(beaker_version)
  end
  if beaker_rspec_version = ENV['BEAKER_RSPEC_VERSION']
    gem 'beaker-rspec', *location_for(beaker_rspec_version)
  else
    gem 'beaker-rspec',  :require => false
  end
end



if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', '2.4.6',  :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', '~>3.8.0', :require => false
end

# vim:ft=ruby
