RSpec.describe API do
  before do
    allow(Logger).to receive(:new).and_return(Rails.logger)
  end

  let(:request_url) { 'test_url' }
  let(:request) { API::Request.new(request_url) }

  it 'returns success response' do
    response = instance_double('Faraday::Response', body: { base: 'EUR' }.to_json)
    allow(request.connection).to receive(:get).and_return(response)
    expect(request.call.success?).to be_truthy
  end

  context 'when Errno::ETIMEDOUT raised' do
    it 'returns error response' do
      allow(request.connection).to receive(:get).and_raise(Errno::ETIMEDOUT)
      expect(request.call.success?).to be_falsey
    end
  end

  context 'when Faraday::Error raised' do
    it 'returns error response' do
      allow(request.connection).to receive(:get).and_raise(Faraday::Error)
      expect(request.call.success?).to be_falsey
    end
  end

  context 'when response body has incorrect format' do
    it 'returns error response' do
      response = instance_double('Faraday::Response', body: 'Incorrect JSON')
      allow(request.connection).to receive(:get).and_return(response)
      expect(request.call.success?).to be_falsey
    end
  end
end
