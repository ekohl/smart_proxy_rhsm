require 'test_helper'
require 'root/root_v2_api'
require 'smart_proxy_rhsm'
require 'rack/test'

class RhsmFeaturesTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::PluginInitializer.new(Proxy::Plugins.instance).initialize_plugins
    Proxy::RootV2Api.new
  end

  def test_features
    Proxy::DefaultModuleLoader.any_instance.expects(:load_configuration_file).with('rhsm.yml')
                              .returns(enabled: true, rhsm_base_url: 'https://rhsm.example.com')

    get '/features'

    response = JSON.parse(last_response.body)

    mod = response['rhsm']
    refute_nil(mod)
    assert_equal('running', mod['state'], Proxy::LogBuffer::Buffer.instance.info[:failed_modules][:rhsm])
    assert_equal([], mod['capabilities'])

    expected_settings = { 'rhsm_base_url' => 'https://rhsm.example.com' }
    assert_equal(expected_settings, mod['settings'])
  end
end
