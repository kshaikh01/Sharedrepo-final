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
    monitors["#{id}/alb/request_count"]["name"] => "request_count_override: #{mock_alb}", # Test override
    monitors["#{id}/alb/target_connection_error_count"]["name"] => "target_connection_error_count: #{mock_alb}",
    monitors["#{id}/alb/target_response_time"]["name"] => "target_response_time: #{mock_alb}",
    monitors["#{id}/custom_alb"]["name"] => "custom_target_connection_error_count: #{mock_alb}", # Test additional custom monitor
    monitors["#{id}/nlb/active_flow_count"]["name"] => "active_flow_count: #{mock_nlb}",
    monitors["#{id}/nlb/processed_bytes"]["name"] => "processed_bytes: #{mock_nlb}",
    monitors["#{id}/nlb/tcpelbreset_count"]["name"] => "tcpelbreset_count: #{mock_nlb}",
    monitors["#{id}/apigatewayv2/4xx"]["name"] => "4xx: #{mock_nlb}",
    monitors["#{id}/apigatewayv2/5xx"]["name"] => "5xx: #{mock_apigatewayv2}"
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