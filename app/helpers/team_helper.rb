module TeamHelper

    NOTIFICATION_URL = "https://run.mocky.io/v3/fd99c100-f88a-4d70-aaf7-393dbbd5d99f"

    def send_notification(phone_number, message = "Too many 5xx!")
        res = call_notification_service(phone_number, message)
        # print JSON.parse(res.body), "\n"
        if res.status != 200
            #log/send error message
            # {success: false, message: "Error in calling notification service"}
            return false
        else
            # {success: true, message: "Message sent"}
            return true
        end
    end

    private

    def call_notification_service(phone_number, message)
        req_body = {"phone_number": "9999999999", "message": "Too many 5xx!"}.to_json
        headers = {"Content-Type" => "application/json"}
        Faraday.post(NOTIFICATION_URL, req_body, headers)
    end
end
