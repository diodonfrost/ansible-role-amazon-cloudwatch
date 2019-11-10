amazon_cloudwatch_package = 'amazon-cloudwatch-agent'
amazon_cloudwatch_service = 'amazon-cloudwatch-agent'

control 'cloudwatch-01' do
  impact 1.0
  title 'Amazon cloudwatch agent install'
  desc 'Amazon cloudwatch agent should be installed'
  describe package(amazon_cloudwatch_package) do
    it { should be_installed }
  end
end

control 'cloudwatch-02' do
  impact 1.0
  title 'Amazon cloudwatch service'
  desc 'Amazon cloudwatch service should be running and enabled'
  describe service(amazon_cloudwatch_service) do
    it { should be_enabled }
    it { should be_running }
  end
end
