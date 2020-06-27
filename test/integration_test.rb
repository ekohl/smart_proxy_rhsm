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

  def mock_config(**config)
    Proxy::DefaultModuleLoader.any_instance.expects(:load_configuration_file).with('rhsm.yml').returns(**config)
  end

  def test_features_invalid_url
    mock_config(enabled: true)

    get '/features'

    response = JSON.parse(last_response.body)

    mod = response['rhsm']
    refute_nil(mod)
    assert_equal('failed', mod['state'], Proxy::LogBuffer::Buffer.instance.info[:failed_modules][:rhsm])
  end

  def test_features_valid_running
    mock_config(enabled: true, rhsm_base_url: 'https://rhsm.example.com')

    get '/features'

    response = JSON.parse(last_response.body)

    mod = response['rhsm']
    refute_nil(mod)
    assert_equal('running', mod['state'], Proxy::LogBuffer::Buffer.instance.info[:failed_modules][:rhsm])
  end

  def test_features_valid_capabilities
    mock_config(enabled: true, rhsm_base_url: 'https://rhsm.example.com')

    get '/features'

    response = JSON.parse(last_response.body)

    mod = response['rhsm']
    refute_nil(mod)
    assert_equal([], mod['capabilities'])
  end

  def test_features_valid_settings
    mock_config(enabled: true, rhsm_base_url: 'https://rhsm.example.com')

    get '/features'

    response = JSON.parse(last_response.body)

    mod = response['rhsm']
    refute_nil(mod)
    expected_settings = { 'rhsm_base_url' => 'https://rhsm.example.com' }
    assert_equal(expected_settings, mod['settings'])
  end
end
