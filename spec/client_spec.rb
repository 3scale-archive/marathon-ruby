require 'spec_helper'

RSpec.describe Marathon::Client do

  let(:subject) { described_class.new 'http://localhost:8090' }
  let(:invalid_response_error) { Marathon::Client::InvalidResponseError }

  describe '#get_app' do
    it 'gets application' do
      stub_request(:get, 'http://localhost:8090/v2/apps/some-id').
          to_return(status: 200, body: '{"id": "some-id"}')

      app = subject.get_app('/some-id')
      expect(app).to eq('id' => 'some-id')

      app = subject.get_app('some-id')
      expect(app).to eq('id' => 'some-id')
    end

    it 'raises exception on error' do
      stub_request(:get, 'http://localhost:8090/v2/apps/some-id').
          to_return(status: 404)

      expect { subject.get_app('/some-id') }.
          to raise_error(invalid_response_error)
    end
  end

  describe '#create_app' do
    it 'creates application' do
      stub_request(:post, 'http://localhost:8090/v2/apps').
          with(:body => '{"id":"some-id"}').
          to_return(:status => 200, :body => '{"id":"some-id"}')
      app = subject.create_app(id: 'some-id')
      expect(app).to eq('id' => 'some-id')
    end

    it 'raises exception on error' do
      stub_request(:post, 'http://localhost:8090/v2/apps').
          to_return(status: 404)
      expect { subject.create_app(id: 'some-id') }.
          to raise_error(invalid_response_error)
    end
  end

  describe '#delete_app' do
    it 'deletes an application' do
      stub_request(:delete, 'http://localhost:8090/v2/apps/some-id').
          to_return(status: 200, body: '{"id": "some-id"}')

      expect(subject.delete_app('some-id')).to eq({"id" => "some-id"})
    end

    it 'raises exception on error' do
      stub_request(:delete, 'http://localhost:8090/v2/apps/some-id').
          to_return(status: 404)

      expect{ subject.delete_app('some-id') }.
          to raise_error(invalid_response_error)
    end
  end

  describe '#update_app' do
    it 'updates an application' do
      stub_request(:put, 'http://localhost:8090/v2/apps/some-id').
          with(:body => '{"property":"potato"}').
          to_return(status: 200, body: '{"id": "some-id", "property":"potato"}')

      expect(subject.update_app('some-id', property: "potato")).
          to eq({"id" => "some-id", "property" => "potato"})
    end

    it 'raises exception on error' do
      stub_request(:put, 'http://localhost:8090/v2/apps/some-id').
          to_return(status: 404)

      expect{ subject.update_app('some-id', foo: 'bar') }.
          to raise_error(invalid_response_error)
    end
  end
end
