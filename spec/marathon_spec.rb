require 'spec_helper'
require 'marathon'

describe Marathon do
  it 'has a version number' do
    expect(Marathon::VERSION).not_to be nil
  end

  it 'instantiates client' do
    expect(Marathon::Client).to receive(:new).with('somehost')
    described_class.new('somehost')
  end
end
