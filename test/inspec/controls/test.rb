# Read from output file
file_name = "output.json"
json_file = inspec.profile.file(file_name)
attributes = JSON.parse(json_file)

id = attributes['id']
mock_resource_ids = attributes['mock_resource_ids']
monitors = attributes['monitors']
empty_monitors = attributes['empty_monitors']

comparisons = {
    monitors["#{id}/alb/httpcode_elb_5xx"]["name"] => "alb.HTTPCode_elb_5XX.override: #{mock_resource_ids["#{id}_alb"]}", # Test override
    monitors["#{id}/alb/target_connection_error_count"]["name"] => "alb.target_connection_error_count: #{mock_resource_ids["#{id}_alb"]}",
    monitors["#{id}/custom_alb"]["name"] => "alb.custom_target_connection_error_count: #{mock_resource_ids["#{id}_alb"]}", # Test additional custom monitor
    monitors["#{id}/nlb/tcpelbreset_count"]["name"] => "nlb.tcpelbreset_count: #{mock_resource_ids["#{id}_nlb"]}",
    monitors["#{id}/apigatewayv2/4xx"]["name"] => "apigatewayv2.4xx: #{mock_resource_ids["#{id}_apigatewayv2"]}",
    monitors["#{id}/apigatewayv2/5xx"]["name"] => "apigatewayv2.5xx: #{mock_resource_ids["#{id}_apigatewayv2"]}"
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