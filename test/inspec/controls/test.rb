# Read from output file
file_name = "output.json"
json_file = inspec.profile.file(file_name)
attributes = JSON.parse(json_file)

id = attributes['id']
mock_alb = attributes['mock_alb']
mock_nlb = attributes['mock_nlb']
mock_apigatewayv2 = attributes['mock_apigatewayv2']
monitors = attributes['monitors']
empty_monitors = attributes['empty_monitors']

comparisons = {
    monitors["#{id}/alb/httpcode_elb_5xx"]["name"] => "HTTPCode_elb_5XX: #{mock_alb}",
    monitors["#{id}/alb/request_count"]["name"] => "request_count_override: #{mock_alb}"
}

#--------------------------------------
control 'datadog_catalog' do
    impact 1.0
    title 'Test catalog outputs'

    describe empty_monitors.empty? do
        it { should cmp true }
    end

    comparisons.each do |key, val|
        describe key do
            it { should cmp val }
        end
    end
end  