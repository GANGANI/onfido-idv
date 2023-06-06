import ballerina/http;

listener http:Listener ep0 = new (9443, config = {host: "localhost"});

service /idv/onfido on ep0 {
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
    resource function post verify(@http:Payload VerifyRequest payload) returns VerificationPostResponse[]|OkVerificationPostResponse|BadRequestError|http:Unauthorized|http:Forbidden|InternalServerErrorError {
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
    return verificationPostResponseArray;
        
    }
}