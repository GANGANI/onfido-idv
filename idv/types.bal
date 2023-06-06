import ballerina/http;

public type OkVerificationPostResponse record {|
    *http:Ok;
    VerificationPostResponse[] body;
|};

public type BadRequestError record {|
    *http:BadRequest;
    Error body;
|};

public type InternalServerErrorError record {|
    *http:InternalServerError;
    Error body;
|};

public type ClaimMetadata record {
};

public type Error record {
    string code?;
    string message?;
    string description?;
    string traceId?;
};

public type VerificationClaimResponse record {
    string id?;
    string uri?;
    boolean isVerified?;
    string idVProviderId?;
    ClaimMetadata claimMetadata?;
};

public type VerifyRequest record {
    string userId?;
    string idVProviderId?;
    string[] claims?;
    ProviderProperty[] properties;
};

public type ProviderProperty record {
    string 'key?;
    string value?;
};

public type VerificationPostResponse record {
    string idVProviderId?;
    VerificationClaimResponse[] claims?;
};
