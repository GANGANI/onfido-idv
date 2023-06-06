import ballerina/http;
import ballerina/io;

listener http:Listener ep0 = new (9443);

service / on ep0 {
    # Initiate Onfido Identity Verification
    #
    # + payload - Verify an identity 
    # + return - returns can be any of following types
    # VerificationPostResponse[] (Accepted)
    # OkVerificationPostResponse (Successful operation)
    # BadRequestError (Bad request)
    # http:Unauthorized (Unauthorized)
    # http:Forbidden (Forbidden)
    # InternalServerErrorError (Server Error)
    resource function post t/'carbon\.super/idv/onfido/verify(@http:Payload VerifyRequest payload) returns VerificationPostResponse[]|OkVerificationPostResponse|BadRequestError|http:Unauthorized|http:Forbidden|InternalServerErrorError|error {
    
        ClaimMetadata claimMetadata = {
                };
                VerificationClaimResponse verificationClaimResponse = {
                    id: "aHR0cDovL3dzbzIub3JnL2NsYWltcy91c2VybmFtZQ",
                    uri: "http://wso2.org/claims/dob",
                    isVerified: true,
                    idVProviderId: "2159375-r567-8524-a456-5566424414527",
                    claimMetadata: claimMetadata
                };
                VerificationClaimResponse[1] VerificationClaimResponseArray = [verificationClaimResponse];
                VerificationPostResponse verificationPostResponse = {
                    idVProviderId: "2159375-r567-8524-a456-5566424414527",
                    claims: VerificationClaimResponseArray
                };
                VerificationPostResponse[1] verificationPostResponseArray = [verificationPostResponse];
                
        do {
            ProviderProperty[] providerProperties = payload.properties;
            foreach ProviderProperty providerProperty in providerProperties {
                if providerProperty.'key == "STATUS" {
                    if providerProperty.value == "INITIATED" {
                        http:Client appicantEndpoint = check new ("https://api.eu.onfido.com");
                        json idvApplicant = check appicantEndpoint->post("/v3.6/applicants",
                            {
                                "first_name": "Jane",
                                "last_name": "Smith"
                            },
                            headers = {
                                "Accept": "application/json",
                                "Authorization": "Token token=api_live.p3twKh-jOVI.bCtxfF5828xOq37cRTQ7HelReiOjpw_3"
                            }
                        );
                        io:println(idvApplicant);

                        http:Client sdkEndpoint = check new ("https://api.eu.onfido.com");
                        json onfidoSdk = check sdkEndpoint->post("/v3.6/applicants",
                            {
                                "first_name": "Jane",
                                "last_name": "Smith"
                            },
                            headers = {
                                "Accept": "application/json",
                                "Authorization": "Token token=api_live.p3twKh-jOVI.bCtxfF5828xOq37cRTQ7HelReiOjpw_3"
                            }
                        );
                        io:println(onfidoSdk);
                    }
                    if providerProperty.value == "COMPLETED" {
                        http:Client checkEndpoint = check new ("https://api.eu.onfido.com");
                        json onfidoCheck = check checkEndpoint->post("/v3.6/check",
                            {
                                "applicant_id": "Jane",
                                "report_names": "Smith"
                            },
                            headers = {
                                "Accept": "application/json",
                                "Authorization": "Token token=api_live.p3twKh-jOVI.bCtxfF5828xOq37cRTQ7HelReiOjpw_3"
                            }
                        );
                        io:println(onfidoCheck);
                    }
                }
                
            return verificationPostResponseArray;
            } 
        } {
            return verificationPostResponseArray;
        }
    }
}
