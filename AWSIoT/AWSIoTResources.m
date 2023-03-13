//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSIoTResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSIoTResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSIoTResources

+ (instancetype)sharedInstance {
    static AWSIoTResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSIoTResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2015-05-28\",\
    \"endpointPrefix\":\"iot\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS IoT\",\
    \"serviceId\":\"IoT\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"execute-api\",\
    \"uid\":\"iot-2015-05-28\"\
  },\
  \"operations\":{\
    \"AcceptCertificateTransfer\":{\
      \"name\":\"AcceptCertificateTransfer\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/accept-certificate-transfer/{certificateId}\"\
      },\
      \"input\":{\"shape\":\"AcceptCertificateTransferRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TransferAlreadyCompletedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Accepts a pending certificate transfer. The default state of the certificate is INACTIVE.</p> <p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AcceptCertificateTransfer</a> action.</p>\"\
    },\
    \"AddThingToBillingGroup\":{\
      \"name\":\"AddThingToBillingGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/billing-groups/addThingToBillingGroup\"\
      },\
      \"input\":{\"shape\":\"AddThingToBillingGroupRequest\"},\
      \"output\":{\"shape\":\"AddThingToBillingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds a thing to a billing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AddThingToBillingGroup</a> action.</p>\"\
    },\
    \"AddThingToThingGroup\":{\
      \"name\":\"AddThingToThingGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/thing-groups/addThingToThingGroup\"\
      },\
      \"input\":{\"shape\":\"AddThingToThingGroupRequest\"},\
      \"output\":{\"shape\":\"AddThingToThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds a thing to a thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AddThingToThingGroup</a> action.</p>\"\
    },\
    \"AssociateTargetsWithJob\":{\
      \"name\":\"AssociateTargetsWithJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/jobs/{jobId}/targets\"\
      },\
      \"input\":{\"shape\":\"AssociateTargetsWithJobRequest\"},\
      \"output\":{\"shape\":\"AssociateTargetsWithJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Associates a group with a continuous job. The following criteria must be met: </p> <ul> <li> <p>The job must have been created with the <code>targetSelection</code> field set to \\\"CONTINUOUS\\\".</p> </li> <li> <p>The job status must currently be \\\"IN_PROGRESS\\\".</p> </li> <li> <p>The total number of targets associated with a job must not exceed 100.</p> </li> </ul> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AssociateTargetsWithJob</a> action.</p>\"\
    },\
    \"AttachPolicy\":{\
      \"name\":\"AttachPolicy\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/target-policies/{policyName}\"\
      },\
      \"input\":{\"shape\":\"AttachPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Attaches the specified policy to the specified principal (certificate or other credential).</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AttachPolicy</a> action.</p>\"\
    },\
    \"AttachPrincipalPolicy\":{\
      \"name\":\"AttachPrincipalPolicy\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/principal-policies/{policyName}\"\
      },\
      \"input\":{\"shape\":\"AttachPrincipalPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Attaches the specified policy to the specified principal (certificate or other credential).</p> <p> <b>Note:</b> This action is deprecated and works as expected for backward compatibility, but we won't add enhancements. Use <a>AttachPolicy</a> instead.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AttachPrincipalPolicy</a> action.</p>\",\
      \"deprecated\":true\
    },\
    \"AttachSecurityProfile\":{\
      \"name\":\"AttachSecurityProfile\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/security-profiles/{securityProfileName}/targets\"\
      },\
      \"input\":{\"shape\":\"AttachSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"AttachSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Associates a Device Defender security profile with a thing group or this account. Each thing group or account can have up to five security profiles associated with it.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AttachSecurityProfile</a> action.</p>\"\
    },\
    \"AttachThingPrincipal\":{\
      \"name\":\"AttachThingPrincipal\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/things/{thingName}/principals\"\
      },\
      \"input\":{\"shape\":\"AttachThingPrincipalRequest\"},\
      \"output\":{\"shape\":\"AttachThingPrincipalResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Attaches the specified principal to the specified thing. A principal can be X.509 certificates, Amazon Cognito identities or federated identities.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">AttachThingPrincipal</a> action.</p>\"\
    },\
    \"CancelAuditMitigationActionsTask\":{\
      \"name\":\"CancelAuditMitigationActionsTask\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/audit/mitigationactions/tasks/{taskId}/cancel\"\
      },\
      \"input\":{\"shape\":\"CancelAuditMitigationActionsTaskRequest\"},\
      \"output\":{\"shape\":\"CancelAuditMitigationActionsTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Cancels a mitigation action task that is in progress. If the task is not in progress, an InvalidRequestException occurs.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CancelAuditMitigationActionsTask</a> action.</p>\"\
    },\
    \"CancelAuditTask\":{\
      \"name\":\"CancelAuditTask\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/audit/tasks/{taskId}/cancel\"\
      },\
      \"input\":{\"shape\":\"CancelAuditTaskRequest\"},\
      \"output\":{\"shape\":\"CancelAuditTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Cancels an audit that is in progress. The audit can be either scheduled or on demand. If the audit isn't in progress, an \\\"InvalidRequestException\\\" occurs.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CancelAuditTask</a> action.</p>\"\
    },\
    \"CancelCertificateTransfer\":{\
      \"name\":\"CancelCertificateTransfer\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/cancel-certificate-transfer/{certificateId}\"\
      },\
      \"input\":{\"shape\":\"CancelCertificateTransferRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TransferAlreadyCompletedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Cancels a pending transfer for the specified certificate.</p> <p> <b>Note</b> Only the transfer source account can use this operation to cancel a transfer. (Transfer destinations can use <a>RejectCertificateTransfer</a> instead.) After transfer, IoT returns the certificate to the source account in the INACTIVE state. After the destination account has accepted the transfer, the transfer cannot be cancelled.</p> <p>After a certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to INACTIVE.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CancelCertificateTransfer</a> action.</p>\"\
    },\
    \"CancelDetectMitigationActionsTask\":{\
      \"name\":\"CancelDetectMitigationActionsTask\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/detect/mitigationactions/tasks/{taskId}/cancel\"\
      },\
      \"input\":{\"shape\":\"CancelDetectMitigationActionsTaskRequest\"},\
      \"output\":{\"shape\":\"CancelDetectMitigationActionsTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Cancels a Device Defender ML Detect mitigation action. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CancelDetectMitigationActionsTask</a> action.</p>\"\
    },\
    \"CancelJob\":{\
      \"name\":\"CancelJob\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/jobs/{jobId}/cancel\"\
      },\
      \"input\":{\"shape\":\"CancelJobRequest\"},\
      \"output\":{\"shape\":\"CancelJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Cancels a job.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CancelJob</a> action.</p>\"\
    },\
    \"CancelJobExecution\":{\
      \"name\":\"CancelJobExecution\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/things/{thingName}/jobs/{jobId}/cancel\"\
      },\
      \"input\":{\"shape\":\"CancelJobExecutionRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"VersionConflictException\"}\
      ],\
      \"documentation\":\"<p>Cancels the execution of a job for a given thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CancelJobExecution</a> action.</p>\"\
    },\
    \"ClearDefaultAuthorizer\":{\
      \"name\":\"ClearDefaultAuthorizer\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/default-authorizer\"\
      },\
      \"input\":{\"shape\":\"ClearDefaultAuthorizerRequest\"},\
      \"output\":{\"shape\":\"ClearDefaultAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Clears the default authorizer.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ClearDefaultAuthorizer</a> action.</p>\"\
    },\
    \"ConfirmTopicRuleDestination\":{\
      \"name\":\"ConfirmTopicRuleDestination\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/confirmdestination/{confirmationToken+}\"\
      },\
      \"input\":{\"shape\":\"ConfirmTopicRuleDestinationRequest\"},\
      \"output\":{\"shape\":\"ConfirmTopicRuleDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Confirms a topic rule destination. When you create a rule requiring a destination, IoT sends a confirmation message to the endpoint or base address you specify. The message includes a token which you pass back when calling <code>ConfirmTopicRuleDestination</code> to confirm that you own or have access to the endpoint.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ConfirmTopicRuleDestination</a> action.</p>\"\
    },\
    \"CreateAuditSuppression\":{\
      \"name\":\"CreateAuditSuppression\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/suppressions/create\"\
      },\
      \"input\":{\"shape\":\"CreateAuditSuppressionRequest\"},\
      \"output\":{\"shape\":\"CreateAuditSuppressionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Creates a Device Defender audit suppression. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateAuditSuppression</a> action.</p>\"\
    },\
    \"CreateAuthorizer\":{\
      \"name\":\"CreateAuthorizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/authorizer/{authorizerName}\"\
      },\
      \"input\":{\"shape\":\"CreateAuthorizerRequest\"},\
      \"output\":{\"shape\":\"CreateAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates an authorizer.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateAuthorizer</a> action.</p>\"\
    },\
    \"CreateBillingGroup\":{\
      \"name\":\"CreateBillingGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/billing-groups/{billingGroupName}\"\
      },\
      \"input\":{\"shape\":\"CreateBillingGroupRequest\"},\
      \"output\":{\"shape\":\"CreateBillingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a billing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateBillingGroup</a> action.</p>\"\
    },\
    \"CreateCertificateFromCsr\":{\
      \"name\":\"CreateCertificateFromCsr\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/certificates\"\
      },\
      \"input\":{\"shape\":\"CreateCertificateFromCsrRequest\"},\
      \"output\":{\"shape\":\"CreateCertificateFromCsrResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates an X.509 certificate using the specified certificate signing request. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateCertificateFromCsr</a> action. </p> <note> <p>The CSR must include a public key that is either an RSA key with a length of at least 2048 bits or an ECC key from NIST P-25 or NIST P-384 curves. For supported certificates, consult <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/x509-client-certs.html#x509-cert-algorithms\\\"> Certificate signing algorithms supported by IoT</a>. </p> </note> <note> <p>Reusing the same certificate signing request (CSR) results in a distinct certificate.</p> </note> <p>You can create multiple certificates in a batch by creating a directory, copying multiple <code>.csr</code> files into that directory, and then specifying that directory on the command line. The following commands show how to create a batch of certificates given a batch of CSRs. In the following commands, we assume that a set of CSRs are located inside of the directory my-csr-directory:</p> <p>On Linux and OS X, the command is: </p> <p> <code>$ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{}</code> </p> <p>This command lists all of the CSRs in my-csr-directory and pipes each CSR file name to the <code>aws iot create-certificate-from-csr</code> Amazon Web Services CLI command to create a certificate for the corresponding CSR. </p> <p>You can also run the <code>aws iot create-certificate-from-csr</code> part of the command in parallel to speed up the certificate creation process:</p> <p> <code>$ ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{} </code> </p> <p>On Windows PowerShell, the command to create certificates for all CSRs in my-csr-directory is:</p> <p> <code>&gt; ls -Name my-csr-directory | %{aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/$_} </code> </p> <p>On a Windows command prompt, the command to create certificates for all CSRs in my-csr-directory is:</p> <p> <code>&gt; forfiles /p my-csr-directory /c \\\"cmd /c aws iot create-certificate-from-csr --certificate-signing-request file://@path\\\" </code> </p>\"\
    },\
    \"CreateCustomMetric\":{\
      \"name\":\"CreateCustomMetric\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/custom-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"CreateCustomMetricRequest\"},\
      \"output\":{\"shape\":\"CreateCustomMetricResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Use this API to define a Custom Metric published by your devices to Device Defender. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateCustomMetric</a> action.</p>\"\
    },\
    \"CreateDimension\":{\
      \"name\":\"CreateDimension\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/dimensions/{name}\"\
      },\
      \"input\":{\"shape\":\"CreateDimensionRequest\"},\
      \"output\":{\"shape\":\"CreateDimensionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Create a dimension that you can use to limit the scope of a metric used in a security profile for IoT Device Defender. For example, using a <code>TOPIC_FILTER</code> dimension, you can narrow down the scope of the metric only to MQTT topics whose name match the pattern specified in the dimension.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateDimension</a> action.</p>\"\
    },\
    \"CreateDomainConfiguration\":{\
      \"name\":\"CreateDomainConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/domainConfigurations/{domainConfigurationName}\"\
      },\
      \"input\":{\"shape\":\"CreateDomainConfigurationRequest\"},\
      \"output\":{\"shape\":\"CreateDomainConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"CertificateValidationException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a domain configuration.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateDomainConfiguration</a> action.</p>\"\
    },\
    \"CreateDynamicThingGroup\":{\
      \"name\":\"CreateDynamicThingGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/dynamic-thing-groups/{thingGroupName}\"\
      },\
      \"input\":{\"shape\":\"CreateDynamicThingGroupRequest\"},\
      \"output\":{\"shape\":\"CreateDynamicThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a dynamic thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateDynamicThingGroup</a> action.</p>\"\
    },\
    \"CreateFleetMetric\":{\
      \"name\":\"CreateFleetMetric\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/fleet-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"CreateFleetMetricRequest\"},\
      \"output\":{\"shape\":\"CreateFleetMetricResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"InvalidAggregationException\"},\
        {\"shape\":\"IndexNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Creates a fleet metric.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateFleetMetric</a> action.</p>\"\
    },\
    \"CreateJob\":{\
      \"name\":\"CreateJob\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/jobs/{jobId}\"\
      },\
      \"input\":{\"shape\":\"CreateJobRequest\"},\
      \"output\":{\"shape\":\"CreateJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a job.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateJob</a> action.</p>\"\
    },\
    \"CreateJobTemplate\":{\
      \"name\":\"CreateJobTemplate\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/job-templates/{jobTemplateId}\"\
      },\
      \"input\":{\"shape\":\"CreateJobTemplateRequest\"},\
      \"output\":{\"shape\":\"CreateJobTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a job template.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateJobTemplate</a> action.</p>\"\
    },\
    \"CreateKeysAndCertificate\":{\
      \"name\":\"CreateKeysAndCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/keys-and-certificate\"\
      },\
      \"input\":{\"shape\":\"CreateKeysAndCertificateRequest\"},\
      \"output\":{\"shape\":\"CreateKeysAndCertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a 2048-bit RSA key pair and issues an X.509 certificate using the issued public key. You can also call <code>CreateKeysAndCertificate</code> over MQTT from a device, for more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/provision-wo-cert.html#provision-mqtt-api\\\">Provisioning MQTT API</a>.</p> <p> <b>Note</b> This is the only time IoT issues the private key for this certificate, so it is important to keep it in a secure location.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateKeysAndCertificate</a> action.</p>\"\
    },\
    \"CreateMitigationAction\":{\
      \"name\":\"CreateMitigationAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/mitigationactions/actions/{actionName}\"\
      },\
      \"input\":{\"shape\":\"CreateMitigationActionRequest\"},\
      \"output\":{\"shape\":\"CreateMitigationActionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Defines an action that can be applied to audit findings by using StartAuditMitigationActionsTask. Only certain types of mitigation actions can be applied to specific check names. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/device-defender-mitigation-actions.html\\\">Mitigation actions</a>. Each mitigation action can apply only one type of change.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateMitigationAction</a> action.</p>\"\
    },\
    \"CreateOTAUpdate\":{\
      \"name\":\"CreateOTAUpdate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/otaUpdates/{otaUpdateId}\"\
      },\
      \"input\":{\"shape\":\"CreateOTAUpdateRequest\"},\
      \"output\":{\"shape\":\"CreateOTAUpdateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates an IoT OTA update on a target group of things or groups.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateOTAUpdate</a> action.</p>\"\
    },\
    \"CreatePolicy\":{\
      \"name\":\"CreatePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/policies/{policyName}\"\
      },\
      \"input\":{\"shape\":\"CreatePolicyRequest\"},\
      \"output\":{\"shape\":\"CreatePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"MalformedPolicyException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates an IoT policy.</p> <p>The created policy is the default version for the policy. This operation creates a policy version with a version identifier of <b>1</b> and sets <b>1</b> as the policy's default version.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreatePolicy</a> action.</p>\"\
    },\
    \"CreatePolicyVersion\":{\
      \"name\":\"CreatePolicyVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/policies/{policyName}/version\"\
      },\
      \"input\":{\"shape\":\"CreatePolicyVersionRequest\"},\
      \"output\":{\"shape\":\"CreatePolicyVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"MalformedPolicyException\"},\
        {\"shape\":\"VersionsLimitExceededException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a new version of the specified IoT policy. To update a policy, create a new policy version. A managed policy can have up to five versions. If the policy has five versions, you must use <a>DeletePolicyVersion</a> to delete an existing version before you create a new one.</p> <p>Optionally, you can set the new version as the policy's default version. The default version is the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreatePolicyVersion</a> action.</p>\"\
    },\
    \"CreateProvisioningClaim\":{\
      \"name\":\"CreateProvisioningClaim\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/provisioning-templates/{templateName}/provisioning-claim\"\
      },\
      \"input\":{\"shape\":\"CreateProvisioningClaimRequest\"},\
      \"output\":{\"shape\":\"CreateProvisioningClaimResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a provisioning claim.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateProvisioningClaim</a> action.</p>\"\
    },\
    \"CreateProvisioningTemplate\":{\
      \"name\":\"CreateProvisioningTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/provisioning-templates\"\
      },\
      \"input\":{\"shape\":\"CreateProvisioningTemplateRequest\"},\
      \"output\":{\"shape\":\"CreateProvisioningTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates a provisioning template.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateProvisioningTemplate</a> action.</p>\"\
    },\
    \"CreateProvisioningTemplateVersion\":{\
      \"name\":\"CreateProvisioningTemplateVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/provisioning-templates/{templateName}/versions\"\
      },\
      \"input\":{\"shape\":\"CreateProvisioningTemplateVersionRequest\"},\
      \"output\":{\"shape\":\"CreateProvisioningTemplateVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"VersionsLimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Creates a new version of a provisioning template.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateProvisioningTemplateVersion</a> action.</p>\"\
    },\
    \"CreateRoleAlias\":{\
      \"name\":\"CreateRoleAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/role-aliases/{roleAlias}\"\
      },\
      \"input\":{\"shape\":\"CreateRoleAliasRequest\"},\
      \"output\":{\"shape\":\"CreateRoleAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a role alias.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateRoleAlias</a> action.</p>\"\
    },\
    \"CreateScheduledAudit\":{\
      \"name\":\"CreateScheduledAudit\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/scheduledaudits/{scheduledAuditName}\"\
      },\
      \"input\":{\"shape\":\"CreateScheduledAuditRequest\"},\
      \"output\":{\"shape\":\"CreateScheduledAuditResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a scheduled audit that is run at a specified time interval.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateScheduledAudit</a> action.</p>\"\
    },\
    \"CreateSecurityProfile\":{\
      \"name\":\"CreateSecurityProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/security-profiles/{securityProfileName}\"\
      },\
      \"input\":{\"shape\":\"CreateSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"CreateSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a Device Defender security profile.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateSecurityProfile</a> action.</p>\"\
    },\
    \"CreateStream\":{\
      \"name\":\"CreateStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/streams/{streamId}\"\
      },\
      \"input\":{\"shape\":\"CreateStreamRequest\"},\
      \"output\":{\"shape\":\"CreateStreamResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a stream for delivering one or more large files in chunks over MQTT. A stream transports data bytes in chunks or blocks packaged as MQTT messages from a source like S3. You can have one or more files associated with a stream.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateStream</a> action.</p>\"\
    },\
    \"CreateThing\":{\
      \"name\":\"CreateThing\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\"shape\":\"CreateThingRequest\"},\
      \"output\":{\"shape\":\"CreateThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates a thing record in the registry. If this call is made multiple times using the same thing name and configuration, the call will succeed. If this call is made with the same thing name but different configuration a <code>ResourceAlreadyExistsException</code> is thrown.</p> <note> <p>This is a control plane operation. See <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html\\\">Authorization</a> for information about authorizing control plane actions.</p> </note> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateThing</a> action.</p>\"\
    },\
    \"CreateThingGroup\":{\
      \"name\":\"CreateThingGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/thing-groups/{thingGroupName}\"\
      },\
      \"input\":{\"shape\":\"CreateThingGroupRequest\"},\
      \"output\":{\"shape\":\"CreateThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Create a thing group.</p> <note> <p>This is a control plane operation. See <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html\\\">Authorization</a> for information about authorizing control plane actions.</p> </note> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateThingGroup</a> action.</p>\"\
    },\
    \"CreateThingType\":{\
      \"name\":\"CreateThingType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/thing-types/{thingTypeName}\"\
      },\
      \"input\":{\"shape\":\"CreateThingTypeRequest\"},\
      \"output\":{\"shape\":\"CreateThingTypeResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates a new thing type.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateThingType</a> action.</p>\"\
    },\
    \"CreateTopicRule\":{\
      \"name\":\"CreateTopicRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\"shape\":\"CreateTopicRuleRequest\"},\
      \"errors\":[\
        {\"shape\":\"SqlParseException\"},\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Creates a rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateTopicRule</a> action.</p>\"\
    },\
    \"CreateTopicRuleDestination\":{\
      \"name\":\"CreateTopicRuleDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/destinations\"\
      },\
      \"input\":{\"shape\":\"CreateTopicRuleDestinationRequest\"},\
      \"output\":{\"shape\":\"CreateTopicRuleDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Creates a topic rule destination. The destination must be confirmed prior to use.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateTopicRuleDestination</a> action.</p>\"\
    },\
    \"DeleteAccountAuditConfiguration\":{\
      \"name\":\"DeleteAccountAuditConfiguration\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/audit/configuration\"\
      },\
      \"input\":{\"shape\":\"DeleteAccountAuditConfigurationRequest\"},\
      \"output\":{\"shape\":\"DeleteAccountAuditConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Restores the default settings for Device Defender audits for this account. Any configuration data you entered is deleted and all audit checks are reset to disabled. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteAccountAuditConfiguration</a> action.</p>\"\
    },\
    \"DeleteAuditSuppression\":{\
      \"name\":\"DeleteAuditSuppression\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/suppressions/delete\"\
      },\
      \"input\":{\"shape\":\"DeleteAuditSuppressionRequest\"},\
      \"output\":{\"shape\":\"DeleteAuditSuppressionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Deletes a Device Defender audit suppression. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteAuditSuppression</a> action.</p>\"\
    },\
    \"DeleteAuthorizer\":{\
      \"name\":\"DeleteAuthorizer\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/authorizer/{authorizerName}\"\
      },\
      \"input\":{\"shape\":\"DeleteAuthorizerRequest\"},\
      \"output\":{\"shape\":\"DeleteAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"DeleteConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes an authorizer.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteAuthorizer</a> action.</p>\"\
    },\
    \"DeleteBillingGroup\":{\
      \"name\":\"DeleteBillingGroup\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/billing-groups/{billingGroupName}\"\
      },\
      \"input\":{\"shape\":\"DeleteBillingGroupRequest\"},\
      \"output\":{\"shape\":\"DeleteBillingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the billing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteBillingGroup</a> action.</p>\"\
    },\
    \"DeleteCACertificate\":{\
      \"name\":\"DeleteCACertificate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/cacertificate/{caCertificateId}\"\
      },\
      \"input\":{\"shape\":\"DeleteCACertificateRequest\"},\
      \"output\":{\"shape\":\"DeleteCACertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"CertificateStateException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes a registered CA certificate.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteCACertificate</a> action.</p>\"\
    },\
    \"DeleteCertificate\":{\
      \"name\":\"DeleteCertificate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/certificates/{certificateId}\"\
      },\
      \"input\":{\"shape\":\"DeleteCertificateRequest\"},\
      \"errors\":[\
        {\"shape\":\"CertificateStateException\"},\
        {\"shape\":\"DeleteConflictException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified certificate.</p> <p>A certificate cannot be deleted if it has a policy or IoT thing attached to it or if its status is set to ACTIVE. To delete a certificate, first use the <a>DetachPolicy</a> action to detach all policies. Next, use the <a>UpdateCertificate</a> action to set the certificate to the INACTIVE status.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteCertificate</a> action.</p>\"\
    },\
    \"DeleteCustomMetric\":{\
      \"name\":\"DeleteCustomMetric\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/custom-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"DeleteCustomMetricRequest\"},\
      \"output\":{\"shape\":\"DeleteCustomMetricResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Deletes a Device Defender detect custom metric. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteCustomMetric</a> action.</p> <note> <p>Before you can delete a custom metric, you must first remove the custom metric from all security profiles it's a part of. The security profile associated with the custom metric can be found using the <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_ListSecurityProfiles.html\\\">ListSecurityProfiles</a> API with <code>metricName</code> set to your custom metric name.</p> </note>\"\
    },\
    \"DeleteDimension\":{\
      \"name\":\"DeleteDimension\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/dimensions/{name}\"\
      },\
      \"input\":{\"shape\":\"DeleteDimensionRequest\"},\
      \"output\":{\"shape\":\"DeleteDimensionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified dimension from your Amazon Web Services accounts.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteDimension</a> action.</p>\"\
    },\
    \"DeleteDomainConfiguration\":{\
      \"name\":\"DeleteDomainConfiguration\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/domainConfigurations/{domainConfigurationName}\"\
      },\
      \"input\":{\"shape\":\"DeleteDomainConfigurationRequest\"},\
      \"output\":{\"shape\":\"DeleteDomainConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified domain configuration.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteDomainConfiguration</a> action.</p>\"\
    },\
    \"DeleteDynamicThingGroup\":{\
      \"name\":\"DeleteDynamicThingGroup\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/dynamic-thing-groups/{thingGroupName}\"\
      },\
      \"input\":{\"shape\":\"DeleteDynamicThingGroupRequest\"},\
      \"output\":{\"shape\":\"DeleteDynamicThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a dynamic thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteDynamicThingGroup</a> action.</p>\"\
    },\
    \"DeleteFleetMetric\":{\
      \"name\":\"DeleteFleetMetric\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/fleet-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"DeleteFleetMetricRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"VersionConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified fleet metric. Returns successfully with no error if the deletion is successful or you specify a fleet metric that doesn't exist.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteFleetMetric</a> action.</p>\"\
    },\
    \"DeleteJob\":{\
      \"name\":\"DeleteJob\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/jobs/{jobId}\"\
      },\
      \"input\":{\"shape\":\"DeleteJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a job and its related job executions.</p> <p>Deleting a job may take time, depending on the number of job executions created for the job and various other factors. While the job is being deleted, the status of the job will be shown as \\\"DELETION_IN_PROGRESS\\\". Attempting to delete or cancel a job whose status is already \\\"DELETION_IN_PROGRESS\\\" will result in an error.</p> <p>Only 10 jobs may have status \\\"DELETION_IN_PROGRESS\\\" at the same time, or a LimitExceededException will occur.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteJob</a> action.</p>\"\
    },\
    \"DeleteJobExecution\":{\
      \"name\":\"DeleteJobExecution\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/things/{thingName}/jobs/{jobId}/executionNumber/{executionNumber}\"\
      },\
      \"input\":{\"shape\":\"DeleteJobExecutionRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a job execution.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteJobExecution</a> action.</p>\"\
    },\
    \"DeleteJobTemplate\":{\
      \"name\":\"DeleteJobTemplate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/job-templates/{jobTemplateId}\"\
      },\
      \"input\":{\"shape\":\"DeleteJobTemplateRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified job template.</p>\"\
    },\
    \"DeleteMitigationAction\":{\
      \"name\":\"DeleteMitigationAction\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/mitigationactions/actions/{actionName}\"\
      },\
      \"input\":{\"shape\":\"DeleteMitigationActionRequest\"},\
      \"output\":{\"shape\":\"DeleteMitigationActionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a defined mitigation action from your Amazon Web Services accounts.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteMitigationAction</a> action.</p>\"\
    },\
    \"DeleteOTAUpdate\":{\
      \"name\":\"DeleteOTAUpdate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/otaUpdates/{otaUpdateId}\"\
      },\
      \"input\":{\"shape\":\"DeleteOTAUpdateRequest\"},\
      \"output\":{\"shape\":\"DeleteOTAUpdateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"VersionConflictException\"}\
      ],\
      \"documentation\":\"<p>Delete an OTA update.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteOTAUpdate</a> action.</p>\"\
    },\
    \"DeletePolicy\":{\
      \"name\":\"DeletePolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/policies/{policyName}\"\
      },\
      \"input\":{\"shape\":\"DeletePolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"DeleteConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified policy.</p> <p>A policy cannot be deleted if it has non-default versions or it is attached to any certificate.</p> <p>To delete a policy, use the <a>DeletePolicyVersion</a> action to delete all non-default versions of the policy; use the <a>DetachPolicy</a> action to detach the policy from any certificate; and then use the DeletePolicy action to delete the policy.</p> <p>When a policy is deleted using DeletePolicy, its default version is deleted with it.</p> <note> <p>Because of the distributed nature of Amazon Web Services, it can take up to five minutes after a policy is detached before it's ready to be deleted.</p> </note> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeletePolicy</a> action.</p>\"\
    },\
    \"DeletePolicyVersion\":{\
      \"name\":\"DeletePolicyVersion\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\"\
      },\
      \"input\":{\"shape\":\"DeletePolicyVersionRequest\"},\
      \"errors\":[\
        {\"shape\":\"DeleteConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified version of the specified policy. You cannot delete the default version of a policy using this action. To delete the default version of a policy, use <a>DeletePolicy</a>. To find out which version of a policy is marked as the default version, use ListPolicyVersions.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeletePolicyVersion</a> action.</p>\"\
    },\
    \"DeleteProvisioningTemplate\":{\
      \"name\":\"DeleteProvisioningTemplate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/provisioning-templates/{templateName}\"\
      },\
      \"input\":{\"shape\":\"DeleteProvisioningTemplateRequest\"},\
      \"output\":{\"shape\":\"DeleteProvisioningTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"DeleteConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a provisioning template.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteProvisioningTemplate</a> action.</p>\"\
    },\
    \"DeleteProvisioningTemplateVersion\":{\
      \"name\":\"DeleteProvisioningTemplateVersion\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/provisioning-templates/{templateName}/versions/{versionId}\"\
      },\
      \"input\":{\"shape\":\"DeleteProvisioningTemplateVersionRequest\"},\
      \"output\":{\"shape\":\"DeleteProvisioningTemplateVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"},\
        {\"shape\":\"DeleteConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes a provisioning template version.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteProvisioningTemplateVersion</a> action.</p>\"\
    },\
    \"DeleteRegistrationCode\":{\
      \"name\":\"DeleteRegistrationCode\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/registrationcode\"\
      },\
      \"input\":{\"shape\":\"DeleteRegistrationCodeRequest\"},\
      \"output\":{\"shape\":\"DeleteRegistrationCodeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a CA certificate registration code.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteRegistrationCode</a> action.</p>\"\
    },\
    \"DeleteRoleAlias\":{\
      \"name\":\"DeleteRoleAlias\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/role-aliases/{roleAlias}\"\
      },\
      \"input\":{\"shape\":\"DeleteRoleAliasRequest\"},\
      \"output\":{\"shape\":\"DeleteRoleAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"DeleteConflictException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes a role alias</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteRoleAlias</a> action.</p>\"\
    },\
    \"DeleteScheduledAudit\":{\
      \"name\":\"DeleteScheduledAudit\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/audit/scheduledaudits/{scheduledAuditName}\"\
      },\
      \"input\":{\"shape\":\"DeleteScheduledAuditRequest\"},\
      \"output\":{\"shape\":\"DeleteScheduledAuditResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a scheduled audit.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteScheduledAudit</a> action.</p>\"\
    },\
    \"DeleteSecurityProfile\":{\
      \"name\":\"DeleteSecurityProfile\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/security-profiles/{securityProfileName}\"\
      },\
      \"input\":{\"shape\":\"DeleteSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"DeleteSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"VersionConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Device Defender security profile.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteSecurityProfile</a> action.</p>\"\
    },\
    \"DeleteStream\":{\
      \"name\":\"DeleteStream\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/streams/{streamId}\"\
      },\
      \"input\":{\"shape\":\"DeleteStreamRequest\"},\
      \"output\":{\"shape\":\"DeleteStreamResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"DeleteConflictException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a stream.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteStream</a> action.</p>\"\
    },\
    \"DeleteThing\":{\
      \"name\":\"DeleteThing\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\"shape\":\"DeleteThingRequest\"},\
      \"output\":{\"shape\":\"DeleteThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified thing. Returns successfully with no error if the deletion is successful or you specify a thing that doesn't exist.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteThing</a> action.</p>\"\
    },\
    \"DeleteThingGroup\":{\
      \"name\":\"DeleteThingGroup\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/thing-groups/{thingGroupName}\"\
      },\
      \"input\":{\"shape\":\"DeleteThingGroupRequest\"},\
      \"output\":{\"shape\":\"DeleteThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteThingGroup</a> action.</p>\"\
    },\
    \"DeleteThingType\":{\
      \"name\":\"DeleteThingType\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/thing-types/{thingTypeName}\"\
      },\
      \"input\":{\"shape\":\"DeleteThingTypeRequest\"},\
      \"output\":{\"shape\":\"DeleteThingTypeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified thing type. You cannot delete a thing type if it has things associated with it. To delete a thing type, first mark it as deprecated by calling <a>DeprecateThingType</a>, then remove any associated things by calling <a>UpdateThing</a> to change the thing type on any associated thing, and finally use <a>DeleteThingType</a> to delete the thing type.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteThingType</a> action.</p>\"\
    },\
    \"DeleteTopicRule\":{\
      \"name\":\"DeleteTopicRule\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\"shape\":\"DeleteTopicRuleRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Deletes the rule.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteTopicRule</a> action.</p>\"\
    },\
    \"DeleteTopicRuleDestination\":{\
      \"name\":\"DeleteTopicRuleDestination\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/destinations/{arn+}\"\
      },\
      \"input\":{\"shape\":\"DeleteTopicRuleDestinationRequest\"},\
      \"output\":{\"shape\":\"DeleteTopicRuleDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Deletes a topic rule destination.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteTopicRuleDestination</a> action.</p>\"\
    },\
    \"DeleteV2LoggingLevel\":{\
      \"name\":\"DeleteV2LoggingLevel\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/v2LoggingLevel\"\
      },\
      \"input\":{\"shape\":\"DeleteV2LoggingLevelRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a logging level.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteV2LoggingLevel</a> action.</p>\"\
    },\
    \"DeprecateThingType\":{\
      \"name\":\"DeprecateThingType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/thing-types/{thingTypeName}/deprecate\"\
      },\
      \"input\":{\"shape\":\"DeprecateThingTypeRequest\"},\
      \"output\":{\"shape\":\"DeprecateThingTypeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deprecates a thing type. You can not associate new things with deprecated thing type.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeprecateThingType</a> action.</p>\"\
    },\
    \"DescribeAccountAuditConfiguration\":{\
      \"name\":\"DescribeAccountAuditConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/configuration\"\
      },\
      \"input\":{\"shape\":\"DescribeAccountAuditConfigurationRequest\"},\
      \"output\":{\"shape\":\"DescribeAccountAuditConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the Device Defender audit settings for this account. Settings include how audit notifications are sent and which audit checks are enabled or disabled.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeAccountAuditConfiguration</a> action.</p>\"\
    },\
    \"DescribeAuditFinding\":{\
      \"name\":\"DescribeAuditFinding\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/findings/{findingId}\"\
      },\
      \"input\":{\"shape\":\"DescribeAuditFindingRequest\"},\
      \"output\":{\"shape\":\"DescribeAuditFindingResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a single audit finding. Properties include the reason for noncompliance, the severity of the issue, and the start time when the audit that returned the finding.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeAuditFinding</a> action.</p>\"\
    },\
    \"DescribeAuditMitigationActionsTask\":{\
      \"name\":\"DescribeAuditMitigationActionsTask\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/mitigationactions/tasks/{taskId}\"\
      },\
      \"input\":{\"shape\":\"DescribeAuditMitigationActionsTaskRequest\"},\
      \"output\":{\"shape\":\"DescribeAuditMitigationActionsTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about an audit mitigation task that is used to apply mitigation actions to a set of audit findings. Properties include the actions being applied, the audit checks to which they're being applied, the task status, and aggregated task statistics.</p>\"\
    },\
    \"DescribeAuditSuppression\":{\
      \"name\":\"DescribeAuditSuppression\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/suppressions/describe\"\
      },\
      \"input\":{\"shape\":\"DescribeAuditSuppressionRequest\"},\
      \"output\":{\"shape\":\"DescribeAuditSuppressionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Gets information about a Device Defender audit suppression. </p>\"\
    },\
    \"DescribeAuditTask\":{\
      \"name\":\"DescribeAuditTask\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/tasks/{taskId}\"\
      },\
      \"input\":{\"shape\":\"DescribeAuditTaskRequest\"},\
      \"output\":{\"shape\":\"DescribeAuditTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a Device Defender audit.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeAuditTask</a> action.</p>\"\
    },\
    \"DescribeAuthorizer\":{\
      \"name\":\"DescribeAuthorizer\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/authorizer/{authorizerName}\"\
      },\
      \"input\":{\"shape\":\"DescribeAuthorizerRequest\"},\
      \"output\":{\"shape\":\"DescribeAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes an authorizer.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeAuthorizer</a> action.</p>\"\
    },\
    \"DescribeBillingGroup\":{\
      \"name\":\"DescribeBillingGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/billing-groups/{billingGroupName}\"\
      },\
      \"input\":{\"shape\":\"DescribeBillingGroupRequest\"},\
      \"output\":{\"shape\":\"DescribeBillingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a billing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeBillingGroup</a> action.</p>\"\
    },\
    \"DescribeCACertificate\":{\
      \"name\":\"DescribeCACertificate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/cacertificate/{caCertificateId}\"\
      },\
      \"input\":{\"shape\":\"DescribeCACertificateRequest\"},\
      \"output\":{\"shape\":\"DescribeCACertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes a registered CA certificate.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeCACertificate</a> action.</p>\"\
    },\
    \"DescribeCertificate\":{\
      \"name\":\"DescribeCertificate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates/{certificateId}\"\
      },\
      \"input\":{\"shape\":\"DescribeCertificateRequest\"},\
      \"output\":{\"shape\":\"DescribeCertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the specified certificate.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeCertificate</a> action.</p>\"\
    },\
    \"DescribeCustomMetric\":{\
      \"name\":\"DescribeCustomMetric\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/custom-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"DescribeCustomMetricRequest\"},\
      \"output\":{\"shape\":\"DescribeCustomMetricResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Gets information about a Device Defender detect custom metric. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeCustomMetric</a> action.</p>\"\
    },\
    \"DescribeDefaultAuthorizer\":{\
      \"name\":\"DescribeDefaultAuthorizer\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/default-authorizer\"\
      },\
      \"input\":{\"shape\":\"DescribeDefaultAuthorizerRequest\"},\
      \"output\":{\"shape\":\"DescribeDefaultAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes the default authorizer.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeDefaultAuthorizer</a> action.</p>\"\
    },\
    \"DescribeDetectMitigationActionsTask\":{\
      \"name\":\"DescribeDetectMitigationActionsTask\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/detect/mitigationactions/tasks/{taskId}\"\
      },\
      \"input\":{\"shape\":\"DescribeDetectMitigationActionsTaskRequest\"},\
      \"output\":{\"shape\":\"DescribeDetectMitigationActionsTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Gets information about a Device Defender ML Detect mitigation action. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeDetectMitigationActionsTask</a> action.</p>\"\
    },\
    \"DescribeDimension\":{\
      \"name\":\"DescribeDimension\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/dimensions/{name}\"\
      },\
      \"input\":{\"shape\":\"DescribeDimensionRequest\"},\
      \"output\":{\"shape\":\"DescribeDimensionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Provides details about a dimension that is defined in your Amazon Web Services accounts.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeDimension</a> action.</p>\"\
    },\
    \"DescribeDomainConfiguration\":{\
      \"name\":\"DescribeDomainConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/domainConfigurations/{domainConfigurationName}\"\
      },\
      \"input\":{\"shape\":\"DescribeDomainConfigurationRequest\"},\
      \"output\":{\"shape\":\"DescribeDomainConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets summary information about a domain configuration.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeDomainConfiguration</a> action.</p>\"\
    },\
    \"DescribeEndpoint\":{\
      \"name\":\"DescribeEndpoint\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/endpoint\"\
      },\
      \"input\":{\"shape\":\"DescribeEndpointRequest\"},\
      \"output\":{\"shape\":\"DescribeEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Returns a unique endpoint specific to the Amazon Web Services account making the call.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeEndpoint</a> action.</p>\"\
    },\
    \"DescribeEventConfigurations\":{\
      \"name\":\"DescribeEventConfigurations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/event-configurations\"\
      },\
      \"input\":{\"shape\":\"DescribeEventConfigurationsRequest\"},\
      \"output\":{\"shape\":\"DescribeEventConfigurationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Describes event configurations.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeEventConfigurations</a> action.</p>\"\
    },\
    \"DescribeFleetMetric\":{\
      \"name\":\"DescribeFleetMetric\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/fleet-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"DescribeFleetMetricRequest\"},\
      \"output\":{\"shape\":\"DescribeFleetMetricResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the specified fleet metric.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeFleetMetric</a> action.</p>\"\
    },\
    \"DescribeIndex\":{\
      \"name\":\"DescribeIndex\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/indices/{indexName}\"\
      },\
      \"input\":{\"shape\":\"DescribeIndexRequest\"},\
      \"output\":{\"shape\":\"DescribeIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes a search index.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeIndex</a> action.</p>\"\
    },\
    \"DescribeJob\":{\
      \"name\":\"DescribeJob\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/jobs/{jobId}\"\
      },\
      \"input\":{\"shape\":\"DescribeJobRequest\"},\
      \"output\":{\"shape\":\"DescribeJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Describes a job.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeJob</a> action.</p>\"\
    },\
    \"DescribeJobExecution\":{\
      \"name\":\"DescribeJobExecution\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}/jobs/{jobId}\"\
      },\
      \"input\":{\"shape\":\"DescribeJobExecutionRequest\"},\
      \"output\":{\"shape\":\"DescribeJobExecutionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Describes a job execution.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeJobExecution</a> action.</p>\"\
    },\
    \"DescribeJobTemplate\":{\
      \"name\":\"DescribeJobTemplate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/job-templates/{jobTemplateId}\"\
      },\
      \"input\":{\"shape\":\"DescribeJobTemplateRequest\"},\
      \"output\":{\"shape\":\"DescribeJobTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a job template.</p>\"\
    },\
    \"DescribeManagedJobTemplate\":{\
      \"name\":\"DescribeManagedJobTemplate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/managed-job-templates/{templateName}\"\
      },\
      \"input\":{\"shape\":\"DescribeManagedJobTemplateRequest\"},\
      \"output\":{\"shape\":\"DescribeManagedJobTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>View details of a managed job template.</p>\"\
    },\
    \"DescribeMitigationAction\":{\
      \"name\":\"DescribeMitigationAction\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/mitigationactions/actions/{actionName}\"\
      },\
      \"input\":{\"shape\":\"DescribeMitigationActionRequest\"},\
      \"output\":{\"shape\":\"DescribeMitigationActionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a mitigation action.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeMitigationAction</a> action.</p>\"\
    },\
    \"DescribeProvisioningTemplate\":{\
      \"name\":\"DescribeProvisioningTemplate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/provisioning-templates/{templateName}\"\
      },\
      \"input\":{\"shape\":\"DescribeProvisioningTemplateRequest\"},\
      \"output\":{\"shape\":\"DescribeProvisioningTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a provisioning template.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeProvisioningTemplate</a> action.</p>\"\
    },\
    \"DescribeProvisioningTemplateVersion\":{\
      \"name\":\"DescribeProvisioningTemplateVersion\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/provisioning-templates/{templateName}/versions/{versionId}\"\
      },\
      \"input\":{\"shape\":\"DescribeProvisioningTemplateVersionRequest\"},\
      \"output\":{\"shape\":\"DescribeProvisioningTemplateVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a provisioning template version.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeProvisioningTemplateVersion</a> action.</p>\"\
    },\
    \"DescribeRoleAlias\":{\
      \"name\":\"DescribeRoleAlias\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/role-aliases/{roleAlias}\"\
      },\
      \"input\":{\"shape\":\"DescribeRoleAliasRequest\"},\
      \"output\":{\"shape\":\"DescribeRoleAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes a role alias.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeRoleAlias</a> action.</p>\"\
    },\
    \"DescribeScheduledAudit\":{\
      \"name\":\"DescribeScheduledAudit\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/scheduledaudits/{scheduledAuditName}\"\
      },\
      \"input\":{\"shape\":\"DescribeScheduledAuditRequest\"},\
      \"output\":{\"shape\":\"DescribeScheduledAuditResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a scheduled audit.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeScheduledAudit</a> action.</p>\"\
    },\
    \"DescribeSecurityProfile\":{\
      \"name\":\"DescribeSecurityProfile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles/{securityProfileName}\"\
      },\
      \"input\":{\"shape\":\"DescribeSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"DescribeSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a Device Defender security profile.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeSecurityProfile</a> action.</p>\"\
    },\
    \"DescribeStream\":{\
      \"name\":\"DescribeStream\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/streams/{streamId}\"\
      },\
      \"input\":{\"shape\":\"DescribeStreamRequest\"},\
      \"output\":{\"shape\":\"DescribeStreamResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a stream.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeStream</a> action.</p>\"\
    },\
    \"DescribeThing\":{\
      \"name\":\"DescribeThing\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\"shape\":\"DescribeThingRequest\"},\
      \"output\":{\"shape\":\"DescribeThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the specified thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeThing</a> action.</p>\"\
    },\
    \"DescribeThingGroup\":{\
      \"name\":\"DescribeThingGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-groups/{thingGroupName}\"\
      },\
      \"input\":{\"shape\":\"DescribeThingGroupRequest\"},\
      \"output\":{\"shape\":\"DescribeThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describe a thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeThingGroup</a> action.</p>\"\
    },\
    \"DescribeThingRegistrationTask\":{\
      \"name\":\"DescribeThingRegistrationTask\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-registration-tasks/{taskId}\"\
      },\
      \"input\":{\"shape\":\"DescribeThingRegistrationTaskRequest\"},\
      \"output\":{\"shape\":\"DescribeThingRegistrationTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes a bulk thing provisioning task.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeThingRegistrationTask</a> action.</p>\"\
    },\
    \"DescribeThingType\":{\
      \"name\":\"DescribeThingType\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-types/{thingTypeName}\"\
      },\
      \"input\":{\"shape\":\"DescribeThingTypeRequest\"},\
      \"output\":{\"shape\":\"DescribeThingTypeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the specified thing type.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DescribeThingType</a> action.</p>\"\
    },\
    \"DetachPolicy\":{\
      \"name\":\"DetachPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/target-policies/{policyName}\"\
      },\
      \"input\":{\"shape\":\"DetachPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Detaches a policy from the specified target.</p> <note> <p>Because of the distributed nature of Amazon Web Services, it can take up to five minutes after a policy is detached before it's ready to be deleted.</p> </note> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DetachPolicy</a> action.</p>\"\
    },\
    \"DetachPrincipalPolicy\":{\
      \"name\":\"DetachPrincipalPolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/principal-policies/{policyName}\"\
      },\
      \"input\":{\"shape\":\"DetachPrincipalPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified policy from the specified certificate.</p> <p> <b>Note:</b> This action is deprecated and works as expected for backward compatibility, but we won't add enhancements. Use <a>DetachPolicy</a> instead.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DetachPrincipalPolicy</a> action.</p>\",\
      \"deprecated\":true\
    },\
    \"DetachSecurityProfile\":{\
      \"name\":\"DetachSecurityProfile\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/security-profiles/{securityProfileName}/targets\"\
      },\
      \"input\":{\"shape\":\"DetachSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"DetachSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Disassociates a Device Defender security profile from a thing group or from this account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DetachSecurityProfile</a> action.</p>\"\
    },\
    \"DetachThingPrincipal\":{\
      \"name\":\"DetachThingPrincipal\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/things/{thingName}/principals\"\
      },\
      \"input\":{\"shape\":\"DetachThingPrincipalRequest\"},\
      \"output\":{\"shape\":\"DetachThingPrincipalResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Detaches the specified principal from the specified thing. A principal can be X.509 certificates, IAM users, groups, and roles, Amazon Cognito identities or federated identities.</p> <note> <p>This call is asynchronous. It might take several seconds for the detachment to propagate.</p> </note> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DetachThingPrincipal</a> action.</p>\"\
    },\
    \"DisableTopicRule\":{\
      \"name\":\"DisableTopicRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rules/{ruleName}/disable\"\
      },\
      \"input\":{\"shape\":\"DisableTopicRuleRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Disables the rule.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DisableTopicRule</a> action.</p>\"\
    },\
    \"EnableTopicRule\":{\
      \"name\":\"EnableTopicRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rules/{ruleName}/enable\"\
      },\
      \"input\":{\"shape\":\"EnableTopicRuleRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Enables the rule.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">EnableTopicRule</a> action.</p>\"\
    },\
    \"GetBehaviorModelTrainingSummaries\":{\
      \"name\":\"GetBehaviorModelTrainingSummaries\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/behavior-model-training/summaries\"\
      },\
      \"input\":{\"shape\":\"GetBehaviorModelTrainingSummariesRequest\"},\
      \"output\":{\"shape\":\"GetBehaviorModelTrainingSummariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> Returns a Device Defender's ML Detect Security Profile training model's status. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetBehaviorModelTrainingSummaries</a> action.</p>\"\
    },\
    \"GetBucketsAggregation\":{\
      \"name\":\"GetBucketsAggregation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/indices/buckets\"\
      },\
      \"input\":{\"shape\":\"GetBucketsAggregationRequest\"},\
      \"output\":{\"shape\":\"GetBucketsAggregationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"InvalidAggregationException\"},\
        {\"shape\":\"IndexNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Aggregates on indexed data with search queries pertaining to particular fields. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetBucketsAggregation</a> action.</p>\"\
    },\
    \"GetCardinality\":{\
      \"name\":\"GetCardinality\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/indices/cardinality\"\
      },\
      \"input\":{\"shape\":\"GetCardinalityRequest\"},\
      \"output\":{\"shape\":\"GetCardinalityResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"InvalidAggregationException\"},\
        {\"shape\":\"IndexNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Returns the approximate count of unique values that match the query.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetCardinality</a> action.</p>\"\
    },\
    \"GetEffectivePolicies\":{\
      \"name\":\"GetEffectivePolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/effective-policies\"\
      },\
      \"input\":{\"shape\":\"GetEffectivePoliciesRequest\"},\
      \"output\":{\"shape\":\"GetEffectivePoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the policies that have an effect on the authorization behavior of the specified device when it connects to the IoT device gateway.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetEffectivePolicies</a> action.</p>\"\
    },\
    \"GetIndexingConfiguration\":{\
      \"name\":\"GetIndexingConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/indexing/config\"\
      },\
      \"input\":{\"shape\":\"GetIndexingConfigurationRequest\"},\
      \"output\":{\"shape\":\"GetIndexingConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets the indexing configuration.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetIndexingConfiguration</a> action.</p>\"\
    },\
    \"GetJobDocument\":{\
      \"name\":\"GetJobDocument\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/jobs/{jobId}/job-document\"\
      },\
      \"input\":{\"shape\":\"GetJobDocumentRequest\"},\
      \"output\":{\"shape\":\"GetJobDocumentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Gets a job document.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetJobDocument</a> action.</p>\"\
    },\
    \"GetLoggingOptions\":{\
      \"name\":\"GetLoggingOptions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/loggingOptions\"\
      },\
      \"input\":{\"shape\":\"GetLoggingOptionsRequest\"},\
      \"output\":{\"shape\":\"GetLoggingOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Gets the logging options.</p> <p>NOTE: use of this command is not recommended. Use <code>GetV2LoggingOptions</code> instead.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetLoggingOptions</a> action.</p>\"\
    },\
    \"GetOTAUpdate\":{\
      \"name\":\"GetOTAUpdate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/otaUpdates/{otaUpdateId}\"\
      },\
      \"input\":{\"shape\":\"GetOTAUpdateRequest\"},\
      \"output\":{\"shape\":\"GetOTAUpdateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets an OTA update.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetOTAUpdate</a> action.</p>\"\
    },\
    \"GetPercentiles\":{\
      \"name\":\"GetPercentiles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/indices/percentiles\"\
      },\
      \"input\":{\"shape\":\"GetPercentilesRequest\"},\
      \"output\":{\"shape\":\"GetPercentilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"InvalidAggregationException\"},\
        {\"shape\":\"IndexNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Groups the aggregated values that match the query into percentile groupings. The default percentile groupings are: 1,5,25,50,75,95,99, although you can specify your own when you call <code>GetPercentiles</code>. This function returns a value for each percentile group specified (or the default percentile groupings). The percentile group \\\"1\\\" contains the aggregated field value that occurs in approximately one percent of the values that match the query. The percentile group \\\"5\\\" contains the aggregated field value that occurs in approximately five percent of the values that match the query, and so on. The result is an approximation, the more values that match the query, the more accurate the percentile values.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetPercentiles</a> action.</p>\"\
    },\
    \"GetPolicy\":{\
      \"name\":\"GetPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies/{policyName}\"\
      },\
      \"input\":{\"shape\":\"GetPolicyRequest\"},\
      \"output\":{\"shape\":\"GetPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the specified policy with the policy document of the default version.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetPolicy</a> action.</p>\"\
    },\
    \"GetPolicyVersion\":{\
      \"name\":\"GetPolicyVersion\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\"\
      },\
      \"input\":{\"shape\":\"GetPolicyVersionRequest\"},\
      \"output\":{\"shape\":\"GetPolicyVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the specified policy version.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetPolicyVersion</a> action.</p>\"\
    },\
    \"GetRegistrationCode\":{\
      \"name\":\"GetRegistrationCode\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/registrationcode\"\
      },\
      \"input\":{\"shape\":\"GetRegistrationCodeRequest\"},\
      \"output\":{\"shape\":\"GetRegistrationCodeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Gets a registration code used to register a CA certificate with IoT.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetRegistrationCode</a> action.</p>\"\
    },\
    \"GetStatistics\":{\
      \"name\":\"GetStatistics\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/indices/statistics\"\
      },\
      \"input\":{\"shape\":\"GetStatisticsRequest\"},\
      \"output\":{\"shape\":\"GetStatisticsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"InvalidAggregationException\"},\
        {\"shape\":\"IndexNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Returns the count, average, sum, minimum, maximum, sum of squares, variance, and standard deviation for the specified aggregated field. If the aggregation field is of type <code>String</code>, only the count statistic is returned.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetStatistics</a> action.</p>\"\
    },\
    \"GetTopicRule\":{\
      \"name\":\"GetTopicRule\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\"shape\":\"GetTopicRuleRequest\"},\
      \"output\":{\"shape\":\"GetTopicRuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the rule.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetTopicRule</a> action.</p>\"\
    },\
    \"GetTopicRuleDestination\":{\
      \"name\":\"GetTopicRuleDestination\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/destinations/{arn+}\"\
      },\
      \"input\":{\"shape\":\"GetTopicRuleDestinationRequest\"},\
      \"output\":{\"shape\":\"GetTopicRuleDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a topic rule destination.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetTopicRuleDestination</a> action.</p>\"\
    },\
    \"GetV2LoggingOptions\":{\
      \"name\":\"GetV2LoggingOptions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2LoggingOptions\"\
      },\
      \"input\":{\"shape\":\"GetV2LoggingOptionsRequest\"},\
      \"output\":{\"shape\":\"GetV2LoggingOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"NotConfiguredException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Gets the fine grained logging options.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetV2LoggingOptions</a> action.</p>\"\
    },\
    \"ListActiveViolations\":{\
      \"name\":\"ListActiveViolations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/active-violations\"\
      },\
      \"input\":{\"shape\":\"ListActiveViolationsRequest\"},\
      \"output\":{\"shape\":\"ListActiveViolationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the active violations for a given Device Defender security profile.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListActiveViolations</a> action.</p>\"\
    },\
    \"ListAttachedPolicies\":{\
      \"name\":\"ListAttachedPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/attached-policies/{target}\"\
      },\
      \"input\":{\"shape\":\"ListAttachedPoliciesRequest\"},\
      \"output\":{\"shape\":\"ListAttachedPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Lists the policies attached to the specified thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListAttachedPolicies</a> action.</p>\"\
    },\
    \"ListAuditFindings\":{\
      \"name\":\"ListAuditFindings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/findings\"\
      },\
      \"input\":{\"shape\":\"ListAuditFindingsRequest\"},\
      \"output\":{\"shape\":\"ListAuditFindingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the findings (results) of a Device Defender audit or of the audits performed during a specified time period. (Findings are retained for 90 days.)</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListAuditFindings</a> action.</p>\"\
    },\
    \"ListAuditMitigationActionsExecutions\":{\
      \"name\":\"ListAuditMitigationActionsExecutions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/mitigationactions/executions\"\
      },\
      \"input\":{\"shape\":\"ListAuditMitigationActionsExecutionsRequest\"},\
      \"output\":{\"shape\":\"ListAuditMitigationActionsExecutionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets the status of audit mitigation action tasks that were executed.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListAuditMitigationActionsExecutions</a> action.</p>\"\
    },\
    \"ListAuditMitigationActionsTasks\":{\
      \"name\":\"ListAuditMitigationActionsTasks\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/mitigationactions/tasks\"\
      },\
      \"input\":{\"shape\":\"ListAuditMitigationActionsTasksRequest\"},\
      \"output\":{\"shape\":\"ListAuditMitigationActionsTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of audit mitigation action tasks that match the specified filters.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListAuditMitigationActionsTasks</a> action.</p>\"\
    },\
    \"ListAuditSuppressions\":{\
      \"name\":\"ListAuditSuppressions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/suppressions/list\"\
      },\
      \"input\":{\"shape\":\"ListAuditSuppressionsRequest\"},\
      \"output\":{\"shape\":\"ListAuditSuppressionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Lists your Device Defender audit listings. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListAuditSuppressions</a> action.</p>\"\
    },\
    \"ListAuditTasks\":{\
      \"name\":\"ListAuditTasks\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/tasks\"\
      },\
      \"input\":{\"shape\":\"ListAuditTasksRequest\"},\
      \"output\":{\"shape\":\"ListAuditTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the Device Defender audits that have been performed during a given time period.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListAuditTasks</a> action.</p>\"\
    },\
    \"ListAuthorizers\":{\
      \"name\":\"ListAuthorizers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/authorizers/\"\
      },\
      \"input\":{\"shape\":\"ListAuthorizersRequest\"},\
      \"output\":{\"shape\":\"ListAuthorizersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the authorizers registered in your account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListAuthorizers</a> action.</p>\"\
    },\
    \"ListBillingGroups\":{\
      \"name\":\"ListBillingGroups\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/billing-groups\"\
      },\
      \"input\":{\"shape\":\"ListBillingGroupsRequest\"},\
      \"output\":{\"shape\":\"ListBillingGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the billing groups you have created.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListBillingGroups</a> action.</p>\"\
    },\
    \"ListCACertificates\":{\
      \"name\":\"ListCACertificates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/cacertificates\"\
      },\
      \"input\":{\"shape\":\"ListCACertificatesRequest\"},\
      \"output\":{\"shape\":\"ListCACertificatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the CA certificates registered for your Amazon Web Services account.</p> <p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListCACertificates</a> action.</p>\"\
    },\
    \"ListCertificates\":{\
      \"name\":\"ListCertificates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates\"\
      },\
      \"input\":{\"shape\":\"ListCertificatesRequest\"},\
      \"output\":{\"shape\":\"ListCertificatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the certificates registered in your Amazon Web Services account.</p> <p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListCertificates</a> action.</p>\"\
    },\
    \"ListCertificatesByCA\":{\
      \"name\":\"ListCertificatesByCA\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates-by-ca/{caCertificateId}\"\
      },\
      \"input\":{\"shape\":\"ListCertificatesByCARequest\"},\
      \"output\":{\"shape\":\"ListCertificatesByCAResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>List the device certificates signed by the specified CA certificate.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListCertificatesByCA</a> action.</p>\"\
    },\
    \"ListCustomMetrics\":{\
      \"name\":\"ListCustomMetrics\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/custom-metrics\"\
      },\
      \"input\":{\"shape\":\"ListCustomMetricsRequest\"},\
      \"output\":{\"shape\":\"ListCustomMetricsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Lists your Device Defender detect custom metrics. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListCustomMetrics</a> action.</p>\"\
    },\
    \"ListDetectMitigationActionsExecutions\":{\
      \"name\":\"ListDetectMitigationActionsExecutions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/detect/mitigationactions/executions\"\
      },\
      \"input\":{\"shape\":\"ListDetectMitigationActionsExecutionsRequest\"},\
      \"output\":{\"shape\":\"ListDetectMitigationActionsExecutionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Lists mitigation actions executions for a Device Defender ML Detect Security Profile. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListDetectMitigationActionsExecutions</a> action.</p>\"\
    },\
    \"ListDetectMitigationActionsTasks\":{\
      \"name\":\"ListDetectMitigationActionsTasks\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/detect/mitigationactions/tasks\"\
      },\
      \"input\":{\"shape\":\"ListDetectMitigationActionsTasksRequest\"},\
      \"output\":{\"shape\":\"ListDetectMitigationActionsTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> List of Device Defender ML Detect mitigation actions tasks. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListDetectMitigationActionsTasks</a> action.</p>\"\
    },\
    \"ListDimensions\":{\
      \"name\":\"ListDimensions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/dimensions\"\
      },\
      \"input\":{\"shape\":\"ListDimensionsRequest\"},\
      \"output\":{\"shape\":\"ListDimensionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>List the set of dimensions that are defined for your Amazon Web Services accounts.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListDimensions</a> action.</p>\"\
    },\
    \"ListDomainConfigurations\":{\
      \"name\":\"ListDomainConfigurations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/domainConfigurations\"\
      },\
      \"input\":{\"shape\":\"ListDomainConfigurationsRequest\"},\
      \"output\":{\"shape\":\"ListDomainConfigurationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of domain configurations for the user. This list is sorted alphabetically by domain configuration name.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListDomainConfigurations</a> action.</p>\"\
    },\
    \"ListFleetMetrics\":{\
      \"name\":\"ListFleetMetrics\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/fleet-metrics\"\
      },\
      \"input\":{\"shape\":\"ListFleetMetricsRequest\"},\
      \"output\":{\"shape\":\"ListFleetMetricsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all your fleet metrics. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListFleetMetrics</a> action.</p>\"\
    },\
    \"ListIndices\":{\
      \"name\":\"ListIndices\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/indices\"\
      },\
      \"input\":{\"shape\":\"ListIndicesRequest\"},\
      \"output\":{\"shape\":\"ListIndicesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the search indices.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListIndices</a> action.</p>\"\
    },\
    \"ListJobExecutionsForJob\":{\
      \"name\":\"ListJobExecutionsForJob\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/jobs/{jobId}/things\"\
      },\
      \"input\":{\"shape\":\"ListJobExecutionsForJobRequest\"},\
      \"output\":{\"shape\":\"ListJobExecutionsForJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the job executions for a job.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListJobExecutionsForJob</a> action.</p>\"\
    },\
    \"ListJobExecutionsForThing\":{\
      \"name\":\"ListJobExecutionsForThing\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}/jobs\"\
      },\
      \"input\":{\"shape\":\"ListJobExecutionsForThingRequest\"},\
      \"output\":{\"shape\":\"ListJobExecutionsForThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the job executions for the specified thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListJobExecutionsForThing</a> action.</p>\"\
    },\
    \"ListJobTemplates\":{\
      \"name\":\"ListJobTemplates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/job-templates\"\
      },\
      \"input\":{\"shape\":\"ListJobTemplatesRequest\"},\
      \"output\":{\"shape\":\"ListJobTemplatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of job templates.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListJobTemplates</a> action.</p>\"\
    },\
    \"ListJobs\":{\
      \"name\":\"ListJobs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/jobs\"\
      },\
      \"input\":{\"shape\":\"ListJobsRequest\"},\
      \"output\":{\"shape\":\"ListJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists jobs.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListJobs</a> action.</p>\"\
    },\
    \"ListManagedJobTemplates\":{\
      \"name\":\"ListManagedJobTemplates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/managed-job-templates\"\
      },\
      \"input\":{\"shape\":\"ListManagedJobTemplatesRequest\"},\
      \"output\":{\"shape\":\"ListManagedJobTemplatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of managed job templates.</p>\"\
    },\
    \"ListMetricValues\":{\
      \"name\":\"ListMetricValues\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/metric-values\"\
      },\
      \"input\":{\"shape\":\"ListMetricValuesRequest\"},\
      \"output\":{\"shape\":\"ListMetricValuesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the values reported for an IoT Device Defender metric (device-side metric, cloud-side metric, or custom metric) by the given thing during the specified time period.</p>\"\
    },\
    \"ListMitigationActions\":{\
      \"name\":\"ListMitigationActions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/mitigationactions/actions\"\
      },\
      \"input\":{\"shape\":\"ListMitigationActionsRequest\"},\
      \"output\":{\"shape\":\"ListMitigationActionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all mitigation actions that match the specified filter criteria.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListMitigationActions</a> action.</p>\"\
    },\
    \"ListOTAUpdates\":{\
      \"name\":\"ListOTAUpdates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/otaUpdates\"\
      },\
      \"input\":{\"shape\":\"ListOTAUpdatesRequest\"},\
      \"output\":{\"shape\":\"ListOTAUpdatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists OTA updates.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListOTAUpdates</a> action.</p>\"\
    },\
    \"ListOutgoingCertificates\":{\
      \"name\":\"ListOutgoingCertificates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates-out-going\"\
      },\
      \"input\":{\"shape\":\"ListOutgoingCertificatesRequest\"},\
      \"output\":{\"shape\":\"ListOutgoingCertificatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists certificates that are being transferred but not yet accepted.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListOutgoingCertificates</a> action.</p>\"\
    },\
    \"ListPolicies\":{\
      \"name\":\"ListPolicies\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies\"\
      },\
      \"input\":{\"shape\":\"ListPoliciesRequest\"},\
      \"output\":{\"shape\":\"ListPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists your policies.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListPolicies</a> action.</p>\"\
    },\
    \"ListPolicyPrincipals\":{\
      \"name\":\"ListPolicyPrincipals\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policy-principals\"\
      },\
      \"input\":{\"shape\":\"ListPolicyPrincipalsRequest\"},\
      \"output\":{\"shape\":\"ListPolicyPrincipalsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the principals associated with the specified policy.</p> <p> <b>Note:</b> This action is deprecated and works as expected for backward compatibility, but we won't add enhancements. Use <a>ListTargetsForPolicy</a> instead.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListPolicyPrincipals</a> action.</p>\",\
      \"deprecated\":true\
    },\
    \"ListPolicyVersions\":{\
      \"name\":\"ListPolicyVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies/{policyName}/version\"\
      },\
      \"input\":{\"shape\":\"ListPolicyVersionsRequest\"},\
      \"output\":{\"shape\":\"ListPolicyVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the versions of the specified policy and identifies the default version.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListPolicyVersions</a> action.</p>\"\
    },\
    \"ListPrincipalPolicies\":{\
      \"name\":\"ListPrincipalPolicies\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/principal-policies\"\
      },\
      \"input\":{\"shape\":\"ListPrincipalPoliciesRequest\"},\
      \"output\":{\"shape\":\"ListPrincipalPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the policies attached to the specified principal. If you use an Cognito identity, the ID must be in <a href=\\\"https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax\\\">AmazonCognito Identity format</a>.</p> <p> <b>Note:</b> This action is deprecated and works as expected for backward compatibility, but we won't add enhancements. Use <a>ListAttachedPolicies</a> instead.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListPrincipalPolicies</a> action.</p>\",\
      \"deprecated\":true\
    },\
    \"ListPrincipalThings\":{\
      \"name\":\"ListPrincipalThings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/principals/things\"\
      },\
      \"input\":{\"shape\":\"ListPrincipalThingsRequest\"},\
      \"output\":{\"shape\":\"ListPrincipalThingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the things associated with the specified principal. A principal can be X.509 certificates, IAM users, groups, and roles, Amazon Cognito identities or federated identities. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListPrincipalThings</a> action.</p>\"\
    },\
    \"ListProvisioningTemplateVersions\":{\
      \"name\":\"ListProvisioningTemplateVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/provisioning-templates/{templateName}/versions\"\
      },\
      \"input\":{\"shape\":\"ListProvisioningTemplateVersionsRequest\"},\
      \"output\":{\"shape\":\"ListProvisioningTemplateVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>A list of provisioning template versions.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListProvisioningTemplateVersions</a> action.</p>\"\
    },\
    \"ListProvisioningTemplates\":{\
      \"name\":\"ListProvisioningTemplates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/provisioning-templates\"\
      },\
      \"input\":{\"shape\":\"ListProvisioningTemplatesRequest\"},\
      \"output\":{\"shape\":\"ListProvisioningTemplatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>Lists the provisioning templates in your Amazon Web Services account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListProvisioningTemplates</a> action.</p>\"\
    },\
    \"ListRelatedResourcesForAuditFinding\":{\
      \"name\":\"ListRelatedResourcesForAuditFinding\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/relatedResources\"\
      },\
      \"input\":{\"shape\":\"ListRelatedResourcesForAuditFindingRequest\"},\
      \"output\":{\"shape\":\"ListRelatedResourcesForAuditFindingResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>The related resources of an Audit finding. The following resources can be returned from calling this API:</p> <ul> <li> <p>DEVICE_CERTIFICATE</p> </li> <li> <p>CA_CERTIFICATE</p> </li> <li> <p>IOT_POLICY</p> </li> <li> <p>COGNITO_IDENTITY_POOL</p> </li> <li> <p>CLIENT_ID</p> </li> <li> <p>ACCOUNT_SETTINGS</p> </li> <li> <p>ROLE_ALIAS</p> </li> <li> <p>IAM_ROLE</p> </li> <li> <p>ISSUER_CERTIFICATE</p> </li> </ul> <note> <p>This API is similar to DescribeAuditFinding's <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_DescribeAuditFinding.html\\\">RelatedResources</a> but provides pagination and is not limited to 10 resources. When calling <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_DescribeAuditFinding.html\\\">DescribeAuditFinding</a> for the intermediate CA revoked for active device certificates check, RelatedResources will not be populated. You must use this API, ListRelatedResourcesForAuditFinding, to list the certificates.</p> </note>\"\
    },\
    \"ListRoleAliases\":{\
      \"name\":\"ListRoleAliases\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/role-aliases\"\
      },\
      \"input\":{\"shape\":\"ListRoleAliasesRequest\"},\
      \"output\":{\"shape\":\"ListRoleAliasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the role aliases registered in your account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListRoleAliases</a> action.</p>\"\
    },\
    \"ListScheduledAudits\":{\
      \"name\":\"ListScheduledAudits\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/audit/scheduledaudits\"\
      },\
      \"input\":{\"shape\":\"ListScheduledAuditsRequest\"},\
      \"output\":{\"shape\":\"ListScheduledAuditsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all of your scheduled audits.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListScheduledAudits</a> action.</p>\"\
    },\
    \"ListSecurityProfiles\":{\
      \"name\":\"ListSecurityProfiles\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles\"\
      },\
      \"input\":{\"shape\":\"ListSecurityProfilesRequest\"},\
      \"output\":{\"shape\":\"ListSecurityProfilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the Device Defender security profiles you've created. You can filter security profiles by dimension or custom metric.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListSecurityProfiles</a> action.</p> <note> <p> <code>dimensionName</code> and <code>metricName</code> cannot be used in the same request.</p> </note>\"\
    },\
    \"ListSecurityProfilesForTarget\":{\
      \"name\":\"ListSecurityProfilesForTarget\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles-for-target\"\
      },\
      \"input\":{\"shape\":\"ListSecurityProfilesForTargetRequest\"},\
      \"output\":{\"shape\":\"ListSecurityProfilesForTargetResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the Device Defender security profiles attached to a target (thing group).</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListSecurityProfilesForTarget</a> action.</p>\"\
    },\
    \"ListStreams\":{\
      \"name\":\"ListStreams\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/streams\"\
      },\
      \"input\":{\"shape\":\"ListStreamsRequest\"},\
      \"output\":{\"shape\":\"ListStreamsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all of the streams in your Amazon Web Services account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListStreams</a> action.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags (metadata) you have assigned to the resource.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListTagsForResource</a> action.</p>\"\
    },\
    \"ListTargetsForPolicy\":{\
      \"name\":\"ListTargetsForPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/policy-targets/{policyName}\"\
      },\
      \"input\":{\"shape\":\"ListTargetsForPolicyRequest\"},\
      \"output\":{\"shape\":\"ListTargetsForPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>List targets for the specified policy.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListTargetsForPolicy</a> action.</p>\"\
    },\
    \"ListTargetsForSecurityProfile\":{\
      \"name\":\"ListTargetsForSecurityProfile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles/{securityProfileName}/targets\"\
      },\
      \"input\":{\"shape\":\"ListTargetsForSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"ListTargetsForSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the targets (thing groups) associated with a given Device Defender security profile.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListTargetsForSecurityProfile</a> action.</p>\"\
    },\
    \"ListThingGroups\":{\
      \"name\":\"ListThingGroups\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-groups\"\
      },\
      \"input\":{\"shape\":\"ListThingGroupsRequest\"},\
      \"output\":{\"shape\":\"ListThingGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>List the thing groups in your account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThingGroups</a> action.</p>\"\
    },\
    \"ListThingGroupsForThing\":{\
      \"name\":\"ListThingGroupsForThing\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}/thing-groups\"\
      },\
      \"input\":{\"shape\":\"ListThingGroupsForThingRequest\"},\
      \"output\":{\"shape\":\"ListThingGroupsForThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>List the thing groups to which the specified thing belongs.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThingGroupsForThing</a> action.</p>\"\
    },\
    \"ListThingPrincipals\":{\
      \"name\":\"ListThingPrincipals\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}/principals\"\
      },\
      \"input\":{\"shape\":\"ListThingPrincipalsRequest\"},\
      \"output\":{\"shape\":\"ListThingPrincipalsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the principals associated with the specified thing. A principal can be X.509 certificates, IAM users, groups, and roles, Amazon Cognito identities or federated identities.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThingPrincipals</a> action.</p>\"\
    },\
    \"ListThingRegistrationTaskReports\":{\
      \"name\":\"ListThingRegistrationTaskReports\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-registration-tasks/{taskId}/reports\"\
      },\
      \"input\":{\"shape\":\"ListThingRegistrationTaskReportsRequest\"},\
      \"output\":{\"shape\":\"ListThingRegistrationTaskReportsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Information about the thing registration tasks.</p>\"\
    },\
    \"ListThingRegistrationTasks\":{\
      \"name\":\"ListThingRegistrationTasks\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-registration-tasks\"\
      },\
      \"input\":{\"shape\":\"ListThingRegistrationTasksRequest\"},\
      \"output\":{\"shape\":\"ListThingRegistrationTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>List bulk thing provisioning tasks.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThingRegistrationTasks</a> action.</p>\"\
    },\
    \"ListThingTypes\":{\
      \"name\":\"ListThingTypes\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-types\"\
      },\
      \"input\":{\"shape\":\"ListThingTypesRequest\"},\
      \"output\":{\"shape\":\"ListThingTypesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the existing thing types.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThingTypes</a> action.</p>\"\
    },\
    \"ListThings\":{\
      \"name\":\"ListThings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things\"\
      },\
      \"input\":{\"shape\":\"ListThingsRequest\"},\
      \"output\":{\"shape\":\"ListThingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists your things. Use the <b>attributeName</b> and <b>attributeValue</b> parameters to filter your things. For example, calling <code>ListThings</code> with attributeName=Color and attributeValue=Red retrieves all things in the registry that contain an attribute <b>Color</b> with the value <b>Red</b>. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/thing-registry.html#list-things\\\">List Things</a> from the <i>Amazon Web Services IoT Core Developer Guide</i>.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThings</a> action.</p> <note> <p>You will not be charged for calling this API if an <code>Access denied</code> error is returned. You will also not be charged if no attributes or pagination token was provided in request and no pagination token and no results were returned.</p> </note>\"\
    },\
    \"ListThingsInBillingGroup\":{\
      \"name\":\"ListThingsInBillingGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/billing-groups/{billingGroupName}/things\"\
      },\
      \"input\":{\"shape\":\"ListThingsInBillingGroupRequest\"},\
      \"output\":{\"shape\":\"ListThingsInBillingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the things you have added to the given billing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThingsInBillingGroup</a> action.</p>\"\
    },\
    \"ListThingsInThingGroup\":{\
      \"name\":\"ListThingsInThingGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-groups/{thingGroupName}/things\"\
      },\
      \"input\":{\"shape\":\"ListThingsInThingGroupRequest\"},\
      \"output\":{\"shape\":\"ListThingsInThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the things in the specified group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListThingsInThingGroup</a> action.</p>\"\
    },\
    \"ListTopicRuleDestinations\":{\
      \"name\":\"ListTopicRuleDestinations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/destinations\"\
      },\
      \"input\":{\"shape\":\"ListTopicRuleDestinationsRequest\"},\
      \"output\":{\"shape\":\"ListTopicRuleDestinationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"}\
      ],\
      \"documentation\":\"<p>Lists all the topic rule destinations in your Amazon Web Services account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListTopicRuleDestinations</a> action.</p>\"\
    },\
    \"ListTopicRules\":{\
      \"name\":\"ListTopicRules\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/rules\"\
      },\
      \"input\":{\"shape\":\"ListTopicRulesRequest\"},\
      \"output\":{\"shape\":\"ListTopicRulesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the rules for the specific topic.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListTopicRules</a> action.</p>\"\
    },\
    \"ListV2LoggingLevels\":{\
      \"name\":\"ListV2LoggingLevels\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2LoggingLevel\"\
      },\
      \"input\":{\"shape\":\"ListV2LoggingLevelsRequest\"},\
      \"output\":{\"shape\":\"ListV2LoggingLevelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"NotConfiguredException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists logging levels.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListV2LoggingLevels</a> action.</p>\"\
    },\
    \"ListViolationEvents\":{\
      \"name\":\"ListViolationEvents\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/violation-events\"\
      },\
      \"input\":{\"shape\":\"ListViolationEventsRequest\"},\
      \"output\":{\"shape\":\"ListViolationEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the Device Defender security profile violations discovered during the given time period. You can use filters to limit the results to those alerts issued for a particular security profile, behavior, or thing (device).</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListViolationEvents</a> action.</p>\"\
    },\
    \"PutVerificationStateOnViolation\":{\
      \"name\":\"PutVerificationStateOnViolation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/violations/verification-state/{violationId}\"\
      },\
      \"input\":{\"shape\":\"PutVerificationStateOnViolationRequest\"},\
      \"output\":{\"shape\":\"PutVerificationStateOnViolationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Set a verification state and provide a description of that verification state on a violation (detect alarm).</p>\"\
    },\
    \"RegisterCACertificate\":{\
      \"name\":\"RegisterCACertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/cacertificate\"\
      },\
      \"input\":{\"shape\":\"RegisterCACertificateRequest\"},\
      \"output\":{\"shape\":\"RegisterCACertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"RegistrationCodeValidationException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"CertificateValidationException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Registers a CA certificate with Amazon Web Services IoT Core. There is no limit to the number of CA certificates you can register in your Amazon Web Services account. You can register up to 10 CA certificates with the same <code>CA subject field</code> per Amazon Web Services account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">RegisterCACertificate</a> action.</p>\"\
    },\
    \"RegisterCertificate\":{\
      \"name\":\"RegisterCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/certificate/register\"\
      },\
      \"input\":{\"shape\":\"RegisterCertificateRequest\"},\
      \"output\":{\"shape\":\"RegisterCertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"CertificateValidationException\"},\
        {\"shape\":\"CertificateStateException\"},\
        {\"shape\":\"CertificateConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Registers a device certificate with IoT in the same <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode\\\">certificate mode</a> as the signing CA. If you have more than one CA certificate that has the same subject field, you must specify the CA certificate that was used to sign the device certificate being registered.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">RegisterCertificate</a> action.</p>\"\
    },\
    \"RegisterCertificateWithoutCA\":{\
      \"name\":\"RegisterCertificateWithoutCA\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/certificate/register-no-ca\"\
      },\
      \"input\":{\"shape\":\"RegisterCertificateWithoutCARequest\"},\
      \"output\":{\"shape\":\"RegisterCertificateWithoutCAResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"CertificateStateException\"},\
        {\"shape\":\"CertificateValidationException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Register a certificate that does not have a certificate authority (CA). For supported certificates, consult <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/x509-client-certs.html#x509-cert-algorithms\\\"> Certificate signing algorithms supported by IoT</a>. </p>\"\
    },\
    \"RegisterThing\":{\
      \"name\":\"RegisterThing\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/things\"\
      },\
      \"input\":{\"shape\":\"RegisterThingRequest\"},\
      \"output\":{\"shape\":\"RegisterThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"},\
        {\"shape\":\"ResourceRegistrationFailureException\"}\
      ],\
      \"documentation\":\"<p>Provisions a thing in the device registry. RegisterThing calls other IoT control plane APIs. These calls might exceed your account level <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_iot\\\"> IoT Throttling Limits</a> and cause throttle errors. Please contact <a href=\\\"https://console.aws.amazon.com/support/home\\\">Amazon Web Services Customer Support</a> to raise your throttling limits if necessary.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">RegisterThing</a> action.</p>\"\
    },\
    \"RejectCertificateTransfer\":{\
      \"name\":\"RejectCertificateTransfer\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/reject-certificate-transfer/{certificateId}\"\
      },\
      \"input\":{\"shape\":\"RejectCertificateTransferRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TransferAlreadyCompletedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Rejects a pending certificate transfer. After IoT rejects a certificate transfer, the certificate status changes from <b>PENDING_TRANSFER</b> to <b>INACTIVE</b>.</p> <p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p> <p>This operation can only be called by the transfer destination. After it is called, the certificate will be returned to the source's account in the INACTIVE state.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">RejectCertificateTransfer</a> action.</p>\"\
    },\
    \"RemoveThingFromBillingGroup\":{\
      \"name\":\"RemoveThingFromBillingGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/billing-groups/removeThingFromBillingGroup\"\
      },\
      \"input\":{\"shape\":\"RemoveThingFromBillingGroupRequest\"},\
      \"output\":{\"shape\":\"RemoveThingFromBillingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes the given thing from the billing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">RemoveThingFromBillingGroup</a> action.</p> <note> <p>This call is asynchronous. It might take several seconds for the detachment to propagate.</p> </note>\"\
    },\
    \"RemoveThingFromThingGroup\":{\
      \"name\":\"RemoveThingFromThingGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/thing-groups/removeThingFromThingGroup\"\
      },\
      \"input\":{\"shape\":\"RemoveThingFromThingGroupRequest\"},\
      \"output\":{\"shape\":\"RemoveThingFromThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Remove the specified thing from the specified group.</p> <p>You must specify either a <code>thingGroupArn</code> or a <code>thingGroupName</code> to identify the thing group and either a <code>thingArn</code> or a <code>thingName</code> to identify the thing to remove from the thing group. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">RemoveThingFromThingGroup</a> action.</p>\"\
    },\
    \"ReplaceTopicRule\":{\
      \"name\":\"ReplaceTopicRule\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\"shape\":\"ReplaceTopicRuleRequest\"},\
      \"errors\":[\
        {\"shape\":\"SqlParseException\"},\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Replaces the rule. You must specify all parameters for the new rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ReplaceTopicRule</a> action.</p>\"\
    },\
    \"SearchIndex\":{\
      \"name\":\"SearchIndex\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/indices/search\"\
      },\
      \"input\":{\"shape\":\"SearchIndexRequest\"},\
      \"output\":{\"shape\":\"SearchIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"IndexNotReadyException\"}\
      ],\
      \"documentation\":\"<p>The query search index.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">SearchIndex</a> action.</p>\"\
    },\
    \"SetDefaultAuthorizer\":{\
      \"name\":\"SetDefaultAuthorizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/default-authorizer\"\
      },\
      \"input\":{\"shape\":\"SetDefaultAuthorizerRequest\"},\
      \"output\":{\"shape\":\"SetDefaultAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Sets the default authorizer. This will be used if a websocket connection is made without specifying an authorizer.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">SetDefaultAuthorizer</a> action.</p>\"\
    },\
    \"SetDefaultPolicyVersion\":{\
      \"name\":\"SetDefaultPolicyVersion\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\"\
      },\
      \"input\":{\"shape\":\"SetDefaultPolicyVersionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Sets the specified version of the specified policy as the policy's default (operative) version. This action affects all certificates to which the policy is attached. To list the principals the policy is attached to, use the <a>ListPrincipalPolicies</a> action.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">SetDefaultPolicyVersion</a> action.</p>\"\
    },\
    \"SetLoggingOptions\":{\
      \"name\":\"SetLoggingOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/loggingOptions\"\
      },\
      \"input\":{\"shape\":\"SetLoggingOptionsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Sets the logging options.</p> <p>NOTE: use of this command is not recommended. Use <code>SetV2LoggingOptions</code> instead.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">SetLoggingOptions</a> action.</p>\"\
    },\
    \"SetV2LoggingLevel\":{\
      \"name\":\"SetV2LoggingLevel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2LoggingLevel\"\
      },\
      \"input\":{\"shape\":\"SetV2LoggingLevelRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"NotConfiguredException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Sets the logging level.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">SetV2LoggingLevel</a> action.</p>\"\
    },\
    \"SetV2LoggingOptions\":{\
      \"name\":\"SetV2LoggingOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2LoggingOptions\"\
      },\
      \"input\":{\"shape\":\"SetV2LoggingOptionsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Sets the logging options for the V2 logging service.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">SetV2LoggingOptions</a> action.</p>\"\
    },\
    \"StartAuditMitigationActionsTask\":{\
      \"name\":\"StartAuditMitigationActionsTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/mitigationactions/tasks/{taskId}\"\
      },\
      \"input\":{\"shape\":\"StartAuditMitigationActionsTaskRequest\"},\
      \"output\":{\"shape\":\"StartAuditMitigationActionsTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TaskAlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Starts a task that applies a set of mitigation actions to the specified target.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">StartAuditMitigationActionsTask</a> action.</p>\"\
    },\
    \"StartDetectMitigationActionsTask\":{\
      \"name\":\"StartDetectMitigationActionsTask\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/detect/mitigationactions/tasks/{taskId}\"\
      },\
      \"input\":{\"shape\":\"StartDetectMitigationActionsTaskRequest\"},\
      \"output\":{\"shape\":\"StartDetectMitigationActionsTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TaskAlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Starts a Device Defender ML Detect mitigation actions task. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">StartDetectMitigationActionsTask</a> action.</p>\"\
    },\
    \"StartOnDemandAuditTask\":{\
      \"name\":\"StartOnDemandAuditTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/audit/tasks\"\
      },\
      \"input\":{\"shape\":\"StartOnDemandAuditTaskRequest\"},\
      \"output\":{\"shape\":\"StartOnDemandAuditTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts an on-demand Device Defender audit.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">StartOnDemandAuditTask</a> action.</p>\"\
    },\
    \"StartThingRegistrationTask\":{\
      \"name\":\"StartThingRegistrationTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/thing-registration-tasks\"\
      },\
      \"input\":{\"shape\":\"StartThingRegistrationTaskRequest\"},\
      \"output\":{\"shape\":\"StartThingRegistrationTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a bulk thing provisioning task.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">StartThingRegistrationTask</a> action.</p>\"\
    },\
    \"StopThingRegistrationTask\":{\
      \"name\":\"StopThingRegistrationTask\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/thing-registration-tasks/{taskId}/cancel\"\
      },\
      \"input\":{\"shape\":\"StopThingRegistrationTaskRequest\"},\
      \"output\":{\"shape\":\"StopThingRegistrationTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Cancels a bulk thing provisioning task.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">StopThingRegistrationTask</a> action.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Adds to or modifies the tags of the given resource. Tags are metadata which can be used to manage a resource.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">TagResource</a> action.</p>\"\
    },\
    \"TestAuthorization\":{\
      \"name\":\"TestAuthorization\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/test-authorization\"\
      },\
      \"input\":{\"shape\":\"TestAuthorizationRequest\"},\
      \"output\":{\"shape\":\"TestAuthorizationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Tests if a specified principal is authorized to perform an IoT action on a specified resource. Use this to test and debug the authorization behavior of devices that connect to the IoT device gateway.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">TestAuthorization</a> action.</p>\"\
    },\
    \"TestInvokeAuthorizer\":{\
      \"name\":\"TestInvokeAuthorizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/authorizer/{authorizerName}/test\"\
      },\
      \"input\":{\"shape\":\"TestInvokeAuthorizerRequest\"},\
      \"output\":{\"shape\":\"TestInvokeAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidResponseException\"}\
      ],\
      \"documentation\":\"<p>Tests a custom authorization behavior by invoking a specified custom authorizer. Use this to test and debug the custom authorization behavior of devices that connect to the IoT device gateway.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">TestInvokeAuthorizer</a> action.</p>\"\
    },\
    \"TransferCertificate\":{\
      \"name\":\"TransferCertificate\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/transfer-certificate/{certificateId}\"\
      },\
      \"input\":{\"shape\":\"TransferCertificateRequest\"},\
      \"output\":{\"shape\":\"TransferCertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"CertificateStateException\"},\
        {\"shape\":\"TransferConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Transfers the specified certificate to the specified Amazon Web Services account.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">TransferCertificate</a> action.</p> <p>You can cancel the transfer until it is acknowledged by the recipient.</p> <p>No notification is sent to the transfer destination's account. It is up to the caller to notify the transfer target.</p> <p>The certificate being transferred must not be in the ACTIVE state. You can use the <a>UpdateCertificate</a> action to deactivate it.</p> <p>The certificate must not have any policies attached to it. You can use the <a>DetachPolicy</a> action to detach them.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/untag\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes the given tags (metadata) from the resource.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UntagResource</a> action.</p>\"\
    },\
    \"UpdateAccountAuditConfiguration\":{\
      \"name\":\"UpdateAccountAuditConfiguration\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/audit/configuration\"\
      },\
      \"input\":{\"shape\":\"UpdateAccountAuditConfigurationRequest\"},\
      \"output\":{\"shape\":\"UpdateAccountAuditConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Configures or reconfigures the Device Defender audit settings for this account. Settings include how audit notifications are sent and which audit checks are enabled or disabled.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateAccountAuditConfiguration</a> action.</p>\"\
    },\
    \"UpdateAuditSuppression\":{\
      \"name\":\"UpdateAuditSuppression\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/audit/suppressions/update\"\
      },\
      \"input\":{\"shape\":\"UpdateAuditSuppressionRequest\"},\
      \"output\":{\"shape\":\"UpdateAuditSuppressionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Updates a Device Defender audit suppression. </p>\"\
    },\
    \"UpdateAuthorizer\":{\
      \"name\":\"UpdateAuthorizer\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/authorizer/{authorizerName}\"\
      },\
      \"input\":{\"shape\":\"UpdateAuthorizerRequest\"},\
      \"output\":{\"shape\":\"UpdateAuthorizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates an authorizer.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateAuthorizer</a> action.</p>\"\
    },\
    \"UpdateBillingGroup\":{\
      \"name\":\"UpdateBillingGroup\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/billing-groups/{billingGroupName}\"\
      },\
      \"input\":{\"shape\":\"UpdateBillingGroupRequest\"},\
      \"output\":{\"shape\":\"UpdateBillingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates information about the billing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateBillingGroup</a> action.</p>\"\
    },\
    \"UpdateCACertificate\":{\
      \"name\":\"UpdateCACertificate\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/cacertificate/{caCertificateId}\"\
      },\
      \"input\":{\"shape\":\"UpdateCACertificateRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a registered CA certificate.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateCACertificate</a> action.</p>\"\
    },\
    \"UpdateCertificate\":{\
      \"name\":\"UpdateCertificate\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/certificates/{certificateId}\"\
      },\
      \"input\":{\"shape\":\"UpdateCertificateRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"CertificateStateException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the status of the specified certificate. This operation is idempotent.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateCertificate</a> action.</p> <p>Certificates must be in the ACTIVE state to authenticate devices that use a certificate to connect to IoT.</p> <p>Within a few minutes of updating a certificate from the ACTIVE state to any other state, IoT disconnects all devices that used that certificate to connect. Devices cannot use a certificate that is not in the ACTIVE state to reconnect.</p>\"\
    },\
    \"UpdateCustomMetric\":{\
      \"name\":\"UpdateCustomMetric\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/custom-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"UpdateCustomMetricRequest\"},\
      \"output\":{\"shape\":\"UpdateCustomMetricResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a Device Defender detect custom metric. </p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateCustomMetric</a> action.</p>\"\
    },\
    \"UpdateDimension\":{\
      \"name\":\"UpdateDimension\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/dimensions/{name}\"\
      },\
      \"input\":{\"shape\":\"UpdateDimensionRequest\"},\
      \"output\":{\"shape\":\"UpdateDimensionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the definition for a dimension. You cannot change the type of a dimension after it is created (you can delete it and recreate it).</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateDimension</a> action.</p>\"\
    },\
    \"UpdateDomainConfiguration\":{\
      \"name\":\"UpdateDomainConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/domainConfigurations/{domainConfigurationName}\"\
      },\
      \"input\":{\"shape\":\"UpdateDomainConfigurationRequest\"},\
      \"output\":{\"shape\":\"UpdateDomainConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"CertificateValidationException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates values stored in the domain configuration. Domain configurations for default endpoints can't be updated.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateDomainConfiguration</a> action.</p>\"\
    },\
    \"UpdateDynamicThingGroup\":{\
      \"name\":\"UpdateDynamicThingGroup\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/dynamic-thing-groups/{thingGroupName}\"\
      },\
      \"input\":{\"shape\":\"UpdateDynamicThingGroupRequest\"},\
      \"output\":{\"shape\":\"UpdateDynamicThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"}\
      ],\
      \"documentation\":\"<p>Updates a dynamic thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateDynamicThingGroup</a> action.</p>\"\
    },\
    \"UpdateEventConfigurations\":{\
      \"name\":\"UpdateEventConfigurations\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/event-configurations\"\
      },\
      \"input\":{\"shape\":\"UpdateEventConfigurationsRequest\"},\
      \"output\":{\"shape\":\"UpdateEventConfigurationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the event configurations.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateEventConfigurations</a> action.</p>\"\
    },\
    \"UpdateFleetMetric\":{\
      \"name\":\"UpdateFleetMetric\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/fleet-metric/{metricName}\"\
      },\
      \"input\":{\"shape\":\"UpdateFleetMetricRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidQueryException\"},\
        {\"shape\":\"InvalidAggregationException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"IndexNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Updates the data for a fleet metric.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateFleetMetric</a> action.</p>\"\
    },\
    \"UpdateIndexingConfiguration\":{\
      \"name\":\"UpdateIndexingConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/indexing/config\"\
      },\
      \"input\":{\"shape\":\"UpdateIndexingConfigurationRequest\"},\
      \"output\":{\"shape\":\"UpdateIndexingConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the search configuration.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateIndexingConfiguration</a> action.</p>\"\
    },\
    \"UpdateJob\":{\
      \"name\":\"UpdateJob\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/jobs/{jobId}\"\
      },\
      \"input\":{\"shape\":\"UpdateJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Updates supported fields of the specified job.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateJob</a> action.</p>\"\
    },\
    \"UpdateMitigationAction\":{\
      \"name\":\"UpdateMitigationAction\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/mitigationactions/actions/{actionName}\"\
      },\
      \"input\":{\"shape\":\"UpdateMitigationActionRequest\"},\
      \"output\":{\"shape\":\"UpdateMitigationActionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the definition for the specified mitigation action.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateMitigationAction</a> action.</p>\"\
    },\
    \"UpdateProvisioningTemplate\":{\
      \"name\":\"UpdateProvisioningTemplate\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/provisioning-templates/{templateName}\"\
      },\
      \"input\":{\"shape\":\"UpdateProvisioningTemplateRequest\"},\
      \"output\":{\"shape\":\"UpdateProvisioningTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Updates a provisioning template.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateProvisioningTemplate</a> action.</p>\"\
    },\
    \"UpdateRoleAlias\":{\
      \"name\":\"UpdateRoleAlias\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/role-aliases/{roleAlias}\"\
      },\
      \"input\":{\"shape\":\"UpdateRoleAliasRequest\"},\
      \"output\":{\"shape\":\"UpdateRoleAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a role alias.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateRoleAlias</a> action.</p>\"\
    },\
    \"UpdateScheduledAudit\":{\
      \"name\":\"UpdateScheduledAudit\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/audit/scheduledaudits/{scheduledAuditName}\"\
      },\
      \"input\":{\"shape\":\"UpdateScheduledAuditRequest\"},\
      \"output\":{\"shape\":\"UpdateScheduledAuditResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a scheduled audit, including which checks are performed and how often the audit takes place.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateScheduledAudit</a> action.</p>\"\
    },\
    \"UpdateSecurityProfile\":{\
      \"name\":\"UpdateSecurityProfile\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/security-profiles/{securityProfileName}\"\
      },\
      \"input\":{\"shape\":\"UpdateSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"UpdateSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a Device Defender security profile.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateSecurityProfile</a> action.</p>\"\
    },\
    \"UpdateStream\":{\
      \"name\":\"UpdateStream\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/streams/{streamId}\"\
      },\
      \"input\":{\"shape\":\"UpdateStreamRequest\"},\
      \"output\":{\"shape\":\"UpdateStreamResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing stream. The stream version will be incremented by one.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateStream</a> action.</p>\"\
    },\
    \"UpdateThing\":{\
      \"name\":\"UpdateThing\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\"shape\":\"UpdateThingRequest\"},\
      \"output\":{\"shape\":\"UpdateThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates the data for a thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateThing</a> action.</p>\"\
    },\
    \"UpdateThingGroup\":{\
      \"name\":\"UpdateThingGroup\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/thing-groups/{thingGroupName}\"\
      },\
      \"input\":{\"shape\":\"UpdateThingGroupRequest\"},\
      \"output\":{\"shape\":\"UpdateThingGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"VersionConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Update a thing group.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateThingGroup</a> action.</p>\"\
    },\
    \"UpdateThingGroupsForThing\":{\
      \"name\":\"UpdateThingGroupsForThing\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/thing-groups/updateThingGroupsForThing\"\
      },\
      \"input\":{\"shape\":\"UpdateThingGroupsForThingRequest\"},\
      \"output\":{\"shape\":\"UpdateThingGroupsForThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates the groups to which the thing belongs.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateThingGroupsForThing</a> action.</p>\"\
    },\
    \"UpdateTopicRuleDestination\":{\
      \"name\":\"UpdateTopicRuleDestination\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/destinations\"\
      },\
      \"input\":{\"shape\":\"UpdateTopicRuleDestinationRequest\"},\
      \"output\":{\"shape\":\"UpdateTopicRuleDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ConflictingResourceUpdateException\"}\
      ],\
      \"documentation\":\"<p>Updates a topic rule destination. You use this to change the status, endpoint URL, or confirmation URL of the destination.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateTopicRuleDestination</a> action.</p>\"\
    },\
    \"ValidateSecurityProfileBehaviors\":{\
      \"name\":\"ValidateSecurityProfileBehaviors\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/security-profile-behaviors/validate\"\
      },\
      \"input\":{\"shape\":\"ValidateSecurityProfileBehaviorsRequest\"},\
      \"output\":{\"shape\":\"ValidateSecurityProfileBehaviorsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Validates a Device Defender security profile behaviors specification.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ValidateSecurityProfileBehaviors</a> action.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AbortAction\":{\
      \"type\":\"string\",\
      \"enum\":[\"CANCEL\"]\
    },\
    \"AbortConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"criteriaList\"],\
      \"members\":{\
        \"criteriaList\":{\
          \"shape\":\"AbortCriteriaList\",\
          \"documentation\":\"<p>The list of criteria that determine when and how to abort the job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The criteria that determine when and how a job abort takes place.</p>\"\
    },\
    \"AbortCriteria\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"failureType\",\
        \"action\",\
        \"thresholdPercentage\",\
        \"minNumberOfExecutedThings\"\
      ],\
      \"members\":{\
        \"failureType\":{\
          \"shape\":\"JobExecutionFailureType\",\
          \"documentation\":\"<p>The type of job execution failures that can initiate a job abort.</p>\"\
        },\
        \"action\":{\
          \"shape\":\"AbortAction\",\
          \"documentation\":\"<p>The type of job action to take to initiate the job abort.</p>\"\
        },\
        \"thresholdPercentage\":{\
          \"shape\":\"AbortThresholdPercentage\",\
          \"documentation\":\"<p>The minimum percentage of job execution failures that must occur to initiate the job abort.</p> <p>Amazon Web Services IoT Core supports up to two digits after the decimal (for example, 10.9 and 10.99, but not 10.999).</p>\"\
        },\
        \"minNumberOfExecutedThings\":{\
          \"shape\":\"MinimumNumberOfExecutedThings\",\
          \"documentation\":\"<p>The minimum number of things which must receive job execution notifications before the job can be aborted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The criteria that determine when and how a job abort takes place.</p>\"\
    },\
    \"AbortCriteriaList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AbortCriteria\"},\
      \"min\":1\
    },\
    \"AbortThresholdPercentage\":{\
      \"type\":\"double\",\
      \"max\":100\
    },\
    \"AcceptCertificateTransferRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\"\
        }\
      },\
      \"documentation\":\"<p>The input for the AcceptCertificateTransfer operation.</p>\"\
    },\
    \"AcmCertificateArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"arn:aws(-cn|-us-gov|-iso-b|-iso)?:acm:[a-z]{2}-(gov-|iso-|isob-)?[a-z]{4,9}-\\\\d{1}:\\\\d{12}:certificate/[a-zA-Z0-9/-]+\"\
    },\
    \"Action\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"dynamoDB\":{\
          \"shape\":\"DynamoDBAction\",\
          \"documentation\":\"<p>Write to a DynamoDB table.</p>\"\
        },\
        \"dynamoDBv2\":{\
          \"shape\":\"DynamoDBv2Action\",\
          \"documentation\":\"<p>Write to a DynamoDB table. This is a new version of the DynamoDB action. It allows you to write each attribute in an MQTT message payload into a separate DynamoDB column.</p>\"\
        },\
        \"lambda\":{\
          \"shape\":\"LambdaAction\",\
          \"documentation\":\"<p>Invoke a Lambda function.</p>\"\
        },\
        \"sns\":{\
          \"shape\":\"SnsAction\",\
          \"documentation\":\"<p>Publish to an Amazon SNS topic.</p>\"\
        },\
        \"sqs\":{\
          \"shape\":\"SqsAction\",\
          \"documentation\":\"<p>Publish to an Amazon SQS queue.</p>\"\
        },\
        \"kinesis\":{\
          \"shape\":\"KinesisAction\",\
          \"documentation\":\"<p>Write data to an Amazon Kinesis stream.</p>\"\
        },\
        \"republish\":{\
          \"shape\":\"RepublishAction\",\
          \"documentation\":\"<p>Publish to another MQTT topic.</p>\"\
        },\
        \"s3\":{\
          \"shape\":\"S3Action\",\
          \"documentation\":\"<p>Write to an Amazon S3 bucket.</p>\"\
        },\
        \"firehose\":{\
          \"shape\":\"FirehoseAction\",\
          \"documentation\":\"<p>Write to an Amazon Kinesis Firehose stream.</p>\"\
        },\
        \"cloudwatchMetric\":{\
          \"shape\":\"CloudwatchMetricAction\",\
          \"documentation\":\"<p>Capture a CloudWatch metric.</p>\"\
        },\
        \"cloudwatchAlarm\":{\
          \"shape\":\"CloudwatchAlarmAction\",\
          \"documentation\":\"<p>Change the state of a CloudWatch alarm.</p>\"\
        },\
        \"cloudwatchLogs\":{\
          \"shape\":\"CloudwatchLogsAction\",\
          \"documentation\":\"<p>Send data to CloudWatch Logs.</p>\"\
        },\
        \"elasticsearch\":{\
          \"shape\":\"ElasticsearchAction\",\
          \"documentation\":\"<p>Write data to an Amazon OpenSearch Service domain.</p> <note> <p>The <code>Elasticsearch</code> action can only be used by existing rule actions. To create a new rule action or to update an existing rule action, use the <code>OpenSearch</code> rule action instead. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_OpenSearchAction.html\\\">OpenSearchAction</a>.</p> </note>\"\
        },\
        \"salesforce\":{\
          \"shape\":\"SalesforceAction\",\
          \"documentation\":\"<p>Send a message to a Salesforce IoT Cloud Input Stream.</p>\"\
        },\
        \"iotAnalytics\":{\
          \"shape\":\"IotAnalyticsAction\",\
          \"documentation\":\"<p>Sends message data to an IoT Analytics channel.</p>\"\
        },\
        \"iotEvents\":{\
          \"shape\":\"IotEventsAction\",\
          \"documentation\":\"<p>Sends an input to an IoT Events detector.</p>\"\
        },\
        \"iotSiteWise\":{\
          \"shape\":\"IotSiteWiseAction\",\
          \"documentation\":\"<p>Sends data from the MQTT message that triggered the rule to IoT SiteWise asset properties.</p>\"\
        },\
        \"stepFunctions\":{\
          \"shape\":\"StepFunctionsAction\",\
          \"documentation\":\"<p>Starts execution of a Step Functions state machine.</p>\"\
        },\
        \"timestream\":{\
          \"shape\":\"TimestreamAction\",\
          \"documentation\":\"<p>The Timestream rule action writes attributes (measures) from an MQTT message into an Amazon Timestream table. For more information, see the <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html\\\">Timestream</a> topic rule action documentation.</p>\"\
        },\
        \"http\":{\
          \"shape\":\"HttpAction\",\
          \"documentation\":\"<p>Send data to an HTTPS endpoint.</p>\"\
        },\
        \"kafka\":{\
          \"shape\":\"KafkaAction\",\
          \"documentation\":\"<p>Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) or self-managed Apache Kafka cluster.</p>\"\
        },\
        \"openSearch\":{\
          \"shape\":\"OpenSearchAction\",\
          \"documentation\":\"<p>Write data to an Amazon OpenSearch Service domain.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"LocationAction\",\
          \"documentation\":\"<p>The Amazon Location Service rule action sends device location updates from an MQTT message to an Amazon Location tracker resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the actions associated with a rule.</p>\"\
    },\
    \"ActionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Action\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"ActionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUBLISH\",\
        \"SUBSCRIBE\",\
        \"RECEIVE\",\
        \"CONNECT\"\
      ]\
    },\
    \"ActiveViolation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"violationId\":{\
          \"shape\":\"ViolationId\",\
          \"documentation\":\"<p>The ID of the active violation.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"DeviceDefenderThingName\",\
          \"documentation\":\"<p>The name of the thing responsible for the active violation.</p>\"\
        },\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The security profile with the behavior is in violation.</p>\"\
        },\
        \"behavior\":{\
          \"shape\":\"Behavior\",\
          \"documentation\":\"<p>The behavior that is being violated.</p>\"\
        },\
        \"lastViolationValue\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value of the metric (the measurement) that caused the most recent violation.</p>\"\
        },\
        \"violationEventAdditionalInfo\":{\
          \"shape\":\"ViolationEventAdditionalInfo\",\
          \"documentation\":\"<p> The details of a violation event. </p>\"\
        },\
        \"verificationState\":{\
          \"shape\":\"VerificationState\",\
          \"documentation\":\"<p>The verification state of the violation (detect alarm).</p>\"\
        },\
        \"verificationStateDescription\":{\
          \"shape\":\"VerificationStateDescription\",\
          \"documentation\":\"<p>The description of the verification state of the violation.</p>\"\
        },\
        \"lastViolationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the most recent violation occurred.</p>\"\
        },\
        \"violationStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the violation started.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an active Device Defender security profile behavior violation.</p>\"\
    },\
    \"ActiveViolations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ActiveViolation\"}\
    },\
    \"AddThingToBillingGroupRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group.</p> <note> <p>This call is asynchronous. It might take several seconds for the detachment to propagate.</p> </note>\"\
        },\
        \"billingGroupArn\":{\
          \"shape\":\"BillingGroupArn\",\
          \"documentation\":\"<p>The ARN of the billing group.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing to be added to the billing group.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the thing to be added to the billing group.</p>\"\
        }\
      }\
    },\
    \"AddThingToBillingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AddThingToThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The name of the group to which you are adding a thing.</p>\"\
        },\
        \"thingGroupArn\":{\
          \"shape\":\"ThingGroupArn\",\
          \"documentation\":\"<p>The ARN of the group to which you are adding a thing.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing to add to a group.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the thing to add to a group.</p>\"\
        },\
        \"overrideDynamicGroups\":{\
          \"shape\":\"OverrideDynamicGroups\",\
          \"documentation\":\"<p>Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing to a static group removes the thing from the last dynamic group.</p>\"\
        }\
      }\
    },\
    \"AddThingToThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AddThingsToThingGroupParams\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingGroupNames\"],\
      \"members\":{\
        \"thingGroupNames\":{\
          \"shape\":\"ThingGroupNames\",\
          \"documentation\":\"<p>The list of groups to which you want to add the things that triggered the mitigation action. You can add a thing to a maximum of 10 groups, but you can't add a thing to more than one group in the same hierarchy.</p>\"\
        },\
        \"overrideDynamicGroups\":{\
          \"shape\":\"NullableBoolean\",\
          \"documentation\":\"<p>Specifies if this mitigation action can move the things that triggered the mitigation action even if they are part of one or more dynamic thing groups.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters used when defining a mitigation action that move a set of things to a thing group.</p>\"\
    },\
    \"AdditionalMetricsToRetainList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BehaviorMetric\"}\
    },\
    \"AdditionalMetricsToRetainV2List\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricToRetain\"}\
    },\
    \"AdditionalParameterMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AttributeKey\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"AggregationField\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"AggregationType\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"AggregationTypeName\",\
          \"documentation\":\"<p>The name of the aggregation type.</p>\"\
        },\
        \"values\":{\
          \"shape\":\"AggregationTypeValues\",\
          \"documentation\":\"<p>A list of the values of aggregation types.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of aggregation queries.</p>\"\
    },\
    \"AggregationTypeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Statistics\",\
        \"Percentiles\",\
        \"Cardinality\"\
      ]\
    },\
    \"AggregationTypeValue\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9]+\"\
    },\
    \"AggregationTypeValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AggregationTypeValue\"}\
    },\
    \"AlarmName\":{\"type\":\"string\"},\
    \"AlertTarget\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"alertTargetArn\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"alertTargetArn\":{\
          \"shape\":\"AlertTargetArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the notification target to which alerts are sent.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role that grants permission to send alerts to the notification target.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure containing the alert target ARN and the role ARN.</p>\"\
    },\
    \"AlertTargetArn\":{\"type\":\"string\"},\
    \"AlertTargetType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The type of alert target: one of \\\"SNS\\\".</p>\",\
      \"enum\":[\"SNS\"]\
    },\
    \"AlertTargets\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AlertTargetType\"},\
      \"value\":{\"shape\":\"AlertTarget\"}\
    },\
    \"AllowAuthorizerOverride\":{\"type\":\"boolean\"},\
    \"AllowAutoRegistration\":{\"type\":\"boolean\"},\
    \"Allowed\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>A list of policies that allowed the authentication.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information that allowed the authorization.</p>\"\
    },\
    \"ApproximateSecondsBeforeTimedOut\":{\"type\":\"long\"},\
    \"AscendingOrder\":{\"type\":\"boolean\"},\
    \"AssetId\":{\"type\":\"string\"},\
    \"AssetPropertyAlias\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"AssetPropertyBooleanValue\":{\"type\":\"string\"},\
    \"AssetPropertyDoubleValue\":{\"type\":\"string\"},\
    \"AssetPropertyEntryId\":{\"type\":\"string\"},\
    \"AssetPropertyId\":{\"type\":\"string\"},\
    \"AssetPropertyIntegerValue\":{\"type\":\"string\"},\
    \"AssetPropertyOffsetInNanos\":{\"type\":\"string\"},\
    \"AssetPropertyQuality\":{\"type\":\"string\"},\
    \"AssetPropertyStringValue\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"AssetPropertyTimeInSeconds\":{\"type\":\"string\"},\
    \"AssetPropertyTimestamp\":{\
      \"type\":\"structure\",\
      \"required\":[\"timeInSeconds\"],\
      \"members\":{\
        \"timeInSeconds\":{\
          \"shape\":\"AssetPropertyTimeInSeconds\",\
          \"documentation\":\"<p>A string that contains the time in seconds since epoch. Accepts substitution templates.</p>\"\
        },\
        \"offsetInNanos\":{\
          \"shape\":\"AssetPropertyOffsetInNanos\",\
          \"documentation\":\"<p>Optional. A string that contains the nanosecond time offset. Accepts substitution templates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An asset property timestamp entry containing the following information.</p>\"\
    },\
    \"AssetPropertyValue\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"value\",\
        \"timestamp\"\
      ],\
      \"members\":{\
        \"value\":{\
          \"shape\":\"AssetPropertyVariant\",\
          \"documentation\":\"<p>The value of the asset property.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"AssetPropertyTimestamp\",\
          \"documentation\":\"<p>The asset property value timestamp.</p>\"\
        },\
        \"quality\":{\
          \"shape\":\"AssetPropertyQuality\",\
          \"documentation\":\"<p>Optional. A string that describes the quality of the value. Accepts substitution templates. Must be <code>GOOD</code>, <code>BAD</code>, or <code>UNCERTAIN</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An asset property value entry containing the following information.</p>\"\
    },\
    \"AssetPropertyValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AssetPropertyValue\"},\
      \"min\":1\
    },\
    \"AssetPropertyVariant\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"stringValue\":{\
          \"shape\":\"AssetPropertyStringValue\",\
          \"documentation\":\"<p>Optional. The string value of the value entry. Accepts substitution templates.</p>\"\
        },\
        \"integerValue\":{\
          \"shape\":\"AssetPropertyIntegerValue\",\
          \"documentation\":\"<p>Optional. A string that contains the integer value of the value entry. Accepts substitution templates.</p>\"\
        },\
        \"doubleValue\":{\
          \"shape\":\"AssetPropertyDoubleValue\",\
          \"documentation\":\"<p>Optional. A string that contains the double value of the value entry. Accepts substitution templates.</p>\"\
        },\
        \"booleanValue\":{\
          \"shape\":\"AssetPropertyBooleanValue\",\
          \"documentation\":\"<p>Optional. A string that contains the boolean value (<code>true</code> or <code>false</code>) of the value entry. Accepts substitution templates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains an asset property value (of a single type).</p>\"\
    },\
    \"AssociateTargetsWithJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"targets\",\
        \"jobId\"\
      ],\
      \"members\":{\
        \"targets\":{\
          \"shape\":\"JobTargets\",\
          \"documentation\":\"<p>A list of thing group ARNs that define the targets of the job.</p>\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"comment\":{\
          \"shape\":\"Comment\",\
          \"documentation\":\"<p>An optional comment string describing why the job was associated with the targets.</p>\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namespaceId\"\
        }\
      }\
    },\
    \"AssociateTargetsWithJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobArn\":{\
          \"shape\":\"JobArn\",\
          \"documentation\":\"<p>An ARN identifying the job.</p>\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A short text description of the job.</p>\"\
        }\
      }\
    },\
    \"AttachPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"target\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy to attach.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"target\":{\
          \"shape\":\"PolicyTarget\",\
          \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/security-iam.html\\\">identity</a> to which the policy is attached. For example, a thing group or a certificate.</p>\"\
        }\
      }\
    },\
    \"AttachPrincipalPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-principal\"\
        }\
      },\
      \"documentation\":\"<p>The input for the AttachPrincipalPolicy operation.</p>\"\
    },\
    \"AttachSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"securityProfileName\",\
        \"securityProfileTargetArn\"\
      ],\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The security profile that is attached.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"securityProfileTargetArn\":{\
          \"shape\":\"SecurityProfileTargetArn\",\
          \"documentation\":\"<p>The ARN of the target (thing group) to which the security profile is attached.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"securityProfileTargetArn\"\
        }\
      }\
    },\
    \"AttachSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AttachThingPrincipalRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-principal\"\
        }\
      },\
      \"documentation\":\"<p>The input for the AttachThingPrincipal operation.</p>\"\
    },\
    \"AttachThingPrincipalResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output from the AttachThingPrincipal operation.</p>\"\
    },\
    \"AttributeKey\":{\"type\":\"string\"},\
    \"AttributeName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[a-zA-Z0-9_.,@/:#-]+\"\
    },\
    \"AttributePayload\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A JSON string containing up to three key-value pair in JSON format. For example:</p> <p> <code>{\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}}</code> </p>\"\
        },\
        \"merge\":{\
          \"shape\":\"Flag\",\
          \"documentation\":\"<p>Specifies whether the list of attributes provided in the <code>AttributePayload</code> is merged with the attributes stored in the registry, instead of overwriting them.</p> <p>To remove an attribute, call <code>UpdateThing</code> with an empty attribute value.</p> <note> <p>The <code>merge</code> attribute is only valid when calling <code>UpdateThing</code> or <code>UpdateThingGroup</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The attribute payload.</p>\"\
    },\
    \"AttributeValue\":{\
      \"type\":\"string\",\
      \"max\":800,\
      \"pattern\":\"[a-zA-Z0-9_.,@/:#-]*\"\
    },\
    \"Attributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AttributeName\"},\
      \"value\":{\"shape\":\"AttributeValue\"}\
    },\
    \"AttributesMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AttributeKey\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"AuditCheckConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>True if this audit check is enabled for this account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Which audit checks are enabled and disabled for this account.</p>\"\
    },\
    \"AuditCheckConfigurations\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuditCheckName\"},\
      \"value\":{\"shape\":\"AuditCheckConfiguration\"}\
    },\
    \"AuditCheckDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"checkRunStatus\":{\
          \"shape\":\"AuditCheckRunStatus\",\
          \"documentation\":\"<p>The completion status of this check. One of \\\"IN_PROGRESS\\\", \\\"WAITING_FOR_DATA_COLLECTION\\\", \\\"CANCELED\\\", \\\"COMPLETED_COMPLIANT\\\", \\\"COMPLETED_NON_COMPLIANT\\\", or \\\"FAILED\\\".</p>\"\
        },\
        \"checkCompliant\":{\
          \"shape\":\"CheckCompliant\",\
          \"documentation\":\"<p>True if the check is complete and found all resources compliant.</p>\"\
        },\
        \"totalResourcesCount\":{\
          \"shape\":\"TotalResourcesCount\",\
          \"documentation\":\"<p>The number of resources on which the check was performed.</p>\"\
        },\
        \"nonCompliantResourcesCount\":{\
          \"shape\":\"NonCompliantResourcesCount\",\
          \"documentation\":\"<p>The number of resources that were found noncompliant during the check.</p>\"\
        },\
        \"suppressedNonCompliantResourcesCount\":{\
          \"shape\":\"SuppressedNonCompliantResourcesCount\",\
          \"documentation\":\"<p> Describes how many of the non-compliant resources created during the evaluation of an audit check were marked as suppressed. </p>\"\
        },\
        \"errorCode\":{\
          \"shape\":\"ErrorCode\",\
          \"documentation\":\"<p>The code of any error encountered when this check is performed during this audit. One of \\\"INSUFFICIENT_PERMISSIONS\\\" or \\\"AUDIT_CHECK_DISABLED\\\".</p>\"\
        },\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The message associated with any error encountered when this check is performed during this audit.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the audit check.</p>\"\
    },\
    \"AuditCheckName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>\"\
    },\
    \"AuditCheckRunStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"WAITING_FOR_DATA_COLLECTION\",\
        \"CANCELED\",\
        \"COMPLETED_COMPLIANT\",\
        \"COMPLETED_NON_COMPLIANT\",\
        \"FAILED\"\
      ]\
    },\
    \"AuditCheckToActionsMapping\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuditCheckName\"},\
      \"value\":{\"shape\":\"MitigationActionNameList\"}\
    },\
    \"AuditCheckToReasonCodeFilter\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuditCheckName\"},\
      \"value\":{\"shape\":\"ReasonForNonComplianceCodes\"}\
    },\
    \"AuditDescription\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"AuditDetails\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuditCheckName\"},\
      \"value\":{\"shape\":\"AuditCheckDetails\"}\
    },\
    \"AuditFinding\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"findingId\":{\
          \"shape\":\"FindingId\",\
          \"documentation\":\"<p>A unique identifier for this set of audit findings. This identifier is used to apply mitigation tasks to one or more sets of findings.</p>\"\
        },\
        \"taskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>The ID of the audit that generated this result (finding).</p>\"\
        },\
        \"checkName\":{\
          \"shape\":\"AuditCheckName\",\
          \"documentation\":\"<p>The audit check that generated this result.</p>\"\
        },\
        \"taskStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the audit started.</p>\"\
        },\
        \"findingTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the result (finding) was discovered.</p>\"\
        },\
        \"severity\":{\
          \"shape\":\"AuditFindingSeverity\",\
          \"documentation\":\"<p>The severity of the result (finding).</p>\"\
        },\
        \"nonCompliantResource\":{\
          \"shape\":\"NonCompliantResource\",\
          \"documentation\":\"<p>The resource that was found to be noncompliant with the audit check.</p>\"\
        },\
        \"relatedResources\":{\
          \"shape\":\"RelatedResources\",\
          \"documentation\":\"<p>The list of related resources.</p>\"\
        },\
        \"reasonForNonCompliance\":{\
          \"shape\":\"ReasonForNonCompliance\",\
          \"documentation\":\"<p>The reason the resource was noncompliant.</p>\"\
        },\
        \"reasonForNonComplianceCode\":{\
          \"shape\":\"ReasonForNonComplianceCode\",\
          \"documentation\":\"<p>A code that indicates the reason that the resource was noncompliant.</p>\"\
        },\
        \"isSuppressed\":{\
          \"shape\":\"IsSuppressed\",\
          \"documentation\":\"<p> Indicates whether the audit finding was suppressed or not during reporting. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The findings (results) of the audit.</p>\"\
    },\
    \"AuditFindingSeverity\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CRITICAL\",\
        \"HIGH\",\
        \"MEDIUM\",\
        \"LOW\"\
      ]\
    },\
    \"AuditFindings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuditFinding\"}\
    },\
    \"AuditFrequency\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DAILY\",\
        \"WEEKLY\",\
        \"BIWEEKLY\",\
        \"MONTHLY\"\
      ]\
    },\
    \"AuditMitigationActionExecutionMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p>The unique identifier for the task that applies the mitigation action.</p>\"\
        },\
        \"findingId\":{\
          \"shape\":\"FindingId\",\
          \"documentation\":\"<p>The unique identifier for the findings to which the task and associated mitigation action are applied.</p>\"\
        },\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>The friendly name of the mitigation action being applied by the task.</p>\"\
        },\
        \"actionId\":{\
          \"shape\":\"MitigationActionId\",\
          \"documentation\":\"<p>The unique identifier for the mitigation action being applied by the task.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"AuditMitigationActionsExecutionStatus\",\
          \"documentation\":\"<p>The current status of the task being executed.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the task was started.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the task was completed or canceled. Blank if the task is still running.</p>\"\
        },\
        \"errorCode\":{\
          \"shape\":\"ErrorCode\",\
          \"documentation\":\"<p>If an error occurred, the code that indicates which type of error occurred.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>If an error occurred, a message that describes the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returned by ListAuditMitigationActionsTask, this object contains information that describes a mitigation action that has been started.</p>\"\
    },\
    \"AuditMitigationActionExecutionMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuditMitigationActionExecutionMetadata\"}\
    },\
    \"AuditMitigationActionsExecutionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"CANCELED\",\
        \"SKIPPED\",\
        \"PENDING\"\
      ]\
    },\
    \"AuditMitigationActionsTaskMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p>The unique identifier for the task.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the audit mitigation actions task was started.</p>\"\
        },\
        \"taskStatus\":{\
          \"shape\":\"AuditMitigationActionsTaskStatus\",\
          \"documentation\":\"<p>The current state of the audit mitigation actions task.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an audit mitigation actions task that is returned by <code>ListAuditMitigationActionsTasks</code>.</p>\"\
    },\
    \"AuditMitigationActionsTaskMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuditMitigationActionsTaskMetadata\"}\
    },\
    \"AuditMitigationActionsTaskStatistics\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuditCheckName\"},\
      \"value\":{\"shape\":\"TaskStatisticsForAuditCheck\"}\
    },\
    \"AuditMitigationActionsTaskStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"CANCELED\"\
      ]\
    },\
    \"AuditMitigationActionsTaskTarget\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"auditTaskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>If the task will apply a mitigation action to findings from a specific audit, this value uniquely identifies the audit.</p>\"\
        },\
        \"findingIds\":{\
          \"shape\":\"FindingIds\",\
          \"documentation\":\"<p>If the task will apply a mitigation action to one or more listed findings, this value uniquely identifies those findings.</p>\"\
        },\
        \"auditCheckToReasonCodeFilter\":{\
          \"shape\":\"AuditCheckToReasonCodeFilter\",\
          \"documentation\":\"<p>Specifies a filter in the form of an audit check and set of reason codes that identify the findings from the audit to which the audit mitigation actions task apply.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Used in MitigationActionParams, this information identifies the target findings to which the mitigation actions are applied. Only one entry appears.</p>\"\
    },\
    \"AuditNotificationTarget\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The ARN of the target (SNS topic) to which audit notifications are sent.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role that grants permission to send notifications to the target.</p>\"\
        },\
        \"enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>True if notifications to the target are enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the targets to which audit notifications are sent.</p>\"\
    },\
    \"AuditNotificationTargetConfigurations\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AuditNotificationType\"},\
      \"value\":{\"shape\":\"AuditNotificationTarget\"}\
    },\
    \"AuditNotificationType\":{\
      \"type\":\"string\",\
      \"enum\":[\"SNS\"]\
    },\
    \"AuditSuppression\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"checkName\",\
        \"resourceIdentifier\"\
      ],\
      \"members\":{\
        \"checkName\":{\"shape\":\"AuditCheckName\"},\
        \"resourceIdentifier\":{\"shape\":\"ResourceIdentifier\"},\
        \"expirationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The expiration date (epoch timestamp in seconds) that you want the suppression to adhere to. </p>\"\
        },\
        \"suppressIndefinitely\":{\
          \"shape\":\"SuppressIndefinitely\",\
          \"documentation\":\"<p> Indicates whether a suppression should exist indefinitely or not. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"AuditDescription\",\
          \"documentation\":\"<p> The description of the audit suppression. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Filters out specific findings of a Device Defender audit. </p>\"\
    },\
    \"AuditSuppressionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuditSuppression\"}\
    },\
    \"AuditTaskId\":{\
      \"type\":\"string\",\
      \"max\":40,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9\\\\-]+\"\
    },\
    \"AuditTaskMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>The ID of this audit.</p>\"\
        },\
        \"taskStatus\":{\
          \"shape\":\"AuditTaskStatus\",\
          \"documentation\":\"<p>The status of this audit. One of \\\"IN_PROGRESS\\\", \\\"COMPLETED\\\", \\\"FAILED\\\", or \\\"CANCELED\\\".</p>\"\
        },\
        \"taskType\":{\
          \"shape\":\"AuditTaskType\",\
          \"documentation\":\"<p>The type of this audit. One of \\\"ON_DEMAND_AUDIT_TASK\\\" or \\\"SCHEDULED_AUDIT_TASK\\\".</p>\"\
        }\
      },\
      \"documentation\":\"<p>The audits that were performed.</p>\"\
    },\
    \"AuditTaskMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuditTaskMetadata\"}\
    },\
    \"AuditTaskStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"CANCELED\"\
      ]\
    },\
    \"AuditTaskType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ON_DEMAND_AUDIT_TASK\",\
        \"SCHEDULED_AUDIT_TASK\"\
      ]\
    },\
    \"AuthDecision\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALLOWED\",\
        \"EXPLICIT_DENY\",\
        \"IMPLICIT_DENY\"\
      ]\
    },\
    \"AuthInfo\":{\
      \"type\":\"structure\",\
      \"required\":[\"resources\"],\
      \"members\":{\
        \"actionType\":{\
          \"shape\":\"ActionType\",\
          \"documentation\":\"<p>The type of action for which the principal is being authorized.</p>\"\
        },\
        \"resources\":{\
          \"shape\":\"Resources\",\
          \"documentation\":\"<p>The resources for which the principal is being authorized to perform the specified action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A collection of authorization information.</p>\"\
    },\
    \"AuthInfos\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuthInfo\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"AuthResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authInfo\":{\
          \"shape\":\"AuthInfo\",\
          \"documentation\":\"<p>Authorization information.</p>\"\
        },\
        \"allowed\":{\
          \"shape\":\"Allowed\",\
          \"documentation\":\"<p>The policies and statements that allowed the specified action.</p>\"\
        },\
        \"denied\":{\
          \"shape\":\"Denied\",\
          \"documentation\":\"<p>The policies and statements that denied the specified action.</p>\"\
        },\
        \"authDecision\":{\
          \"shape\":\"AuthDecision\",\
          \"documentation\":\"<p>The final authorization decision of this scenario. Multiple statements are taken into account when determining the authorization decision. An explicit deny statement can override multiple allow statements.</p>\"\
        },\
        \"missingContextValues\":{\
          \"shape\":\"MissingContextValues\",\
          \"documentation\":\"<p>Contains any missing context values found while evaluating policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The authorizer result.</p>\"\
    },\
    \"AuthResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuthResult\"}\
    },\
    \"AuthorizerArn\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"AuthorizerConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"defaultAuthorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The name of the authorization service for a domain configuration.</p>\"\
        },\
        \"allowAuthorizerOverride\":{\
          \"shape\":\"AllowAuthorizerOverride\",\
          \"documentation\":\"<p>A Boolean that specifies whether the domain configuration's authorization service can be overridden.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>An object that specifies the authorization service for a domain.</p>\"\
    },\
    \"AuthorizerDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer name.</p>\"\
        },\
        \"authorizerArn\":{\
          \"shape\":\"AuthorizerArn\",\
          \"documentation\":\"<p>The authorizer ARN.</p>\"\
        },\
        \"authorizerFunctionArn\":{\
          \"shape\":\"AuthorizerFunctionArn\",\
          \"documentation\":\"<p>The authorizer's Lambda function ARN.</p>\"\
        },\
        \"tokenKeyName\":{\
          \"shape\":\"TokenKeyName\",\
          \"documentation\":\"<p>The key used to extract the token from the HTTP headers.</p>\"\
        },\
        \"tokenSigningPublicKeys\":{\
          \"shape\":\"PublicKeyMap\",\
          \"documentation\":\"<p>The public keys used to validate the token signature returned by your custom authentication service.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"AuthorizerStatus\",\
          \"documentation\":\"<p>The status of the authorizer.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The UNIX timestamp of when the authorizer was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The UNIX timestamp of when the authorizer was last updated.</p>\"\
        },\
        \"signingDisabled\":{\
          \"shape\":\"BooleanKey\",\
          \"documentation\":\"<p>Specifies whether IoT validates the token signature in an authorization request.</p>\"\
        },\
        \"enableCachingForHttp\":{\
          \"shape\":\"EnableCachingForHttp\",\
          \"documentation\":\"<p>When <code>true</code>, the result from the authorizerâs Lambda function is cached for the time specified in <code>refreshAfterInSeconds</code>. The cached result is used while the device reuses the same HTTP connection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The authorizer description.</p>\"\
    },\
    \"AuthorizerFunctionArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"AuthorizerName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w=,@-]+\"\
    },\
    \"AuthorizerStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"INACTIVE\"\
      ]\
    },\
    \"AuthorizerSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer name.</p>\"\
        },\
        \"authorizerArn\":{\
          \"shape\":\"AuthorizerArn\",\
          \"documentation\":\"<p>The authorizer ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The authorizer summary.</p>\"\
    },\
    \"Authorizers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuthorizerSummary\"}\
    },\
    \"AutoRegistrationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLE\",\
        \"DISABLE\"\
      ]\
    },\
    \"Average\":{\"type\":\"double\"},\
    \"AwsAccountId\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"[0-9]+\"\
    },\
    \"AwsArn\":{\"type\":\"string\"},\
    \"AwsIotJobArn\":{\"type\":\"string\"},\
    \"AwsIotJobId\":{\"type\":\"string\"},\
    \"AwsIotSqlVersion\":{\"type\":\"string\"},\
    \"AwsJobAbortConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"abortCriteriaList\"],\
      \"members\":{\
        \"abortCriteriaList\":{\
          \"shape\":\"AwsJobAbortCriteriaList\",\
          \"documentation\":\"<p>The list of criteria that determine when and how to abort the job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The criteria that determine when and how a job abort takes place.</p>\"\
    },\
    \"AwsJobAbortCriteria\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"failureType\",\
        \"action\",\
        \"thresholdPercentage\",\
        \"minNumberOfExecutedThings\"\
      ],\
      \"members\":{\
        \"failureType\":{\
          \"shape\":\"AwsJobAbortCriteriaFailureType\",\
          \"documentation\":\"<p>The type of job execution failures that can initiate a job abort.</p>\"\
        },\
        \"action\":{\
          \"shape\":\"AwsJobAbortCriteriaAbortAction\",\
          \"documentation\":\"<p>The type of job action to take to initiate the job abort.</p>\"\
        },\
        \"thresholdPercentage\":{\
          \"shape\":\"AwsJobAbortCriteriaAbortThresholdPercentage\",\
          \"documentation\":\"<p>The minimum percentage of job execution failures that must occur to initiate the job abort.</p> <p>Amazon Web Services IoT Core supports up to two digits after the decimal (for example, 10.9 and 10.99, but not 10.999).</p>\"\
        },\
        \"minNumberOfExecutedThings\":{\
          \"shape\":\"AwsJobAbortCriteriaMinimumNumberOfExecutedThings\",\
          \"documentation\":\"<p>The minimum number of things which must receive job execution notifications before the job can be aborted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The criteria that determine when and how a job abort takes place.</p>\"\
    },\
    \"AwsJobAbortCriteriaAbortAction\":{\
      \"type\":\"string\",\
      \"enum\":[\"CANCEL\"]\
    },\
    \"AwsJobAbortCriteriaAbortThresholdPercentage\":{\
      \"type\":\"double\",\
      \"max\":100\
    },\
    \"AwsJobAbortCriteriaFailureType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FAILED\",\
        \"REJECTED\",\
        \"TIMED_OUT\",\
        \"ALL\"\
      ]\
    },\
    \"AwsJobAbortCriteriaList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsJobAbortCriteria\"},\
      \"min\":1\
    },\
    \"AwsJobAbortCriteriaMinimumNumberOfExecutedThings\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"AwsJobExecutionsRolloutConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maximumPerMinute\":{\
          \"shape\":\"MaximumPerMinute\",\
          \"documentation\":\"<p>The maximum number of OTA update job executions started per minute.</p>\"\
        },\
        \"exponentialRate\":{\
          \"shape\":\"AwsJobExponentialRolloutRate\",\
          \"documentation\":\"<p>The rate of increase for a job rollout. This parameter allows you to define an exponential rate increase for a job rollout.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration for the rollout of OTA updates.</p>\"\
    },\
    \"AwsJobExponentialRolloutRate\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"baseRatePerMinute\",\
        \"incrementFactor\",\
        \"rateIncreaseCriteria\"\
      ],\
      \"members\":{\
        \"baseRatePerMinute\":{\
          \"shape\":\"AwsJobRolloutRatePerMinute\",\
          \"documentation\":\"<p>The minimum number of things that will be notified of a pending job, per minute, at the start of the job rollout. This is the initial rate of the rollout.</p>\"\
        },\
        \"incrementFactor\":{\
          \"shape\":\"AwsJobRolloutIncrementFactor\",\
          \"documentation\":\"<p>The rate of increase for a job rollout. The number of things notified is multiplied by this factor.</p>\"\
        },\
        \"rateIncreaseCriteria\":{\
          \"shape\":\"AwsJobRateIncreaseCriteria\",\
          \"documentation\":\"<p>The criteria to initiate the increase in rate of rollout for a job.</p> <p>Amazon Web Services IoT Core supports up to one digit after the decimal (for example, 1.5, but not 1.55).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The rate of increase for a job rollout. This parameter allows you to define an exponential rate increase for a job rollout.</p>\"\
    },\
    \"AwsJobPresignedUrlConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"expiresInSec\":{\
          \"shape\":\"ExpiresInSeconds\",\
          \"documentation\":\"<p>How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600, the default value is 1800 seconds. Pre-signed URLs are generated when a request for the job document is received.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information for pre-signed URLs. Valid when <code>protocols</code> contains HTTP.</p>\"\
    },\
    \"AwsJobRateIncreaseCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"numberOfNotifiedThings\":{\
          \"shape\":\"AwsJobRateIncreaseCriteriaNumberOfThings\",\
          \"documentation\":\"<p>When this number of things have been notified, it will initiate an increase in the rollout rate.</p>\"\
        },\
        \"numberOfSucceededThings\":{\
          \"shape\":\"AwsJobRateIncreaseCriteriaNumberOfThings\",\
          \"documentation\":\"<p>When this number of things have succeeded in their job execution, it will initiate an increase in the rollout rate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The criteria to initiate the increase in rate of rollout for a job.</p>\"\
    },\
    \"AwsJobRateIncreaseCriteriaNumberOfThings\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"AwsJobRolloutIncrementFactor\":{\"type\":\"double\"},\
    \"AwsJobRolloutRatePerMinute\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"AwsJobTimeoutConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"inProgressTimeoutInMinutes\":{\
          \"shape\":\"AwsJobTimeoutInProgressTimeoutInMinutes\",\
          \"documentation\":\"<p>Specifies the amount of time, in minutes, this device has to finish execution of this job. The timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The in progress timer can't be updated and will apply to all job executions for the job. Whenever a job execution remains in the IN_PROGRESS status for longer than this interval, the job execution will fail and switch to the terminal <code>TIMED_OUT</code> status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>\"\
    },\
    \"AwsJobTimeoutInProgressTimeoutInMinutes\":{\"type\":\"long\"},\
    \"BatchMode\":{\"type\":\"boolean\"},\
    \"Behavior\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"BehaviorName\",\
          \"documentation\":\"<p>The name you've given to the behavior.</p>\"\
        },\
        \"metric\":{\
          \"shape\":\"BehaviorMetric\",\
          \"documentation\":\"<p>What is measured by the behavior.</p>\"\
        },\
        \"metricDimension\":{\
          \"shape\":\"MetricDimension\",\
          \"documentation\":\"<p>The dimension for a metric in your behavior. For example, using a <code>TOPIC_FILTER</code> dimension, you can narrow down the scope of the metric to only MQTT topics where the name matches the pattern specified in the dimension. This can't be used with custom metrics.</p>\"\
        },\
        \"criteria\":{\
          \"shape\":\"BehaviorCriteria\",\
          \"documentation\":\"<p>The criteria that determine if a device is behaving normally in regard to the <code>metric</code>.</p>\"\
        },\
        \"suppressAlerts\":{\
          \"shape\":\"SuppressAlerts\",\
          \"documentation\":\"<p> Suppresses alerts. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A Device Defender security profile behavior.</p>\"\
    },\
    \"BehaviorCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"comparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>The operator that relates the thing measured (<code>metric</code>) to the criteria (containing a <code>value</code> or <code>statisticalThreshold</code>). Valid operators include:</p> <ul> <li> <p> <code>string-list</code>: <code>in-set</code> and <code>not-in-set</code> </p> </li> <li> <p> <code>number-list</code>: <code>in-set</code> and <code>not-in-set</code> </p> </li> <li> <p> <code>ip-address-list</code>: <code>in-cidr-set</code> and <code>not-in-cidr-set</code> </p> </li> <li> <p> <code>number</code>: <code>less-than</code>, <code>less-than-equals</code>, <code>greater-than</code>, and <code>greater-than-equals</code> </p> </li> </ul>\"\
        },\
        \"value\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value to be compared with the <code>metric</code>.</p>\"\
        },\
        \"durationSeconds\":{\
          \"shape\":\"DurationSeconds\",\
          \"documentation\":\"<p>Use this to specify the time duration over which the behavior is evaluated, for those criteria that have a time dimension (for example, <code>NUM_MESSAGES_SENT</code>). For a <code>statisticalThreshhold</code> metric comparison, measurements from all devices are accumulated over this time duration before being used to calculate percentiles, and later, measurements from an individual device are also accumulated over this time duration before being given a percentile rank. Cannot be used with list-based metric datatypes.</p>\"\
        },\
        \"consecutiveDatapointsToAlarm\":{\
          \"shape\":\"ConsecutiveDatapointsToAlarm\",\
          \"documentation\":\"<p>If a device is in violation of the behavior for the specified number of consecutive datapoints, an alarm occurs. If not specified, the default is 1.</p>\"\
        },\
        \"consecutiveDatapointsToClear\":{\
          \"shape\":\"ConsecutiveDatapointsToClear\",\
          \"documentation\":\"<p>If an alarm has occurred and the offending device is no longer in violation of the behavior for the specified number of consecutive datapoints, the alarm is cleared. If not specified, the default is 1.</p>\"\
        },\
        \"statisticalThreshold\":{\
          \"shape\":\"StatisticalThreshold\",\
          \"documentation\":\"<p>A statistical ranking (percentile)that indicates a threshold value by which a behavior is determined to be in compliance or in violation of the behavior.</p>\"\
        },\
        \"mlDetectionConfig\":{\
          \"shape\":\"MachineLearningDetectionConfig\",\
          \"documentation\":\"<p> The configuration of an ML Detect </p>\"\
        }\
      },\
      \"documentation\":\"<p>The criteria by which the behavior is determined to be normal.</p>\"\
    },\
    \"BehaviorCriteriaType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STATIC\",\
        \"STATISTICAL\",\
        \"MACHINE_LEARNING\"\
      ]\
    },\
    \"BehaviorMetric\":{\"type\":\"string\"},\
    \"BehaviorModelTrainingSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BehaviorModelTrainingSummary\"}\
    },\
    \"BehaviorModelTrainingSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p> The name of the security profile. </p>\"\
        },\
        \"behaviorName\":{\
          \"shape\":\"BehaviorName\",\
          \"documentation\":\"<p> The name of the behavior. </p>\"\
        },\
        \"trainingDataCollectionStartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The date a training model started collecting data. </p>\"\
        },\
        \"modelStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p> The status of the behavior model. </p>\"\
        },\
        \"datapointsCollectionPercentage\":{\
          \"shape\":\"DataCollectionPercentage\",\
          \"documentation\":\"<p> The percentage of datapoints collected. </p>\"\
        },\
        \"lastModelRefreshDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The date the model was last refreshed. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The summary of an ML Detect behavior model. </p>\"\
    },\
    \"BehaviorName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"Behaviors\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Behavior\"},\
      \"max\":100\
    },\
    \"BillingGroupArn\":{\"type\":\"string\"},\
    \"BillingGroupDescription\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"BillingGroupId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9\\\\-]+\"\
    },\
    \"BillingGroupMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"creationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>The date the billing group was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Additional information about the billing group.</p>\"\
    },\
    \"BillingGroupName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"BillingGroupNameAndArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GroupNameAndArn\"}\
    },\
    \"BillingGroupProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"billingGroupDescription\":{\
          \"shape\":\"BillingGroupDescription\",\
          \"documentation\":\"<p>The description of the billing group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The properties of a billing group.</p>\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BooleanKey\":{\"type\":\"boolean\"},\
    \"BooleanWrapperObject\":{\"type\":\"boolean\"},\
    \"Bucket\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"keyValue\":{\
          \"shape\":\"BucketKeyValue\",\
          \"documentation\":\"<p>The value counted for the particular bucket.</p>\"\
        },\
        \"count\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The number of documents that have the value counted for the particular bucket.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A count of documents that meets a specific aggregation criteria.</p>\"\
    },\
    \"BucketKeyValue\":{\"type\":\"string\"},\
    \"BucketName\":{\"type\":\"string\"},\
    \"Buckets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Bucket\"}\
    },\
    \"BucketsAggregationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"termsAggregation\":{\
          \"shape\":\"TermsAggregation\",\
          \"documentation\":\"<p>Performs an aggregation that will return a list of buckets. The list of buckets is a ranked list of the number of occurrences of an aggregation field value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of bucketed aggregation performed.</p>\"\
    },\
    \"CACertificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the CA certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the CA certificate.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CACertificateStatus\",\
          \"documentation\":\"<p>The status of the CA certificate.</p> <p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the CA certificate was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A CA certificate.</p>\"\
    },\
    \"CACertificateDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The CA certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The CA certificate ID.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CACertificateStatus\",\
          \"documentation\":\"<p>The status of a CA certificate.</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The CA certificate data, in PEM format.</p>\"\
        },\
        \"ownedBy\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The owner of the CA certificate.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the CA certificate was created.</p>\"\
        },\
        \"autoRegistrationStatus\":{\
          \"shape\":\"AutoRegistrationStatus\",\
          \"documentation\":\"<p>Whether the CA certificate configured for auto registration of device certificates. Valid values are \\\"ENABLE\\\" and \\\"DISABLE\\\"</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the CA certificate was last modified.</p>\"\
        },\
        \"customerVersion\":{\
          \"shape\":\"CustomerVersion\",\
          \"documentation\":\"<p>The customer version of the CA certificate.</p>\"\
        },\
        \"generationId\":{\
          \"shape\":\"GenerationId\",\
          \"documentation\":\"<p>The generation ID of the CA certificate.</p>\"\
        },\
        \"validity\":{\
          \"shape\":\"CertificateValidity\",\
          \"documentation\":\"<p>When the CA certificate is valid.</p>\"\
        },\
        \"certificateMode\":{\
          \"shape\":\"CertificateMode\",\
          \"documentation\":\"<p>The mode of the CA. </p> <p>All the device certificates that are registered using this CA will be registered in the same mode as the CA. For more information about certificate mode for device certificates, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode\\\">certificate mode</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a CA certificate.</p>\"\
    },\
    \"CACertificateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"INACTIVE\"\
      ]\
    },\
    \"CACertificateUpdateAction\":{\
      \"type\":\"string\",\
      \"enum\":[\"DEACTIVATE\"]\
    },\
    \"CACertificates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CACertificate\"}\
    },\
    \"CancelAuditMitigationActionsTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p>The unique identifier for the task that you want to cancel. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"CancelAuditMitigationActionsTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CancelAuditTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>The ID of the audit you want to cancel. You can only cancel an audit that is \\\"IN_PROGRESS\\\".</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"CancelAuditTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CancelCertificateTransferRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CancelCertificateTransfer operation.</p>\"\
    },\
    \"CancelDetectMitigationActionsTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p> The unique identifier of the task. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"CancelDetectMitigationActionsTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CancelJobExecutionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"jobId\",\
        \"thingName\"\
      ],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The ID of the job to be canceled.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing whose execution of the job will be canceled.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"force\":{\
          \"shape\":\"ForceFlag\",\
          \"documentation\":\"<p>(Optional) If <code>true</code> the job execution will be canceled if it has status IN_PROGRESS or QUEUED, otherwise the job execution will be canceled only if it has status QUEUED. If you attempt to cancel a job execution that is IN_PROGRESS, and you do not set <code>force</code> to <code>true</code>, then an <code>InvalidStateTransitionException</code> will be thrown. The default is <code>false</code>.</p> <p>Canceling a job execution which is \\\"IN_PROGRESS\\\", will cause the device to be unable to update the job execution status. Use caution and ensure that the device is able to recover to a valid state.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"force\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"ExpectedVersion\",\
          \"documentation\":\"<p>(Optional) The expected current version of the job execution. Each time you update the job execution, its version is incremented. If the version of the job execution stored in Jobs does not match, the update is rejected with a VersionMismatch error, and an ErrorResponse that contains the current job execution status data is returned. (This makes it unnecessary to perform a separate DescribeJobExecution request in order to obtain the job execution status data.)</p>\"\
        },\
        \"statusDetails\":{\
          \"shape\":\"DetailsMap\",\
          \"documentation\":\"<p>A collection of name/value pairs that describe the status of the job execution. If not specified, the statusDetails are unchanged. You can specify at most 10 name/value pairs.</p>\"\
        }\
      }\
    },\
    \"CancelJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobId\"],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"reasonCode\":{\
          \"shape\":\"ReasonCode\",\
          \"documentation\":\"<p>(Optional)A reason code string that explains why the job was canceled.</p>\"\
        },\
        \"comment\":{\
          \"shape\":\"Comment\",\
          \"documentation\":\"<p>An optional comment string describing why the job was canceled.</p>\"\
        },\
        \"force\":{\
          \"shape\":\"ForceFlag\",\
          \"documentation\":\"<p>(Optional) If <code>true</code> job executions with status \\\"IN_PROGRESS\\\" and \\\"QUEUED\\\" are canceled, otherwise only job executions with status \\\"QUEUED\\\" are canceled. The default is <code>false</code>.</p> <p>Canceling a job which is \\\"IN_PROGRESS\\\", will cause a device which is executing the job to be unable to update the job execution status. Use caution and ensure that each device executing a job which is canceled is able to recover to a valid state.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"force\"\
        }\
      }\
    },\
    \"CancelJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobArn\":{\
          \"shape\":\"JobArn\",\
          \"documentation\":\"<p>The job ARN.</p>\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A short text description of the job.</p>\"\
        }\
      }\
    },\
    \"CanceledChecksCount\":{\"type\":\"integer\"},\
    \"CanceledFindingsCount\":{\"type\":\"long\"},\
    \"CanceledThings\":{\"type\":\"integer\"},\
    \"CannedAccessControlList\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"private\",\
        \"public-read\",\
        \"public-read-write\",\
        \"aws-exec-read\",\
        \"authenticated-read\",\
        \"bucket-owner-read\",\
        \"bucket-owner-full-control\",\
        \"log-delivery-write\"\
      ]\
    },\
    \"Certificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CertificateStatus\",\
          \"documentation\":\"<p>The status of the certificate.</p> <p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\"\
        },\
        \"certificateMode\":{\
          \"shape\":\"CertificateMode\",\
          \"documentation\":\"<p>The mode of the certificate.</p> <p> <code>DEFAULT</code>: A certificate in <code>DEFAULT</code> mode is either generated by Amazon Web Services IoT Core or registered with an issuer certificate authority (CA) in <code>DEFAULT</code> mode. Devices with certificates in <code>DEFAULT</code> mode aren't required to send the Server Name Indication (SNI) extension when connecting to Amazon Web Services IoT Core. However, to use features such as custom domains and VPC endpoints, we recommend that you use the SNI extension when connecting to Amazon Web Services IoT Core.</p> <p> <code>SNI_ONLY</code>: A certificate in <code>SNI_ONLY</code> mode is registered without an issuer CA. Devices with certificates in <code>SNI_ONLY</code> mode must send the SNI extension when connecting to Amazon Web Services IoT Core. </p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the certificate was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a certificate.</p>\"\
    },\
    \"CertificateArn\":{\"type\":\"string\"},\
    \"CertificateConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Unable to verify the CA certificate used to sign the device certificate you are attempting to register. This is happens when you have registered more than one CA certificate that has the same subject field and public key.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"CertificateDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"caCertificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The certificate ID of the CA certificate used to sign this certificate.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CertificateStatus\",\
          \"documentation\":\"<p>The status of the certificate.</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"ownedBy\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the Amazon Web Services account that owns the certificate.</p>\"\
        },\
        \"previousOwnedBy\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the Amazon Web Services account of the previous owner of the certificate.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the certificate was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the certificate was last modified.</p>\"\
        },\
        \"customerVersion\":{\
          \"shape\":\"CustomerVersion\",\
          \"documentation\":\"<p>The customer version of the certificate.</p>\"\
        },\
        \"transferData\":{\
          \"shape\":\"TransferData\",\
          \"documentation\":\"<p>The transfer data.</p>\"\
        },\
        \"generationId\":{\
          \"shape\":\"GenerationId\",\
          \"documentation\":\"<p>The generation ID of the certificate.</p>\"\
        },\
        \"validity\":{\
          \"shape\":\"CertificateValidity\",\
          \"documentation\":\"<p>When the certificate is valid.</p>\"\
        },\
        \"certificateMode\":{\
          \"shape\":\"CertificateMode\",\
          \"documentation\":\"<p>The mode of the certificate.</p> <p> <code>DEFAULT</code>: A certificate in <code>DEFAULT</code> mode is either generated by Amazon Web Services IoT Core or registered with an issuer certificate authority (CA) in <code>DEFAULT</code> mode. Devices with certificates in <code>DEFAULT</code> mode aren't required to send the Server Name Indication (SNI) extension when connecting to Amazon Web Services IoT Core. However, to use features such as custom domains and VPC endpoints, we recommend that you use the SNI extension when connecting to Amazon Web Services IoT Core.</p> <p> <code>SNI_ONLY</code>: A certificate in <code>SNI_ONLY</code> mode is registered without an issuer CA. Devices with certificates in <code>SNI_ONLY</code> mode must send the SNI extension when connecting to Amazon Web Services IoT Core. </p> <p>For more information about the value for SNI extension, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/transport-security.html\\\">Transport security in IoT</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a certificate.</p>\"\
    },\
    \"CertificateId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":64,\
      \"pattern\":\"(0x)?[a-fA-F0-9]+\"\
    },\
    \"CertificateMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"SNI_ONLY\"\
      ]\
    },\
    \"CertificateName\":{\"type\":\"string\"},\
    \"CertificatePathOnDevice\":{\"type\":\"string\"},\
    \"CertificatePem\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The PEM of a certificate.</p>\",\
      \"max\":65536,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"CertificateSigningRequest\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"CertificateStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The certificate operation is not allowed.</p>\",\
      \"error\":{\"httpStatusCode\":406},\
      \"exception\":true\
    },\
    \"CertificateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"INACTIVE\",\
        \"REVOKED\",\
        \"PENDING_TRANSFER\",\
        \"REGISTER_INACTIVE\",\
        \"PENDING_ACTIVATION\"\
      ]\
    },\
    \"CertificateValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>Additional information about the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The certificate is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"CertificateValidity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"notBefore\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The certificate is not valid before this date.</p>\"\
        },\
        \"notAfter\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The certificate is not valid after this date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>When the certificate is valid.</p>\"\
    },\
    \"Certificates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Certificate\"}\
    },\
    \"ChannelName\":{\"type\":\"string\"},\
    \"CheckCompliant\":{\"type\":\"boolean\"},\
    \"Cidr\":{\
      \"type\":\"string\",\
      \"max\":43,\
      \"min\":2,\
      \"pattern\":\"[a-fA-F0-9:\\\\.\\\\/]+\"\
    },\
    \"Cidrs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Cidr\"}\
    },\
    \"ClearDefaultAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ClearDefaultAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ClientId\":{\"type\":\"string\"},\
    \"ClientProperties\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"String\"}\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"CloudwatchAlarmAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"alarmName\",\
        \"stateReason\",\
        \"stateValue\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that allows access to the CloudWatch alarm.</p>\"\
        },\
        \"alarmName\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The CloudWatch alarm name.</p>\"\
        },\
        \"stateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>The reason for the alarm change.</p>\"\
        },\
        \"stateValue\":{\
          \"shape\":\"StateValue\",\
          \"documentation\":\"<p>The value of the alarm state. Acceptable values are: OK, ALARM, INSUFFICIENT_DATA.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that updates a CloudWatch alarm.</p>\"\
    },\
    \"CloudwatchLogsAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"logGroupName\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that allows access to the CloudWatch log.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The CloudWatch log group to which the action sends data.</p>\"\
        },\
        \"batchMode\":{\
          \"shape\":\"BatchMode\",\
          \"documentation\":\"<p>Indicates whether batches of log records will be extracted and uploaded into CloudWatch. Values include <code>true</code> or <code>false</code> <i>(default)</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that sends data to CloudWatch Logs.</p>\"\
    },\
    \"CloudwatchMetricAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"metricNamespace\",\
        \"metricName\",\
        \"metricValue\",\
        \"metricUnit\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that allows access to the CloudWatch metric.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CloudWatch metric namespace name.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CloudWatch metric name.</p>\"\
        },\
        \"metricValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CloudWatch metric value.</p>\"\
        },\
        \"metricUnit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit\\\">metric unit</a> supported by CloudWatch.</p>\"\
        },\
        \"metricTimestamp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp\\\">Unix timestamp</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that captures a CloudWatch metric.</p>\"\
    },\
    \"Code\":{\"type\":\"string\"},\
    \"CodeSigning\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"awsSignerJobId\":{\
          \"shape\":\"SigningJobId\",\
          \"documentation\":\"<p>The ID of the <code>AWSSignerJob</code> which was created to sign the file.</p>\"\
        },\
        \"startSigningJobParameter\":{\
          \"shape\":\"StartSigningJobParameter\",\
          \"documentation\":\"<p>Describes the code-signing job.</p>\"\
        },\
        \"customCodeSigning\":{\
          \"shape\":\"CustomCodeSigning\",\
          \"documentation\":\"<p>A custom method for code signing a file.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the method to use when code signing a file.</p>\"\
    },\
    \"CodeSigningCertificateChain\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateName\":{\
          \"shape\":\"CertificateName\",\
          \"documentation\":\"<p>The name of the certificate.</p>\"\
        },\
        \"inlineDocument\":{\
          \"shape\":\"InlineDocument\",\
          \"documentation\":\"<p>A base64 encoded binary representation of the code signing certificate chain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the certificate chain being used when code signing a file.</p>\"\
    },\
    \"CodeSigningSignature\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"inlineDocument\":{\
          \"shape\":\"Signature\",\
          \"documentation\":\"<p>A base64 encoded binary representation of the code signing signature.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the signature for a file.</p>\"\
    },\
    \"CognitoIdentityPoolId\":{\"type\":\"string\"},\
    \"Comment\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"ComparisonOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"less-than\",\
        \"less-than-equals\",\
        \"greater-than\",\
        \"greater-than-equals\",\
        \"in-cidr-set\",\
        \"not-in-cidr-set\",\
        \"in-port-set\",\
        \"not-in-port-set\",\
        \"in-set\",\
        \"not-in-set\"\
      ]\
    },\
    \"CompliantChecksCount\":{\"type\":\"integer\"},\
    \"ConfidenceLevel\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LOW\",\
        \"MEDIUM\",\
        \"HIGH\"\
      ]\
    },\
    \"Configuration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>True to enable the configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration.</p>\"\
    },\
    \"ConfirmTopicRuleDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"confirmationToken\"],\
      \"members\":{\
        \"confirmationToken\":{\
          \"shape\":\"ConfirmationToken\",\
          \"documentation\":\"<p>The token used to confirm ownership or access to the topic rule confirmation URL.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"confirmationToken\"\
        }\
      }\
    },\
    \"ConfirmTopicRuleDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ConfirmationToken\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>A resource with the same name already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ConflictingResourceUpdateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A conflicting resource update exception. This exception is thrown when two pending updates cause a conflict.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ConnectivityTimestamp\":{\"type\":\"long\"},\
    \"ConsecutiveDatapointsToAlarm\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"ConsecutiveDatapointsToClear\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"ContentType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"CorrelationData\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"Count\":{\"type\":\"integer\"},\
    \"CreateAuditSuppressionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"checkName\",\
        \"resourceIdentifier\",\
        \"clientRequestToken\"\
      ],\
      \"members\":{\
        \"checkName\":{\"shape\":\"AuditCheckName\"},\
        \"resourceIdentifier\":{\"shape\":\"ResourceIdentifier\"},\
        \"expirationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The epoch timestamp in seconds at which this suppression expires. </p>\"\
        },\
        \"suppressIndefinitely\":{\
          \"shape\":\"SuppressIndefinitely\",\
          \"documentation\":\"<p> Indicates whether a suppression should exist indefinitely or not. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"AuditDescription\",\
          \"documentation\":\"<p> The description of the audit suppression. </p>\"\
        },\
        \"clientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p> Each audit supression must have a unique client request token. If you try to create a new audit suppression with the same token as one that already exists, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateAuditSuppressionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CreateAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"authorizerName\",\
        \"authorizerFunctionArn\"\
      ],\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"authorizerName\"\
        },\
        \"authorizerFunctionArn\":{\
          \"shape\":\"AuthorizerFunctionArn\",\
          \"documentation\":\"<p>The ARN of the authorizer's Lambda function.</p>\"\
        },\
        \"tokenKeyName\":{\
          \"shape\":\"TokenKeyName\",\
          \"documentation\":\"<p>The name of the token key used to extract the token from the HTTP headers.</p>\"\
        },\
        \"tokenSigningPublicKeys\":{\
          \"shape\":\"PublicKeyMap\",\
          \"documentation\":\"<p>The public keys used to verify the digital signature returned by your custom authentication service.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"AuthorizerStatus\",\
          \"documentation\":\"<p>The status of the create authorizer request.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the custom authorizer.</p> <note> <p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p> <p>For the CLI command-line parameter use format: &amp;&amp;tags \\\"key1=value1&amp;key2=value2...\\\"</p> <p>For the cli-input-json file use format: \\\"tags\\\": \\\"key1=value1&amp;key2=value2...\\\"</p> </note>\"\
        },\
        \"signingDisabled\":{\
          \"shape\":\"BooleanKey\",\
          \"documentation\":\"<p>Specifies whether IoT validates the token signature in an authorization request.</p>\"\
        },\
        \"enableCachingForHttp\":{\
          \"shape\":\"EnableCachingForHttp\",\
          \"documentation\":\"<p>When <code>true</code>, the result from the authorizerâs Lambda function is cached for clients that use persistent HTTP connections. The results are cached for the time specified by the Lambda function in <code>refreshAfterInSeconds</code>. This value does not affect authorization of clients that use MQTT connections.</p> <p>The default value is <code>false</code>.</p>\"\
        }\
      }\
    },\
    \"CreateAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer's name.</p>\"\
        },\
        \"authorizerArn\":{\
          \"shape\":\"AuthorizerArn\",\
          \"documentation\":\"<p>The authorizer ARN.</p>\"\
        }\
      }\
    },\
    \"CreateBillingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"billingGroupName\"],\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name you wish to give to the billing group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"billingGroupName\"\
        },\
        \"billingGroupProperties\":{\
          \"shape\":\"BillingGroupProperties\",\
          \"documentation\":\"<p>The properties of the billing group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the billing group.</p>\"\
        }\
      }\
    },\
    \"CreateBillingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name you gave to the billing group.</p>\"\
        },\
        \"billingGroupArn\":{\
          \"shape\":\"BillingGroupArn\",\
          \"documentation\":\"<p>The ARN of the billing group.</p>\"\
        },\
        \"billingGroupId\":{\
          \"shape\":\"BillingGroupId\",\
          \"documentation\":\"<p>The ID of the billing group.</p>\"\
        }\
      }\
    },\
    \"CreateCertificateFromCsrRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateSigningRequest\"],\
      \"members\":{\
        \"certificateSigningRequest\":{\
          \"shape\":\"CertificateSigningRequest\",\
          \"documentation\":\"<p>The certificate signing request (CSR).</p>\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateCertificateFromCsr operation.</p>\"\
    },\
    \"CreateCertificateFromCsrResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a principal for policy operations.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. Certificate management operations only take a certificateId.</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the CreateCertificateFromCsr operation.</p>\"\
    },\
    \"CreateCustomMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"metricName\",\
        \"metricType\",\
        \"clientRequestToken\"\
      ],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric. This will be used in the metric report submitted from the device/thing. The name can't begin with <code>aws:</code>. You can't change the name after you define it.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        },\
        \"displayName\":{\
          \"shape\":\"CustomMetricDisplayName\",\
          \"documentation\":\"<p> The friendly name in the console for the custom metric. This name doesn't have to be unique. Don't use this name as the metric identifier in the device metric report. You can update the friendly name after you define it.</p>\"\
        },\
        \"metricType\":{\
          \"shape\":\"CustomMetricType\",\
          \"documentation\":\"<p> The type of the custom metric. </p> <important> <p>The type <code>number</code> only takes a single metric value as an input, but when you submit the metrics value in the DeviceMetrics report, you must pass it as an array with a single value.</p> </important>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p> Metadata that can be used to manage the custom metric. </p>\"\
        },\
        \"clientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Each custom metric must have a unique client request token. If you try to create a new custom metric that already exists with a different token, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request. </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateCustomMetricResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric to be used in the metric report. </p>\"\
        },\
        \"metricArn\":{\
          \"shape\":\"CustomMetricArn\",\
          \"documentation\":\"<p> The Amazon Resource Number (ARN) of the custom metric. For example, <code>arn:<i>aws-partition</i>:iot:<i>region</i>:<i>accountId</i>:custommetric/<i>metricName</i> </code> </p>\"\
        }\
      }\
    },\
    \"CreateDimensionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"type\",\
        \"stringValues\",\
        \"clientRequestToken\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>A unique identifier for the dimension. Choose something that describes the type and value to make it easy to remember what it does.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        },\
        \"type\":{\
          \"shape\":\"DimensionType\",\
          \"documentation\":\"<p>Specifies the type of dimension. Supported types: <code>TOPIC_FILTER.</code> </p>\"\
        },\
        \"stringValues\":{\
          \"shape\":\"DimensionStringValues\",\
          \"documentation\":\"<p>Specifies the value or list of values for the dimension. For <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the MQTT topic (for example, \\\"admin/#\\\").</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata that can be used to manage the dimension.</p>\"\
        },\
        \"clientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Each dimension must have a unique client request token. If you try to create a new dimension with the same token as a dimension that already exists, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateDimensionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>A unique identifier for the dimension.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"DimensionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the created dimension.</p>\"\
        }\
      }\
    },\
    \"CreateDomainConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainConfigurationName\"],\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"DomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration. This value must be unique to a region.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"domainConfigurationName\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain.</p>\"\
        },\
        \"serverCertificateArns\":{\
          \"shape\":\"ServerCertificateArns\",\
          \"documentation\":\"<p>The ARNs of the certificates that IoT passes to the device during the TLS handshake. Currently you can specify only one certificate ARN. This value is not required for Amazon Web Services-managed domains.</p>\"\
        },\
        \"validationCertificateArn\":{\
          \"shape\":\"AcmCertificateArn\",\
          \"documentation\":\"<p>The certificate used to validate the server certificate and prove domain name ownership. This certificate must be signed by a public certificate authority. This value is not required for Amazon Web Services-managed domains.</p>\"\
        },\
        \"authorizerConfig\":{\
          \"shape\":\"AuthorizerConfig\",\
          \"documentation\":\"<p>An object that specifies the authorization service for a domain.</p>\"\
        },\
        \"serviceType\":{\
          \"shape\":\"ServiceType\",\
          \"documentation\":\"<p>The type of service delivered by the endpoint.</p> <note> <p>Amazon Web Services IoT Core currently supports only the <code>DATA</code> service type.</p> </note>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the domain configuration.</p> <note> <p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p> <p>For the CLI command-line parameter use format: &amp;&amp;tags \\\"key1=value1&amp;key2=value2...\\\"</p> <p>For the cli-input-json file use format: \\\"tags\\\": \\\"key1=value1&amp;key2=value2...\\\"</p> </note>\"\
        }\
      }\
    },\
    \"CreateDomainConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"DomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration.</p>\"\
        },\
        \"domainConfigurationArn\":{\
          \"shape\":\"DomainConfigurationArn\",\
          \"documentation\":\"<p>The ARN of the domain configuration.</p>\"\
        }\
      }\
    },\
    \"CreateDynamicThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingGroupName\",\
        \"queryString\"\
      ],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The dynamic thing group name to create.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"thingGroupProperties\":{\
          \"shape\":\"ThingGroupProperties\",\
          \"documentation\":\"<p>The dynamic thing group properties.</p>\"\
        },\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The dynamic thing group index name.</p> <note> <p>Currently one index is supported: <code>AWS_Things</code>.</p> </note>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The dynamic thing group search query string.</p> <p>See <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html\\\">Query Syntax</a> for information about query string syntax.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The dynamic thing group query version.</p> <note> <p>Currently one query version is supported: \\\"2017-09-30\\\". If not specified, the query version defaults to this value.</p> </note>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the dynamic thing group.</p>\"\
        }\
      }\
    },\
    \"CreateDynamicThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The dynamic thing group name.</p>\"\
        },\
        \"thingGroupArn\":{\
          \"shape\":\"ThingGroupArn\",\
          \"documentation\":\"<p>The dynamic thing group ARN.</p>\"\
        },\
        \"thingGroupId\":{\
          \"shape\":\"ThingGroupId\",\
          \"documentation\":\"<p>The dynamic thing group ID.</p>\"\
        },\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The dynamic thing group index name.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The dynamic thing group search query string.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The dynamic thing group query version.</p>\"\
        }\
      }\
    },\
    \"CreateFleetMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"metricName\",\
        \"queryString\",\
        \"aggregationType\",\
        \"period\",\
        \"aggregationField\"\
      ],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"FleetMetricName\",\
          \"documentation\":\"<p>The name of the fleet metric to create.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The search query string.</p>\"\
        },\
        \"aggregationType\":{\
          \"shape\":\"AggregationType\",\
          \"documentation\":\"<p>The type of the aggregation query.</p>\"\
        },\
        \"period\":{\
          \"shape\":\"FleetMetricPeriod\",\
          \"documentation\":\"<p>The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be multiple of 60.</p>\"\
        },\
        \"aggregationField\":{\
          \"shape\":\"AggregationField\",\
          \"documentation\":\"<p>The field to aggregate.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"FleetMetricDescription\",\
          \"documentation\":\"<p>The fleet metric description.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The query version.</p>\"\
        },\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The name of the index to search.</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"FleetMetricUnit\",\
          \"documentation\":\"<p>Used to support unit transformation such as milliseconds to seconds. The unit must be supported by <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html\\\">CW metric</a>. Default to null.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata, which can be used to manage the fleet metric.</p>\"\
        }\
      }\
    },\
    \"CreateFleetMetricResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"FleetMetricName\",\
          \"documentation\":\"<p>The name of the fleet metric to create.</p>\"\
        },\
        \"metricArn\":{\
          \"shape\":\"FleetMetricArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the new fleet metric.</p>\"\
        }\
      }\
    },\
    \"CreateJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"jobId\",\
        \"targets\"\
      ],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>A job identifier which must be unique for your Amazon Web Services account. We recommend using a UUID. Alpha-numeric characters, \\\"-\\\" and \\\"_\\\" are valid for use here.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"targets\":{\
          \"shape\":\"JobTargets\",\
          \"documentation\":\"<p>A list of things and thing groups to which the job should be sent.</p>\"\
        },\
        \"documentSource\":{\
          \"shape\":\"JobDocumentSource\",\
          \"documentation\":\"<p>An S3 link to the job document. Required if you don't specify a value for <code>document</code>.</p> <note> <p>If the job document resides in an S3 bucket, you must use a placeholder link when specifying the document.</p> <p>The placeholder link is of the following form:</p> <p> <code>${aws:iot:s3-presigned-url:https://s3.amazonaws.com/<i>bucket</i>/<i>key</i>}</code> </p> <p>where <i>bucket</i> is your bucket name and <i>key</i> is the object in the bucket to which you are linking.</p> </note>\"\
        },\
        \"document\":{\
          \"shape\":\"JobDocument\",\
          \"documentation\":\"<p>The job document. Required if you don't specify a value for <code>documentSource</code>.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A short text description of the job.</p>\"\
        },\
        \"presignedUrlConfig\":{\
          \"shape\":\"PresignedUrlConfig\",\
          \"documentation\":\"<p>Configuration information for pre-signed S3 URLs.</p>\"\
        },\
        \"targetSelection\":{\
          \"shape\":\"TargetSelection\",\
          \"documentation\":\"<p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p> <note> <p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p> </note>\"\
        },\
        \"jobExecutionsRolloutConfig\":{\
          \"shape\":\"JobExecutionsRolloutConfig\",\
          \"documentation\":\"<p>Allows you to create a staged rollout of the job.</p>\"\
        },\
        \"abortConfig\":{\
          \"shape\":\"AbortConfig\",\
          \"documentation\":\"<p>Allows you to create the criteria to abort a job.</p>\"\
        },\
        \"timeoutConfig\":{\
          \"shape\":\"TimeoutConfig\",\
          \"documentation\":\"<p>Specifies the amount of time each device has to finish its execution of the job. The timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the time expires, it will be automatically set to <code>TIMED_OUT</code>.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the job.</p>\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\"\
        },\
        \"jobTemplateArn\":{\
          \"shape\":\"JobTemplateArn\",\
          \"documentation\":\"<p>The ARN of the job template used to create the job.</p>\"\
        },\
        \"jobExecutionsRetryConfig\":{\
          \"shape\":\"JobExecutionsRetryConfig\",\
          \"documentation\":\"<p>Allows you to create the criteria to retry a job.</p>\"\
        },\
        \"documentParameters\":{\
          \"shape\":\"ParameterMap\",\
          \"documentation\":\"<p>Parameters of an Amazon Web Services managed template that you can specify to create the job document.</p> <note> <p> <code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p> </note>\"\
        },\
        \"schedulingConfig\":{\
          \"shape\":\"SchedulingConfig\",\
          \"documentation\":\"<p>The configuration that allows you to schedule a job for a future date and time in addition to specifying the end behavior for each job execution.</p>\"\
        }\
      }\
    },\
    \"CreateJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobArn\":{\
          \"shape\":\"JobArn\",\
          \"documentation\":\"<p>The job ARN.</p>\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>The job description.</p>\"\
        }\
      }\
    },\
    \"CreateJobTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"jobTemplateId\",\
        \"description\"\
      ],\
      \"members\":{\
        \"jobTemplateId\":{\
          \"shape\":\"JobTemplateId\",\
          \"documentation\":\"<p>A unique identifier for the job template. We recommend using a UUID. Alpha-numeric characters, \\\"-\\\", and \\\"_\\\" are valid for use here.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobTemplateId\"\
        },\
        \"jobArn\":{\
          \"shape\":\"JobArn\",\
          \"documentation\":\"<p>The ARN of the job to use as the basis for the job template.</p>\"\
        },\
        \"documentSource\":{\
          \"shape\":\"JobDocumentSource\",\
          \"documentation\":\"<p>An S3 link to the job document to use in the template. Required if you don't specify a value for <code>document</code>.</p> <note> <p>If the job document resides in an S3 bucket, you must use a placeholder link when specifying the document.</p> <p>The placeholder link is of the following form:</p> <p> <code>${aws:iot:s3-presigned-url:https://s3.amazonaws.com/<i>bucket</i>/<i>key</i>}</code> </p> <p>where <i>bucket</i> is your bucket name and <i>key</i> is the object in the bucket to which you are linking.</p> </note>\"\
        },\
        \"document\":{\
          \"shape\":\"JobDocument\",\
          \"documentation\":\"<p>The job document. Required if you don't specify a value for <code>documentSource</code>.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A description of the job document.</p>\"\
        },\
        \"presignedUrlConfig\":{\"shape\":\"PresignedUrlConfig\"},\
        \"jobExecutionsRolloutConfig\":{\"shape\":\"JobExecutionsRolloutConfig\"},\
        \"abortConfig\":{\"shape\":\"AbortConfig\"},\
        \"timeoutConfig\":{\"shape\":\"TimeoutConfig\"},\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata that can be used to manage the job template.</p>\"\
        },\
        \"jobExecutionsRetryConfig\":{\
          \"shape\":\"JobExecutionsRetryConfig\",\
          \"documentation\":\"<p>Allows you to create the criteria to retry a job.</p>\"\
        },\
        \"maintenanceWindows\":{\
          \"shape\":\"MaintenanceWindows\",\
          \"documentation\":\"<p>Allows you to configure an optional maintenance window for the rollout of a job document to all devices in the target group for a job.</p>\"\
        }\
      }\
    },\
    \"CreateJobTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobTemplateArn\":{\
          \"shape\":\"JobTemplateArn\",\
          \"documentation\":\"<p>The ARN of the job template.</p>\"\
        },\
        \"jobTemplateId\":{\
          \"shape\":\"JobTemplateId\",\
          \"documentation\":\"<p>The unique identifier of the job template.</p>\"\
        }\
      }\
    },\
    \"CreateKeysAndCertificateRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateKeysAndCertificate operation.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">CreateKeysAndCertificateRequest</a> action.</p>\"\
    },\
    \"CreateKeysAndCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. IoT issues a default subject name for the certificate (for example, IoT Certificate).</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"keyPair\":{\
          \"shape\":\"KeyPair\",\
          \"documentation\":\"<p>The generated key pair.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreateKeysAndCertificate operation.</p>\"\
    },\
    \"CreateMitigationActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"actionName\",\
        \"roleArn\",\
        \"actionParams\"\
      ],\
      \"members\":{\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>A friendly name for the action. Choose a friendly name that accurately describes the action (for example, <code>EnableLoggingAction</code>).</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"actionName\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that is used to apply the mitigation action.</p>\"\
        },\
        \"actionParams\":{\
          \"shape\":\"MitigationActionParams\",\
          \"documentation\":\"<p>Defines the type of action and the parameters for that action.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata that can be used to manage the mitigation action.</p>\"\
        }\
      }\
    },\
    \"CreateMitigationActionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionArn\":{\
          \"shape\":\"MitigationActionArn\",\
          \"documentation\":\"<p>The ARN for the new mitigation action.</p>\"\
        },\
        \"actionId\":{\
          \"shape\":\"MitigationActionId\",\
          \"documentation\":\"<p>A unique identifier for the new mitigation action.</p>\"\
        }\
      }\
    },\
    \"CreateOTAUpdateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"otaUpdateId\",\
        \"targets\",\
        \"files\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"otaUpdateId\":{\
          \"shape\":\"OTAUpdateId\",\
          \"documentation\":\"<p>The ID of the OTA update to be created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"otaUpdateId\"\
        },\
        \"description\":{\
          \"shape\":\"OTAUpdateDescription\",\
          \"documentation\":\"<p>The description of the OTA update.</p>\"\
        },\
        \"targets\":{\
          \"shape\":\"Targets\",\
          \"documentation\":\"<p>The devices targeted to receive OTA updates.</p>\"\
        },\
        \"protocols\":{\
          \"shape\":\"Protocols\",\
          \"documentation\":\"<p>The protocol used to transfer the OTA update image. Valid values are [HTTP], [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the target device can choose the protocol.</p>\"\
        },\
        \"targetSelection\":{\
          \"shape\":\"TargetSelection\",\
          \"documentation\":\"<p>Specifies whether the update will continue to run (CONTINUOUS), or will be complete after all the things specified as targets have completed the update (SNAPSHOT). If continuous, the update may also be run on a thing when a change is detected in a target. For example, an update will run on a thing when the thing is added to a target group, even after the update was completed by all things originally in the group. Valid values: CONTINUOUS | SNAPSHOT.</p>\"\
        },\
        \"awsJobExecutionsRolloutConfig\":{\
          \"shape\":\"AwsJobExecutionsRolloutConfig\",\
          \"documentation\":\"<p>Configuration for the rollout of OTA updates.</p>\"\
        },\
        \"awsJobPresignedUrlConfig\":{\
          \"shape\":\"AwsJobPresignedUrlConfig\",\
          \"documentation\":\"<p>Configuration information for pre-signed URLs.</p>\"\
        },\
        \"awsJobAbortConfig\":{\
          \"shape\":\"AwsJobAbortConfig\",\
          \"documentation\":\"<p>The criteria that determine when and how a job abort takes place.</p>\"\
        },\
        \"awsJobTimeoutConfig\":{\
          \"shape\":\"AwsJobTimeoutConfig\",\
          \"documentation\":\"<p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>\"\
        },\
        \"files\":{\
          \"shape\":\"OTAUpdateFiles\",\
          \"documentation\":\"<p>The files to be streamed by the OTA update.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The IAM role that grants Amazon Web Services IoT Core access to the Amazon S3, IoT jobs and Amazon Web Services Code Signing resources to create an OTA update job.</p>\"\
        },\
        \"additionalParameters\":{\
          \"shape\":\"AdditionalParameterMap\",\
          \"documentation\":\"<p>A list of additional OTA update parameters which are name-value pairs.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage updates.</p>\"\
        }\
      }\
    },\
    \"CreateOTAUpdateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"otaUpdateId\":{\
          \"shape\":\"OTAUpdateId\",\
          \"documentation\":\"<p>The OTA update ID.</p>\"\
        },\
        \"awsIotJobId\":{\
          \"shape\":\"AwsIotJobId\",\
          \"documentation\":\"<p>The IoT job ID associated with the OTA update.</p>\"\
        },\
        \"otaUpdateArn\":{\
          \"shape\":\"OTAUpdateArn\",\
          \"documentation\":\"<p>The OTA update ARN.</p>\"\
        },\
        \"awsIotJobArn\":{\
          \"shape\":\"AwsIotJobArn\",\
          \"documentation\":\"<p>The IoT job ARN associated with the OTA update.</p>\"\
        },\
        \"otaUpdateStatus\":{\
          \"shape\":\"OTAUpdateStatus\",\
          \"documentation\":\"<p>The OTA update status.</p>\"\
        }\
      }\
    },\
    \"CreatePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyDocument\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy. <b>policyDocument</b> must have a minimum length of 1, with a maximum length of 2048, excluding whitespace.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the policy.</p> <note> <p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p> <p>For the CLI command-line parameter use format: &amp;&amp;tags \\\"key1=value1&amp;key2=value2...\\\"</p> <p>For the cli-input-json file use format: \\\"tags\\\": \\\"key1=value1&amp;key2=value2...\\\"</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreatePolicy operation.</p>\"\
    },\
    \"CreatePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the CreatePolicy operation.</p>\"\
    },\
    \"CreatePolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyDocument\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048, excluding whitespace.</p>\"\
        },\
        \"setAsDefault\":{\
          \"shape\":\"SetAsDefault\",\
          \"documentation\":\"<p>Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsDefault\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreatePolicyVersion operation.</p>\"\
    },\
    \"CreatePolicyVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreatePolicyVersion operation.</p>\"\
    },\
    \"CreateProvisioningClaimRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateName\"],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template to use.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        }\
      }\
    },\
    \"CreateProvisioningClaimResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The provisioning claim certificate.</p>\"\
        },\
        \"keyPair\":{\
          \"shape\":\"KeyPair\",\
          \"documentation\":\"<p>The provisioning claim key pair.</p>\"\
        },\
        \"expiration\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The provisioning claim expiration time.</p>\"\
        }\
      }\
    },\
    \"CreateProvisioningTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"templateName\",\
        \"templateBody\",\
        \"provisioningRoleArn\"\
      ],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"TemplateDescription\",\
          \"documentation\":\"<p>The description of the provisioning template.</p>\"\
        },\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The JSON formatted contents of the provisioning template.</p>\"\
        },\
        \"enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>True to enable the provisioning template, otherwise false.</p>\"\
        },\
        \"provisioningRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The role ARN for the role associated with the provisioning template. This IoT role grants permission to provision a device.</p>\"\
        },\
        \"preProvisioningHook\":{\
          \"shape\":\"ProvisioningHook\",\
          \"documentation\":\"<p>Creates a pre-provisioning hook template. Only supports template of type <code>FLEET_PROVISIONING</code>. For more information about provisioning template types, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_CreateProvisioningTemplate.html#iot-CreateProvisioningTemplate-request-type\\\">type</a>.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the provisioning template.</p> <note> <p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p> <p>For the CLI command-line parameter use format: &amp;&amp;tags \\\"key1=value1&amp;key2=value2...\\\"</p> <p>For the cli-input-json file use format: \\\"tags\\\": \\\"key1=value1&amp;key2=value2...\\\"</p> </note>\"\
        },\
        \"type\":{\
          \"shape\":\"TemplateType\",\
          \"documentation\":\"<p>The type you define in a provisioning template. You can create a template with only one type. You can't change the template type after its creation. The default value is <code>FLEET_PROVISIONING</code>. For more information about provisioning template, see: <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html\\\">Provisioning template</a>. </p>\"\
        }\
      }\
    },\
    \"CreateProvisioningTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateArn\":{\
          \"shape\":\"TemplateArn\",\
          \"documentation\":\"<p>The ARN that identifies the provisioning template.</p>\"\
        },\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\"\
        },\
        \"defaultVersionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The default version of the provisioning template.</p>\"\
        }\
      }\
    },\
    \"CreateProvisioningTemplateVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"templateName\",\
        \"templateBody\"\
      ],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        },\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The JSON formatted contents of the provisioning template.</p>\"\
        },\
        \"setAsDefault\":{\
          \"shape\":\"SetAsDefault\",\
          \"documentation\":\"<p>Sets a fleet provision template version as the default version.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsDefault\"\
        }\
      }\
    },\
    \"CreateProvisioningTemplateVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateArn\":{\
          \"shape\":\"TemplateArn\",\
          \"documentation\":\"<p>The ARN that identifies the provisioning template.</p>\"\
        },\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\"\
        },\
        \"versionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The version of the provisioning template.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>True if the provisioning template version is the default version, otherwise false.</p>\"\
        }\
      }\
    },\
    \"CreateRoleAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleAlias\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"roleAlias\":{\
          \"shape\":\"RoleAlias\",\
          \"documentation\":\"<p>The role alias that points to a role ARN. This allows you to change the role without having to update the device.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"roleAlias\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The role ARN.</p>\"\
        },\
        \"credentialDurationSeconds\":{\
          \"shape\":\"CredentialDurationSeconds\",\
          \"documentation\":\"<p>How long (in seconds) the credentials will be valid. The default value is 3,600 seconds.</p> <p>This value must be less than or equal to the maximum session duration of the IAM role that the role alias references.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the role alias.</p> <note> <p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p> <p>For the CLI command-line parameter use format: &amp;&amp;tags \\\"key1=value1&amp;key2=value2...\\\"</p> <p>For the cli-input-json file use format: \\\"tags\\\": \\\"key1=value1&amp;key2=value2...\\\"</p> </note>\"\
        }\
      }\
    },\
    \"CreateRoleAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleAlias\":{\
          \"shape\":\"RoleAlias\",\
          \"documentation\":\"<p>The role alias.</p>\"\
        },\
        \"roleAliasArn\":{\
          \"shape\":\"RoleAliasArn\",\
          \"documentation\":\"<p>The role alias ARN.</p>\"\
        }\
      }\
    },\
    \"CreateScheduledAuditRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"frequency\",\
        \"targetCheckNames\",\
        \"scheduledAuditName\"\
      ],\
      \"members\":{\
        \"frequency\":{\
          \"shape\":\"AuditFrequency\",\
          \"documentation\":\"<p>How often the scheduled audit takes place, either <code>DAILY</code>, <code>WEEKLY</code>, <code>BIWEEKLY</code> or <code>MONTHLY</code>. The start time of each audit is determined by the system.</p>\"\
        },\
        \"dayOfMonth\":{\
          \"shape\":\"DayOfMonth\",\
          \"documentation\":\"<p>The day of the month on which the scheduled audit takes place. This can be \\\"1\\\" through \\\"31\\\" or \\\"LAST\\\". This field is required if the \\\"frequency\\\" parameter is set to <code>MONTHLY</code>. If days 29 to 31 are specified, and the month doesn't have that many days, the audit takes place on the <code>LAST</code> day of the month.</p>\"\
        },\
        \"dayOfWeek\":{\
          \"shape\":\"DayOfWeek\",\
          \"documentation\":\"<p>The day of the week on which the scheduled audit takes place, either <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>. This field is required if the <code>frequency</code> parameter is set to <code>WEEKLY</code> or <code>BIWEEKLY</code>.</p>\"\
        },\
        \"targetCheckNames\":{\
          \"shape\":\"TargetAuditCheckNames\",\
          \"documentation\":\"<p>Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>\"\
        },\
        \"scheduledAuditName\":{\
          \"shape\":\"ScheduledAuditName\",\
          \"documentation\":\"<p>The name you want to give to the scheduled audit. (Max. 128 chars)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"scheduledAuditName\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata that can be used to manage the scheduled audit.</p>\"\
        }\
      }\
    },\
    \"CreateScheduledAuditResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"scheduledAuditArn\":{\
          \"shape\":\"ScheduledAuditArn\",\
          \"documentation\":\"<p>The ARN of the scheduled audit.</p>\"\
        }\
      }\
    },\
    \"CreateSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"securityProfileName\"],\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name you are giving to the security profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"securityProfileDescription\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>A description of the security profile.</p>\"\
        },\
        \"behaviors\":{\
          \"shape\":\"Behaviors\",\
          \"documentation\":\"<p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>\"\
        },\
        \"alertTargets\":{\
          \"shape\":\"AlertTargets\",\
          \"documentation\":\"<p>Specifies the destinations to which alerts are sent. (Alerts are always sent to the console.) Alerts are generated when a device (thing) violates a behavior.</p>\"\
        },\
        \"additionalMetricsToRetain\":{\
          \"shape\":\"AdditionalMetricsToRetainList\",\
          \"documentation\":\"<p> <i>Please use <a>CreateSecurityProfileRequest$additionalMetricsToRetainV2</a> instead.</i> </p> <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Use additionalMetricsToRetainV2.\"\
        },\
        \"additionalMetricsToRetainV2\":{\
          \"shape\":\"AdditionalMetricsToRetainV2List\",\
          \"documentation\":\"<p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata that can be used to manage the security profile.</p>\"\
        }\
      }\
    },\
    \"CreateSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name you gave to the security profile.</p>\"\
        },\
        \"securityProfileArn\":{\
          \"shape\":\"SecurityProfileArn\",\
          \"documentation\":\"<p>The ARN of the security profile.</p>\"\
        }\
      }\
    },\
    \"CreateStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"streamId\",\
        \"files\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"streamId\"\
        },\
        \"description\":{\
          \"shape\":\"StreamDescription\",\
          \"documentation\":\"<p>A description of the stream.</p>\"\
        },\
        \"files\":{\
          \"shape\":\"StreamFiles\",\
          \"documentation\":\"<p>The files to stream.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>An IAM role that allows the IoT service principal to access your S3 files.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage streams.</p>\"\
        }\
      }\
    },\
    \"CreateStreamResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\"\
        },\
        \"streamArn\":{\
          \"shape\":\"StreamArn\",\
          \"documentation\":\"<p>The stream ARN.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"StreamDescription\",\
          \"documentation\":\"<p>A description of the stream.</p>\"\
        },\
        \"streamVersion\":{\
          \"shape\":\"StreamVersion\",\
          \"documentation\":\"<p>The version of the stream.</p>\"\
        }\
      }\
    },\
    \"CreateThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingGroupName\"],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The thing group name to create.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"parentGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The name of the parent thing group.</p>\"\
        },\
        \"thingGroupProperties\":{\
          \"shape\":\"ThingGroupProperties\",\
          \"documentation\":\"<p>The thing group properties.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the thing group.</p>\"\
        }\
      }\
    },\
    \"CreateThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The thing group name.</p>\"\
        },\
        \"thingGroupArn\":{\
          \"shape\":\"ThingGroupArn\",\
          \"documentation\":\"<p>The thing group ARN.</p>\"\
        },\
        \"thingGroupId\":{\
          \"shape\":\"ThingGroupId\",\
          \"documentation\":\"<p>The thing group ID.</p>\"\
        }\
      }\
    },\
    \"CreateThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing to create.</p> <p>You can't change a thing's name after you create it. To change a thing's name, you must create a new thing, give it the new name, and then delete the old thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type associated with the new thing.</p>\"\
        },\
        \"attributePayload\":{\
          \"shape\":\"AttributePayload\",\
          \"documentation\":\"<p>The attribute payload, which consists of up to three name/value pairs in a JSON document. For example:</p> <p> <code>{\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}}</code> </p>\"\
        },\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group the thing will be added to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateThing operation.</p>\"\
    },\
    \"CreateThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the new thing.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the new thing.</p>\"\
        },\
        \"thingId\":{\
          \"shape\":\"ThingId\",\
          \"documentation\":\"<p>The thing ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreateThing operation.</p>\"\
    },\
    \"CreateThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\"\
        },\
        \"thingTypeProperties\":{\
          \"shape\":\"ThingTypeProperties\",\
          \"documentation\":\"<p>The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the thing type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateThingType operation.</p>\"\
    },\
    \"CreateThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"thingTypeArn\":{\
          \"shape\":\"ThingTypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the thing type.</p>\"\
        },\
        \"thingTypeId\":{\
          \"shape\":\"ThingTypeId\",\
          \"documentation\":\"<p>The thing type ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreateThingType operation.</p>\"\
    },\
    \"CreateTopicRuleDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"destinationConfiguration\"],\
      \"members\":{\
        \"destinationConfiguration\":{\
          \"shape\":\"TopicRuleDestinationConfiguration\",\
          \"documentation\":\"<p>The topic rule destination configuration.</p>\"\
        }\
      }\
    },\
    \"CreateTopicRuleDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"topicRuleDestination\":{\
          \"shape\":\"TopicRuleDestination\",\
          \"documentation\":\"<p>The topic rule destination.</p>\"\
        }\
      }\
    },\
    \"CreateTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ruleName\",\
        \"topicRulePayload\"\
      ],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\"\
        },\
        \"topicRulePayload\":{\
          \"shape\":\"TopicRulePayload\",\
          \"documentation\":\"<p>The rule payload.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Metadata which can be used to manage the topic rule.</p> <note> <p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p> <p>For the CLI command-line parameter use format: --tags \\\"key1=value1&amp;key2=value2...\\\"</p> <p>For the cli-input-json file use format: \\\"tags\\\": \\\"key1=value1&amp;key2=value2...\\\"</p> </note>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-tagging\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateTopicRule operation.</p>\",\
      \"payload\":\"topicRulePayload\"\
    },\
    \"CreatedAtDate\":{\"type\":\"timestamp\"},\
    \"CreationDate\":{\"type\":\"timestamp\"},\
    \"CredentialDurationSeconds\":{\
      \"type\":\"integer\",\
      \"max\":43200,\
      \"min\":900\
    },\
    \"CronExpression\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"CustomCodeSigning\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"signature\":{\
          \"shape\":\"CodeSigningSignature\",\
          \"documentation\":\"<p>The signature for the file.</p>\"\
        },\
        \"certificateChain\":{\
          \"shape\":\"CodeSigningCertificateChain\",\
          \"documentation\":\"<p>The certificate chain.</p>\"\
        },\
        \"hashAlgorithm\":{\
          \"shape\":\"HashAlgorithm\",\
          \"documentation\":\"<p>The hash algorithm used to code sign the file. You can use a string as the algorithm name if the target over-the-air (OTA) update devices are able to verify the signature that was generated using the same signature algorithm. For example, FreeRTOS uses <code>SHA256</code> or <code>SHA1</code>, so you can pass either of them based on which was used for generating the signature.</p>\"\
        },\
        \"signatureAlgorithm\":{\
          \"shape\":\"SignatureAlgorithm\",\
          \"documentation\":\"<p>The signature algorithm used to code sign the file. You can use a string as the algorithm name if the target over-the-air (OTA) update devices are able to verify the signature that was generated using the same signature algorithm. For example, FreeRTOS uses <code>ECDSA</code> or <code>RSA</code>, so you can pass either of them based on which was used for generating the signature.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a custom method used to code sign a file.</p>\"\
    },\
    \"CustomMetricArn\":{\"type\":\"string\"},\
    \"CustomMetricDisplayName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"CustomMetricType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"string-list\",\
        \"ip-address-list\",\
        \"number-list\",\
        \"number\"\
      ]\
    },\
    \"CustomerVersion\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"DataCollectionPercentage\":{\
      \"type\":\"double\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"DateType\":{\"type\":\"timestamp\"},\
    \"DayOfMonth\":{\
      \"type\":\"string\",\
      \"pattern\":\"^([1-9]|[12][0-9]|3[01])$|^LAST$\"\
    },\
    \"DayOfWeek\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUN\",\
        \"MON\",\
        \"TUE\",\
        \"WED\",\
        \"THU\",\
        \"FRI\",\
        \"SAT\"\
      ]\
    },\
    \"DeleteAccountAuditConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deleteScheduledAudits\":{\
          \"shape\":\"DeleteScheduledAudits\",\
          \"documentation\":\"<p>If true, all scheduled audits are deleted.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"deleteScheduledAudits\"\
        }\
      }\
    },\
    \"DeleteAccountAuditConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteAdditionalMetricsToRetain\":{\"type\":\"boolean\"},\
    \"DeleteAlertTargets\":{\"type\":\"boolean\"},\
    \"DeleteAuditSuppressionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"checkName\",\
        \"resourceIdentifier\"\
      ],\
      \"members\":{\
        \"checkName\":{\"shape\":\"AuditCheckName\"},\
        \"resourceIdentifier\":{\"shape\":\"ResourceIdentifier\"}\
      }\
    },\
    \"DeleteAuditSuppressionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"authorizerName\"],\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The name of the authorizer to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"authorizerName\"\
        }\
      }\
    },\
    \"DeleteAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteBehaviors\":{\"type\":\"boolean\"},\
    \"DeleteBillingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"billingGroupName\"],\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"billingGroupName\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the billing group. If the version of the billing group does not match the expected version specified in the request, the <code>DeleteBillingGroup</code> request is rejected with a <code>VersionConflictException</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\"\
        }\
      }\
    },\
    \"DeleteBillingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate to delete. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\"\
        }\
      },\
      \"documentation\":\"<p>Input for the DeleteCACertificate operation.</p>\"\
    },\
    \"DeleteCACertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeleteCACertificate operation.</p>\"\
    },\
    \"DeleteCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\"\
        },\
        \"forceDelete\":{\
          \"shape\":\"ForceDelete\",\
          \"documentation\":\"<p>Forces the deletion of a certificate if it is inactive and is not attached to an IoT thing.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"forceDelete\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteCertificate operation.</p>\"\
    },\
    \"DeleteConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"DeleteCustomMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"metricName\"],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        }\
      }\
    },\
    \"DeleteCustomMetricResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteDimensionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The unique identifier for the dimension that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        }\
      }\
    },\
    \"DeleteDimensionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteDomainConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainConfigurationName\"],\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"DomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"domainConfigurationName\"\
        }\
      }\
    },\
    \"DeleteDomainConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteDynamicThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingGroupName\"],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The name of the dynamic thing group to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the dynamic thing group to delete.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\"\
        }\
      }\
    },\
    \"DeleteDynamicThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteFleetMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"metricName\"],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"FleetMetricName\",\
          \"documentation\":\"<p>The name of the fleet metric to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the fleet metric to delete.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\"\
        }\
      }\
    },\
    \"DeleteJobExecutionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"jobId\",\
        \"thingName\",\
        \"executionNumber\"\
      ],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The ID of the job whose execution on a particular device will be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing whose job execution will be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"executionNumber\":{\
          \"shape\":\"ExecutionNumber\",\
          \"documentation\":\"<p>The ID of the job execution to be deleted. The <code>executionNumber</code> refers to the execution of a particular job on a particular device.</p> <p>Note that once a job execution is deleted, the <code>executionNumber</code> may be reused by IoT, so be sure you get and use the correct value here.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"executionNumber\"\
        },\
        \"force\":{\
          \"shape\":\"ForceFlag\",\
          \"documentation\":\"<p>(Optional) When true, you can delete a job execution which is \\\"IN_PROGRESS\\\". Otherwise, you can only delete a job execution which is in a terminal state (\\\"SUCCEEDED\\\", \\\"FAILED\\\", \\\"REJECTED\\\", \\\"REMOVED\\\" or \\\"CANCELED\\\") or an exception will occur. The default is false.</p> <note> <p>Deleting a job execution which is \\\"IN_PROGRESS\\\", will cause the device to be unable to access job information or update the job execution status. Use caution and ensure that the device is able to recover to a valid state.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"force\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namespaceId\"\
        }\
      }\
    },\
    \"DeleteJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobId\"],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The ID of the job to be deleted.</p> <p>After a job deletion is completed, you may reuse this jobId when you create a new job. However, this is not recommended, and you must ensure that your devices are not using the jobId to refer to the deleted job.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"force\":{\
          \"shape\":\"ForceFlag\",\
          \"documentation\":\"<p>(Optional) When true, you can delete a job which is \\\"IN_PROGRESS\\\". Otherwise, you can only delete a job which is in a terminal state (\\\"COMPLETED\\\" or \\\"CANCELED\\\") or an exception will occur. The default is false.</p> <note> <p>Deleting a job which is \\\"IN_PROGRESS\\\", will cause a device which is executing the job to be unable to access job information or update the job execution status. Use caution and ensure that each device executing a job which is deleted is able to recover to a valid state.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"force\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namespaceId\"\
        }\
      }\
    },\
    \"DeleteJobTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobTemplateId\"],\
      \"members\":{\
        \"jobTemplateId\":{\
          \"shape\":\"JobTemplateId\",\
          \"documentation\":\"<p>The unique identifier of the job template to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobTemplateId\"\
        }\
      }\
    },\
    \"DeleteMitigationActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"actionName\"],\
      \"members\":{\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>The name of the mitigation action that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"actionName\"\
        }\
      }\
    },\
    \"DeleteMitigationActionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteOTAUpdateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"otaUpdateId\"],\
      \"members\":{\
        \"otaUpdateId\":{\
          \"shape\":\"OTAUpdateId\",\
          \"documentation\":\"<p>The ID of the OTA update to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"otaUpdateId\"\
        },\
        \"deleteStream\":{\
          \"shape\":\"DeleteStream\",\
          \"documentation\":\"<p>When true, the stream created by the OTAUpdate process is deleted when the OTA update is deleted. Ignored if the stream specified in the OTAUpdate is supplied by the user.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"deleteStream\"\
        },\
        \"forceDeleteAWSJob\":{\
          \"shape\":\"ForceDeleteAWSJob\",\
          \"documentation\":\"<p>When true, deletes the IoT job created by the OTAUpdate process even if it is \\\"IN_PROGRESS\\\". Otherwise, if the job is not in a terminal state (\\\"COMPLETED\\\" or \\\"CANCELED\\\") an exception will occur. The default is false.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"forceDeleteAWSJob\"\
        }\
      }\
    },\
    \"DeleteOTAUpdateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeletePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeletePolicy operation.</p>\"\
    },\
    \"DeletePolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyVersionId\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyVersionId\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeletePolicyVersion operation.</p>\"\
    },\
    \"DeleteProvisioningTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateName\"],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the fleet provision template to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        }\
      }\
    },\
    \"DeleteProvisioningTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteProvisioningTemplateVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"templateName\",\
        \"versionId\"\
      ],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template version to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        },\
        \"versionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The provisioning template version ID to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"versionId\"\
        }\
      }\
    },\
    \"DeleteProvisioningTemplateVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteRegistrationCodeRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input for the DeleteRegistrationCode operation.</p>\"\
    },\
    \"DeleteRegistrationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeleteRegistrationCode operation.</p>\"\
    },\
    \"DeleteRoleAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"roleAlias\"],\
      \"members\":{\
        \"roleAlias\":{\
          \"shape\":\"RoleAlias\",\
          \"documentation\":\"<p>The role alias to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"roleAlias\"\
        }\
      }\
    },\
    \"DeleteRoleAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteScheduledAuditRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"scheduledAuditName\"],\
      \"members\":{\
        \"scheduledAuditName\":{\
          \"shape\":\"ScheduledAuditName\",\
          \"documentation\":\"<p>The name of the scheduled audit you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"scheduledAuditName\"\
        }\
      }\
    },\
    \"DeleteScheduledAuditResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteScheduledAudits\":{\"type\":\"boolean\"},\
    \"DeleteSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"securityProfileName\"],\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the security profile. A new version is generated whenever the security profile is updated. If you specify a value that is different from the actual version, a <code>VersionConflictException</code> is thrown.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\"\
        }\
      }\
    },\
    \"DeleteSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteStream\":{\"type\":\"boolean\"},\
    \"DeleteStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"streamId\"],\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"streamId\"\
        }\
      }\
    },\
    \"DeleteStreamResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingGroupName\"],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The name of the thing group to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the thing group to delete.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\"\
        }\
      }\
    },\
    \"DeleteThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>DeleteThing</code> request is rejected with a <code>VersionConflictException</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteThing operation.</p>\"\
    },\
    \"DeleteThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output of the DeleteThing operation.</p>\"\
    },\
    \"DeleteThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteThingType operation.</p>\"\
    },\
    \"DeleteThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeleteThingType operation.</p>\"\
    },\
    \"DeleteTopicRuleDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"arn\"],\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the topic rule destination to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"arn\"\
        }\
      }\
    },\
    \"DeleteTopicRuleDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ruleName\"],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteTopicRule operation.</p>\"\
    },\
    \"DeleteV2LoggingLevelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"targetType\",\
        \"targetName\"\
      ],\
      \"members\":{\
        \"targetType\":{\
          \"shape\":\"LogTargetType\",\
          \"documentation\":\"<p>The type of resource for which you are configuring logging. Must be <code>THING_Group</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"targetType\"\
        },\
        \"targetName\":{\
          \"shape\":\"LogTargetName\",\
          \"documentation\":\"<p>The name of the resource for which you are configuring logging.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"targetName\"\
        }\
      }\
    },\
    \"DeliveryStreamName\":{\"type\":\"string\"},\
    \"Denied\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"implicitDeny\":{\
          \"shape\":\"ImplicitDeny\",\
          \"documentation\":\"<p>Information that implicitly denies the authorization. When a policy doesn't explicitly deny or allow an action on a resource it is considered an implicit deny.</p>\"\
        },\
        \"explicitDeny\":{\
          \"shape\":\"ExplicitDeny\",\
          \"documentation\":\"<p>Information that explicitly denies the authorization. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information that denied the authorization.</p>\"\
    },\
    \"DeprecateThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type to deprecate.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\"\
        },\
        \"undoDeprecate\":{\
          \"shape\":\"UndoDeprecate\",\
          \"documentation\":\"<p>Whether to undeprecate a deprecated thing type. If <b>true</b>, the thing type will not be deprecated anymore and you can associate it with things.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeprecateThingType operation.</p>\"\
    },\
    \"DeprecateThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeprecateThingType operation.</p>\"\
    },\
    \"DeprecationDate\":{\"type\":\"timestamp\"},\
    \"DescribeAccountAuditConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeAccountAuditConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role that grants permission to IoT to access information about your devices, policies, certificates, and other items as required when performing an audit.</p> <p>On the first call to <code>UpdateAccountAuditConfiguration</code>, this parameter is required.</p>\"\
        },\
        \"auditNotificationTargetConfigurations\":{\
          \"shape\":\"AuditNotificationTargetConfigurations\",\
          \"documentation\":\"<p>Information about the targets to which audit notifications are sent for this account.</p>\"\
        },\
        \"auditCheckConfigurations\":{\
          \"shape\":\"AuditCheckConfigurations\",\
          \"documentation\":\"<p>Which audit checks are enabled and disabled for this account.</p>\"\
        }\
      }\
    },\
    \"DescribeAuditFindingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"findingId\"],\
      \"members\":{\
        \"findingId\":{\
          \"shape\":\"FindingId\",\
          \"documentation\":\"<p>A unique identifier for a single audit finding. You can use this identifier to apply mitigation actions to the finding.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"findingId\"\
        }\
      }\
    },\
    \"DescribeAuditFindingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"finding\":{\"shape\":\"AuditFinding\"}\
      }\
    },\
    \"DescribeAuditMitigationActionsTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p>The unique identifier for the audit mitigation task.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"DescribeAuditMitigationActionsTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskStatus\":{\
          \"shape\":\"AuditMitigationActionsTaskStatus\",\
          \"documentation\":\"<p>The current status of the task.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the task was started.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the task was completed or canceled.</p>\"\
        },\
        \"taskStatistics\":{\
          \"shape\":\"AuditMitigationActionsTaskStatistics\",\
          \"documentation\":\"<p>Aggregate counts of the results when the mitigation tasks were applied to the findings for this audit mitigation actions task.</p>\"\
        },\
        \"target\":{\
          \"shape\":\"AuditMitigationActionsTaskTarget\",\
          \"documentation\":\"<p>Identifies the findings to which the mitigation actions are applied. This can be by audit checks, by audit task, or a set of findings.</p>\"\
        },\
        \"auditCheckToActionsMapping\":{\
          \"shape\":\"AuditCheckToActionsMapping\",\
          \"documentation\":\"<p>Specifies the mitigation actions that should be applied to specific audit checks.</p>\"\
        },\
        \"actionsDefinition\":{\
          \"shape\":\"MitigationActionList\",\
          \"documentation\":\"<p>Specifies the mitigation actions and their parameters that are applied as part of this task.</p>\"\
        }\
      }\
    },\
    \"DescribeAuditSuppressionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"checkName\",\
        \"resourceIdentifier\"\
      ],\
      \"members\":{\
        \"checkName\":{\"shape\":\"AuditCheckName\"},\
        \"resourceIdentifier\":{\"shape\":\"ResourceIdentifier\"}\
      }\
    },\
    \"DescribeAuditSuppressionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"checkName\":{\"shape\":\"AuditCheckName\"},\
        \"resourceIdentifier\":{\"shape\":\"ResourceIdentifier\"},\
        \"expirationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The epoch timestamp in seconds at which this suppression expires. </p>\"\
        },\
        \"suppressIndefinitely\":{\
          \"shape\":\"SuppressIndefinitely\",\
          \"documentation\":\"<p> Indicates whether a suppression should exist indefinitely or not. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"AuditDescription\",\
          \"documentation\":\"<p> The description of the audit suppression. </p>\"\
        }\
      }\
    },\
    \"DescribeAuditTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>The ID of the audit whose information you want to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"DescribeAuditTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskStatus\":{\
          \"shape\":\"AuditTaskStatus\",\
          \"documentation\":\"<p>The status of the audit: one of \\\"IN_PROGRESS\\\", \\\"COMPLETED\\\", \\\"FAILED\\\", or \\\"CANCELED\\\".</p>\"\
        },\
        \"taskType\":{\
          \"shape\":\"AuditTaskType\",\
          \"documentation\":\"<p>The type of audit: \\\"ON_DEMAND_AUDIT_TASK\\\" or \\\"SCHEDULED_AUDIT_TASK\\\".</p>\"\
        },\
        \"taskStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the audit started.</p>\"\
        },\
        \"taskStatistics\":{\
          \"shape\":\"TaskStatistics\",\
          \"documentation\":\"<p>Statistical information about the audit.</p>\"\
        },\
        \"scheduledAuditName\":{\
          \"shape\":\"ScheduledAuditName\",\
          \"documentation\":\"<p>The name of the scheduled audit (only if the audit was a scheduled audit).</p>\"\
        },\
        \"auditDetails\":{\
          \"shape\":\"AuditDetails\",\
          \"documentation\":\"<p>Detailed information about each check performed during this audit.</p>\"\
        }\
      }\
    },\
    \"DescribeAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"authorizerName\"],\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The name of the authorizer to describe.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"authorizerName\"\
        }\
      }\
    },\
    \"DescribeAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizerDescription\":{\
          \"shape\":\"AuthorizerDescription\",\
          \"documentation\":\"<p>The authorizer description.</p>\"\
        }\
      }\
    },\
    \"DescribeBillingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"billingGroupName\"],\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"billingGroupName\"\
        }\
      }\
    },\
    \"DescribeBillingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group.</p>\"\
        },\
        \"billingGroupId\":{\
          \"shape\":\"BillingGroupId\",\
          \"documentation\":\"<p>The ID of the billing group.</p>\"\
        },\
        \"billingGroupArn\":{\
          \"shape\":\"BillingGroupArn\",\
          \"documentation\":\"<p>The ARN of the billing group.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the billing group.</p>\"\
        },\
        \"billingGroupProperties\":{\
          \"shape\":\"BillingGroupProperties\",\
          \"documentation\":\"<p>The properties of the billing group.</p>\"\
        },\
        \"billingGroupMetadata\":{\
          \"shape\":\"BillingGroupMetadata\",\
          \"documentation\":\"<p>Additional information about the billing group.</p>\"\
        }\
      }\
    },\
    \"DescribeCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The CA certificate identifier.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeCACertificate operation.</p>\"\
    },\
    \"DescribeCACertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateDescription\":{\
          \"shape\":\"CACertificateDescription\",\
          \"documentation\":\"<p>The CA certificate description.</p>\"\
        },\
        \"registrationConfig\":{\
          \"shape\":\"RegistrationConfig\",\
          \"documentation\":\"<p>Information about the registration configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DescribeCACertificate operation.</p>\"\
    },\
    \"DescribeCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeCertificate operation.</p>\"\
    },\
    \"DescribeCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateDescription\":{\
          \"shape\":\"CertificateDescription\",\
          \"documentation\":\"<p>The description of the certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the DescribeCertificate operation.</p>\"\
    },\
    \"DescribeCustomMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"metricName\"],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        }\
      }\
    },\
    \"DescribeCustomMetricResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric. </p>\"\
        },\
        \"metricArn\":{\
          \"shape\":\"CustomMetricArn\",\
          \"documentation\":\"<p> The Amazon Resource Number (ARN) of the custom metric. </p>\"\
        },\
        \"metricType\":{\
          \"shape\":\"CustomMetricType\",\
          \"documentation\":\"<p> The type of the custom metric. </p> <important> <p>The type <code>number</code> only takes a single metric value as an input, but while submitting the metrics value in the DeviceMetrics report, it must be passed as an array with a single value.</p> </important>\"\
        },\
        \"displayName\":{\
          \"shape\":\"CustomMetricDisplayName\",\
          \"documentation\":\"<p> Field represents a friendly name in the console for the custom metric; doesn't have to be unique. Don't use this name as the metric identifier in the device metric report. Can be updated. </p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The creation date of the custom metric in milliseconds since epoch. </p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The time the custom metric was last modified in milliseconds since epoch. </p>\"\
        }\
      }\
    },\
    \"DescribeDefaultAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeDefaultAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizerDescription\":{\
          \"shape\":\"AuthorizerDescription\",\
          \"documentation\":\"<p>The default authorizer's description.</p>\"\
        }\
      }\
    },\
    \"DescribeDetectMitigationActionsTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p> The unique identifier of the task. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"DescribeDetectMitigationActionsTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskSummary\":{\
          \"shape\":\"DetectMitigationActionsTaskSummary\",\
          \"documentation\":\"<p> The description of a task. </p>\"\
        }\
      }\
    },\
    \"DescribeDimensionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The unique identifier for the dimension.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        }\
      }\
    },\
    \"DescribeDimensionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The unique identifier for the dimension.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"DimensionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the dimension.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"DimensionType\",\
          \"documentation\":\"<p>The type of the dimension.</p>\"\
        },\
        \"stringValues\":{\
          \"shape\":\"DimensionStringValues\",\
          \"documentation\":\"<p>The value or list of values used to scope the dimension. For example, for topic filters, this is the pattern used to match the MQTT topic name.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date the dimension was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date the dimension was last modified.</p>\"\
        }\
      }\
    },\
    \"DescribeDomainConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainConfigurationName\"],\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"ReservedDomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"domainConfigurationName\"\
        }\
      }\
    },\
    \"DescribeDomainConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"ReservedDomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration.</p>\"\
        },\
        \"domainConfigurationArn\":{\
          \"shape\":\"DomainConfigurationArn\",\
          \"documentation\":\"<p>The ARN of the domain configuration.</p>\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain.</p>\"\
        },\
        \"serverCertificates\":{\
          \"shape\":\"ServerCertificates\",\
          \"documentation\":\"<p>A list containing summary information about the server certificate included in the domain configuration.</p>\"\
        },\
        \"authorizerConfig\":{\
          \"shape\":\"AuthorizerConfig\",\
          \"documentation\":\"<p>An object that specifies the authorization service for a domain.</p>\"\
        },\
        \"domainConfigurationStatus\":{\
          \"shape\":\"DomainConfigurationStatus\",\
          \"documentation\":\"<p>A Boolean value that specifies the current state of the domain configuration.</p>\"\
        },\
        \"serviceType\":{\
          \"shape\":\"ServiceType\",\
          \"documentation\":\"<p>The type of service delivered by the endpoint.</p>\"\
        },\
        \"domainType\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The type of the domain.</p>\"\
        },\
        \"lastStatusChangeDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the domain configuration's status was last changed.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"endpointType\":{\
          \"shape\":\"EndpointType\",\
          \"documentation\":\"<p>The endpoint type. Valid endpoint types include:</p> <ul> <li> <p> <code>iot:Data</code> - Returns a VeriSign signed data endpoint.</p> </li> </ul> <ul> <li> <p> <code>iot:Data-ATS</code> - Returns an ATS signed data endpoint.</p> </li> </ul> <ul> <li> <p> <code>iot:CredentialProvider</code> - Returns an IoT credentials provider API endpoint.</p> </li> </ul> <ul> <li> <p> <code>iot:Jobs</code> - Returns an IoT device management Jobs API endpoint.</p> </li> </ul> <p>We strongly recommend that customers use the newer <code>iot:Data-ATS</code> endpoint type to avoid issues related to the widespread distrust of Symantec certificate authorities.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"endpointType\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeEndpoint operation.</p>\"\
    },\
    \"DescribeEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"endpointAddress\":{\
          \"shape\":\"EndpointAddress\",\
          \"documentation\":\"<p>The endpoint. The format of the endpoint is as follows: <i>identifier</i>.iot.<i>region</i>.amazonaws.com.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DescribeEndpoint operation.</p>\"\
    },\
    \"DescribeEventConfigurationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeEventConfigurationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"eventConfigurations\":{\
          \"shape\":\"EventConfigurations\",\
          \"documentation\":\"<p>The event configurations.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>The creation date of the event configuration.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"LastModifiedDate\",\
          \"documentation\":\"<p>The date the event configurations were last modified.</p>\"\
        }\
      }\
    },\
    \"DescribeFleetMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"metricName\"],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"FleetMetricName\",\
          \"documentation\":\"<p>The name of the fleet metric to describe.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        }\
      }\
    },\
    \"DescribeFleetMetricResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"FleetMetricName\",\
          \"documentation\":\"<p>The name of the fleet metric to describe.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The search query string.</p>\"\
        },\
        \"aggregationType\":{\
          \"shape\":\"AggregationType\",\
          \"documentation\":\"<p>The type of the aggregation query.</p>\"\
        },\
        \"period\":{\
          \"shape\":\"FleetMetricPeriod\",\
          \"documentation\":\"<p>The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be multiple of 60.</p>\"\
        },\
        \"aggregationField\":{\
          \"shape\":\"AggregationField\",\
          \"documentation\":\"<p>The field to aggregate.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"FleetMetricDescription\",\
          \"documentation\":\"<p>The fleet metric description.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The query version.</p>\"\
        },\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The name of the index to search.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>The date when the fleet metric is created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"LastModifiedDate\",\
          \"documentation\":\"<p>The date when the fleet metric is last modified.</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"FleetMetricUnit\",\
          \"documentation\":\"<p>Used to support unit transformation such as milliseconds to seconds. The unit must be supported by <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html\\\">CW metric</a>.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the fleet metric.</p>\"\
        },\
        \"metricArn\":{\
          \"shape\":\"FleetMetricArn\",\
          \"documentation\":\"<p>The ARN of the fleet metric to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"indexName\"],\
      \"members\":{\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The index name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"indexName\"\
        }\
      }\
    },\
    \"DescribeIndexResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The index name.</p>\"\
        },\
        \"indexStatus\":{\
          \"shape\":\"IndexStatus\",\
          \"documentation\":\"<p>The index status.</p>\"\
        },\
        \"schema\":{\
          \"shape\":\"IndexSchema\",\
          \"documentation\":\"<p>Contains a value that specifies the type of indexing performed. Valid values are:</p> <ul> <li> <p>REGISTRY â Your thing index contains only registry data.</p> </li> <li> <p>REGISTRY_AND_SHADOW - Your thing index contains registry data and shadow data.</p> </li> <li> <p>REGISTRY_AND_CONNECTIVITY_STATUS - Your thing index contains registry data and thing connectivity status data.</p> </li> <li> <p>REGISTRY_AND_SHADOW_AND_CONNECTIVITY_STATUS - Your thing index contains registry data, shadow data, and thing connectivity status data.</p> </li> <li> <p>MULTI_INDEXING_MODE - Your thing index contains multiple data sources. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_GetIndexingConfiguration.html\\\">GetIndexingConfiguration</a>.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"DescribeJobExecutionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"jobId\",\
        \"thingName\"\
      ],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing on which the job execution is running.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"executionNumber\":{\
          \"shape\":\"ExecutionNumber\",\
          \"documentation\":\"<p>A string (consisting of the digits \\\"0\\\" through \\\"9\\\" which is used to specify a particular job execution on a particular device.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"executionNumber\"\
        }\
      }\
    },\
    \"DescribeJobExecutionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"execution\":{\
          \"shape\":\"JobExecution\",\
          \"documentation\":\"<p>Information about the job execution.</p>\"\
        }\
      }\
    },\
    \"DescribeJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobId\"],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        }\
      }\
    },\
    \"DescribeJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"documentSource\":{\
          \"shape\":\"JobDocumentSource\",\
          \"documentation\":\"<p>An S3 link to the job document.</p>\"\
        },\
        \"job\":{\
          \"shape\":\"Job\",\
          \"documentation\":\"<p>Information about the job.</p>\"\
        }\
      }\
    },\
    \"DescribeJobTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobTemplateId\"],\
      \"members\":{\
        \"jobTemplateId\":{\
          \"shape\":\"JobTemplateId\",\
          \"documentation\":\"<p>The unique identifier of the job template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobTemplateId\"\
        }\
      }\
    },\
    \"DescribeJobTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobTemplateArn\":{\
          \"shape\":\"JobTemplateArn\",\
          \"documentation\":\"<p>The ARN of the job template.</p>\"\
        },\
        \"jobTemplateId\":{\
          \"shape\":\"JobTemplateId\",\
          \"documentation\":\"<p>The unique identifier of the job template.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A description of the job template.</p>\"\
        },\
        \"documentSource\":{\
          \"shape\":\"JobDocumentSource\",\
          \"documentation\":\"<p>An S3 link to the job document.</p>\"\
        },\
        \"document\":{\
          \"shape\":\"JobDocument\",\
          \"documentation\":\"<p>The job document.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job template was created.</p>\"\
        },\
        \"presignedUrlConfig\":{\"shape\":\"PresignedUrlConfig\"},\
        \"jobExecutionsRolloutConfig\":{\"shape\":\"JobExecutionsRolloutConfig\"},\
        \"abortConfig\":{\"shape\":\"AbortConfig\"},\
        \"timeoutConfig\":{\"shape\":\"TimeoutConfig\"},\
        \"jobExecutionsRetryConfig\":{\
          \"shape\":\"JobExecutionsRetryConfig\",\
          \"documentation\":\"<p>The configuration that determines how many retries are allowed for each failure type for a job.</p>\"\
        },\
        \"maintenanceWindows\":{\
          \"shape\":\"MaintenanceWindows\",\
          \"documentation\":\"<p>Allows you to configure an optional maintenance window for the rollout of a job document to all devices in the target group for a job.</p>\"\
        }\
      }\
    },\
    \"DescribeManagedJobTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateName\"],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"ManagedJobTemplateName\",\
          \"documentation\":\"<p>The unique name of a managed job template, which is required.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        },\
        \"templateVersion\":{\
          \"shape\":\"ManagedTemplateVersion\",\
          \"documentation\":\"<p>An optional parameter to specify version of a managed template. If not specified, the pre-defined default version is returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"templateVersion\"\
        }\
      }\
    },\
    \"DescribeManagedJobTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"ManagedJobTemplateName\",\
          \"documentation\":\"<p>The unique name of a managed template, such as <code>AWS-Reboot</code>.</p>\"\
        },\
        \"templateArn\":{\
          \"shape\":\"JobTemplateArn\",\
          \"documentation\":\"<p>The unique Amazon Resource Name (ARN) of the managed template.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>The unique description of a managed template.</p>\"\
        },\
        \"templateVersion\":{\
          \"shape\":\"ManagedTemplateVersion\",\
          \"documentation\":\"<p>The version for a managed template.</p>\"\
        },\
        \"environments\":{\
          \"shape\":\"Environments\",\
          \"documentation\":\"<p>A list of environments that are supported with the managed job template.</p>\"\
        },\
        \"documentParameters\":{\
          \"shape\":\"DocumentParameters\",\
          \"documentation\":\"<p>A map of key-value pairs that you can use as guidance to specify the inputs for creating a job from a managed template.</p> <note> <p> <code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p> </note>\"\
        },\
        \"document\":{\
          \"shape\":\"JobDocument\",\
          \"documentation\":\"<p>The document schema for a managed job template.</p>\"\
        }\
      }\
    },\
    \"DescribeMitigationActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"actionName\"],\
      \"members\":{\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>The friendly name that uniquely identifies the mitigation action.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"actionName\"\
        }\
      }\
    },\
    \"DescribeMitigationActionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>The friendly name that uniquely identifies the mitigation action.</p>\"\
        },\
        \"actionType\":{\
          \"shape\":\"MitigationActionType\",\
          \"documentation\":\"<p>The type of mitigation action.</p>\"\
        },\
        \"actionArn\":{\
          \"shape\":\"MitigationActionArn\",\
          \"documentation\":\"<p>The ARN that identifies this migration action.</p>\"\
        },\
        \"actionId\":{\
          \"shape\":\"MitigationActionId\",\
          \"documentation\":\"<p>A unique identifier for this action.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the IAM role used to apply this action.</p>\"\
        },\
        \"actionParams\":{\
          \"shape\":\"MitigationActionParams\",\
          \"documentation\":\"<p>Parameters that control how the mitigation action is applied, specific to the type of mitigation action.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the mitigation action was added to your Amazon Web Services accounts.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the mitigation action was last changed.</p>\"\
        }\
      }\
    },\
    \"DescribeProvisioningTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateName\"],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        }\
      }\
    },\
    \"DescribeProvisioningTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateArn\":{\
          \"shape\":\"TemplateArn\",\
          \"documentation\":\"<p>The ARN of the provisioning template.</p>\"\
        },\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"TemplateDescription\",\
          \"documentation\":\"<p>The description of the provisioning template.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the provisioning template was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the provisioning template was last modified.</p>\"\
        },\
        \"defaultVersionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The default fleet template version ID.</p>\"\
        },\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The JSON formatted contents of the provisioning template.</p>\"\
        },\
        \"enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>True if the provisioning template is enabled, otherwise false.</p>\"\
        },\
        \"provisioningRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role associated with the provisioning template. This IoT role grants permission to provision a device.</p>\"\
        },\
        \"preProvisioningHook\":{\
          \"shape\":\"ProvisioningHook\",\
          \"documentation\":\"<p>Gets information about a pre-provisioned hook.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"TemplateType\",\
          \"documentation\":\"<p>The type you define in a provisioning template. You can create a template with only one type. You can't change the template type after its creation. The default value is <code>FLEET_PROVISIONING</code>. For more information about provisioning template, see: <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html\\\">Provisioning template</a>. </p>\"\
        }\
      }\
    },\
    \"DescribeProvisioningTemplateVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"templateName\",\
        \"versionId\"\
      ],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The template name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        },\
        \"versionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The provisioning template version ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"versionId\"\
        }\
      }\
    },\
    \"DescribeProvisioningTemplateVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"versionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The provisioning template version ID.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the provisioning template version was created.</p>\"\
        },\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The JSON formatted contents of the provisioning template version.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>True if the provisioning template version is the default version.</p>\"\
        }\
      }\
    },\
    \"DescribeRoleAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"roleAlias\"],\
      \"members\":{\
        \"roleAlias\":{\
          \"shape\":\"RoleAlias\",\
          \"documentation\":\"<p>The role alias to describe.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"roleAlias\"\
        }\
      }\
    },\
    \"DescribeRoleAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleAliasDescription\":{\
          \"shape\":\"RoleAliasDescription\",\
          \"documentation\":\"<p>The role alias description.</p>\"\
        }\
      }\
    },\
    \"DescribeScheduledAuditRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"scheduledAuditName\"],\
      \"members\":{\
        \"scheduledAuditName\":{\
          \"shape\":\"ScheduledAuditName\",\
          \"documentation\":\"<p>The name of the scheduled audit whose information you want to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"scheduledAuditName\"\
        }\
      }\
    },\
    \"DescribeScheduledAuditResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"frequency\":{\
          \"shape\":\"AuditFrequency\",\
          \"documentation\":\"<p>How often the scheduled audit takes place, either one of <code>DAILY</code>, <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The start time of each audit is determined by the system.</p>\"\
        },\
        \"dayOfMonth\":{\
          \"shape\":\"DayOfMonth\",\
          \"documentation\":\"<p>The day of the month on which the scheduled audit takes place. This is will be <code>1</code> through <code>31</code> or <code>LAST</code>. If days <code>29</code>-<code>31</code> are specified, and the month does not have that many days, the audit takes place on the <code>LAST</code> day of the month.</p>\"\
        },\
        \"dayOfWeek\":{\
          \"shape\":\"DayOfWeek\",\
          \"documentation\":\"<p>The day of the week on which the scheduled audit takes place, either one of <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>.</p>\"\
        },\
        \"targetCheckNames\":{\
          \"shape\":\"TargetAuditCheckNames\",\
          \"documentation\":\"<p>Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>\"\
        },\
        \"scheduledAuditName\":{\
          \"shape\":\"ScheduledAuditName\",\
          \"documentation\":\"<p>The name of the scheduled audit.</p>\"\
        },\
        \"scheduledAuditArn\":{\
          \"shape\":\"ScheduledAuditArn\",\
          \"documentation\":\"<p>The ARN of the scheduled audit.</p>\"\
        }\
      }\
    },\
    \"DescribeSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"securityProfileName\"],\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile whose information you want to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"securityProfileName\"\
        }\
      }\
    },\
    \"DescribeSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile.</p>\"\
        },\
        \"securityProfileArn\":{\
          \"shape\":\"SecurityProfileArn\",\
          \"documentation\":\"<p>The ARN of the security profile.</p>\"\
        },\
        \"securityProfileDescription\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>A description of the security profile (associated with the security profile when it was created or updated).</p>\"\
        },\
        \"behaviors\":{\
          \"shape\":\"Behaviors\",\
          \"documentation\":\"<p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>\"\
        },\
        \"alertTargets\":{\
          \"shape\":\"AlertTargets\",\
          \"documentation\":\"<p>Where the alerts are sent. (Alerts are always sent to the console.)</p>\"\
        },\
        \"additionalMetricsToRetain\":{\
          \"shape\":\"AdditionalMetricsToRetainList\",\
          \"documentation\":\"<p> <i>Please use <a>DescribeSecurityProfileResponse$additionalMetricsToRetainV2</a> instead.</i> </p> <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Use additionalMetricsToRetainV2.\"\
        },\
        \"additionalMetricsToRetainV2\":{\
          \"shape\":\"AdditionalMetricsToRetainV2List\",\
          \"documentation\":\"<p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the security profile. A new version is generated whenever the security profile is updated.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the security profile was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the security profile was last modified.</p>\"\
        }\
      }\
    },\
    \"DescribeStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"streamId\"],\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"streamId\"\
        }\
      }\
    },\
    \"DescribeStreamResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"streamInfo\":{\
          \"shape\":\"StreamInfo\",\
          \"documentation\":\"<p>Information about the stream.</p>\"\
        }\
      }\
    },\
    \"DescribeThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingGroupName\"],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The name of the thing group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        }\
      }\
    },\
    \"DescribeThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The name of the thing group.</p>\"\
        },\
        \"thingGroupId\":{\
          \"shape\":\"ThingGroupId\",\
          \"documentation\":\"<p>The thing group ID.</p>\"\
        },\
        \"thingGroupArn\":{\
          \"shape\":\"ThingGroupArn\",\
          \"documentation\":\"<p>The thing group ARN.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the thing group.</p>\"\
        },\
        \"thingGroupProperties\":{\
          \"shape\":\"ThingGroupProperties\",\
          \"documentation\":\"<p>The thing group properties.</p>\"\
        },\
        \"thingGroupMetadata\":{\
          \"shape\":\"ThingGroupMetadata\",\
          \"documentation\":\"<p>Thing group metadata.</p>\"\
        },\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The dynamic thing group index name.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The dynamic thing group search query string.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The dynamic thing group query version.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"DynamicGroupStatus\",\
          \"documentation\":\"<p>The dynamic thing group status.</p>\"\
        }\
      }\
    },\
    \"DescribeThingRegistrationTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>The task ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"DescribeThingRegistrationTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>The task ID.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>The task creation date.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"LastModifiedDate\",\
          \"documentation\":\"<p>The date when the task was last modified.</p>\"\
        },\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The task's template.</p>\"\
        },\
        \"inputFileBucket\":{\
          \"shape\":\"RegistryS3BucketName\",\
          \"documentation\":\"<p>The S3 bucket that contains the input file.</p>\"\
        },\
        \"inputFileKey\":{\
          \"shape\":\"RegistryS3KeyName\",\
          \"documentation\":\"<p>The input file key.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The role ARN that grants access to the input file bucket.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>The status of the bulk thing provisioning task.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The message.</p>\"\
        },\
        \"successCount\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The number of things successfully provisioned.</p>\"\
        },\
        \"failureCount\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The number of things that failed to be provisioned.</p>\"\
        },\
        \"percentageProgress\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The progress of the bulk provisioning task expressed as a percentage.</p>\"\
        }\
      }\
    },\
    \"DescribeThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeThing operation.</p>\"\
    },\
    \"DescribeThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"defaultClientId\":{\
          \"shape\":\"ClientId\",\
          \"documentation\":\"<p>The default MQTT client ID. For a typical device, the thing name is also used as the default MQTT client ID. Although we donât require a mapping between a thing's registry name and its use of MQTT client IDs, certificates, or shadow state, we recommend that you choose a thing name and use it as the MQTT client ID for the registry and the Device Shadow service.</p> <p>This lets you better organize your IoT fleet without removing the flexibility of the underlying device certificate model or shadows.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        },\
        \"thingId\":{\
          \"shape\":\"ThingId\",\
          \"documentation\":\"<p>The ID of the thing to describe.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the thing to describe.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The thing type name.</p>\"\
        },\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>The thing attributes.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The current version of the thing record in the registry.</p> <note> <p>To avoid unintentional changes to the information in the registry, you can pass the version information in the <code>expectedVersion</code> parameter of the <code>UpdateThing</code> and <code>DeleteThing</code> calls.</p> </note>\"\
        },\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group the thing belongs to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DescribeThing operation.</p>\"\
    },\
    \"DescribeThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeThingType operation.</p>\"\
    },\
    \"DescribeThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"thingTypeId\":{\
          \"shape\":\"ThingTypeId\",\
          \"documentation\":\"<p>The thing type ID.</p>\"\
        },\
        \"thingTypeArn\":{\
          \"shape\":\"ThingTypeArn\",\
          \"documentation\":\"<p>The thing type ARN.</p>\"\
        },\
        \"thingTypeProperties\":{\
          \"shape\":\"ThingTypeProperties\",\
          \"documentation\":\"<p>The ThingTypeProperties contains information about the thing type including description, and a list of searchable thing attribute names.</p>\"\
        },\
        \"thingTypeMetadata\":{\
          \"shape\":\"ThingTypeMetadata\",\
          \"documentation\":\"<p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when it was deprecated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the DescribeThingType operation.</p>\"\
    },\
    \"Description\":{\"type\":\"string\"},\
    \"Destination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"s3Destination\":{\
          \"shape\":\"S3Destination\",\
          \"documentation\":\"<p>Describes the location in S3 of the updated firmware.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the location of the updated firmware.</p>\"\
    },\
    \"DetachPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"target\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy to detach.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"target\":{\
          \"shape\":\"PolicyTarget\",\
          \"documentation\":\"<p>The target from which the policy will be detached.</p>\"\
        }\
      }\
    },\
    \"DetachPrincipalPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy to detach.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal.</p> <p>Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-principal\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DetachPrincipalPolicy operation.</p>\"\
    },\
    \"DetachSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"securityProfileName\",\
        \"securityProfileTargetArn\"\
      ],\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The security profile that is detached.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"securityProfileTargetArn\":{\
          \"shape\":\"SecurityProfileTargetArn\",\
          \"documentation\":\"<p>The ARN of the thing group from which the security profile is detached.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"securityProfileTargetArn\"\
        }\
      }\
    },\
    \"DetachSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DetachThingPrincipalRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>If the principal is a certificate, this value must be ARN of the certificate. If the principal is an Amazon Cognito identity, this value must be the ID of the Amazon Cognito identity.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-principal\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DetachThingPrincipal operation.</p>\"\
    },\
    \"DetachThingPrincipalResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output from the DetachThingPrincipal operation.</p>\"\
    },\
    \"DetailsKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"DetailsMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"DetailsKey\"},\
      \"value\":{\"shape\":\"DetailsValue\"}\
    },\
    \"DetailsValue\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"DetectMitigationActionExecution\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p> The unique identifier of the task. </p>\"\
        },\
        \"violationId\":{\
          \"shape\":\"ViolationId\",\
          \"documentation\":\"<p> The unique identifier of the violation. </p>\"\
        },\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p> The friendly name that uniquely identifies the mitigation action. </p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"DeviceDefenderThingName\",\
          \"documentation\":\"<p> The name of the thing. </p>\"\
        },\
        \"executionStartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The date a mitigation action was started. </p>\"\
        },\
        \"executionEndDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The date a mitigation action ended. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"DetectMitigationActionExecutionStatus\",\
          \"documentation\":\"<p> The status of a mitigation action. </p>\"\
        },\
        \"errorCode\":{\
          \"shape\":\"DetectMitigationActionExecutionErrorCode\",\
          \"documentation\":\"<p> The error code of a mitigation action. </p>\"\
        },\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p> The message of a mitigation action. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes which mitigation actions should be executed. </p>\"\
    },\
    \"DetectMitigationActionExecutionErrorCode\":{\"type\":\"string\"},\
    \"DetectMitigationActionExecutionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DetectMitigationActionExecution\"}\
    },\
    \"DetectMitigationActionExecutionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"SUCCESSFUL\",\
        \"FAILED\",\
        \"SKIPPED\"\
      ]\
    },\
    \"DetectMitigationActionsTaskStatistics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionsExecuted\":{\
          \"shape\":\"GenericLongValue\",\
          \"documentation\":\"<p> The actions that were performed. </p>\"\
        },\
        \"actionsSkipped\":{\
          \"shape\":\"GenericLongValue\",\
          \"documentation\":\"<p> The actions that were skipped. </p>\"\
        },\
        \"actionsFailed\":{\
          \"shape\":\"GenericLongValue\",\
          \"documentation\":\"<p> The actions that failed. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The statistics of a mitigation action task. </p>\"\
    },\
    \"DetectMitigationActionsTaskStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"SUCCESSFUL\",\
        \"FAILED\",\
        \"CANCELED\"\
      ]\
    },\
    \"DetectMitigationActionsTaskSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p> The unique identifier of the task. </p>\"\
        },\
        \"taskStatus\":{\
          \"shape\":\"DetectMitigationActionsTaskStatus\",\
          \"documentation\":\"<p> The status of the task. </p>\"\
        },\
        \"taskStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The date the task started. </p>\"\
        },\
        \"taskEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The date the task ended. </p>\"\
        },\
        \"target\":{\
          \"shape\":\"DetectMitigationActionsTaskTarget\",\
          \"documentation\":\"<p> Specifies the ML Detect findings to which the mitigation actions are applied. </p>\"\
        },\
        \"violationEventOccurrenceRange\":{\
          \"shape\":\"ViolationEventOccurrenceRange\",\
          \"documentation\":\"<p> Specifies the time period of which violation events occurred between. </p>\"\
        },\
        \"onlyActiveViolationsIncluded\":{\
          \"shape\":\"PrimitiveBoolean\",\
          \"documentation\":\"<p> Includes only active violations. </p>\"\
        },\
        \"suppressedAlertsIncluded\":{\
          \"shape\":\"PrimitiveBoolean\",\
          \"documentation\":\"<p> Includes suppressed alerts. </p>\"\
        },\
        \"actionsDefinition\":{\
          \"shape\":\"MitigationActionList\",\
          \"documentation\":\"<p> The definition of the actions. </p>\"\
        },\
        \"taskStatistics\":{\
          \"shape\":\"DetectMitigationActionsTaskStatistics\",\
          \"documentation\":\"<p> The statistics of a mitigation action task. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The summary of the mitigation action tasks. </p>\"\
    },\
    \"DetectMitigationActionsTaskSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DetectMitigationActionsTaskSummary\"}\
    },\
    \"DetectMitigationActionsTaskTarget\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"violationIds\":{\
          \"shape\":\"TargetViolationIdsForDetectMitigationActions\",\
          \"documentation\":\"<p> The unique identifiers of the violations. </p>\"\
        },\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p> The name of the security profile. </p>\"\
        },\
        \"behaviorName\":{\
          \"shape\":\"BehaviorName\",\
          \"documentation\":\"<p> The name of the behavior. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The target of a mitigation action task. </p>\"\
    },\
    \"DetectMitigationActionsToExecuteList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MitigationActionName\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"DeviceCertificateUpdateAction\":{\
      \"type\":\"string\",\
      \"enum\":[\"DEACTIVATE\"]\
    },\
    \"DeviceDefenderIndexingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"VIOLATIONS\"\
      ]\
    },\
    \"DeviceDefenderThingName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"DimensionArn\":{\"type\":\"string\"},\
    \"DimensionName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"DimensionNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DimensionName\"}\
    },\
    \"DimensionStringValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"DimensionStringValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DimensionStringValue\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"DimensionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"TOPIC_FILTER\"]\
    },\
    \"DimensionValueOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN\",\
        \"NOT_IN\"\
      ]\
    },\
    \"DisableAllLogs\":{\"type\":\"boolean\"},\
    \"DisableTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ruleName\"],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule to disable.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DisableTopicRuleRequest operation.</p>\"\
    },\
    \"DisconnectReason\":{\"type\":\"string\"},\
    \"DocumentParameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"key\":{\
          \"shape\":\"ParameterKey\",\
          \"documentation\":\"<p>Key of the map field containing the patterns that need to be replaced in a managed template job document schema.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>Description of the map field containing the patterns that need to be replaced in a managed template job document schema.</p>\"\
        },\
        \"regex\":{\
          \"shape\":\"Regex\",\
          \"documentation\":\"<p>A regular expression of the patterns that need to be replaced in a managed template job document schema.</p>\"\
        },\
        \"example\":{\
          \"shape\":\"Example\",\
          \"documentation\":\"<p>An example illustrating a pattern that need to be replaced in a managed template job document schema.</p>\"\
        },\
        \"optional\":{\
          \"shape\":\"Optional\",\
          \"documentation\":\"<p>Specifies whether a pattern that needs to be replaced in a managed template job document schema is optional or required.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A map of key-value pairs containing the patterns that need to be replaced in a managed template job document schema. You can use the description of each key as a guidance to specify the inputs during runtime when creating a job.</p> <note> <p> <code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p> </note>\"\
    },\
    \"DocumentParameters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentParameter\"}\
    },\
    \"DomainConfigurationArn\":{\"type\":\"string\"},\
    \"DomainConfigurationName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w.-]+\"\
    },\
    \"DomainConfigurationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"DomainConfigurationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"ReservedDomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration. This value must be unique to a region.</p>\"\
        },\
        \"domainConfigurationArn\":{\
          \"shape\":\"DomainConfigurationArn\",\
          \"documentation\":\"<p>The ARN of the domain configuration.</p>\"\
        },\
        \"serviceType\":{\
          \"shape\":\"ServiceType\",\
          \"documentation\":\"<p>The type of service delivered by the endpoint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The summary of a domain configuration. A domain configuration specifies custom IoT-specific information about a domain. A domain configuration can be associated with an Amazon Web Services-managed domain (for example, dbc123defghijk.iot.us-west-2.amazonaws.com), a customer managed domain, or a default endpoint.</p> <ul> <li> <p>Data</p> </li> <li> <p>Jobs</p> </li> <li> <p>CredentialProvider</p> </li> </ul>\"\
    },\
    \"DomainConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainConfigurationSummary\"}\
    },\
    \"DomainName\":{\
      \"type\":\"string\",\
      \"max\":253,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"DomainType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENDPOINT\",\
        \"AWS_MANAGED\",\
        \"CUSTOMER_MANAGED\"\
      ]\
    },\
    \"DurationInMinutes\":{\
      \"type\":\"integer\",\
      \"max\":1430,\
      \"min\":30\
    },\
    \"DurationSeconds\":{\"type\":\"integer\"},\
    \"DynamicGroupStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"BUILDING\",\
        \"REBUILDING\"\
      ]\
    },\
    \"DynamoDBAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"tableName\",\
        \"roleArn\",\
        \"hashKeyField\",\
        \"hashKeyValue\"\
      ],\
      \"members\":{\
        \"tableName\":{\
          \"shape\":\"TableName\",\
          \"documentation\":\"<p>The name of the DynamoDB table.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access to the DynamoDB table.</p>\"\
        },\
        \"operation\":{\
          \"shape\":\"DynamoOperation\",\
          \"documentation\":\"<p>The type of operation to be performed. This follows the substitution template, so it can be <code>${operation}</code>, but the substitution must result in one of the following: <code>INSERT</code>, <code>UPDATE</code>, or <code>DELETE</code>.</p>\"\
        },\
        \"hashKeyField\":{\
          \"shape\":\"HashKeyField\",\
          \"documentation\":\"<p>The hash key name.</p>\"\
        },\
        \"hashKeyValue\":{\
          \"shape\":\"HashKeyValue\",\
          \"documentation\":\"<p>The hash key value.</p>\"\
        },\
        \"hashKeyType\":{\
          \"shape\":\"DynamoKeyType\",\
          \"documentation\":\"<p>The hash key type. Valid values are \\\"STRING\\\" or \\\"NUMBER\\\"</p>\"\
        },\
        \"rangeKeyField\":{\
          \"shape\":\"RangeKeyField\",\
          \"documentation\":\"<p>The range key name.</p>\"\
        },\
        \"rangeKeyValue\":{\
          \"shape\":\"RangeKeyValue\",\
          \"documentation\":\"<p>The range key value.</p>\"\
        },\
        \"rangeKeyType\":{\
          \"shape\":\"DynamoKeyType\",\
          \"documentation\":\"<p>The range key type. Valid values are \\\"STRING\\\" or \\\"NUMBER\\\"</p>\"\
        },\
        \"payloadField\":{\
          \"shape\":\"PayloadField\",\
          \"documentation\":\"<p>The action payload. This name can be customized.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write to a DynamoDB table.</p> <p>The <code>tableName</code>, <code>hashKeyField</code>, and <code>rangeKeyField</code> values must match the values used when you created the table.</p> <p>The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a substitution template syntax. These templates provide data at runtime. The syntax is as follows: ${<i>sql-expression</i>}.</p> <p>You can specify any valid expression in a WHERE or SELECT clause, including JSON properties, comparisons, calculations, and functions. For example, the following field uses the third level of the topic:</p> <p> <code>\\\"hashKeyValue\\\": \\\"${topic(3)}\\\"</code> </p> <p>The following field uses the timestamp:</p> <p> <code>\\\"rangeKeyValue\\\": \\\"${timestamp()}\\\"</code> </p>\"\
    },\
    \"DynamoDBv2Action\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"putItem\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access to the DynamoDB table.</p>\"\
        },\
        \"putItem\":{\
          \"shape\":\"PutItemInput\",\
          \"documentation\":\"<p>Specifies the DynamoDB table to which the message data will be written. For example:</p> <p> <code>{ \\\"dynamoDBv2\\\": { \\\"roleArn\\\": \\\"aws:iam:12341251:my-role\\\" \\\"putItem\\\": { \\\"tableName\\\": \\\"my-table\\\" } } }</code> </p> <p>Each attribute in the message payload will be written to a separate column in the DynamoDB database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write to a DynamoDB table.</p> <p>This DynamoDB action writes each attribute in the message payload into it's own column in the DynamoDB table.</p>\"\
    },\
    \"DynamoKeyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STRING\",\
        \"NUMBER\"\
      ]\
    },\
    \"DynamoOperation\":{\"type\":\"string\"},\
    \"EffectivePolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EffectivePolicy\"}\
    },\
    \"EffectivePolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The IAM policy document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The policy that has the effect on the authorization results.</p>\"\
    },\
    \"ElasticsearchAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"endpoint\",\
        \"index\",\
        \"type\",\
        \"id\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role ARN that has access to OpenSearch.</p>\"\
        },\
        \"endpoint\":{\
          \"shape\":\"ElasticsearchEndpoint\",\
          \"documentation\":\"<p>The endpoint of your OpenSearch domain.</p>\"\
        },\
        \"index\":{\
          \"shape\":\"ElasticsearchIndex\",\
          \"documentation\":\"<p>The index where you want to store your data.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"ElasticsearchType\",\
          \"documentation\":\"<p>The type of document you are storing.</p>\"\
        },\
        \"id\":{\
          \"shape\":\"ElasticsearchId\",\
          \"documentation\":\"<p>The unique identifier for the document you are storing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that writes data to an Amazon OpenSearch Service domain.</p> <note> <p>The <code>Elasticsearch</code> action can only be used by existing rule actions. To create a new rule action or to update an existing rule action, use the <code>OpenSearch</code> rule action instead. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_OpenSearchAction.html\\\">OpenSearchAction</a>.</p> </note>\"\
    },\
    \"ElasticsearchEndpoint\":{\
      \"type\":\"string\",\
      \"pattern\":\"https?://.*\"\
    },\
    \"ElasticsearchId\":{\"type\":\"string\"},\
    \"ElasticsearchIndex\":{\"type\":\"string\"},\
    \"ElasticsearchType\":{\"type\":\"string\"},\
    \"EnableCachingForHttp\":{\"type\":\"boolean\"},\
    \"EnableIoTLoggingParams\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArnForLogging\",\
        \"logLevel\"\
      ],\
      \"members\":{\
        \"roleArnForLogging\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role used for logging.</p>\"\
        },\
        \"logLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>Specifies the type of information to be logged.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters used when defining a mitigation action that enable Amazon Web Services IoT Core logging.</p>\"\
    },\
    \"EnableTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ruleName\"],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the topic rule to enable.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the EnableTopicRuleRequest operation.</p>\"\
    },\
    \"Enabled\":{\"type\":\"boolean\"},\
    \"EndpointAddress\":{\"type\":\"string\"},\
    \"EndpointType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"Environment\":{\
      \"type\":\"string\",\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"Environments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Environment\"}\
    },\
    \"ErrorCode\":{\"type\":\"string\"},\
    \"ErrorInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\
          \"shape\":\"Code\",\
          \"documentation\":\"<p>The error code.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"OTAUpdateErrorMessage\",\
          \"documentation\":\"<p>The error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Error information.</p>\"\
    },\
    \"ErrorMessage\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"EvaluationStatistic\":{\
      \"type\":\"string\",\
      \"pattern\":\"(p0|p0\\\\.1|p0\\\\.01|p1|p10|p50|p90|p99|p99\\\\.9|p99\\\\.99|p100)\"\
    },\
    \"EventConfigurations\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EventType\"},\
      \"value\":{\"shape\":\"Configuration\"}\
    },\
    \"EventType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"THING\",\
        \"THING_GROUP\",\
        \"THING_TYPE\",\
        \"THING_GROUP_MEMBERSHIP\",\
        \"THING_GROUP_HIERARCHY\",\
        \"THING_TYPE_ASSOCIATION\",\
        \"JOB\",\
        \"JOB_EXECUTION\",\
        \"POLICY\",\
        \"CERTIFICATE\",\
        \"CA_CERTIFICATE\"\
      ]\
    },\
    \"Example\":{\
      \"type\":\"string\",\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"ExecutionNamePrefix\":{\"type\":\"string\"},\
    \"ExecutionNumber\":{\"type\":\"long\"},\
    \"ExpectedVersion\":{\"type\":\"long\"},\
    \"ExpiresInSec\":{\
      \"type\":\"long\",\
      \"max\":3600,\
      \"min\":60\
    },\
    \"ExpiresInSeconds\":{\"type\":\"long\"},\
    \"ExplicitDeny\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>The policies that denied the authorization.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information that explicitly denies authorization.</p>\"\
    },\
    \"ExponentialRolloutRate\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"baseRatePerMinute\",\
        \"incrementFactor\",\
        \"rateIncreaseCriteria\"\
      ],\
      \"members\":{\
        \"baseRatePerMinute\":{\
          \"shape\":\"RolloutRatePerMinute\",\
          \"documentation\":\"<p>The minimum number of things that will be notified of a pending job, per minute at the start of job rollout. This parameter allows you to define the initial rate of rollout.</p>\"\
        },\
        \"incrementFactor\":{\
          \"shape\":\"IncrementFactor\",\
          \"documentation\":\"<p>The exponential factor to increase the rate of rollout for a job.</p> <p>Amazon Web Services IoT Core supports up to one digit after the decimal (for example, 1.5, but not 1.55).</p>\"\
        },\
        \"rateIncreaseCriteria\":{\
          \"shape\":\"RateIncreaseCriteria\",\
          \"documentation\":\"<p>The criteria to initiate the increase in rate of rollout for a job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Allows you to create an exponential rate of rollout for a job.</p>\"\
    },\
    \"FailedChecksCount\":{\"type\":\"integer\"},\
    \"FailedFindingsCount\":{\"type\":\"long\"},\
    \"FailedThings\":{\"type\":\"integer\"},\
    \"Field\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"FieldName\",\
          \"documentation\":\"<p>The name of the field.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"FieldType\",\
          \"documentation\":\"<p>The data type of the field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the name and data type at a field.</p>\"\
    },\
    \"FieldName\":{\"type\":\"string\"},\
    \"FieldType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Number\",\
        \"String\",\
        \"Boolean\"\
      ]\
    },\
    \"Fields\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Field\"}\
    },\
    \"FileId\":{\
      \"type\":\"integer\",\
      \"max\":255,\
      \"min\":0\
    },\
    \"FileLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"stream\":{\
          \"shape\":\"Stream\",\
          \"documentation\":\"<p>The stream that contains the OTA update.</p>\"\
        },\
        \"s3Location\":{\
          \"shape\":\"S3Location\",\
          \"documentation\":\"<p>The location of the updated firmware in S3.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The location of the OTA update.</p>\"\
    },\
    \"FileName\":{\"type\":\"string\"},\
    \"FileType\":{\
      \"type\":\"integer\",\
      \"max\":255,\
      \"min\":0\
    },\
    \"FindingId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"FindingIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FindingId\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"FirehoseAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"deliveryStreamName\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that grants access to the Amazon Kinesis Firehose stream.</p>\"\
        },\
        \"deliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The delivery stream name.</p>\"\
        },\
        \"separator\":{\
          \"shape\":\"FirehoseSeparator\",\
          \"documentation\":\"<p>A character separator that will be used to separate records written to the Firehose stream. Valid values are: '\\\\n' (newline), '\\\\t' (tab), '\\\\r\\\\n' (Windows newline), ',' (comma).</p>\"\
        },\
        \"batchMode\":{\
          \"shape\":\"BatchMode\",\
          \"documentation\":\"<p>Whether to deliver the Kinesis Data Firehose stream as a batch by using <a href=\\\"https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html\\\"> <code>PutRecordBatch</code> </a>. The default value is <code>false</code>.</p> <p>When <code>batchMode</code> is <code>true</code> and the rule's SQL statement evaluates to an Array, each Array element forms one record in the <a href=\\\"https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html\\\"> <code>PutRecordBatch</code> </a> request. The resulting array can't have more than 500 records.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that writes data to an Amazon Kinesis Firehose stream.</p>\"\
    },\
    \"FirehoseSeparator\":{\
      \"type\":\"string\",\
      \"pattern\":\"([\\\\n\\\\t])|(\\\\r\\\\n)|(,)\"\
    },\
    \"Flag\":{\"type\":\"boolean\"},\
    \"FleetMetricArn\":{\"type\":\"string\"},\
    \"FleetMetricDescription\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"FleetMetricName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_\\\\-\\\\.]+\"\
    },\
    \"FleetMetricNameAndArn\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"FleetMetricName\",\
          \"documentation\":\"<p>The fleet metric name.</p>\"\
        },\
        \"metricArn\":{\
          \"shape\":\"FleetMetricArn\",\
          \"documentation\":\"<p>The fleet metric ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The name and ARN of a fleet metric.</p>\"\
    },\
    \"FleetMetricNameAndArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FleetMetricNameAndArn\"}\
    },\
    \"FleetMetricPeriod\":{\
      \"type\":\"integer\",\
      \"max\":86400,\
      \"min\":60\
    },\
    \"FleetMetricUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Seconds\",\
        \"Microseconds\",\
        \"Milliseconds\",\
        \"Bytes\",\
        \"Kilobytes\",\
        \"Megabytes\",\
        \"Gigabytes\",\
        \"Terabytes\",\
        \"Bits\",\
        \"Kilobits\",\
        \"Megabits\",\
        \"Gigabits\",\
        \"Terabits\",\
        \"Percent\",\
        \"Count\",\
        \"Bytes/Second\",\
        \"Kilobytes/Second\",\
        \"Megabytes/Second\",\
        \"Gigabytes/Second\",\
        \"Terabytes/Second\",\
        \"Bits/Second\",\
        \"Kilobits/Second\",\
        \"Megabits/Second\",\
        \"Gigabits/Second\",\
        \"Terabits/Second\",\
        \"Count/Second\",\
        \"None\"\
      ]\
    },\
    \"ForceDelete\":{\"type\":\"boolean\"},\
    \"ForceDeleteAWSJob\":{\"type\":\"boolean\"},\
    \"ForceFlag\":{\"type\":\"boolean\"},\
    \"Forced\":{\"type\":\"boolean\"},\
    \"FunctionArn\":{\"type\":\"string\"},\
    \"GenerationId\":{\"type\":\"string\"},\
    \"GenericLongValue\":{\"type\":\"long\"},\
    \"GetBehaviorModelTrainingSummariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p> The name of the security profile. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"maxResults\":{\
          \"shape\":\"TinyMaxResults\",\
          \"documentation\":\"<p> The maximum number of results to return at one time. The default is 10. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> The token for the next set of results. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"GetBehaviorModelTrainingSummariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"summaries\":{\
          \"shape\":\"BehaviorModelTrainingSummaries\",\
          \"documentation\":\"<p> A list of all ML Detect behaviors and their model status for a given Security Profile. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>\"\
        }\
      }\
    },\
    \"GetBucketsAggregationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"queryString\",\
        \"aggregationField\",\
        \"bucketsAggregationType\"\
      ],\
      \"members\":{\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The name of the index to search.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The search query string.</p>\"\
        },\
        \"aggregationField\":{\
          \"shape\":\"AggregationField\",\
          \"documentation\":\"<p>The aggregation field.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The version of the query.</p>\"\
        },\
        \"bucketsAggregationType\":{\
          \"shape\":\"BucketsAggregationType\",\
          \"documentation\":\"<p>The basic control of the response shape and the bucket aggregation type to perform. </p>\"\
        }\
      }\
    },\
    \"GetBucketsAggregationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"totalCount\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The total number of things that fit the query string criteria.</p>\"\
        },\
        \"buckets\":{\
          \"shape\":\"Buckets\",\
          \"documentation\":\"<p>The main part of the response with a list of buckets. Each bucket contains a <code>keyValue</code> and a <code>count</code>.</p> <p> <code>keyValue</code>: The aggregation field value counted for the particular bucket.</p> <p> <code>count</code>: The number of documents that have that value.</p>\"\
        }\
      }\
    },\
    \"GetCardinalityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryString\"],\
      \"members\":{\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The name of the index to search.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The search query string.</p>\"\
        },\
        \"aggregationField\":{\
          \"shape\":\"AggregationField\",\
          \"documentation\":\"<p>The field to aggregate.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The query version.</p>\"\
        }\
      }\
    },\
    \"GetCardinalityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"cardinality\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The approximate count of unique values that match the query.</p>\"\
        }\
      }\
    },\
    \"GetEffectivePoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>\"\
        },\
        \"cognitoIdentityPoolId\":{\
          \"shape\":\"CognitoIdentityPoolId\",\
          \"documentation\":\"<p>The Cognito identity pool ID.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The thing name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingName\"\
        }\
      }\
    },\
    \"GetEffectivePoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"effectivePolicies\":{\
          \"shape\":\"EffectivePolicies\",\
          \"documentation\":\"<p>The effective policies.</p>\"\
        }\
      }\
    },\
    \"GetIndexingConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetIndexingConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingIndexingConfiguration\":{\
          \"shape\":\"ThingIndexingConfiguration\",\
          \"documentation\":\"<p>Thing indexing configuration.</p>\"\
        },\
        \"thingGroupIndexingConfiguration\":{\
          \"shape\":\"ThingGroupIndexingConfiguration\",\
          \"documentation\":\"<p>The index configuration.</p>\"\
        }\
      }\
    },\
    \"GetJobDocumentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobId\"],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        }\
      }\
    },\
    \"GetJobDocumentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"document\":{\
          \"shape\":\"JobDocument\",\
          \"documentation\":\"<p>The job document content.</p>\"\
        }\
      }\
    },\
    \"GetLoggingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input for the GetLoggingOptions operation.</p>\"\
    },\
    \"GetLoggingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"logLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The logging level.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetLoggingOptions operation.</p>\"\
    },\
    \"GetOTAUpdateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"otaUpdateId\"],\
      \"members\":{\
        \"otaUpdateId\":{\
          \"shape\":\"OTAUpdateId\",\
          \"documentation\":\"<p>The OTA update ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"otaUpdateId\"\
        }\
      }\
    },\
    \"GetOTAUpdateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"otaUpdateInfo\":{\
          \"shape\":\"OTAUpdateInfo\",\
          \"documentation\":\"<p>The OTA update info.</p>\"\
        }\
      }\
    },\
    \"GetPercentilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryString\"],\
      \"members\":{\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The name of the index to search.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The search query string.</p>\"\
        },\
        \"aggregationField\":{\
          \"shape\":\"AggregationField\",\
          \"documentation\":\"<p>The field to aggregate.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The query version.</p>\"\
        },\
        \"percents\":{\
          \"shape\":\"PercentList\",\
          \"documentation\":\"<p>The percentile groups returned.</p>\"\
        }\
      }\
    },\
    \"GetPercentilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"percentiles\":{\
          \"shape\":\"Percentiles\",\
          \"documentation\":\"<p>The percentile values of the aggregated fields.</p>\"\
        }\
      }\
    },\
    \"GetPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetPolicy operation.</p>\"\
    },\
    \"GetPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"defaultVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The default policy version ID.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the policy was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the policy was last modified.</p>\"\
        },\
        \"generationId\":{\
          \"shape\":\"GenerationId\",\
          \"documentation\":\"<p>The generation ID of the policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetPolicy operation.</p>\"\
    },\
    \"GetPolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyVersionId\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyVersionId\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetPolicyVersion operation.</p>\"\
    },\
    \"GetPolicyVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the policy was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the policy was last modified.</p>\"\
        },\
        \"generationId\":{\
          \"shape\":\"GenerationId\",\
          \"documentation\":\"<p>The generation ID of the policy version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetPolicyVersion operation.</p>\"\
    },\
    \"GetRegistrationCodeRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input to the GetRegistrationCode operation.</p>\"\
    },\
    \"GetRegistrationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"registrationCode\":{\
          \"shape\":\"RegistrationCode\",\
          \"documentation\":\"<p>The CA certificate registration code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetRegistrationCode operation.</p>\"\
    },\
    \"GetStatisticsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryString\"],\
      \"members\":{\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The name of the index to search. The default value is <code>AWS_Things</code>.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The query used to search. You can specify \\\"*\\\" for the query string to get the count of all indexed things in your Amazon Web Services account.</p>\"\
        },\
        \"aggregationField\":{\
          \"shape\":\"AggregationField\",\
          \"documentation\":\"<p>The aggregation field name.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The version of the query used to search.</p>\"\
        }\
      }\
    },\
    \"GetStatisticsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"statistics\":{\
          \"shape\":\"Statistics\",\
          \"documentation\":\"<p>The statistics returned by the Fleet Indexing service based on the query and aggregation field.</p>\"\
        }\
      }\
    },\
    \"GetTopicRuleDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"arn\"],\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the topic rule destination.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"arn\"\
        }\
      }\
    },\
    \"GetTopicRuleDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"topicRuleDestination\":{\
          \"shape\":\"TopicRuleDestination\",\
          \"documentation\":\"<p>The topic rule destination.</p>\"\
        }\
      }\
    },\
    \"GetTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ruleName\"],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetTopicRule operation.</p>\"\
    },\
    \"GetTopicRuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The rule ARN.</p>\"\
        },\
        \"rule\":{\
          \"shape\":\"TopicRule\",\
          \"documentation\":\"<p>The rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetTopicRule operation.</p>\"\
    },\
    \"GetV2LoggingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetV2LoggingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role ARN IoT uses to write to your CloudWatch logs.</p>\"\
        },\
        \"defaultLogLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The default log level.</p>\"\
        },\
        \"disableAllLogs\":{\
          \"shape\":\"DisableAllLogs\",\
          \"documentation\":\"<p>Disables all logs.</p>\"\
        }\
      }\
    },\
    \"GroupNameAndArn\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"groupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The group name.</p>\"\
        },\
        \"groupArn\":{\
          \"shape\":\"ThingGroupArn\",\
          \"documentation\":\"<p>The group ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The name and ARN of a group.</p>\"\
    },\
    \"HashAlgorithm\":{\"type\":\"string\"},\
    \"HashKeyField\":{\"type\":\"string\"},\
    \"HashKeyValue\":{\"type\":\"string\"},\
    \"HeaderKey\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"HeaderList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HttpActionHeader\"},\
      \"max\":100,\
      \"min\":0\
    },\
    \"HeaderValue\":{\"type\":\"string\"},\
    \"HttpAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"url\"],\
      \"members\":{\
        \"url\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The endpoint URL. If substitution templates are used in the URL, you must also specify a <code>confirmationUrl</code>. If this is a new destination, a new <code>TopicRuleDestination</code> is created if possible.</p>\"\
        },\
        \"confirmationUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The URL to which IoT sends a confirmation message. The value of the confirmation URL must be a prefix of the endpoint URL. If you do not specify a confirmation URL IoT uses the endpoint URL as the confirmation URL. If you use substitution templates in the confirmationUrl, you must create and enable topic rule destinations that match each possible value of the substitution template before traffic is allowed to your endpoint URL.</p>\"\
        },\
        \"headers\":{\
          \"shape\":\"HeaderList\",\
          \"documentation\":\"<p>The HTTP headers to send with the message data.</p>\"\
        },\
        \"auth\":{\
          \"shape\":\"HttpAuthorization\",\
          \"documentation\":\"<p>The authentication method to use when sending data to an HTTPS endpoint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Send data to an HTTPS endpoint.</p>\"\
    },\
    \"HttpActionHeader\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"key\",\
        \"value\"\
      ],\
      \"members\":{\
        \"key\":{\
          \"shape\":\"HeaderKey\",\
          \"documentation\":\"<p>The HTTP header key.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"HeaderValue\",\
          \"documentation\":\"<p>The HTTP header value. Substitution templates are supported.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The HTTP action header.</p>\"\
    },\
    \"HttpAuthorization\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"sigv4\":{\
          \"shape\":\"SigV4Authorization\",\
          \"documentation\":\"<p>Use Sig V4 authorization. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 Signing Process</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The authorization method used to send messages.</p>\"\
    },\
    \"HttpContext\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"headers\":{\
          \"shape\":\"HttpHeaders\",\
          \"documentation\":\"<p>The header keys and values in an HTTP authorization request.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"HttpQueryString\",\
          \"documentation\":\"<p>The query string keys and values in an HTTP authorization request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the HTTP context to use for the test authorizer request.</p>\"\
    },\
    \"HttpHeaderName\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"HttpHeaderValue\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"HttpHeaders\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"HttpHeaderName\"},\
      \"value\":{\"shape\":\"HttpHeaderValue\"}\
    },\
    \"HttpQueryString\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"HttpUrlDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"confirmationUrl\"],\
      \"members\":{\
        \"confirmationUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The URL IoT uses to confirm ownership of or access to the topic rule destination URL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>HTTP URL destination configuration used by the topic rule's HTTP action.</p>\"\
    },\
    \"HttpUrlDestinationProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"confirmationUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The URL used to confirm the HTTP topic rule destination URL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>HTTP URL destination properties.</p>\"\
    },\
    \"HttpUrlDestinationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"confirmationUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The URL used to confirm ownership of or access to the HTTP topic rule destination URL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an HTTP URL destination.</p>\"\
    },\
    \"ImplicitDeny\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>Policies that don't contain a matching allow or deny statement for the specified action on the specified resource. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information that implicitly denies authorization. When policy doesn't explicitly deny or allow an action on a resource it is considered an implicit deny.</p>\"\
    },\
    \"InProgressChecksCount\":{\"type\":\"integer\"},\
    \"InProgressThings\":{\"type\":\"integer\"},\
    \"InProgressTimeoutInMinutes\":{\"type\":\"long\"},\
    \"IncrementFactor\":{\
      \"type\":\"double\",\
      \"max\":5,\
      \"min\":1.1\
    },\
    \"IndexName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"IndexNamesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IndexName\"}\
    },\
    \"IndexNotReadyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The index is not ready.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"IndexSchema\":{\"type\":\"string\"},\
    \"IndexStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"BUILDING\",\
        \"REBUILDING\"\
      ]\
    },\
    \"IndexingFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"namedShadowNames\":{\
          \"shape\":\"NamedShadowNamesFilter\",\
          \"documentation\":\"<p>The shadow names that you select to index. The default maximum number of shadow names for indexing is 10. To increase the limit, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/iot_device_management.html#fleet-indexing-limits\\\">Amazon Web Services IoT Device Management Quotas</a> in the <i>Amazon Web Services General Reference</i>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides additional filters for specific data sources. Named shadow is the only data source that currently supports and requires a filter. To add named shadows to your fleet indexing configuration, set <code>namedShadowIndexingMode</code> to be <code>ON</code> and specify your shadow names in <code>filter</code>.</p>\"\
    },\
    \"InlineDocument\":{\"type\":\"string\"},\
    \"InputName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"InternalException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An unexpected error has occurred.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An unexpected error has occurred.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>Internal error from the service that indicates an unexpected error or that the service is unavailable.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidAggregationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The aggregation is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidQueryException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The query is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidResponseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidStateTransitionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An attempt was made to change to an invalid state, for example by deleting a job or a job execution which is \\\"IN_PROGRESS\\\" without setting the <code>force</code> parameter.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"IotAnalyticsAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"channelArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>(deprecated) The ARN of the IoT Analytics channel to which message data will be sent.</p>\"\
        },\
        \"channelName\":{\
          \"shape\":\"ChannelName\",\
          \"documentation\":\"<p>The name of the IoT Analytics channel to which message data will be sent.</p>\"\
        },\
        \"batchMode\":{\
          \"shape\":\"BatchMode\",\
          \"documentation\":\"<p>Whether to process the action as a batch. The default value is <code>false</code>.</p> <p>When <code>batchMode</code> is <code>true</code> and the rule SQL statement evaluates to an Array, each Array element is delivered as a separate message when passed by <a href=\\\"https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_BatchPutMessage.html\\\"> <code>BatchPutMessage</code> </a> to the IoT Analytics channel. The resulting array can't have more than 100 messages.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the role which has a policy that grants IoT Analytics permission to send message data via IoT Analytics (iotanalytics:BatchPutMessage).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sends message data to an IoT Analytics channel.</p>\"\
    },\
    \"IotEventsAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"inputName\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"inputName\":{\
          \"shape\":\"InputName\",\
          \"documentation\":\"<p>The name of the IoT Events input.</p>\"\
        },\
        \"messageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The ID of the message. The default <code>messageId</code> is a new UUID value.</p> <p>When <code>batchMode</code> is <code>true</code>, you can't specify a <code>messageId</code>--a new UUID value will be assigned.</p> <p>Assign a value to this property to ensure that only one input (message) with a given <code>messageId</code> will be processed by an IoT Events detector.</p>\"\
        },\
        \"batchMode\":{\
          \"shape\":\"BatchMode\",\
          \"documentation\":\"<p>Whether to process the event actions as a batch. The default value is <code>false</code>.</p> <p>When <code>batchMode</code> is <code>true</code>, you can't specify a <code>messageId</code>. </p> <p>When <code>batchMode</code> is <code>true</code> and the rule SQL statement evaluates to an Array, each Array element is treated as a separate message when it's sent to IoT Events by calling <a href=\\\"https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchPutMessage.html\\\"> <code>BatchPutMessage</code> </a>. The resulting array can't have more than 10 messages.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the role that grants IoT permission to send an input to an IoT Events detector. (\\\"Action\\\":\\\"iotevents:BatchPutMessage\\\").</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sends an input to an IoT Events detector.</p>\"\
    },\
    \"IotSiteWiseAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"putAssetPropertyValueEntries\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"putAssetPropertyValueEntries\":{\
          \"shape\":\"PutAssetPropertyValueEntryList\",\
          \"documentation\":\"<p>A list of asset property value entries.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the role that grants IoT permission to send an asset property value to IoT SiteWise. (<code>\\\"Action\\\": \\\"iotsitewise:BatchPutAssetPropertyValue\\\"</code>). The trust policy can restrict access to specific asset hierarchy paths.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to send data from an MQTT message that triggered the rule to IoT SiteWise asset properties.</p>\"\
    },\
    \"IsAuthenticated\":{\"type\":\"boolean\"},\
    \"IsDefaultVersion\":{\"type\":\"boolean\"},\
    \"IsDisabled\":{\"type\":\"boolean\"},\
    \"IsSuppressed\":{\"type\":\"boolean\"},\
    \"IssuerCertificateIdentifier\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"issuerCertificateSubject\":{\
          \"shape\":\"IssuerCertificateSubject\",\
          \"documentation\":\"<p>The subject of the issuer certificate.</p>\"\
        },\
        \"issuerId\":{\
          \"shape\":\"IssuerId\",\
          \"documentation\":\"<p>The issuer ID.</p>\"\
        },\
        \"issuerCertificateSerialNumber\":{\
          \"shape\":\"IssuerCertificateSerialNumber\",\
          \"documentation\":\"<p>The issuer certificate serial number.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The certificate issuer indentifier.</p>\"\
    },\
    \"IssuerCertificateSerialNumber\":{\
      \"type\":\"string\",\
      \"max\":20,\
      \"pattern\":\"[a-fA-F0-9:]+\"\
    },\
    \"IssuerCertificateSubject\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"IssuerId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"(0x)?[a-fA-F0-9]+\"\
    },\
    \"Job\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobArn\":{\
          \"shape\":\"JobArn\",\
          \"documentation\":\"<p>An ARN identifying the job with format \\\"arn:aws:iot:region:account:job/jobId\\\".</p>\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\"\
        },\
        \"targetSelection\":{\
          \"shape\":\"TargetSelection\",\
          \"documentation\":\"<p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a device when the thing representing the device is added to a target group, even after the job was completed by all things originally in the group. </p> <note> <p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p> </note>\"\
        },\
        \"status\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job, one of <code>IN_PROGRESS</code>, <code>CANCELED</code>, <code>DELETION_IN_PROGRESS</code> or <code>COMPLETED</code>. </p>\"\
        },\
        \"forceCanceled\":{\
          \"shape\":\"Forced\",\
          \"documentation\":\"<p>Will be <code>true</code> if the job was canceled with the optional <code>force</code> parameter set to <code>true</code>.</p>\"\
        },\
        \"reasonCode\":{\
          \"shape\":\"ReasonCode\",\
          \"documentation\":\"<p>If the job was updated, provides the reason code for the update.</p>\"\
        },\
        \"comment\":{\
          \"shape\":\"Comment\",\
          \"documentation\":\"<p>If the job was updated, describes the reason for the update.</p>\"\
        },\
        \"targets\":{\
          \"shape\":\"JobTargets\",\
          \"documentation\":\"<p>A list of IoT things and thing groups to which the job should be sent.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A short text description of the job.</p>\"\
        },\
        \"presignedUrlConfig\":{\
          \"shape\":\"PresignedUrlConfig\",\
          \"documentation\":\"<p>Configuration for pre-signed S3 URLs.</p>\"\
        },\
        \"jobExecutionsRolloutConfig\":{\
          \"shape\":\"JobExecutionsRolloutConfig\",\
          \"documentation\":\"<p>Allows you to create a staged rollout of a job.</p>\"\
        },\
        \"abortConfig\":{\
          \"shape\":\"AbortConfig\",\
          \"documentation\":\"<p>Configuration for criteria to abort the job.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job was created.</p>\"\
        },\
        \"lastUpdatedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job was last updated.</p>\"\
        },\
        \"completedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job was completed.</p>\"\
        },\
        \"jobProcessDetails\":{\
          \"shape\":\"JobProcessDetails\",\
          \"documentation\":\"<p>Details about the job process.</p>\"\
        },\
        \"timeoutConfig\":{\
          \"shape\":\"TimeoutConfig\",\
          \"documentation\":\"<p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\"\
        },\
        \"jobTemplateArn\":{\
          \"shape\":\"JobTemplateArn\",\
          \"documentation\":\"<p>The ARN of the job template used to create the job.</p>\"\
        },\
        \"jobExecutionsRetryConfig\":{\
          \"shape\":\"JobExecutionsRetryConfig\",\
          \"documentation\":\"<p>The configuration for the criteria to retry the job.</p>\"\
        },\
        \"documentParameters\":{\
          \"shape\":\"ParameterMap\",\
          \"documentation\":\"<p>A key-value map that pairs the patterns that need to be replaced in a managed template job document schema. You can use the description of each key as a guidance to specify the inputs during runtime when creating a job.</p> <note> <p> <code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p> </note>\"\
        },\
        \"isConcurrent\":{\
          \"shape\":\"BooleanWrapperObject\",\
          \"documentation\":\"<p>Indicates whether a job is concurrent. Will be true when a job is rolling out new job executions or canceling previously created executions, otherwise false.</p>\"\
        },\
        \"schedulingConfig\":{\
          \"shape\":\"SchedulingConfig\",\
          \"documentation\":\"<p>The configuration that allows you to schedule a job for a future date and time in addition to specifying the end behavior for each job execution.</p>\"\
        },\
        \"scheduledJobRollouts\":{\
          \"shape\":\"ScheduledJobRolloutList\",\
          \"documentation\":\"<p>Displays the next seven maintenance window occurrences and their start times.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>Job</code> object contains details about a job.</p>\"\
    },\
    \"JobArn\":{\"type\":\"string\"},\
    \"JobDescription\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"JobDocument\":{\
      \"type\":\"string\",\
      \"max\":32768\
    },\
    \"JobDocumentSource\":{\
      \"type\":\"string\",\
      \"max\":1350,\
      \"min\":1\
    },\
    \"JobEndBehavior\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STOP_ROLLOUT\",\
        \"CANCEL\",\
        \"FORCE_CANCEL\"\
      ]\
    },\
    \"JobExecution\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to the job when it was created.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"JobExecutionStatus\",\
          \"documentation\":\"<p>The status of the job execution (IN_PROGRESS, QUEUED, FAILED, SUCCEEDED, TIMED_OUT, CANCELED, or REJECTED).</p>\"\
        },\
        \"forceCanceled\":{\
          \"shape\":\"Forced\",\
          \"documentation\":\"<p>Will be <code>true</code> if the job execution was canceled with the optional <code>force</code> parameter set to <code>true</code>.</p>\"\
        },\
        \"statusDetails\":{\
          \"shape\":\"JobExecutionStatusDetails\",\
          \"documentation\":\"<p>A collection of name/value pairs that describe the status of the job execution.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the thing on which the job execution is running.</p>\"\
        },\
        \"queuedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job execution was queued.</p>\"\
        },\
        \"startedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job execution started.</p>\"\
        },\
        \"lastUpdatedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job execution was last updated.</p>\"\
        },\
        \"executionNumber\":{\
          \"shape\":\"ExecutionNumber\",\
          \"documentation\":\"<p>A string (consisting of the digits \\\"0\\\" through \\\"9\\\") which identifies this particular job execution on this particular device. It can be used in commands which return or update job execution information. </p>\"\
        },\
        \"versionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version of the job execution. Job execution versions are incremented each time they are updated by a device.</p>\"\
        },\
        \"approximateSecondsBeforeTimedOut\":{\
          \"shape\":\"ApproximateSecondsBeforeTimedOut\",\
          \"documentation\":\"<p>The estimated number of seconds that remain before the job execution status will be changed to <code>TIMED_OUT</code>. The timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The actual job execution timeout can occur up to 60 seconds later than the estimated duration. This value will not be included if the job execution has reached a terminal status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The job execution object represents the execution of a job on a particular device.</p>\"\
    },\
    \"JobExecutionFailureType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FAILED\",\
        \"REJECTED\",\
        \"TIMED_OUT\",\
        \"ALL\"\
      ]\
    },\
    \"JobExecutionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUED\",\
        \"IN_PROGRESS\",\
        \"SUCCEEDED\",\
        \"FAILED\",\
        \"TIMED_OUT\",\
        \"REJECTED\",\
        \"REMOVED\",\
        \"CANCELED\"\
      ]\
    },\
    \"JobExecutionStatusDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detailsMap\":{\
          \"shape\":\"DetailsMap\",\
          \"documentation\":\"<p>The job execution status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details of the job execution status.</p>\"\
    },\
    \"JobExecutionSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"status\":{\
          \"shape\":\"JobExecutionStatus\",\
          \"documentation\":\"<p>The status of the job execution.</p>\"\
        },\
        \"queuedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job execution was queued.</p>\"\
        },\
        \"startedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job execution started.</p>\"\
        },\
        \"lastUpdatedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job execution was last updated.</p>\"\
        },\
        \"executionNumber\":{\
          \"shape\":\"ExecutionNumber\",\
          \"documentation\":\"<p>A string (consisting of the digits \\\"0\\\" through \\\"9\\\") which identifies this particular job execution on this particular device. It can be used later in commands which return or update job execution information.</p>\"\
        },\
        \"retryAttempt\":{\
          \"shape\":\"RetryAttempt\",\
          \"documentation\":\"<p>The number that indicates how many retry attempts have been completed for this job on this device.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The job execution summary.</p>\"\
    },\
    \"JobExecutionSummaryForJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the thing on which the job execution is running.</p>\"\
        },\
        \"jobExecutionSummary\":{\
          \"shape\":\"JobExecutionSummary\",\
          \"documentation\":\"<p>Contains a subset of information about a job execution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a summary of information about job executions for a specific job.</p>\"\
    },\
    \"JobExecutionSummaryForJobList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobExecutionSummaryForJob\"}\
    },\
    \"JobExecutionSummaryForThing\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\"\
        },\
        \"jobExecutionSummary\":{\
          \"shape\":\"JobExecutionSummary\",\
          \"documentation\":\"<p>Contains a subset of information about a job execution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The job execution summary for a thing.</p>\"\
    },\
    \"JobExecutionSummaryForThingList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobExecutionSummaryForThing\"}\
    },\
    \"JobExecutionsRetryConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"criteriaList\"],\
      \"members\":{\
        \"criteriaList\":{\
          \"shape\":\"RetryCriteriaList\",\
          \"documentation\":\"<p>The list of criteria that determines how many retries are allowed for each failure type for a job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration that determines how many retries are allowed for each failure type for a job.</p>\"\
    },\
    \"JobExecutionsRolloutConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maximumPerMinute\":{\
          \"shape\":\"MaxJobExecutionsPerMin\",\
          \"documentation\":\"<p>The maximum number of things that will be notified of a pending job, per minute. This parameter allows you to create a staged rollout.</p>\"\
        },\
        \"exponentialRate\":{\
          \"shape\":\"ExponentialRolloutRate\",\
          \"documentation\":\"<p>The rate of increase for a job rollout. This parameter allows you to define an exponential rate for a job rollout.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Allows you to create a staged rollout of a job.</p>\"\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"JobProcessDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"processingTargets\":{\
          \"shape\":\"ProcessingTargetNameList\",\
          \"documentation\":\"<p>The target devices to which the job execution is being rolled out. This value will be null after the job execution has finished rolling out to all the target devices.</p>\"\
        },\
        \"numberOfCanceledThings\":{\
          \"shape\":\"CanceledThings\",\
          \"documentation\":\"<p>The number of things that cancelled the job.</p>\"\
        },\
        \"numberOfSucceededThings\":{\
          \"shape\":\"SucceededThings\",\
          \"documentation\":\"<p>The number of things which successfully completed the job.</p>\"\
        },\
        \"numberOfFailedThings\":{\
          \"shape\":\"FailedThings\",\
          \"documentation\":\"<p>The number of things that failed executing the job.</p>\"\
        },\
        \"numberOfRejectedThings\":{\
          \"shape\":\"RejectedThings\",\
          \"documentation\":\"<p>The number of things that rejected the job.</p>\"\
        },\
        \"numberOfQueuedThings\":{\
          \"shape\":\"QueuedThings\",\
          \"documentation\":\"<p>The number of things that are awaiting execution of the job.</p>\"\
        },\
        \"numberOfInProgressThings\":{\
          \"shape\":\"InProgressThings\",\
          \"documentation\":\"<p>The number of things currently executing the job.</p>\"\
        },\
        \"numberOfRemovedThings\":{\
          \"shape\":\"RemovedThings\",\
          \"documentation\":\"<p>The number of things that are no longer scheduled to execute the job because they have been deleted or have been removed from the group that was a target of the job.</p>\"\
        },\
        \"numberOfTimedOutThings\":{\
          \"shape\":\"TimedOutThings\",\
          \"documentation\":\"<p>The number of things whose job execution status is <code>TIMED_OUT</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The job process details.</p>\"\
    },\
    \"JobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"CANCELED\",\
        \"COMPLETED\",\
        \"DELETION_IN_PROGRESS\",\
        \"SCHEDULED\"\
      ]\
    },\
    \"JobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobArn\":{\
          \"shape\":\"JobArn\",\
          \"documentation\":\"<p>The job ARN.</p>\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\"\
        },\
        \"thingGroupId\":{\
          \"shape\":\"ThingGroupId\",\
          \"documentation\":\"<p>The ID of the thing group.</p>\"\
        },\
        \"targetSelection\":{\
          \"shape\":\"TargetSelection\",\
          \"documentation\":\"<p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p> <note> <p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p> </note>\"\
        },\
        \"status\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The job summary status.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job was created.</p>\"\
        },\
        \"lastUpdatedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job was last updated.</p>\"\
        },\
        \"completedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job completed.</p>\"\
        },\
        \"isConcurrent\":{\
          \"shape\":\"BooleanWrapperObject\",\
          \"documentation\":\"<p>Indicates whether a job is concurrent. Will be true when a job is rolling out new job executions or canceling previously created executions, otherwise false.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The job summary.</p>\"\
    },\
    \"JobSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobSummary\"}\
    },\
    \"JobTargets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetArn\"},\
      \"min\":1\
    },\
    \"JobTemplateArn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1,\
      \"pattern\":\"^arn:[!-~]+$\"\
    },\
    \"JobTemplateId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"JobTemplateSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobTemplateArn\":{\
          \"shape\":\"JobTemplateArn\",\
          \"documentation\":\"<p>The ARN of the job template.</p>\"\
        },\
        \"jobTemplateId\":{\
          \"shape\":\"JobTemplateId\",\
          \"documentation\":\"<p>The unique identifier of the job template.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A description of the job template.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The time, in seconds since the epoch, when the job template was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the job template.</p>\"\
    },\
    \"JobTemplateSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobTemplateSummary\"}\
    },\
    \"JsonDocument\":{\"type\":\"string\"},\
    \"KafkaAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"destinationArn\",\
        \"topic\",\
        \"clientProperties\"\
      ],\
      \"members\":{\
        \"destinationArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of Kafka action's VPC <code>TopicRuleDestination</code>.</p>\"\
        },\
        \"topic\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Kafka topic for messages to be sent to the Kafka broker.</p>\"\
        },\
        \"key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Kafka message key.</p>\"\
        },\
        \"partition\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Kafka message partition.</p>\"\
        },\
        \"clientProperties\":{\
          \"shape\":\"ClientProperties\",\
          \"documentation\":\"<p>Properties of the Apache Kafka producer client.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) or self-managed Apache Kafka cluster.</p>\"\
    },\
    \"Key\":{\"type\":\"string\"},\
    \"KeyName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"KeyPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicKey\":{\
          \"shape\":\"PublicKey\",\
          \"documentation\":\"<p>The public key.</p>\"\
        },\
        \"PrivateKey\":{\
          \"shape\":\"PrivateKey\",\
          \"documentation\":\"<p>The private key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a key pair.</p>\"\
    },\
    \"KeyValue\":{\
      \"type\":\"string\",\
      \"max\":5120,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"KinesisAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"streamName\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access to the Amazon Kinesis stream.</p>\"\
        },\
        \"streamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the Amazon Kinesis stream.</p>\"\
        },\
        \"partitionKey\":{\
          \"shape\":\"PartitionKey\",\
          \"documentation\":\"<p>The partition key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write data to an Amazon Kinesis stream.</p>\"\
    },\
    \"LambdaAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"functionArn\"],\
      \"members\":{\
        \"functionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The ARN of the Lambda function.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to invoke a Lambda function.</p>\"\
    },\
    \"LaserMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"LastModifiedDate\":{\"type\":\"timestamp\"},\
    \"LastUpdatedAtDate\":{\"type\":\"timestamp\"},\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A limit has been exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":410},\
      \"exception\":true\
    },\
    \"ListActiveViolationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"DeviceDefenderThingName\",\
          \"documentation\":\"<p>The name of the thing whose active violations are listed.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingName\"\
        },\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the Device Defender security profile for which violations are listed.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"behaviorCriteriaType\":{\
          \"shape\":\"BehaviorCriteriaType\",\
          \"documentation\":\"<p> The criteria for a behavior. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"behaviorCriteriaType\"\
        },\
        \"listSuppressedAlerts\":{\
          \"shape\":\"ListSuppressedAlerts\",\
          \"documentation\":\"<p> A list of all suppressed alerts. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"listSuppressedAlerts\"\
        },\
        \"verificationState\":{\
          \"shape\":\"VerificationState\",\
          \"documentation\":\"<p>The verification state of the violation (detect alarm).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"verificationState\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListActiveViolationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"activeViolations\":{\
          \"shape\":\"ActiveViolations\",\
          \"documentation\":\"<p>The list of active violations.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListAttachedPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"target\"],\
      \"members\":{\
        \"target\":{\
          \"shape\":\"PolicyTarget\",\
          \"documentation\":\"<p>The group or principal for which the policies will be listed. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"target\"\
        },\
        \"recursive\":{\
          \"shape\":\"Recursive\",\
          \"documentation\":\"<p>When true, recursively list attached policies.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"recursive\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        }\
      }\
    },\
    \"ListAttachedPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>The policies.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The token to retrieve the next set of results, or ``null`` if there are no more results.</p>\"\
        }\
      }\
    },\
    \"ListAuditFindingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>A filter to limit results to the audit with the specified ID. You must specify either the taskId or the startTime and endTime, but not both.</p>\"\
        },\
        \"checkName\":{\
          \"shape\":\"AuditCheckName\",\
          \"documentation\":\"<p>A filter to limit results to the findings for the specified audit check.</p>\"\
        },\
        \"resourceIdentifier\":{\
          \"shape\":\"ResourceIdentifier\",\
          \"documentation\":\"<p>Information identifying the noncompliant resource.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time. The default is 25.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter to limit results to those found after the specified time. You must specify either the startTime and endTime or the taskId, but not both.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter to limit results to those found before the specified time. You must specify either the startTime and endTime or the taskId, but not both.</p>\"\
        },\
        \"listSuppressedFindings\":{\
          \"shape\":\"ListSuppressedFindings\",\
          \"documentation\":\"<p> Boolean flag indicating whether only the suppressed findings or the unsuppressed findings should be listed. If this parameter isn't provided, the response will list both suppressed and unsuppressed findings. </p>\"\
        }\
      }\
    },\
    \"ListAuditFindingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"findings\":{\
          \"shape\":\"AuditFindings\",\
          \"documentation\":\"<p>The findings (results) of the audit.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListAuditMitigationActionsExecutionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"taskId\",\
        \"findingId\"\
      ],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p>Specify this filter to limit results to actions for a specific audit mitigation actions task.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"taskId\"\
        },\
        \"actionStatus\":{\
          \"shape\":\"AuditMitigationActionsExecutionStatus\",\
          \"documentation\":\"<p>Specify this filter to limit results to those with a specific status.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"actionStatus\"\
        },\
        \"findingId\":{\
          \"shape\":\"FindingId\",\
          \"documentation\":\"<p>Specify this filter to limit results to those that were applied to a specific audit finding.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"findingId\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time. The default is 25.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListAuditMitigationActionsExecutionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionsExecutions\":{\
          \"shape\":\"AuditMitigationActionExecutionMetadataList\",\
          \"documentation\":\"<p>A set of task execution results based on the input parameters. Details include the mitigation action applied, start time, and task status.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListAuditMitigationActionsTasksRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"endTime\"\
      ],\
      \"members\":{\
        \"auditTaskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>Specify this filter to limit results to tasks that were applied to results for a specific audit.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"auditTaskId\"\
        },\
        \"findingId\":{\
          \"shape\":\"FindingId\",\
          \"documentation\":\"<p>Specify this filter to limit results to tasks that were applied to a specific audit finding.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"findingId\"\
        },\
        \"taskStatus\":{\
          \"shape\":\"AuditMitigationActionsTaskStatus\",\
          \"documentation\":\"<p>Specify this filter to limit results to tasks that are in a specific state.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"taskStatus\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time. The default is 25.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specify this filter to limit results to tasks that began on or after a specific date and time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startTime\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specify this filter to limit results to tasks that were completed or canceled on or before a specific date and time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"endTime\"\
        }\
      }\
    },\
    \"ListAuditMitigationActionsTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tasks\":{\
          \"shape\":\"AuditMitigationActionsTaskMetadataList\",\
          \"documentation\":\"<p>The collection of audit mitigation tasks that matched the filter criteria.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListAuditSuppressionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"checkName\":{\"shape\":\"AuditCheckName\"},\
        \"resourceIdentifier\":{\"shape\":\"ResourceIdentifier\"},\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p> Determines whether suppressions are listed in ascending order by expiration date or not. If parameter isn't provided, <code>ascendingOrder=true</code>. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> The token for the next set of results. </p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of results to return at one time. The default is 25. </p>\"\
        }\
      }\
    },\
    \"ListAuditSuppressionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"suppressions\":{\
          \"shape\":\"AuditSuppressionList\",\
          \"documentation\":\"<p> List of audit suppressions. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>\"\
        }\
      }\
    },\
    \"ListAuditTasksRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"endTime\"\
      ],\
      \"members\":{\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The beginning of the time period. Audit information is retained for a limited time (90 days). Requesting a start time prior to what is retained results in an \\\"InvalidRequestException\\\".</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startTime\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time period.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"endTime\"\
        },\
        \"taskType\":{\
          \"shape\":\"AuditTaskType\",\
          \"documentation\":\"<p>A filter to limit the output to the specified type of audit: can be one of \\\"ON_DEMAND_AUDIT_TASK\\\" or \\\"SCHEDULED__AUDIT_TASK\\\".</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"taskType\"\
        },\
        \"taskStatus\":{\
          \"shape\":\"AuditTaskStatus\",\
          \"documentation\":\"<p>A filter to limit the output to audits with the specified completion status: can be one of \\\"IN_PROGRESS\\\", \\\"COMPLETED\\\", \\\"FAILED\\\", or \\\"CANCELED\\\".</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"taskStatus\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time. The default is 25.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListAuditTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tasks\":{\
          \"shape\":\"AuditTaskMetadataList\",\
          \"documentation\":\"<p>The audits that were performed during the specified time period.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListAuthorizersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>A marker used to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Return the list of authorizers in ascending alphabetical order.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        },\
        \"status\":{\
          \"shape\":\"AuthorizerStatus\",\
          \"documentation\":\"<p>The status of the list authorizers request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"status\"\
        }\
      }\
    },\
    \"ListAuthorizersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizers\":{\
          \"shape\":\"Authorizers\",\
          \"documentation\":\"<p>The authorizers.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>A marker used to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListBillingGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return per request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"namePrefixFilter\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>Limit the results to billing groups whose names have the given prefix.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namePrefixFilter\"\
        }\
      }\
    },\
    \"ListBillingGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"billingGroups\":{\
          \"shape\":\"BillingGroupNameAndArnList\",\
          \"documentation\":\"<p>The list of billing groups.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListCACertificatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Determines the order of the results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        },\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"templateName\"\
        }\
      },\
      \"documentation\":\"<p>Input for the ListCACertificates operation.</p>\"\
    },\
    \"ListCACertificatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificates\":{\
          \"shape\":\"CACertificates\",\
          \"documentation\":\"<p>The CA certificates registered in your Amazon Web Services account.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The current position within the list of CA certificates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListCACertificates operation.</p>\"\
    },\
    \"ListCertificatesByCARequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"caCertificateId\"],\
      \"members\":{\
        \"caCertificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the CA certificate. This operation will list all registered device certificate that were signed by this CA certificate.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      },\
      \"documentation\":\"<p>The input to the ListCertificatesByCA operation.</p>\"\
    },\
    \"ListCertificatesByCAResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificates\":{\
          \"shape\":\"Certificates\",\
          \"documentation\":\"<p>The device certificates signed by the specified CA certificate.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the ListCertificatesByCA operation.</p>\"\
    },\
    \"ListCertificatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListCertificates operation.</p>\"\
    },\
    \"ListCertificatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificates\":{\
          \"shape\":\"Certificates\",\
          \"documentation\":\"<p>The descriptions of the certificates.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the ListCertificates operation.</p>\"\
    },\
    \"ListCustomMetricsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> The token for the next set of results. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of results to return at one time. The default is 25. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListCustomMetricsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricNames\":{\
          \"shape\":\"MetricNames\",\
          \"documentation\":\"<p> The name of the custom metric. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>\"\
        }\
      }\
    },\
    \"ListDetectMitigationActionsExecutionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p> The unique identifier of the task. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"taskId\"\
        },\
        \"violationId\":{\
          \"shape\":\"ViolationId\",\
          \"documentation\":\"<p> The unique identifier of the violation. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"violationId\"\
        },\
        \"thingName\":{\
          \"shape\":\"DeviceDefenderThingName\",\
          \"documentation\":\"<p> The name of the thing whose mitigation actions are listed. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingName\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> A filter to limit results to those found after the specified time. You must specify either the startTime and endTime or the taskId, but not both. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startTime\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The end of the time period for which ML Detect mitigation actions executions are returned. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"endTime\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of results to return at one time. The default is 25. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> The token for the next set of results. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListDetectMitigationActionsExecutionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionsExecutions\":{\
          \"shape\":\"DetectMitigationActionExecutionList\",\
          \"documentation\":\"<p> List of actions executions. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>\"\
        }\
      }\
    },\
    \"ListDetectMitigationActionsTasksRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"endTime\"\
      ],\
      \"members\":{\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time. The default is 25.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> The token for the next set of results. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> A filter to limit results to those found after the specified time. You must specify either the startTime and endTime or the taskId, but not both. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startTime\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The end of the time period for which ML Detect mitigation actions tasks are returned. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"endTime\"\
        }\
      }\
    },\
    \"ListDetectMitigationActionsTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tasks\":{\
          \"shape\":\"DetectMitigationActionsTaskSummaryList\",\
          \"documentation\":\"<p> The collection of ML Detect mitigation tasks that matched the filter criteria. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>\"\
        }\
      }\
    },\
    \"ListDimensionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to retrieve at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListDimensionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"dimensionNames\":{\
          \"shape\":\"DimensionNames\",\
          \"documentation\":\"<p>A list of the names of the defined dimensions. Use <code>DescribeDimension</code> to get details for a dimension.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListDomainConfigurationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"serviceType\":{\
          \"shape\":\"ServiceType\",\
          \"documentation\":\"<p>The type of service delivered by the endpoint.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"serviceType\"\
        }\
      }\
    },\
    \"ListDomainConfigurationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainConfigurations\":{\
          \"shape\":\"DomainConfigurations\",\
          \"documentation\":\"<p>A list of objects that contain summary information about the user's domain configurations.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListFleetMetricsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <code>null</code> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListFleetMetricsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"fleetMetrics\":{\
          \"shape\":\"FleetMetricNameAndArnList\",\
          \"documentation\":\"<p>The list of fleet metrics objects.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Will not be returned if the operation has returned all results.</p>\"\
        }\
      }\
    },\
    \"ListIndicesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"QueryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListIndicesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"indexNames\":{\
          \"shape\":\"IndexNamesList\",\
          \"documentation\":\"<p>The index names.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListJobExecutionsForJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobId\"],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"status\":{\
          \"shape\":\"JobExecutionStatus\",\
          \"documentation\":\"<p>The status of the job.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"status\"\
        },\
        \"maxResults\":{\
          \"shape\":\"LaserMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListJobExecutionsForJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"executionSummaries\":{\
          \"shape\":\"JobExecutionSummaryForJobList\",\
          \"documentation\":\"<p>A list of job execution summaries.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListJobExecutionsForThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The thing name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"status\":{\
          \"shape\":\"JobExecutionStatus\",\
          \"documentation\":\"<p>An optional filter that lets you search for jobs that have the specified status.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"status\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namespaceId\"\
        },\
        \"maxResults\":{\
          \"shape\":\"LaserMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The unique identifier you assigned to this job when it was created.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"jobId\"\
        }\
      }\
    },\
    \"ListJobExecutionsForThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"executionSummaries\":{\
          \"shape\":\"JobExecutionSummaryForThingList\",\
          \"documentation\":\"<p>A list of job execution summaries.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListJobTemplatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maxResults\":{\
          \"shape\":\"LaserMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in the list.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to return the next set of results in the list.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListJobTemplatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobTemplates\":{\
          \"shape\":\"JobTemplateSummaryList\",\
          \"documentation\":\"<p>A list of objects that contain information about the job templates.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"status\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>An optional filter that lets you search for jobs that have the specified status.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"status\"\
        },\
        \"targetSelection\":{\
          \"shape\":\"TargetSelection\",\
          \"documentation\":\"<p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group. </p> <note> <p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"targetSelection\"\
        },\
        \"maxResults\":{\
          \"shape\":\"LaserMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return per request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>A filter that limits the returned jobs to those for the specified group.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"thingGroupId\":{\
          \"shape\":\"ThingGroupId\",\
          \"documentation\":\"<p>A filter that limits the returned jobs to those for the specified group.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingGroupId\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namespaceId\"\
        }\
      }\
    },\
    \"ListJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"jobs\":{\
          \"shape\":\"JobSummaryList\",\
          \"documentation\":\"<p>A list of jobs.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListManagedJobTemplatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"ManagedJobTemplateName\",\
          \"documentation\":\"<p>An optional parameter for template name. If specified, only the versions of the managed job templates that have the specified template name will be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"templateName\"\
        },\
        \"maxResults\":{\
          \"shape\":\"LaserMaxResults\",\
          \"documentation\":\"<p>Maximum number of entries that can be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListManagedJobTemplatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"managedJobTemplates\":{\
          \"shape\":\"ManagedJobTemplatesSummaryList\",\
          \"documentation\":\"<p>A list of managed job templates that are returned.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListMetricValuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingName\",\
        \"metricName\",\
        \"startTime\",\
        \"endTime\"\
      ],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"DeviceDefenderThingName\",\
          \"documentation\":\"<p>The name of the thing for which security profile metric values are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingName\"\
        },\
        \"metricName\":{\
          \"shape\":\"BehaviorMetric\",\
          \"documentation\":\"<p>The name of the security profile metric for which values are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"metricName\"\
        },\
        \"dimensionName\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The dimension name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"dimensionName\"\
        },\
        \"dimensionValueOperator\":{\
          \"shape\":\"DimensionValueOperator\",\
          \"documentation\":\"<p>The dimension value operator.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"dimensionValueOperator\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the time period for which metric values are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startTime\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time period for which metric values are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"endTime\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListMetricValuesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricDatumList\":{\
          \"shape\":\"MetricDatumList\",\
          \"documentation\":\"<p>The data the thing reports for the metric during the specified time period.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListMitigationActionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionType\":{\
          \"shape\":\"MitigationActionType\",\
          \"documentation\":\"<p>Specify a value to limit the result to mitigation actions with a specific action type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"actionType\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time. The default is 25.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListMitigationActionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionIdentifiers\":{\
          \"shape\":\"MitigationActionIdentifierList\",\
          \"documentation\":\"<p>A set of actions that matched the specified filter criteria.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListOTAUpdatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token used to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"otaUpdateStatus\":{\
          \"shape\":\"OTAUpdateStatus\",\
          \"documentation\":\"<p>The OTA update job status.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"otaUpdateStatus\"\
        }\
      }\
    },\
    \"ListOTAUpdatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"otaUpdates\":{\
          \"shape\":\"OTAUpdatesSummary\",\
          \"documentation\":\"<p>A list of OTA update jobs.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to use to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListOutgoingCertificatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      },\
      \"documentation\":\"<p>The input to the ListOutgoingCertificates operation.</p>\"\
    },\
    \"ListOutgoingCertificatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"outgoingCertificates\":{\
          \"shape\":\"OutgoingCertificates\",\
          \"documentation\":\"<p>The certificates that are being transferred but not yet accepted.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListOutgoingCertificates operation.</p>\"\
    },\
    \"ListPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPolicies operation.</p>\"\
    },\
    \"ListPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>The descriptions of the policies.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPolicies operation.</p>\"\
    },\
    \"ListPolicyPrincipalsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-policy\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPolicyPrincipals operation.</p>\"\
    },\
    \"ListPolicyPrincipalsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"principals\":{\
          \"shape\":\"Principals\",\
          \"documentation\":\"<p>The descriptions of the principals.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPolicyPrincipals operation.</p>\"\
    },\
    \"ListPolicyVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPolicyVersions operation.</p>\"\
    },\
    \"ListPolicyVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyVersions\":{\
          \"shape\":\"PolicyVersions\",\
          \"documentation\":\"<p>The policy versions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPolicyVersions operation.</p>\"\
    },\
    \"ListPrincipalPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"principal\"],\
      \"members\":{\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-principal\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If true, results are returned in ascending creation order.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPrincipalPolicies operation.</p>\"\
    },\
    \"ListPrincipalPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>The policies.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPrincipalPolicies operation.</p>\"\
    },\
    \"ListPrincipalThingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"principal\"],\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-principal\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPrincipalThings operation.</p>\"\
    },\
    \"ListPrincipalThingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"things\":{\
          \"shape\":\"ThingNameList\",\
          \"documentation\":\"<p>The things.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPrincipalThings operation.</p>\"\
    },\
    \"ListProvisioningTemplateVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateName\"],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListProvisioningTemplateVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"versions\":{\
          \"shape\":\"ProvisioningTemplateVersionListing\",\
          \"documentation\":\"<p>The list of provisioning template versions.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListProvisioningTemplatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListProvisioningTemplatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templates\":{\
          \"shape\":\"ProvisioningTemplateListing\",\
          \"documentation\":\"<p>A list of provisioning templates</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListRelatedResourcesForAuditFindingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"findingId\"],\
      \"members\":{\
        \"findingId\":{\
          \"shape\":\"FindingId\",\
          \"documentation\":\"<p>The finding Id.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"findingId\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRelatedResourcesForAuditFindingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"relatedResources\":{\
          \"shape\":\"RelatedResources\",\
          \"documentation\":\"<p>The related resources.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> for the first API call.</p>\"\
        }\
      }\
    },\
    \"ListRoleAliasesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>A marker used to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Return the list of role aliases in ascending alphabetical order.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      }\
    },\
    \"ListRoleAliasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleAliases\":{\
          \"shape\":\"RoleAliases\",\
          \"documentation\":\"<p>The role aliases.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>A marker used to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListScheduledAuditsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time. The default is 25.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListScheduledAuditsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"scheduledAudits\":{\
          \"shape\":\"ScheduledAuditMetadataList\",\
          \"documentation\":\"<p>The list of scheduled audits.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityProfilesForTargetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"securityProfileTargetArn\"],\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"recursive\":{\
          \"shape\":\"Recursive\",\
          \"documentation\":\"<p>If true, return child groups too.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"recursive\"\
        },\
        \"securityProfileTargetArn\":{\
          \"shape\":\"SecurityProfileTargetArn\",\
          \"documentation\":\"<p>The ARN of the target (thing group) whose attached security profiles you want to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"securityProfileTargetArn\"\
        }\
      }\
    },\
    \"ListSecurityProfilesForTargetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileTargetMappings\":{\
          \"shape\":\"SecurityProfileTargetMappings\",\
          \"documentation\":\"<p>A list of security profiles and their associated targets.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityProfilesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"dimensionName\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>A filter to limit results to the security profiles that use the defined dimension. Cannot be used with <code>metricName</code> </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"dimensionName\"\
        },\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric. Cannot be used with <code>dimensionName</code>. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"metricName\"\
        }\
      }\
    },\
    \"ListSecurityProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileIdentifiers\":{\
          \"shape\":\"SecurityProfileIdentifiers\",\
          \"documentation\":\"<p>A list of security profile identifiers (names and ARNs).</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListStreamsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at a time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token used to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"documentation\":\"<p>Set to true to return the list of streams in ascending order.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\"\
        }\
      }\
    },\
    \"ListStreamsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"streams\":{\
          \"shape\":\"StreamsSummary\",\
          \"documentation\":\"<p>A list of streams.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token used to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListSuppressedAlerts\":{\"type\":\"boolean\"},\
    \"ListSuppressedFindings\":{\"type\":\"boolean\"},\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceArn\"],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The ARN of the resource.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The list of tags assigned to the resource.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListTargetsForPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>A marker used to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        }\
      }\
    },\
    \"ListTargetsForPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"targets\":{\
          \"shape\":\"PolicyTargets\",\
          \"documentation\":\"<p>The policy targets.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>A marker used to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListTargetsForSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"securityProfileName\"],\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The security profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListTargetsForSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileTargets\":{\
          \"shape\":\"SecurityProfileTargets\",\
          \"documentation\":\"<p>The thing groups to which the security profile is attached.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListThingGroupsForThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The thing name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListThingGroupsForThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroups\":{\
          \"shape\":\"ThingGroupNameAndArnList\",\
          \"documentation\":\"<p>The thing groups.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListThingGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"parentGroup\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>A filter that limits the results to those with the specified parent group.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"parentGroup\"\
        },\
        \"namePrefixFilter\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>A filter that limits the results to those with the specified name prefix.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namePrefixFilter\"\
        },\
        \"recursive\":{\
          \"shape\":\"RecursiveWithoutDefault\",\
          \"documentation\":\"<p>If true, return child groups as well.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"recursive\"\
        }\
      }\
    },\
    \"ListThingGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroups\":{\
          \"shape\":\"ThingGroupNameAndArnList\",\
          \"documentation\":\"<p>The thing groups.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results. Will not be returned if operation has returned all results.</p>\"\
        }\
      }\
    },\
    \"ListThingPrincipalsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListThingPrincipal operation.</p>\"\
    },\
    \"ListThingPrincipalsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"principals\":{\
          \"shape\":\"Principals\",\
          \"documentation\":\"<p>The principals associated with the thing.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListThingPrincipals operation.</p>\"\
    },\
    \"ListThingRegistrationTaskReportsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"taskId\",\
        \"reportType\"\
      ],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>The id of the task.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        },\
        \"reportType\":{\
          \"shape\":\"ReportType\",\
          \"documentation\":\"<p>The type of task report.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"reportType\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return per request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListThingRegistrationTaskReportsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceLinks\":{\
          \"shape\":\"S3FileUrlList\",\
          \"documentation\":\"<p>Links to the task resources.</p>\"\
        },\
        \"reportType\":{\
          \"shape\":\"ReportType\",\
          \"documentation\":\"<p>The type of task report.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListThingRegistrationTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>The status of the bulk thing provisioning task.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"status\"\
        }\
      }\
    },\
    \"ListThingRegistrationTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskIds\":{\
          \"shape\":\"TaskIdList\",\
          \"documentation\":\"<p>A list of bulk thing provisioning task IDs.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListThingTypesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingTypeName\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListThingTypes operation.</p>\"\
    },\
    \"ListThingTypesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypes\":{\
          \"shape\":\"ThingTypeList\",\
          \"documentation\":\"<p>The thing types.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Will not be returned if operation has returned all results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the ListThingTypes operation.</p>\"\
    },\
    \"ListThingsInBillingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"billingGroupName\"],\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"billingGroupName\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return per request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListThingsInBillingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"things\":{\
          \"shape\":\"ThingNameList\",\
          \"documentation\":\"<p>A list of things in the billing group.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results. Will not be returned if operation has returned all results.</p>\"\
        }\
      }\
    },\
    \"ListThingsInThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingGroupName\"],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The thing group name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"recursive\":{\
          \"shape\":\"Recursive\",\
          \"documentation\":\"<p>When true, list things in this thing group and in all child groups as well.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"recursive\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListThingsInThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"things\":{\
          \"shape\":\"ThingNameList\",\
          \"documentation\":\"<p>The things in the specified thing group.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListThingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RegistryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"attributeName\":{\
          \"shape\":\"AttributeName\",\
          \"documentation\":\"<p>The attribute name used to search for things.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"attributeName\"\
        },\
        \"attributeValue\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The attribute value used to search for things.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"attributeValue\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type used to search for things.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingTypeName\"\
        },\
        \"usePrefixAttributeValue\":{\
          \"shape\":\"usePrefixAttributeValue\",\
          \"documentation\":\"<p>When <code>true</code>, the action returns the thing resources with attribute values that start with the <code>attributeValue</code> provided.</p> <p>When <code>false</code>, or not present, the action returns only the thing resources with attribute values that match the entire <code>attributeValue</code> provided. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"usePrefixAttributeValue\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListThings operation.</p>\"\
    },\
    \"ListThingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"things\":{\
          \"shape\":\"ThingAttributeList\",\
          \"documentation\":\"<p>The things.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results. Will not be returned if operation has returned all results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListThings operation.</p>\"\
    },\
    \"ListTopicRuleDestinationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maxResults\":{\
          \"shape\":\"TopicRuleDestinationMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListTopicRuleDestinationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destinationSummaries\":{\
          \"shape\":\"TopicRuleDestinationSummaries\",\
          \"documentation\":\"<p>Information about a topic rule destination.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListTopicRulesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"topic\":{\
          \"shape\":\"Topic\",\
          \"documentation\":\"<p>The topic.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"topic\"\
        },\
        \"maxResults\":{\
          \"shape\":\"TopicRuleMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"ruleDisabled\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListTopicRules operation.</p>\"\
    },\
    \"ListTopicRulesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"rules\":{\
          \"shape\":\"TopicRuleList\",\
          \"documentation\":\"<p>The rules.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListTopicRules operation.</p>\"\
    },\
    \"ListV2LoggingLevelsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"targetType\":{\
          \"shape\":\"LogTargetType\",\
          \"documentation\":\"<p>The type of resource for which you are configuring logging. Must be <code>THING_Group</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"targetType\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"SkyfallMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListV2LoggingLevelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logTargetConfigurations\":{\
          \"shape\":\"LogTargetConfigurations\",\
          \"documentation\":\"<p>The logging configuration for a target.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"ListViolationEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"endTime\"\
      ],\
      \"members\":{\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time for the alerts to be listed.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startTime\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time for the alerts to be listed.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"endTime\"\
        },\
        \"thingName\":{\
          \"shape\":\"DeviceDefenderThingName\",\
          \"documentation\":\"<p>A filter to limit results to those alerts caused by the specified thing.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingName\"\
        },\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>A filter to limit results to those alerts generated by the specified security profile.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"behaviorCriteriaType\":{\
          \"shape\":\"BehaviorCriteriaType\",\
          \"documentation\":\"<p> The criteria for a behavior. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"behaviorCriteriaType\"\
        },\
        \"listSuppressedAlerts\":{\
          \"shape\":\"ListSuppressedAlerts\",\
          \"documentation\":\"<p> A list of all suppressed alerts. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"listSuppressedAlerts\"\
        },\
        \"verificationState\":{\
          \"shape\":\"VerificationState\",\
          \"documentation\":\"<p>The verification state of the violation (detect alarm).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"verificationState\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListViolationEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"violationEvents\":{\
          \"shape\":\"ViolationEvents\",\
          \"documentation\":\"<p>The security profile violation alerts issued for this account during the given time period, potentially filtered by security profile, behavior violated, or thing (device) violating.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"LocationAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"trackerName\",\
        \"deviceId\",\
        \"latitude\",\
        \"longitude\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that grants permission to write to the Amazon Location resource.</p>\"\
        },\
        \"trackerName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the tracker resource in Amazon Location in which the location is updated.</p>\"\
        },\
        \"deviceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the device providing the location data.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"LocationTimestamp\",\
          \"documentation\":\"<p>The time that the location data was sampled. The default value is the time the MQTT message was processed.</p>\"\
        },\
        \"latitude\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string that evaluates to a double value that represents the latitude of the device's location.</p>\"\
        },\
        \"longitude\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string that evaluates to a double value that represents the longitude of the device's location.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Location rule action sends device location updates from an MQTT message to an Amazon Location tracker resource.</p>\"\
    },\
    \"LocationTimestamp\":{\
      \"type\":\"structure\",\
      \"required\":[\"value\"],\
      \"members\":{\
        \"value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An expression that returns a long epoch time value.</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The precision of the timestamp value that results from the expression described in <code>value</code>.</p> <p>Valid values: <code>SECONDS</code> | <code>MILLISECONDS</code> | <code>MICROSECONDS</code> | <code>NANOSECONDS</code>. The default is <code>MILLISECONDS</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes how to interpret an application-defined timestamp value from an MQTT message payload and the precision of that value.</p>\"\
    },\
    \"LogGroupName\":{\"type\":\"string\"},\
    \"LogLevel\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEBUG\",\
        \"INFO\",\
        \"ERROR\",\
        \"WARN\",\
        \"DISABLED\"\
      ]\
    },\
    \"LogTarget\":{\
      \"type\":\"structure\",\
      \"required\":[\"targetType\"],\
      \"members\":{\
        \"targetType\":{\
          \"shape\":\"LogTargetType\",\
          \"documentation\":\"<p>The target type.</p>\"\
        },\
        \"targetName\":{\
          \"shape\":\"LogTargetName\",\
          \"documentation\":\"<p>The target name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A log target.</p>\"\
    },\
    \"LogTargetConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logTarget\":{\
          \"shape\":\"LogTarget\",\
          \"documentation\":\"<p>A log target</p>\"\
        },\
        \"logLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The logging level.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The target configuration.</p>\"\
    },\
    \"LogTargetConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogTargetConfiguration\"}\
    },\
    \"LogTargetName\":{\"type\":\"string\"},\
    \"LogTargetType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"THING_GROUP\",\
        \"CLIENT_ID\",\
        \"SOURCE_IP\",\
        \"PRINCIPAL_ID\"\
      ]\
    },\
    \"LoggingOptionsPayload\":{\
      \"type\":\"structure\",\
      \"required\":[\"roleArn\"],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"logLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The log level.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the logging options payload.</p>\"\
    },\
    \"MachineLearningDetectionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"confidenceLevel\"],\
      \"members\":{\
        \"confidenceLevel\":{\
          \"shape\":\"ConfidenceLevel\",\
          \"documentation\":\"<p> The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>, <code>Medium</code>, or <code>High</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The configuration of an ML Detect Security Profile. </p>\"\
    },\
    \"MaintenanceWindow\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"durationInMinutes\"\
      ],\
      \"members\":{\
        \"startTime\":{\
          \"shape\":\"CronExpression\",\
          \"documentation\":\"<p>Displays the start time of the next maintenance window.</p>\"\
        },\
        \"durationInMinutes\":{\
          \"shape\":\"DurationInMinutes\",\
          \"documentation\":\"<p>Displays the duration of the next maintenance window.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An optional configuration within the <code>SchedulingConfig</code> to setup a recurring maintenance window with a predetermined start time and duration for the rollout of a job document to all devices in a target group for a job.</p>\"\
    },\
    \"MaintenanceWindows\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MaintenanceWindow\"}\
    },\
    \"MalformedPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The policy documentation is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ManagedJobTemplateName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"ManagedJobTemplateSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateArn\":{\
          \"shape\":\"JobTemplateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for a managed template.</p>\"\
        },\
        \"templateName\":{\
          \"shape\":\"ManagedJobTemplateName\",\
          \"documentation\":\"<p>The unique Name for a managed template.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>The description for a managed template.</p>\"\
        },\
        \"environments\":{\
          \"shape\":\"Environments\",\
          \"documentation\":\"<p>A list of environments that are supported with the managed job template.</p>\"\
        },\
        \"templateVersion\":{\
          \"shape\":\"ManagedTemplateVersion\",\
          \"documentation\":\"<p>The version for a managed template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the managed template.</p>\"\
    },\
    \"ManagedJobTemplatesSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ManagedJobTemplateSummary\"}\
    },\
    \"ManagedTemplateVersion\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[1-9]+.[0-9]+\"\
    },\
    \"Marker\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[A-Za-z0-9+/]+={0,2}\"\
    },\
    \"MaxBuckets\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"MaxJobExecutionsPerMin\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"Maximum\":{\"type\":\"double\"},\
    \"MaximumPerMinute\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"Message\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"MessageExpiry\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"MessageFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RAW\",\
        \"JSON\"\
      ]\
    },\
    \"MessageId\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"MetricDatum\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the metric value was reported.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value reported for the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A metric.</p>\"\
    },\
    \"MetricDatumList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDatum\"}\
    },\
    \"MetricDimension\":{\
      \"type\":\"structure\",\
      \"required\":[\"dimensionName\"],\
      \"members\":{\
        \"dimensionName\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>A unique identifier for the dimension.</p>\"\
        },\
        \"operator\":{\
          \"shape\":\"DimensionValueOperator\",\
          \"documentation\":\"<p>Defines how the <code>dimensionValues</code> of a dimension are interpreted. For example, for dimension type TOPIC_FILTER, the <code>IN</code> operator, a message will be counted only if its topic matches one of the topic filters. With <code>NOT_IN</code> operator, a message will be counted only if it doesn't match any of the topic filters. The operator is optional: if it's not provided (is <code>null</code>), it will be interpreted as <code>IN</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The dimension of a metric.</p>\"\
    },\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"MetricNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricName\"}\
    },\
    \"MetricToRetain\":{\
      \"type\":\"structure\",\
      \"required\":[\"metric\"],\
      \"members\":{\
        \"metric\":{\
          \"shape\":\"BehaviorMetric\",\
          \"documentation\":\"<p>What is measured by the behavior.</p>\"\
        },\
        \"metricDimension\":{\
          \"shape\":\"MetricDimension\",\
          \"documentation\":\"<p>The dimension of a metric. This can't be used with custom metrics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The metric you want to retain. Dimensions are optional.</p>\"\
    },\
    \"MetricValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"count\":{\
          \"shape\":\"UnsignedLong\",\
          \"documentation\":\"<p>If the <code>comparisonOperator</code> calls for a numeric value, use this to specify that numeric value to be compared with the <code>metric</code>.</p>\"\
        },\
        \"cidrs\":{\
          \"shape\":\"Cidrs\",\
          \"documentation\":\"<p>If the <code>comparisonOperator</code> calls for a set of CIDRs, use this to specify that set to be compared with the <code>metric</code>.</p>\"\
        },\
        \"ports\":{\
          \"shape\":\"Ports\",\
          \"documentation\":\"<p>If the <code>comparisonOperator</code> calls for a set of ports, use this to specify that set to be compared with the <code>metric</code>.</p>\"\
        },\
        \"number\":{\
          \"shape\":\"Number\",\
          \"documentation\":\"<p> The numeral value of a metric. </p>\"\
        },\
        \"numbers\":{\
          \"shape\":\"NumberList\",\
          \"documentation\":\"<p> The numeral values of a metric. </p>\"\
        },\
        \"strings\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p> The string values of a metric. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The value to be compared with the <code>metric</code>.</p>\"\
    },\
    \"Minimum\":{\"type\":\"double\"},\
    \"MinimumNumberOfExecutedThings\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MissingContextValue\":{\"type\":\"string\"},\
    \"MissingContextValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MissingContextValue\"}\
    },\
    \"MitigationAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>A user-friendly name for the mitigation action.</p>\"\
        },\
        \"id\":{\
          \"shape\":\"MitigationActionId\",\
          \"documentation\":\"<p>A unique identifier for the mitigation action.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The IAM role ARN used to apply this mitigation action.</p>\"\
        },\
        \"actionParams\":{\
          \"shape\":\"MitigationActionParams\",\
          \"documentation\":\"<p>The set of parameters for this mitigation action. The parameters vary, depending on the kind of action you apply.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes which changes should be applied as part of a mitigation action.</p>\"\
    },\
    \"MitigationActionArn\":{\"type\":\"string\"},\
    \"MitigationActionId\":{\"type\":\"string\"},\
    \"MitigationActionIdentifier\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>The friendly name of the mitigation action.</p>\"\
        },\
        \"actionArn\":{\
          \"shape\":\"MitigationActionArn\",\
          \"documentation\":\"<p>The IAM role ARN used to apply this mitigation action.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date when this mitigation action was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information that identifies a mitigation action. This information is returned by ListMitigationActions.</p>\"\
    },\
    \"MitigationActionIdentifierList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MitigationActionIdentifier\"}\
    },\
    \"MitigationActionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MitigationAction\"}\
    },\
    \"MitigationActionName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"MitigationActionNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MitigationActionName\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"MitigationActionParams\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"updateDeviceCertificateParams\":{\
          \"shape\":\"UpdateDeviceCertificateParams\",\
          \"documentation\":\"<p>Parameters to define a mitigation action that changes the state of the device certificate to inactive.</p>\"\
        },\
        \"updateCACertificateParams\":{\
          \"shape\":\"UpdateCACertificateParams\",\
          \"documentation\":\"<p>Parameters to define a mitigation action that changes the state of the CA certificate to inactive.</p>\"\
        },\
        \"addThingsToThingGroupParams\":{\
          \"shape\":\"AddThingsToThingGroupParams\",\
          \"documentation\":\"<p>Parameters to define a mitigation action that moves devices associated with a certificate to one or more specified thing groups, typically for quarantine.</p>\"\
        },\
        \"replaceDefaultPolicyVersionParams\":{\
          \"shape\":\"ReplaceDefaultPolicyVersionParams\",\
          \"documentation\":\"<p>Parameters to define a mitigation action that adds a blank policy to restrict permissions.</p>\"\
        },\
        \"enableIoTLoggingParams\":{\
          \"shape\":\"EnableIoTLoggingParams\",\
          \"documentation\":\"<p>Parameters to define a mitigation action that enables Amazon Web Services IoT Core logging at a specified level of detail.</p>\"\
        },\
        \"publishFindingToSnsParams\":{\
          \"shape\":\"PublishFindingToSnsParams\",\
          \"documentation\":\"<p>Parameters to define a mitigation action that publishes findings to Amazon Simple Notification Service (Amazon SNS. You can implement your own custom actions in response to the Amazon SNS messages.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The set of parameters for this mitigation action. You can specify only one type of parameter (in other words, you can apply only one action for each defined mitigation action).</p>\"\
    },\
    \"MitigationActionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UPDATE_DEVICE_CERTIFICATE\",\
        \"UPDATE_CA_CERTIFICATE\",\
        \"ADD_THINGS_TO_THING_GROUP\",\
        \"REPLACE_DEFAULT_POLICY_VERSION\",\
        \"ENABLE_IOT_LOGGING\",\
        \"PUBLISH_FINDING_TO_SNS\"\
      ]\
    },\
    \"MitigationActionsTaskId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"ModelStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING_BUILD\",\
        \"ACTIVE\",\
        \"EXPIRED\"\
      ]\
    },\
    \"MqttClientId\":{\
      \"type\":\"string\",\
      \"max\":65535,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"MqttContext\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"username\":{\
          \"shape\":\"MqttUsername\",\
          \"documentation\":\"<p>The value of the <code>username</code> key in an MQTT authorization request.</p>\"\
        },\
        \"password\":{\
          \"shape\":\"MqttPassword\",\
          \"documentation\":\"<p>The value of the <code>password</code> key in an MQTT authorization request.</p>\"\
        },\
        \"clientId\":{\
          \"shape\":\"MqttClientId\",\
          \"documentation\":\"<p>The value of the <code>clientId</code> key in an MQTT authorization request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the MQTT context to use for the test authorizer request</p>\"\
    },\
    \"MqttHeaders\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"payloadFormatIndicator\":{\
          \"shape\":\"PayloadFormatIndicator\",\
          \"documentation\":\"<p>An <code>Enum</code> string value that indicates whether the payload is formatted as UTF-8.</p> <p>Valid values are <code>UNSPECIFIED_BYTES</code> and <code>UTF8_DATA</code>.</p> <p>For more information, see <a href=\\\"https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901111\\\"> Payload Format Indicator</a> from the MQTT Version 5.0 specification.</p> <p>Supports <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html\\\">substitution templates</a>.</p>\"\
        },\
        \"contentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>A UTF-8 encoded string that describes the content of the publishing message.</p> <p>For more information, see <a href=\\\"https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901118\\\"> Content Type</a> from the MQTT Version 5.0 specification.</p> <p>Supports <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html\\\">substitution templates</a>.</p>\"\
        },\
        \"responseTopic\":{\
          \"shape\":\"ResponseTopic\",\
          \"documentation\":\"<p>A UTF-8 encoded string that's used as the topic name for a response message. The response topic is used to describe the topic which the receiver should publish to as part of the request-response flow. The topic must not contain wildcard characters.</p> <p>For more information, see <a href=\\\"https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901114\\\"> Response Topic</a> from the MQTT Version 5.0 specification.</p> <p>Supports <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html\\\">substitution templates</a>.</p>\"\
        },\
        \"correlationData\":{\
          \"shape\":\"CorrelationData\",\
          \"documentation\":\"<p>The base64-encoded binary data used by the sender of the request message to identify which request the response message is for when it's received.</p> <p>For more information, see <a href=\\\"https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901115\\\"> Correlation Data</a> from the MQTT Version 5.0 specification.</p> <note> <p> This binary data must be based64-encoded. </p> </note> <p>Supports <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html\\\">substitution templates</a>.</p>\"\
        },\
        \"messageExpiry\":{\
          \"shape\":\"MessageExpiry\",\
          \"documentation\":\"<p>A user-defined integer value that will persist a message at the message broker for a specified amount of time to ensure that the message will expire if it's no longer relevant to the subscriber. The value of <code>messageExpiry</code> represents the number of seconds before it expires. For more information about the limits of <code>messageExpiry</code>, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html\\\">Amazon Web Services IoT Core message broker and protocol limits and quotas </a> from the Amazon Web Services Reference Guide.</p> <p>Supports <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html\\\">substitution templates</a>.</p>\"\
        },\
        \"userProperties\":{\
          \"shape\":\"UserProperties\",\
          \"documentation\":\"<p>An array of key-value pairs that you define in the MQTT5 header.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies MQTT Version 5.0 headers information. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html\\\"> MQTT</a> from Amazon Web Services IoT Core Developer Guide.</p>\"\
    },\
    \"MqttPassword\":{\
      \"type\":\"blob\",\
      \"max\":65535,\
      \"min\":1\
    },\
    \"MqttUsername\":{\
      \"type\":\"string\",\
      \"max\":65535,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"NamedShadowIndexingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"ON\"\
      ]\
    },\
    \"NamedShadowNamesFilter\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ShadowName\"}\
    },\
    \"NamespaceId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"NonCompliantChecksCount\":{\"type\":\"integer\"},\
    \"NonCompliantResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of the noncompliant resource.</p>\"\
        },\
        \"resourceIdentifier\":{\
          \"shape\":\"ResourceIdentifier\",\
          \"documentation\":\"<p>Information that identifies the noncompliant resource.</p>\"\
        },\
        \"additionalInfo\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p>Other information about the noncompliant resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the resource that was noncompliant with the audit check.</p>\"\
    },\
    \"NonCompliantResourcesCount\":{\"type\":\"long\"},\
    \"NotConfiguredException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource is not configured.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NullableBoolean\":{\"type\":\"boolean\"},\
    \"Number\":{\"type\":\"double\"},\
    \"NumberList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Number\"}\
    },\
    \"NumberOfRetries\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":0\
    },\
    \"NumberOfThings\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"OTAUpdateArn\":{\"type\":\"string\"},\
    \"OTAUpdateDescription\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"OTAUpdateErrorMessage\":{\"type\":\"string\"},\
    \"OTAUpdateFile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"fileName\":{\
          \"shape\":\"FileName\",\
          \"documentation\":\"<p>The name of the file.</p>\"\
        },\
        \"fileType\":{\
          \"shape\":\"FileType\",\
          \"documentation\":\"<p>An integer value you can include in the job document to allow your devices to identify the type of file received from the cloud.</p>\"\
        },\
        \"fileVersion\":{\
          \"shape\":\"OTAUpdateFileVersion\",\
          \"documentation\":\"<p>The file version.</p>\"\
        },\
        \"fileLocation\":{\
          \"shape\":\"FileLocation\",\
          \"documentation\":\"<p>The location of the updated firmware.</p>\"\
        },\
        \"codeSigning\":{\
          \"shape\":\"CodeSigning\",\
          \"documentation\":\"<p>The code signing method of the file.</p>\"\
        },\
        \"attributes\":{\
          \"shape\":\"AttributesMap\",\
          \"documentation\":\"<p>A list of name/attribute pairs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a file to be associated with an OTA update.</p>\"\
    },\
    \"OTAUpdateFileVersion\":{\"type\":\"string\"},\
    \"OTAUpdateFiles\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OTAUpdateFile\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"OTAUpdateId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"OTAUpdateInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"otaUpdateId\":{\
          \"shape\":\"OTAUpdateId\",\
          \"documentation\":\"<p>The OTA update ID.</p>\"\
        },\
        \"otaUpdateArn\":{\
          \"shape\":\"OTAUpdateArn\",\
          \"documentation\":\"<p>The OTA update ARN.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the OTA update was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the OTA update was last updated.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"OTAUpdateDescription\",\
          \"documentation\":\"<p>A description of the OTA update.</p>\"\
        },\
        \"targets\":{\
          \"shape\":\"Targets\",\
          \"documentation\":\"<p>The targets of the OTA update.</p>\"\
        },\
        \"protocols\":{\
          \"shape\":\"Protocols\",\
          \"documentation\":\"<p>The protocol used to transfer the OTA update image. Valid values are [HTTP], [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the target device can choose the protocol.</p>\"\
        },\
        \"awsJobExecutionsRolloutConfig\":{\
          \"shape\":\"AwsJobExecutionsRolloutConfig\",\
          \"documentation\":\"<p>Configuration for the rollout of OTA updates.</p>\"\
        },\
        \"awsJobPresignedUrlConfig\":{\
          \"shape\":\"AwsJobPresignedUrlConfig\",\
          \"documentation\":\"<p>Configuration information for pre-signed URLs. Valid when <code>protocols</code> contains HTTP.</p>\"\
        },\
        \"targetSelection\":{\
          \"shape\":\"TargetSelection\",\
          \"documentation\":\"<p>Specifies whether the OTA update will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the OTA update (SNAPSHOT). If continuous, the OTA update may also be run on a thing when a change is detected in a target. For example, an OTA update will run on a thing when the thing is added to a target group, even after the OTA update was completed by all things originally in the group. </p>\"\
        },\
        \"otaUpdateFiles\":{\
          \"shape\":\"OTAUpdateFiles\",\
          \"documentation\":\"<p>A list of files associated with the OTA update.</p>\"\
        },\
        \"otaUpdateStatus\":{\
          \"shape\":\"OTAUpdateStatus\",\
          \"documentation\":\"<p>The status of the OTA update.</p>\"\
        },\
        \"awsIotJobId\":{\
          \"shape\":\"AwsIotJobId\",\
          \"documentation\":\"<p>The IoT job ID associated with the OTA update.</p>\"\
        },\
        \"awsIotJobArn\":{\
          \"shape\":\"AwsIotJobArn\",\
          \"documentation\":\"<p>The IoT job ARN associated with the OTA update.</p>\"\
        },\
        \"errorInfo\":{\
          \"shape\":\"ErrorInfo\",\
          \"documentation\":\"<p>Error information associated with the OTA update.</p>\"\
        },\
        \"additionalParameters\":{\
          \"shape\":\"AdditionalParameterMap\",\
          \"documentation\":\"<p>A collection of name/value pairs</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an OTA update.</p>\"\
    },\
    \"OTAUpdateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE_PENDING\",\
        \"CREATE_IN_PROGRESS\",\
        \"CREATE_COMPLETE\",\
        \"CREATE_FAILED\"\
      ]\
    },\
    \"OTAUpdateSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"otaUpdateId\":{\
          \"shape\":\"OTAUpdateId\",\
          \"documentation\":\"<p>The OTA update ID.</p>\"\
        },\
        \"otaUpdateArn\":{\
          \"shape\":\"OTAUpdateArn\",\
          \"documentation\":\"<p>The OTA update ARN.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the OTA update was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An OTA update summary.</p>\"\
    },\
    \"OTAUpdatesSummary\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OTAUpdateSummary\"}\
    },\
    \"OpenSearchAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"endpoint\",\
        \"index\",\
        \"type\",\
        \"id\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role ARN that has access to OpenSearch.</p>\"\
        },\
        \"endpoint\":{\
          \"shape\":\"ElasticsearchEndpoint\",\
          \"documentation\":\"<p>The endpoint of your OpenSearch domain.</p>\"\
        },\
        \"index\":{\
          \"shape\":\"ElasticsearchIndex\",\
          \"documentation\":\"<p>The OpenSearch index where you want to store your data.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"ElasticsearchType\",\
          \"documentation\":\"<p>The type of document you are storing.</p>\"\
        },\
        \"id\":{\
          \"shape\":\"ElasticsearchId\",\
          \"documentation\":\"<p>The unique identifier for the document you are storing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that writes data to an Amazon OpenSearch Service domain.</p>\"\
    },\
    \"Optional\":{\"type\":\"boolean\"},\
    \"OptionalVersion\":{\"type\":\"long\"},\
    \"OutgoingCertificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The certificate ID.</p>\"\
        },\
        \"transferredTo\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The Amazon Web Services account to which the transfer was made.</p>\"\
        },\
        \"transferDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer was initiated.</p>\"\
        },\
        \"transferMessage\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The transfer message.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The certificate creation date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A certificate that has been transferred but not yet accepted.</p>\"\
    },\
    \"OutgoingCertificates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OutgoingCertificate\"}\
    },\
    \"OverrideDynamicGroups\":{\"type\":\"boolean\"},\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"Parameter\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"ParameterKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"ParameterMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ParameterKey\"},\
      \"value\":{\"shape\":\"ParameterValue\"}\
    },\
    \"ParameterValue\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"Parameters\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Parameter\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"PartitionKey\":{\"type\":\"string\"},\
    \"PayloadField\":{\"type\":\"string\"},\
    \"PayloadFormatIndicator\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"PayloadVersion\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":10,\
      \"pattern\":\"^[0-9-]+$\"\
    },\
    \"Percent\":{\
      \"type\":\"double\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"PercentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Percent\"}\
    },\
    \"PercentPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"percent\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The percentile.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"PercentValue\",\
          \"documentation\":\"<p>The value of the percentile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the percentile and percentile value.</p>\"\
    },\
    \"PercentValue\":{\"type\":\"double\"},\
    \"Percentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Percentiles\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PercentPair\"}\
    },\
    \"Platform\":{\"type\":\"string\"},\
    \"Policies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Policy\"}\
    },\
    \"Policy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an IoT policy.</p>\"\
    },\
    \"PolicyArn\":{\"type\":\"string\"},\
    \"PolicyDocument\":{\
      \"type\":\"string\",\
      \"max\":404600,\
      \"min\":0,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"PolicyDocuments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyDocument\"}\
    },\
    \"PolicyName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+=,.@-]+\"\
    },\
    \"PolicyNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyName\"}\
    },\
    \"PolicyTarget\":{\"type\":\"string\"},\
    \"PolicyTargets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyTarget\"}\
    },\
    \"PolicyTemplateName\":{\
      \"type\":\"string\",\
      \"enum\":[\"BLANK_POLICY\"]\
    },\
    \"PolicyVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"versionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\"\
        },\
        \"createDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the policy was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a policy version.</p>\"\
    },\
    \"PolicyVersionId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9]+\"\
    },\
    \"PolicyVersionIdentifier\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The ID of the version of the policy associated with the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the version of the policy associated with the resource.</p>\"\
    },\
    \"PolicyVersions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyVersion\"}\
    },\
    \"Port\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":0\
    },\
    \"Ports\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Port\"}\
    },\
    \"Prefix\":{\"type\":\"string\"},\
    \"PresignedUrlConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that grants grants permission to download files from the S3 bucket where the job data/updates are stored. The role must also grant permission for IoT to download the files.</p> <important> <p>For information about addressing the confused deputy problem, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/cross-service-confused-deputy-prevention.html\\\">cross-service confused deputy prevention</a> in the <i>Amazon Web Services IoT Core developer guide</i>.</p> </important>\"\
        },\
        \"expiresInSec\":{\
          \"shape\":\"ExpiresInSec\",\
          \"documentation\":\"<p>How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600, the default value is 3600 seconds. Pre-signed URLs are generated when Jobs receives an MQTT request for the job document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration for pre-signed S3 URLs.</p>\"\
    },\
    \"PrimitiveBoolean\":{\"type\":\"boolean\"},\
    \"Principal\":{\"type\":\"string\"},\
    \"PrincipalArn\":{\"type\":\"string\"},\
    \"PrincipalId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9]+\"\
    },\
    \"Principals\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PrincipalArn\"}\
    },\
    \"PrivateKey\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"ProcessingTargetName\":{\"type\":\"string\"},\
    \"ProcessingTargetNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProcessingTargetName\"}\
    },\
    \"Protocol\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MQTT\",\
        \"HTTP\"\
      ]\
    },\
    \"Protocols\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Protocol\"},\
      \"max\":2,\
      \"min\":1\
    },\
    \"ProvisioningHook\":{\
      \"type\":\"structure\",\
      \"required\":[\"targetArn\"],\
      \"members\":{\
        \"payloadVersion\":{\
          \"shape\":\"PayloadVersion\",\
          \"documentation\":\"<p>The payload that was sent to the target function.</p> <p> <i>Note:</i> Only Lambda functions are currently supported.</p>\"\
        },\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The ARN of the target function.</p> <p> <i>Note:</i> Only Lambda functions are currently supported.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure that contains <code>payloadVersion</code> and <code>targetArn</code>.</p>\"\
    },\
    \"ProvisioningTemplateListing\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProvisioningTemplateSummary\"}\
    },\
    \"ProvisioningTemplateSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateArn\":{\
          \"shape\":\"TemplateArn\",\
          \"documentation\":\"<p>The ARN of the provisioning template.</p>\"\
        },\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"TemplateDescription\",\
          \"documentation\":\"<p>The description of the provisioning template.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the provisioning template summary was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the provisioning template summary was last modified.</p>\"\
        },\
        \"enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>True if the fleet provision template is enabled, otherwise false.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"TemplateType\",\
          \"documentation\":\"<p>The type you define in a provisioning template. You can create a template with only one type. You can't change the template type after its creation. The default value is <code>FLEET_PROVISIONING</code>. For more information about provisioning template, see: <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html\\\">Provisioning template</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of information about a provisioning template.</p>\"\
    },\
    \"ProvisioningTemplateVersionListing\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProvisioningTemplateVersionSummary\"}\
    },\
    \"ProvisioningTemplateVersionSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"versionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The ID of the fleet provisioning template version.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the provisioning template version was created</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>True if the provisioning template version is the default version, otherwise false.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of information about a fleet provision template version.</p>\"\
    },\
    \"PublicKey\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"PublicKeyMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"KeyName\"},\
      \"value\":{\"shape\":\"KeyValue\"}\
    },\
    \"PublishFindingToSnsParams\":{\
      \"type\":\"structure\",\
      \"required\":[\"topicArn\"],\
      \"members\":{\
        \"topicArn\":{\
          \"shape\":\"SnsTopicArn\",\
          \"documentation\":\"<p>The ARN of the topic to which you want to publish the findings.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters to define a mitigation action that publishes findings to Amazon SNS. You can implement your own custom actions in response to the Amazon SNS messages.</p>\"\
    },\
    \"PutAssetPropertyValueEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\"propertyValues\"],\
      \"members\":{\
        \"entryId\":{\
          \"shape\":\"AssetPropertyEntryId\",\
          \"documentation\":\"<p>Optional. A unique identifier for this entry that you can define to better track which message caused an error in case of failure. Accepts substitution templates. Defaults to a new UUID.</p>\"\
        },\
        \"assetId\":{\
          \"shape\":\"AssetId\",\
          \"documentation\":\"<p>The ID of the IoT SiteWise asset. You must specify either a <code>propertyAlias</code> or both an <code>aliasId</code> and a <code>propertyId</code>. Accepts substitution templates.</p>\"\
        },\
        \"propertyId\":{\
          \"shape\":\"AssetPropertyId\",\
          \"documentation\":\"<p>The ID of the asset's property. You must specify either a <code>propertyAlias</code> or both an <code>aliasId</code> and a <code>propertyId</code>. Accepts substitution templates.</p>\"\
        },\
        \"propertyAlias\":{\
          \"shape\":\"AssetPropertyAlias\",\
          \"documentation\":\"<p>The name of the property alias associated with your asset property. You must specify either a <code>propertyAlias</code> or both an <code>aliasId</code> and a <code>propertyId</code>. Accepts substitution templates.</p>\"\
        },\
        \"propertyValues\":{\
          \"shape\":\"AssetPropertyValueList\",\
          \"documentation\":\"<p>A list of property values to insert that each contain timestamp, quality, and value (TQV) information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An asset property value entry containing the following information.</p>\"\
    },\
    \"PutAssetPropertyValueEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PutAssetPropertyValueEntry\"},\
      \"min\":1\
    },\
    \"PutItemInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"tableName\"],\
      \"members\":{\
        \"tableName\":{\
          \"shape\":\"TableName\",\
          \"documentation\":\"<p>The table where the message data will be written.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DynamoActionVS action that specifies the DynamoDB table to which the message data will be written.</p>\"\
    },\
    \"PutVerificationStateOnViolationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"violationId\",\
        \"verificationState\"\
      ],\
      \"members\":{\
        \"violationId\":{\
          \"shape\":\"ViolationId\",\
          \"documentation\":\"<p>The violation ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"violationId\"\
        },\
        \"verificationState\":{\
          \"shape\":\"VerificationState\",\
          \"documentation\":\"<p>The verification state of the violation.</p>\"\
        },\
        \"verificationStateDescription\":{\
          \"shape\":\"VerificationStateDescription\",\
          \"documentation\":\"<p>The description of the verification state of the violation (detect alarm).</p>\"\
        }\
      }\
    },\
    \"PutVerificationStateOnViolationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Qos\":{\
      \"type\":\"integer\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"QueryMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"QueryString\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"QueryVersion\":{\"type\":\"string\"},\
    \"QueueUrl\":{\"type\":\"string\"},\
    \"QueuedThings\":{\"type\":\"integer\"},\
    \"RangeKeyField\":{\"type\":\"string\"},\
    \"RangeKeyValue\":{\"type\":\"string\"},\
    \"RateIncreaseCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"numberOfNotifiedThings\":{\
          \"shape\":\"NumberOfThings\",\
          \"documentation\":\"<p>The threshold for number of notified things that will initiate the increase in rate of rollout.</p>\"\
        },\
        \"numberOfSucceededThings\":{\
          \"shape\":\"NumberOfThings\",\
          \"documentation\":\"<p>The threshold for number of succeeded things that will initiate the increase in rate of rollout.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Allows you to define a criteria to initiate the increase in rate of rollout for a job.</p>\"\
    },\
    \"ReasonCode\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[\\\\p{Upper}\\\\p{Digit}_]+\"\
    },\
    \"ReasonForNonCompliance\":{\"type\":\"string\"},\
    \"ReasonForNonComplianceCode\":{\"type\":\"string\"},\
    \"ReasonForNonComplianceCodes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReasonForNonComplianceCode\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"Recursive\":{\"type\":\"boolean\"},\
    \"RecursiveWithoutDefault\":{\"type\":\"boolean\"},\
    \"Regex\":{\"type\":\"string\"},\
    \"RegisterCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"caCertificate\"],\
      \"members\":{\
        \"caCertificate\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The CA certificate.</p>\"\
        },\
        \"verificationCertificate\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The private key verification certificate. If <code>certificateMode</code> is <code>SNI_ONLY</code>, the <code>verificationCertificate</code> field must be empty. If <code>certificateMode</code> is <code>DEFAULT</code> or not provided, the <code>verificationCertificate</code> field must not be empty. </p>\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"documentation\":\"<p>A boolean value that specifies if the CA certificate is set to active.</p> <p>Valid values: <code>ACTIVE | INACTIVE</code> </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\"\
        },\
        \"allowAutoRegistration\":{\
          \"shape\":\"AllowAutoRegistration\",\
          \"documentation\":\"<p>Allows this CA certificate to be used for auto registration of device certificates.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"allowAutoRegistration\"\
        },\
        \"registrationConfig\":{\
          \"shape\":\"RegistrationConfig\",\
          \"documentation\":\"<p>Information about the registration configuration.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Metadata which can be used to manage the CA certificate.</p> <note> <p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p> <p>For the CLI command-line parameter use format: &amp;&amp;tags \\\"key1=value1&amp;key2=value2...\\\"</p> <p>For the cli-input-json file use format: \\\"tags\\\": \\\"key1=value1&amp;key2=value2...\\\"</p> </note>\"\
        },\
        \"certificateMode\":{\
          \"shape\":\"CertificateMode\",\
          \"documentation\":\"<p>Describes the certificate mode in which the Certificate Authority (CA) will be registered. If the <code>verificationCertificate</code> field is not provided, set <code>certificateMode</code> to be <code>SNI_ONLY</code>. If the <code>verificationCertificate</code> field is provided, set <code>certificateMode</code> to be <code>DEFAULT</code>. When <code>certificateMode</code> is not provided, it defaults to <code>DEFAULT</code>. All the device certificates that are registered using this CA will be registered in the same certificate mode as the CA. For more information about certificate mode for device certificates, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode\\\"> certificate mode</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the RegisterCACertificate operation.</p>\"\
    },\
    \"RegisterCACertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The CA certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The CA certificate identifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the RegisterCACertificateResponse operation.</p>\"\
    },\
    \"RegisterCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificatePem\"],\
      \"members\":{\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"caCertificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The CA certificate used to sign the device certificate being registered.</p>\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActiveFlag\",\
          \"documentation\":\"<p>A boolean value that specifies if the certificate is set to active.</p> <p>Valid values: <code>ACTIVE | INACTIVE</code> </p>\",\
          \"deprecated\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\"\
        },\
        \"status\":{\
          \"shape\":\"CertificateStatus\",\
          \"documentation\":\"<p>The status of the register certificate request. Valid values that you can use include <code>ACTIVE</code>, <code>INACTIVE</code>, and <code>REVOKED</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the RegisterCertificate operation.</p>\"\
    },\
    \"RegisterCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The certificate identifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the RegisterCertificate operation.</p>\"\
    },\
    \"RegisterCertificateWithoutCARequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificatePem\"],\
      \"members\":{\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CertificateStatus\",\
          \"documentation\":\"<p>The status of the register certificate request.</p>\"\
        }\
      }\
    },\
    \"RegisterCertificateWithoutCAResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the registered certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the registered certificate. (The last part of the certificate ARN contains the certificate ID.</p>\"\
        }\
      }\
    },\
    \"RegisterThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateBody\"],\
      \"members\":{\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The provisioning template. See <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/provision-w-cert.html\\\">Provisioning Devices That Have Device Certificates</a> for more information.</p>\"\
        },\
        \"parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>The parameters for provisioning a thing. See <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html\\\">Provisioning Templates</a> for more information.</p>\"\
        }\
      }\
    },\
    \"RegisterThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"resourceArns\":{\
          \"shape\":\"ResourceArns\",\
          \"documentation\":\"<p>ARNs for the generated resources.</p>\"\
        }\
      }\
    },\
    \"RegistrationCode\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":64,\
      \"pattern\":\"(0x)?[a-fA-F0-9]+\"\
    },\
    \"RegistrationCodeValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>Additional information about the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The registration code is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"RegistrationConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The template body.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role.</p>\"\
        },\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The registration configuration.</p>\"\
    },\
    \"RegistryMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"RegistryS3BucketName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":3,\
      \"pattern\":\"[a-zA-Z0-9._-]+\"\
    },\
    \"RegistryS3KeyName\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9!_.*'()-\\\\/]+\"\
    },\
    \"RejectCertificateTransferRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\"\
        },\
        \"rejectReason\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The reason the certificate transfer was rejected.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the RejectCertificateTransfer operation.</p>\"\
    },\
    \"RejectedThings\":{\"type\":\"integer\"},\
    \"RelatedResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource.</p>\"\
        },\
        \"resourceIdentifier\":{\
          \"shape\":\"ResourceIdentifier\",\
          \"documentation\":\"<p>Information that identifies the resource.</p>\"\
        },\
        \"additionalInfo\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p>Other information about the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a related resource.</p>\"\
    },\
    \"RelatedResources\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelatedResource\"}\
    },\
    \"RemoveAuthorizerConfig\":{\"type\":\"boolean\"},\
    \"RemoveAutoRegistration\":{\"type\":\"boolean\"},\
    \"RemoveHook\":{\"type\":\"boolean\"},\
    \"RemoveThingFromBillingGroupRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group.</p>\"\
        },\
        \"billingGroupArn\":{\
          \"shape\":\"BillingGroupArn\",\
          \"documentation\":\"<p>The ARN of the billing group.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing to be removed from the billing group.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the thing to be removed from the billing group.</p>\"\
        }\
      }\
    },\
    \"RemoveThingFromBillingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveThingFromThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The group name.</p>\"\
        },\
        \"thingGroupArn\":{\
          \"shape\":\"ThingGroupArn\",\
          \"documentation\":\"<p>The group ARN.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing to remove from the group.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the thing to remove from the group.</p>\"\
        }\
      }\
    },\
    \"RemoveThingFromThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveThingType\":{\"type\":\"boolean\"},\
    \"RemovedThings\":{\"type\":\"integer\"},\
    \"ReplaceDefaultPolicyVersionParams\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateName\"],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"PolicyTemplateName\",\
          \"documentation\":\"<p>The name of the template to be applied. The only supported value is <code>BLANK_POLICY</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters to define a mitigation action that adds a blank policy to restrict permissions.</p>\"\
    },\
    \"ReplaceTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ruleName\",\
        \"topicRulePayload\"\
      ],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\"\
        },\
        \"topicRulePayload\":{\
          \"shape\":\"TopicRulePayload\",\
          \"documentation\":\"<p>The rule payload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ReplaceTopicRule operation.</p>\",\
      \"payload\":\"topicRulePayload\"\
    },\
    \"ReportType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ERRORS\",\
        \"RESULTS\"\
      ]\
    },\
    \"RepublishAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"topic\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"topic\":{\
          \"shape\":\"TopicPattern\",\
          \"documentation\":\"<p>The name of the MQTT topic.</p>\"\
        },\
        \"qos\":{\
          \"shape\":\"Qos\",\
          \"documentation\":\"<p>The Quality of Service (QoS) level to use when republishing messages. The default value is 0.</p>\"\
        },\
        \"headers\":{\
          \"shape\":\"MqttHeaders\",\
          \"documentation\":\"<p>MQTT Version 5.0 headers information. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html\\\"> MQTT</a> from the Amazon Web Services IoT Core Developer Guide.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to republish to another topic.</p>\"\
    },\
    \"ReservedDomainConfigurationName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w.:-]+\"\
    },\
    \"Resource\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        },\
        \"resourceId\":{\
          \"shape\":\"resourceId\",\
          \"documentation\":\"<p>The ID of the resource that caused the exception.</p>\"\
        },\
        \"resourceArn\":{\
          \"shape\":\"resourceArn\",\
          \"documentation\":\"<p>The ARN of the resource that caused the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceArn\":{\"type\":\"string\"},\
    \"ResourceArns\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceLogicalId\"},\
      \"value\":{\"shape\":\"ResourceArn\"}\
    },\
    \"ResourceIdentifier\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deviceCertificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate attached to the resource.</p>\"\
        },\
        \"caCertificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the CA certificate used to authorize the certificate.</p>\"\
        },\
        \"cognitoIdentityPoolId\":{\
          \"shape\":\"CognitoIdentityPoolId\",\
          \"documentation\":\"<p>The ID of the Amazon Cognito identity pool.</p>\"\
        },\
        \"clientId\":{\
          \"shape\":\"ClientId\",\
          \"documentation\":\"<p>The client ID.</p>\"\
        },\
        \"policyVersionIdentifier\":{\
          \"shape\":\"PolicyVersionIdentifier\",\
          \"documentation\":\"<p>The version of the policy associated with the resource.</p>\"\
        },\
        \"account\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The account with which the resource is associated.</p>\"\
        },\
        \"iamRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that has overly permissive actions.</p>\"\
        },\
        \"roleAliasArn\":{\
          \"shape\":\"RoleAliasArn\",\
          \"documentation\":\"<p>The ARN of the role alias that has overly permissive actions.</p>\"\
        },\
        \"issuerCertificateIdentifier\":{\
          \"shape\":\"IssuerCertificateIdentifier\",\
          \"documentation\":\"<p>The issuer certificate identifier.</p>\"\
        },\
        \"deviceCertificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the identified device certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information that identifies the noncompliant resource.</p>\"\
    },\
    \"ResourceLogicalId\":{\"type\":\"string\"},\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified resource does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourceRegistrationFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource registration failed.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEVICE_CERTIFICATE\",\
        \"CA_CERTIFICATE\",\
        \"IOT_POLICY\",\
        \"COGNITO_IDENTITY_POOL\",\
        \"CLIENT_ID\",\
        \"ACCOUNT_SETTINGS\",\
        \"ROLE_ALIAS\",\
        \"IAM_ROLE\",\
        \"ISSUER_CERTIFICATE\"\
      ]\
    },\
    \"Resources\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Resource\"}\
    },\
    \"ResponseTopic\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"RetryAttempt\":{\"type\":\"integer\"},\
    \"RetryCriteria\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"failureType\",\
        \"numberOfRetries\"\
      ],\
      \"members\":{\
        \"failureType\":{\
          \"shape\":\"RetryableFailureType\",\
          \"documentation\":\"<p>The type of job execution failures that can initiate a job retry.</p>\"\
        },\
        \"numberOfRetries\":{\
          \"shape\":\"NumberOfRetries\",\
          \"documentation\":\"<p>The number of retries allowed for a failure type for the job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The criteria that determines how many retries are allowed for each failure type for a job.</p>\"\
    },\
    \"RetryCriteriaList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RetryCriteria\"},\
      \"max\":2,\
      \"min\":1\
    },\
    \"RetryableFailureType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FAILED\",\
        \"TIMED_OUT\",\
        \"ALL\"\
      ]\
    },\
    \"RoleAlias\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w=,@-]+\"\
    },\
    \"RoleAliasArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"RoleAliasDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleAlias\":{\
          \"shape\":\"RoleAlias\",\
          \"documentation\":\"<p>The role alias.</p>\"\
        },\
        \"roleAliasArn\":{\
          \"shape\":\"RoleAliasArn\",\
          \"documentation\":\"<p>The ARN of the role alias.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The role ARN.</p>\"\
        },\
        \"owner\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The role alias owner.</p>\"\
        },\
        \"credentialDurationSeconds\":{\
          \"shape\":\"CredentialDurationSeconds\",\
          \"documentation\":\"<p>The number of seconds for which the credential is valid.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The UNIX timestamp of when the role alias was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The UNIX timestamp of when the role alias was last modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Role alias description.</p>\"\
    },\
    \"RoleAliases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoleAlias\"}\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"RolloutRatePerMinute\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"RuleArn\":{\"type\":\"string\"},\
    \"RuleName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9_]+$\"\
    },\
    \"S3Action\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"bucketName\",\
        \"key\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"bucketName\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The Amazon S3 bucket.</p>\"\
        },\
        \"key\":{\
          \"shape\":\"Key\",\
          \"documentation\":\"<p>The object key. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/list_amazons3.html\\\">Actions, resources, and condition keys for Amazon S3</a>.</p>\"\
        },\
        \"cannedAcl\":{\
          \"shape\":\"CannedAccessControlList\",\
          \"documentation\":\"<p>The Amazon S3 canned ACL that controls access to the object identified by the object key. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl\\\">S3 canned ACLs</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write data to an Amazon S3 bucket.</p>\"\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"S3Destination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The S3 bucket that contains the updated firmware.</p>\"\
        },\
        \"prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The S3 prefix.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the location of updated firmware in S3.</p>\"\
    },\
    \"S3FileUrl\":{\
      \"type\":\"string\",\
      \"max\":65535\
    },\
    \"S3FileUrlList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"S3FileUrl\"}\
    },\
    \"S3Key\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"S3Location\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The S3 bucket.</p>\"\
        },\
        \"key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The S3 key.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"S3Version\",\
          \"documentation\":\"<p>The S3 bucket version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The S3 location.</p>\"\
    },\
    \"S3Version\":{\"type\":\"string\"},\
    \"SQL\":{\"type\":\"string\"},\
    \"SalesforceAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"token\",\
        \"url\"\
      ],\
      \"members\":{\
        \"token\":{\
          \"shape\":\"SalesforceToken\",\
          \"documentation\":\"<p>The token used to authenticate access to the Salesforce IoT Cloud Input Stream. The token is available from the Salesforce IoT Cloud platform after creation of the Input Stream.</p>\"\
        },\
        \"url\":{\
          \"shape\":\"SalesforceEndpoint\",\
          \"documentation\":\"<p>The URL exposed by the Salesforce IoT Cloud Input Stream. The URL is available from the Salesforce IoT Cloud platform after creation of the Input Stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write a message to a Salesforce IoT Cloud Input Stream.</p>\"\
    },\
    \"SalesforceEndpoint\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"pattern\":\"https://ingestion-[a-zA-Z0-9]{1,12}\\\\.[a-zA-Z0-9]+\\\\.((sfdc-matrix\\\\.net)|(sfdcnow\\\\.com))/streams/\\\\w{1,20}/\\\\w{1,20}/event\"\
    },\
    \"SalesforceToken\":{\
      \"type\":\"string\",\
      \"min\":40\
    },\
    \"ScheduledAuditArn\":{\"type\":\"string\"},\
    \"ScheduledAuditMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"scheduledAuditName\":{\
          \"shape\":\"ScheduledAuditName\",\
          \"documentation\":\"<p>The name of the scheduled audit.</p>\"\
        },\
        \"scheduledAuditArn\":{\
          \"shape\":\"ScheduledAuditArn\",\
          \"documentation\":\"<p>The ARN of the scheduled audit.</p>\"\
        },\
        \"frequency\":{\
          \"shape\":\"AuditFrequency\",\
          \"documentation\":\"<p>How often the scheduled audit occurs.</p>\"\
        },\
        \"dayOfMonth\":{\
          \"shape\":\"DayOfMonth\",\
          \"documentation\":\"<p>The day of the month on which the scheduled audit is run (if the <code>frequency</code> is \\\"MONTHLY\\\"). If days 29-31 are specified, and the month does not have that many days, the audit takes place on the \\\"LAST\\\" day of the month.</p>\"\
        },\
        \"dayOfWeek\":{\
          \"shape\":\"DayOfWeek\",\
          \"documentation\":\"<p>The day of the week on which the scheduled audit is run (if the <code>frequency</code> is \\\"WEEKLY\\\" or \\\"BIWEEKLY\\\").</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the scheduled audit.</p>\"\
    },\
    \"ScheduledAuditMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScheduledAuditMetadata\"}\
    },\
    \"ScheduledAuditName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"ScheduledJobRollout\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"startTime\":{\
          \"shape\":\"StringDateTime\",\
          \"documentation\":\"<p>Displays the start times of the next seven maintenance window occurrences.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Displays the next seven maintenance window occurrences and their start times.</p>\"\
    },\
    \"ScheduledJobRolloutList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScheduledJobRollout\"}\
    },\
    \"SchedulingConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"startTime\":{\
          \"shape\":\"StringDateTime\",\
          \"documentation\":\"<p>The time a job will begin rollout of the job document to all devices in the target group for a job. The <code>startTime</code> can be scheduled up to a year in advance and must be scheduled a minimum of thirty minutes from the current time. The date and time format for the <code>startTime</code> is YYYY-MM-DD for the date and HH:MM for the time.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"StringDateTime\",\
          \"documentation\":\"<p>The time a job will stop rollout of the job document to all devices in the target group for a job. The <code>endTime</code> must take place no later than two years from the current time and be scheduled a minimum of thirty minutes from the current time. The minimum duration between <code>startTime</code> and <code>endTime</code> is thirty minutes. The maximum duration between <code>startTime</code> and <code>endTime</code> is two years. The date and time format for the <code>endTime</code> is YYYY-MM-DD for the date and HH:MM for the time.</p>\"\
        },\
        \"endBehavior\":{\
          \"shape\":\"JobEndBehavior\",\
          \"documentation\":\"<p>Specifies the end behavior for all job executions after a job reaches the selected <code>endTime</code>. If <code>endTime</code> is not selected when creating the job, then <code>endBehavior</code> does not apply.</p>\"\
        },\
        \"maintenanceWindows\":{\
          \"shape\":\"MaintenanceWindows\",\
          \"documentation\":\"<p>An optional configuration within the <code>SchedulingConfig</code> to setup a recurring maintenance window with a predetermined start time and duration for the rollout of a job document to all devices in a target group for a job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the date and time that a job will begin the rollout of the job document to all devices in the target group. Additionally, you can specify the end behavior for each job execution when it reaches the scheduled end time.</p>\"\
    },\
    \"SearchIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryString\"],\
      \"members\":{\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The search index name.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The search query string. For more information about the search query syntax, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html\\\">Query syntax</a>.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"QueryMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The query version.</p>\"\
        }\
      }\
    },\
    \"SearchIndexResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>\"\
        },\
        \"things\":{\
          \"shape\":\"ThingDocumentList\",\
          \"documentation\":\"<p>The things that match the search query.</p>\"\
        },\
        \"thingGroups\":{\
          \"shape\":\"ThingGroupDocumentList\",\
          \"documentation\":\"<p>The thing groups that match the search query.</p>\"\
        }\
      }\
    },\
    \"SearchableAttributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeName\"}\
    },\
    \"Seconds\":{\"type\":\"integer\"},\
    \"SecurityGroupId\":{\"type\":\"string\"},\
    \"SecurityGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"}\
    },\
    \"SecurityProfileArn\":{\"type\":\"string\"},\
    \"SecurityProfileDescription\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"SecurityProfileIdentifier\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"arn\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name you've given to the security profile.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"SecurityProfileArn\",\
          \"documentation\":\"<p>The ARN of the security profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifying information for a Device Defender security profile.</p>\"\
    },\
    \"SecurityProfileIdentifiers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileIdentifier\"}\
    },\
    \"SecurityProfileName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"SecurityProfileTarget\":{\
      \"type\":\"structure\",\
      \"required\":[\"arn\"],\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"SecurityProfileTargetArn\",\
          \"documentation\":\"<p>The ARN of the security profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A target to which an alert is sent when a security profile behavior is violated.</p>\"\
    },\
    \"SecurityProfileTargetArn\":{\"type\":\"string\"},\
    \"SecurityProfileTargetMapping\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileIdentifier\":{\
          \"shape\":\"SecurityProfileIdentifier\",\
          \"documentation\":\"<p>Information that identifies the security profile.</p>\"\
        },\
        \"target\":{\
          \"shape\":\"SecurityProfileTarget\",\
          \"documentation\":\"<p>Information about the target (thing group) associated with the security profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a security profile and the target associated with it.</p>\"\
    },\
    \"SecurityProfileTargetMappings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileTargetMapping\"}\
    },\
    \"SecurityProfileTargets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileTarget\"}\
    },\
    \"ServerCertificateArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AcmCertificateArn\"},\
      \"max\":1,\
      \"min\":0\
    },\
    \"ServerCertificateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INVALID\",\
        \"VALID\"\
      ]\
    },\
    \"ServerCertificateStatusDetail\":{\"type\":\"string\"},\
    \"ServerCertificateSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"serverCertificateArn\":{\
          \"shape\":\"AcmCertificateArn\",\
          \"documentation\":\"<p>The ARN of the server certificate.</p>\"\
        },\
        \"serverCertificateStatus\":{\
          \"shape\":\"ServerCertificateStatus\",\
          \"documentation\":\"<p>The status of the server certificate.</p>\"\
        },\
        \"serverCertificateStatusDetail\":{\
          \"shape\":\"ServerCertificateStatusDetail\",\
          \"documentation\":\"<p>Details that explain the status of the server certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about a server certificate.</p>\"\
    },\
    \"ServerCertificates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ServerCertificateSummary\"}\
    },\
    \"ServerName\":{\
      \"type\":\"string\",\
      \"max\":253,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"ServiceName\":{\"type\":\"string\"},\
    \"ServiceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DATA\",\
        \"CREDENTIAL_PROVIDER\",\
        \"JOBS\"\
      ]\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The service is temporarily unavailable.</p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"SetAsActive\":{\"type\":\"boolean\"},\
    \"SetAsActiveFlag\":{\"type\":\"boolean\"},\
    \"SetAsDefault\":{\"type\":\"boolean\"},\
    \"SetDefaultAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"authorizerName\"],\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer name.</p>\"\
        }\
      }\
    },\
    \"SetDefaultAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer name.</p>\"\
        },\
        \"authorizerArn\":{\
          \"shape\":\"AuthorizerArn\",\
          \"documentation\":\"<p>The authorizer ARN.</p>\"\
        }\
      }\
    },\
    \"SetDefaultPolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyVersionId\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyVersionId\"\
        }\
      },\
      \"documentation\":\"<p>The input for the SetDefaultPolicyVersion operation.</p>\"\
    },\
    \"SetLoggingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"loggingOptionsPayload\"],\
      \"members\":{\
        \"loggingOptionsPayload\":{\
          \"shape\":\"LoggingOptionsPayload\",\
          \"documentation\":\"<p>The logging options payload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the SetLoggingOptions operation.</p>\",\
      \"payload\":\"loggingOptionsPayload\"\
    },\
    \"SetV2LoggingLevelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logTarget\",\
        \"logLevel\"\
      ],\
      \"members\":{\
        \"logTarget\":{\
          \"shape\":\"LogTarget\",\
          \"documentation\":\"<p>The log target.</p>\"\
        },\
        \"logLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The log level.</p>\"\
        }\
      }\
    },\
    \"SetV2LoggingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the role that allows IoT to write to Cloudwatch logs.</p>\"\
        },\
        \"defaultLogLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The default logging level.</p>\"\
        },\
        \"disableAllLogs\":{\
          \"shape\":\"DisableAllLogs\",\
          \"documentation\":\"<p>If true all logs are disabled. The default is false.</p>\"\
        }\
      }\
    },\
    \"ShadowName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"SigV4Authorization\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"signingRegion\",\
        \"serviceName\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"signingRegion\":{\
          \"shape\":\"SigningRegion\",\
          \"documentation\":\"<p>The signing region.</p>\"\
        },\
        \"serviceName\":{\
          \"shape\":\"ServiceName\",\
          \"documentation\":\"<p>The service name to use while signing with Sig V4.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the signing role.</p>\"\
        }\
      },\
      \"documentation\":\"<p>For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 signing process</a>.</p>\"\
    },\
    \"Signature\":{\"type\":\"blob\"},\
    \"SignatureAlgorithm\":{\"type\":\"string\"},\
    \"SigningJobId\":{\"type\":\"string\"},\
    \"SigningProfileName\":{\"type\":\"string\"},\
    \"SigningProfileParameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>Certificate ARN.</p>\"\
        },\
        \"platform\":{\
          \"shape\":\"Platform\",\
          \"documentation\":\"<p>The hardware platform of your device.</p>\"\
        },\
        \"certificatePathOnDevice\":{\
          \"shape\":\"CertificatePathOnDevice\",\
          \"documentation\":\"<p>The location of the code-signing certificate on your device.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the code-signing profile.</p>\"\
    },\
    \"SigningRegion\":{\"type\":\"string\"},\
    \"SkippedFindingsCount\":{\"type\":\"long\"},\
    \"SkyfallMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"SnsAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"targetArn\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"targetArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the SNS topic.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"messageFormat\":{\
          \"shape\":\"MessageFormat\",\
          \"documentation\":\"<p>(Optional) The message format of the message to publish. Accepted values are \\\"JSON\\\" and \\\"RAW\\\". The default value of the attribute is \\\"RAW\\\". SNS uses this setting to determine if the payload should be parsed and relevant platform-specific bits of the payload should be extracted. To read more about SNS message formats, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/json-formats.html\\\">https://docs.aws.amazon.com/sns/latest/dg/json-formats.html</a> refer to their official documentation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to publish to an Amazon SNS topic.</p>\"\
    },\
    \"SnsTopicArn\":{\
      \"type\":\"string\",\
      \"max\":350\
    },\
    \"SqlParseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Rule-SQL expression can't be parsed correctly.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"SqsAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"queueUrl\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"queueUrl\":{\
          \"shape\":\"QueueUrl\",\
          \"documentation\":\"<p>The URL of the Amazon SQS queue.</p>\"\
        },\
        \"useBase64\":{\
          \"shape\":\"UseBase64\",\
          \"documentation\":\"<p>Specifies whether to use Base64 encoding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to publish data to an Amazon SQS queue.</p>\"\
    },\
    \"StartAuditMitigationActionsTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"taskId\",\
        \"target\",\
        \"auditCheckToActionsMapping\",\
        \"clientRequestToken\"\
      ],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p>A unique identifier for the task. You can use this identifier to check the status of the task or to cancel it.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        },\
        \"target\":{\
          \"shape\":\"AuditMitigationActionsTaskTarget\",\
          \"documentation\":\"<p>Specifies the audit findings to which the mitigation actions are applied. You can apply them to a type of audit check, to all findings from an audit, or to a specific set of findings.</p>\"\
        },\
        \"auditCheckToActionsMapping\":{\
          \"shape\":\"AuditCheckToActionsMapping\",\
          \"documentation\":\"<p>For an audit check, specifies which mitigation actions to apply. Those actions must be defined in your Amazon Web Services accounts.</p>\"\
        },\
        \"clientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Each audit mitigation task must have a unique client request token. If you try to start a new task with the same token as a task that already exists, an exception occurs. If you omit this value, a unique client request token is generated automatically.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"StartAuditMitigationActionsTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p>The unique identifier for the audit mitigation task. This matches the <code>taskId</code> that you specified in the request.</p>\"\
        }\
      }\
    },\
    \"StartDetectMitigationActionsTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"taskId\",\
        \"target\",\
        \"actions\",\
        \"clientRequestToken\"\
      ],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p> The unique identifier of the task. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        },\
        \"target\":{\
          \"shape\":\"DetectMitigationActionsTaskTarget\",\
          \"documentation\":\"<p> Specifies the ML Detect findings to which the mitigation actions are applied. </p>\"\
        },\
        \"actions\":{\
          \"shape\":\"DetectMitigationActionsToExecuteList\",\
          \"documentation\":\"<p> The actions to be performed when a device has unexpected behavior. </p>\"\
        },\
        \"violationEventOccurrenceRange\":{\
          \"shape\":\"ViolationEventOccurrenceRange\",\
          \"documentation\":\"<p> Specifies the time period of which violation events occurred between. </p>\"\
        },\
        \"includeOnlyActiveViolations\":{\
          \"shape\":\"NullableBoolean\",\
          \"documentation\":\"<p> Specifies to list only active violations. </p>\"\
        },\
        \"includeSuppressedAlerts\":{\
          \"shape\":\"NullableBoolean\",\
          \"documentation\":\"<p> Specifies to include suppressed alerts. </p>\"\
        },\
        \"clientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p> Each mitigation action task must have a unique client request token. If you try to create a new task with the same token as a task that already exists, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request. </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"StartDetectMitigationActionsTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"MitigationActionsTaskId\",\
          \"documentation\":\"<p> The unique identifier of the task. </p>\"\
        }\
      }\
    },\
    \"StartOnDemandAuditTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"targetCheckNames\"],\
      \"members\":{\
        \"targetCheckNames\":{\
          \"shape\":\"TargetAuditCheckNames\",\
          \"documentation\":\"<p>Which checks are performed during the audit. The checks you specify must be enabled for your account or an exception occurs. Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.</p>\"\
        }\
      }\
    },\
    \"StartOnDemandAuditTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"AuditTaskId\",\
          \"documentation\":\"<p>The ID of the on-demand audit you started.</p>\"\
        }\
      }\
    },\
    \"StartSigningJobParameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"signingProfileParameter\":{\
          \"shape\":\"SigningProfileParameter\",\
          \"documentation\":\"<p>Describes the code-signing profile.</p>\"\
        },\
        \"signingProfileName\":{\
          \"shape\":\"SigningProfileName\",\
          \"documentation\":\"<p>The code-signing profile name.</p>\"\
        },\
        \"destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>The location to write the code-signed file.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information required to start a signing job.</p>\"\
    },\
    \"StartThingRegistrationTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"templateBody\",\
        \"inputFileBucket\",\
        \"inputFileKey\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"templateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The provisioning template.</p>\"\
        },\
        \"inputFileBucket\":{\
          \"shape\":\"RegistryS3BucketName\",\
          \"documentation\":\"<p>The S3 bucket that contains the input file.</p>\"\
        },\
        \"inputFileKey\":{\
          \"shape\":\"RegistryS3KeyName\",\
          \"documentation\":\"<p>The name of input file within the S3 bucket. This file contains a newline delimited JSON file. Each line contains the parameter values to provision one device (thing).</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The IAM role ARN that grants permission the input file.</p>\"\
        }\
      }\
    },\
    \"StartThingRegistrationTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>The bulk thing provisioning task ID.</p>\"\
        }\
      }\
    },\
    \"StateMachineName\":{\"type\":\"string\"},\
    \"StateReason\":{\"type\":\"string\"},\
    \"StateValue\":{\"type\":\"string\"},\
    \"StatisticalThreshold\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"statistic\":{\
          \"shape\":\"EvaluationStatistic\",\
          \"documentation\":\"<p>The percentile that resolves to a threshold value by which compliance with a behavior is determined. Metrics are collected over the specified period (<code>durationSeconds</code>) from all reporting devices in your account and statistical ranks are calculated. Then, the measurements from a device are collected over the same period. If the accumulated measurements from the device fall above or below (<code>comparisonOperator</code>) the value associated with the percentile specified, then the device is considered to be in compliance with the behavior, otherwise a violation occurs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A statistical ranking (percentile) that indicates a threshold value by which a behavior is determined to be in compliance or in violation of the behavior.</p>\"\
    },\
    \"Statistics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"count\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The count of things that match the query string criteria and contain a valid aggregation field value.</p>\"\
        },\
        \"average\":{\
          \"shape\":\"Average\",\
          \"documentation\":\"<p>The average of the aggregated field values.</p>\",\
          \"box\":true\
        },\
        \"sum\":{\
          \"shape\":\"Sum\",\
          \"documentation\":\"<p>The sum of the aggregated field values.</p>\",\
          \"box\":true\
        },\
        \"minimum\":{\
          \"shape\":\"Minimum\",\
          \"documentation\":\"<p>The minimum aggregated field value.</p>\",\
          \"box\":true\
        },\
        \"maximum\":{\
          \"shape\":\"Maximum\",\
          \"documentation\":\"<p>The maximum aggregated field value.</p>\",\
          \"box\":true\
        },\
        \"sumOfSquares\":{\
          \"shape\":\"SumOfSquares\",\
          \"documentation\":\"<p>The sum of the squares of the aggregated field values.</p>\",\
          \"box\":true\
        },\
        \"variance\":{\
          \"shape\":\"Variance\",\
          \"documentation\":\"<p>The variance of the aggregated field values.</p>\",\
          \"box\":true\
        },\
        \"stdDeviation\":{\
          \"shape\":\"StdDeviation\",\
          \"documentation\":\"<p>The standard deviation of the aggregated field values.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>A map of key-value pairs for all supported statistics. For issues with missing or unexpected values for this API, consult <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/fleet-indexing-troubleshooting.html\\\"> Fleet indexing troubleshooting guide</a>.</p>\"\
    },\
    \"Status\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Cancelled\",\
        \"Cancelling\"\
      ]\
    },\
    \"StdDeviation\":{\"type\":\"double\"},\
    \"StepFunctionsAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"stateMachineName\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"executionNamePrefix\":{\
          \"shape\":\"ExecutionNamePrefix\",\
          \"documentation\":\"<p>(Optional) A name will be given to the state machine execution consisting of this prefix followed by a UUID. Step Functions automatically creates a unique name for each state machine execution if one is not provided.</p>\"\
        },\
        \"stateMachineName\":{\
          \"shape\":\"StateMachineName\",\
          \"documentation\":\"<p>The name of the Step Functions state machine whose execution will be started.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the role that grants IoT permission to start execution of a state machine (\\\"Action\\\":\\\"states:StartExecution\\\").</p>\"\
        }\
      },\
      \"documentation\":\"<p>Starts execution of a Step Functions state machine.</p>\"\
    },\
    \"StopThingRegistrationTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>The bulk thing provisioning task ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"taskId\"\
        }\
      }\
    },\
    \"StopThingRegistrationTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Stream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\"\
        },\
        \"fileId\":{\
          \"shape\":\"FileId\",\
          \"documentation\":\"<p>The ID of a file associated with a stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a group of files that can be streamed.</p>\"\
    },\
    \"StreamArn\":{\"type\":\"string\"},\
    \"StreamDescription\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[^\\\\p{C}]+\"\
    },\
    \"StreamFile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"fileId\":{\
          \"shape\":\"FileId\",\
          \"documentation\":\"<p>The file ID.</p>\"\
        },\
        \"s3Location\":{\
          \"shape\":\"S3Location\",\
          \"documentation\":\"<p>The location of the file in S3.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a file to stream.</p>\"\
    },\
    \"StreamFiles\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StreamFile\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"StreamId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"StreamInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\"\
        },\
        \"streamArn\":{\
          \"shape\":\"StreamArn\",\
          \"documentation\":\"<p>The stream ARN.</p>\"\
        },\
        \"streamVersion\":{\
          \"shape\":\"StreamVersion\",\
          \"documentation\":\"<p>The stream version.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"StreamDescription\",\
          \"documentation\":\"<p>The description of the stream.</p>\"\
        },\
        \"files\":{\
          \"shape\":\"StreamFiles\",\
          \"documentation\":\"<p>The files to stream.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the stream was created.</p>\"\
        },\
        \"lastUpdatedAt\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the stream was last updated.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>An IAM role IoT assumes to access your S3 files.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a stream.</p>\"\
    },\
    \"StreamName\":{\"type\":\"string\"},\
    \"StreamSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\"\
        },\
        \"streamArn\":{\
          \"shape\":\"StreamArn\",\
          \"documentation\":\"<p>The stream ARN.</p>\"\
        },\
        \"streamVersion\":{\
          \"shape\":\"StreamVersion\",\
          \"documentation\":\"<p>The stream version.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"StreamDescription\",\
          \"documentation\":\"<p>A description of the stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of a stream.</p>\"\
    },\
    \"StreamVersion\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":0\
    },\
    \"StreamsSummary\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StreamSummary\"}\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringDateTime\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"stringValue\"}\
    },\
    \"StringMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"String\"}\
    },\
    \"SubnetId\":{\"type\":\"string\"},\
    \"SubnetIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"}\
    },\
    \"SucceededFindingsCount\":{\"type\":\"long\"},\
    \"SucceededThings\":{\"type\":\"integer\"},\
    \"Sum\":{\"type\":\"double\"},\
    \"SumOfSquares\":{\"type\":\"double\"},\
    \"SuppressAlerts\":{\"type\":\"boolean\"},\
    \"SuppressIndefinitely\":{\"type\":\"boolean\"},\
    \"SuppressedNonCompliantResourcesCount\":{\"type\":\"long\"},\
    \"TableName\":{\"type\":\"string\"},\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The tag's key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The tag's value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A set of key/value pairs that are used to manage the resource.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The ARN of the resource.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The new or modified tags for the resource.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"Target\":{\"type\":\"string\"},\
    \"TargetArn\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"TargetAuditCheckNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuditCheckName\"}\
    },\
    \"TargetSelection\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONTINUOUS\",\
        \"SNAPSHOT\"\
      ]\
    },\
    \"TargetViolationIdsForDetectMitigationActions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ViolationId\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"Targets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Target\"},\
      \"min\":1\
    },\
    \"TaskAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p> This exception occurs if you attempt to start a task with the same task-id as an existing task but with a different clientRequestToken. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TaskId\":{\
      \"type\":\"string\",\
      \"max\":40\
    },\
    \"TaskIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TaskId\"}\
    },\
    \"TaskStatistics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"totalChecks\":{\
          \"shape\":\"TotalChecksCount\",\
          \"documentation\":\"<p>The number of checks in this audit.</p>\"\
        },\
        \"inProgressChecks\":{\
          \"shape\":\"InProgressChecksCount\",\
          \"documentation\":\"<p>The number of checks in progress.</p>\"\
        },\
        \"waitingForDataCollectionChecks\":{\
          \"shape\":\"WaitingForDataCollectionChecksCount\",\
          \"documentation\":\"<p>The number of checks waiting for data collection.</p>\"\
        },\
        \"compliantChecks\":{\
          \"shape\":\"CompliantChecksCount\",\
          \"documentation\":\"<p>The number of checks that found compliant resources.</p>\"\
        },\
        \"nonCompliantChecks\":{\
          \"shape\":\"NonCompliantChecksCount\",\
          \"documentation\":\"<p>The number of checks that found noncompliant resources.</p>\"\
        },\
        \"failedChecks\":{\
          \"shape\":\"FailedChecksCount\",\
          \"documentation\":\"<p>The number of checks.</p>\"\
        },\
        \"canceledChecks\":{\
          \"shape\":\"CanceledChecksCount\",\
          \"documentation\":\"<p>The number of checks that did not run because the audit was canceled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Statistics for the checks performed during the audit.</p>\"\
    },\
    \"TaskStatisticsForAuditCheck\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"totalFindingsCount\":{\
          \"shape\":\"TotalFindingsCount\",\
          \"documentation\":\"<p>The total number of findings to which a task is being applied.</p>\"\
        },\
        \"failedFindingsCount\":{\
          \"shape\":\"FailedFindingsCount\",\
          \"documentation\":\"<p>The number of findings for which at least one of the actions failed when applied.</p>\"\
        },\
        \"succeededFindingsCount\":{\
          \"shape\":\"SucceededFindingsCount\",\
          \"documentation\":\"<p>The number of findings for which all mitigation actions succeeded when applied.</p>\"\
        },\
        \"skippedFindingsCount\":{\
          \"shape\":\"SkippedFindingsCount\",\
          \"documentation\":\"<p>The number of findings skipped because of filter conditions provided in the parameters to the command.</p>\"\
        },\
        \"canceledFindingsCount\":{\
          \"shape\":\"CanceledFindingsCount\",\
          \"documentation\":\"<p>The number of findings to which the mitigation action task was canceled when applied.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary counts of how many tasks for findings are in a particular state. This information is included in the response from DescribeAuditMitigationActionsTask.</p>\"\
    },\
    \"TemplateArn\":{\"type\":\"string\"},\
    \"TemplateBody\":{\
      \"type\":\"string\",\
      \"max\":10240,\
      \"min\":0,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"TemplateDescription\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\"[^\\\\p{C}]*\"\
    },\
    \"TemplateName\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":1,\
      \"pattern\":\"^[0-9A-Za-z_-]+$\"\
    },\
    \"TemplateType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FLEET_PROVISIONING\",\
        \"JITP\"\
      ]\
    },\
    \"TemplateVersionId\":{\"type\":\"integer\"},\
    \"TermsAggregation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"maxBuckets\":{\
          \"shape\":\"MaxBuckets\",\
          \"documentation\":\"<p>The number of buckets to return in the response. Default to 10.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Performs an aggregation that will return a list of buckets. The list of buckets is a ranked list of the number of occurrences of an aggregation field value.</p>\"\
    },\
    \"TestAuthorizationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"authInfos\"],\
      \"members\":{\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>\"\
        },\
        \"cognitoIdentityPoolId\":{\
          \"shape\":\"CognitoIdentityPoolId\",\
          \"documentation\":\"<p>The Cognito identity pool ID.</p>\"\
        },\
        \"authInfos\":{\
          \"shape\":\"AuthInfos\",\
          \"documentation\":\"<p>A list of authorization info objects. Simulating authorization will create a response for each <code>authInfo</code> object in the list.</p>\"\
        },\
        \"clientId\":{\
          \"shape\":\"ClientId\",\
          \"documentation\":\"<p>The MQTT client ID.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"clientId\"\
        },\
        \"policyNamesToAdd\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>When testing custom authorization, the policies specified here are treated as if they are attached to the principal being authorized.</p>\"\
        },\
        \"policyNamesToSkip\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>When testing custom authorization, the policies specified here are treated as if they are not attached to the principal being authorized.</p>\"\
        }\
      }\
    },\
    \"TestAuthorizationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authResults\":{\
          \"shape\":\"AuthResults\",\
          \"documentation\":\"<p>The authentication results.</p>\"\
        }\
      }\
    },\
    \"TestInvokeAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"authorizerName\"],\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The custom authorizer name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"authorizerName\"\
        },\
        \"token\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The token returned by your custom authentication service.</p>\"\
        },\
        \"tokenSignature\":{\
          \"shape\":\"TokenSignature\",\
          \"documentation\":\"<p>The signature made with the token and your custom authentication service's private key. This value must be Base-64-encoded.</p>\"\
        },\
        \"httpContext\":{\
          \"shape\":\"HttpContext\",\
          \"documentation\":\"<p>Specifies a test HTTP authorization request.</p>\"\
        },\
        \"mqttContext\":{\
          \"shape\":\"MqttContext\",\
          \"documentation\":\"<p>Specifies a test MQTT authorization request.</p>\"\
        },\
        \"tlsContext\":{\
          \"shape\":\"TlsContext\",\
          \"documentation\":\"<p>Specifies a test TLS authorization request.</p>\"\
        }\
      }\
    },\
    \"TestInvokeAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"isAuthenticated\":{\
          \"shape\":\"IsAuthenticated\",\
          \"documentation\":\"<p>True if the token is authenticated, otherwise false.</p>\"\
        },\
        \"principalId\":{\
          \"shape\":\"PrincipalId\",\
          \"documentation\":\"<p>The principal ID.</p>\"\
        },\
        \"policyDocuments\":{\
          \"shape\":\"PolicyDocuments\",\
          \"documentation\":\"<p>IAM policy documents.</p>\"\
        },\
        \"refreshAfterInSeconds\":{\
          \"shape\":\"Seconds\",\
          \"documentation\":\"<p>The number of seconds after which the temporary credentials are refreshed.</p>\"\
        },\
        \"disconnectAfterInSeconds\":{\
          \"shape\":\"Seconds\",\
          \"documentation\":\"<p>The number of seconds after which the connection is terminated.</p>\"\
        }\
      }\
    },\
    \"ThingArn\":{\"type\":\"string\"},\
    \"ThingAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type, if the thing has been associated with a type.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The thing ARN.</p>\"\
        },\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A list of thing attributes which are name-value pairs.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the thing record in the registry.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The properties of the thing, including thing name, thing type name, and a list of thing attributes.</p>\"\
    },\
    \"ThingAttributeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingAttribute\"}\
    },\
    \"ThingConnectivity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"connected\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>True if the thing is connected to the Amazon Web Services IoT Core service; false if it is not connected.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"ConnectivityTimestamp\",\
          \"documentation\":\"<p>The epoch time (in milliseconds) when the thing last connected or disconnected. If the thing has been disconnected for approximately an hour, the time value might be missing.</p>\"\
        },\
        \"disconnectReason\":{\
          \"shape\":\"DisconnectReason\",\
          \"documentation\":\"<p>The reason why the client is disconnected. If the thing has been disconnected for approximately an hour, the <code>disconnectReason</code> value might be missing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The connectivity status of the thing.</p>\"\
    },\
    \"ThingConnectivityIndexingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"STATUS\"\
      ]\
    },\
    \"ThingDocument\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The thing name.</p>\"\
        },\
        \"thingId\":{\
          \"shape\":\"ThingId\",\
          \"documentation\":\"<p>The thing ID.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The thing type name.</p>\"\
        },\
        \"thingGroupNames\":{\
          \"shape\":\"ThingGroupNameList\",\
          \"documentation\":\"<p>Thing group names.</p>\"\
        },\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>The attributes.</p>\"\
        },\
        \"shadow\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The unnamed shadow and named shadow.</p> <p>For more information about shadows, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-device-shadows.html\\\">IoT Device Shadow service.</a> </p>\"\
        },\
        \"deviceDefender\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>Contains Device Defender data.</p> <p>For more information about Device Defender, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/device-defender.html\\\">Device Defender</a>. </p>\"\
        },\
        \"connectivity\":{\
          \"shape\":\"ThingConnectivity\",\
          \"documentation\":\"<p>Indicates whether the thing is connected to the Amazon Web Services IoT Core service.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The thing search index document.</p>\"\
    },\
    \"ThingDocumentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingDocument\"}\
    },\
    \"ThingGroupArn\":{\"type\":\"string\"},\
    \"ThingGroupDescription\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"ThingGroupDocument\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The thing group name.</p>\"\
        },\
        \"thingGroupId\":{\
          \"shape\":\"ThingGroupId\",\
          \"documentation\":\"<p>The thing group ID.</p>\"\
        },\
        \"thingGroupDescription\":{\
          \"shape\":\"ThingGroupDescription\",\
          \"documentation\":\"<p>The thing group description.</p>\"\
        },\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>The thing group attributes.</p>\"\
        },\
        \"parentGroupNames\":{\
          \"shape\":\"ThingGroupNameList\",\
          \"documentation\":\"<p>Parent group names.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The thing group search index document.</p>\"\
    },\
    \"ThingGroupDocumentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingGroupDocument\"}\
    },\
    \"ThingGroupId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9\\\\-]+\"\
    },\
    \"ThingGroupIndexingConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingGroupIndexingMode\"],\
      \"members\":{\
        \"thingGroupIndexingMode\":{\
          \"shape\":\"ThingGroupIndexingMode\",\
          \"documentation\":\"<p>Thing group indexing mode.</p>\"\
        },\
        \"managedFields\":{\
          \"shape\":\"Fields\",\
          \"documentation\":\"<p>Contains fields that are indexed and whose types are already known by the Fleet Indexing service. This is an optional field. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/managing-fleet-index.html#managed-field\\\">Managed fields</a> in the <i>Amazon Web Services IoT Core Developer Guide</i>.</p>\"\
        },\
        \"customFields\":{\
          \"shape\":\"Fields\",\
          \"documentation\":\"<p>A list of thing group fields to index. This list cannot contain any managed fields. Use the GetIndexingConfiguration API to get a list of managed fields.</p> <p>Contains custom field names and their data type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Thing group indexing configuration.</p>\"\
    },\
    \"ThingGroupIndexingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"ON\"\
      ]\
    },\
    \"ThingGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingGroupName\"}\
    },\
    \"ThingGroupMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"parentGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The parent thing group name.</p>\"\
        },\
        \"rootToParentThingGroups\":{\
          \"shape\":\"ThingGroupNameAndArnList\",\
          \"documentation\":\"<p>The root parent thing group.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>The UNIX timestamp of when the thing group was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Thing group metadata.</p>\"\
    },\
    \"ThingGroupName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThingGroupNameAndArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GroupNameAndArn\"}\
    },\
    \"ThingGroupNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingGroupName\"}\
    },\
    \"ThingGroupNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingGroupName\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"ThingGroupProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingGroupDescription\":{\
          \"shape\":\"ThingGroupDescription\",\
          \"documentation\":\"<p>The thing group description.</p>\"\
        },\
        \"attributePayload\":{\
          \"shape\":\"AttributePayload\",\
          \"documentation\":\"<p>The thing group attributes in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Thing group properties.</p>\"\
    },\
    \"ThingId\":{\"type\":\"string\"},\
    \"ThingIndexingConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingIndexingMode\"],\
      \"members\":{\
        \"thingIndexingMode\":{\
          \"shape\":\"ThingIndexingMode\",\
          \"documentation\":\"<p>Thing indexing mode. Valid values are:</p> <ul> <li> <p>REGISTRY â Your thing index contains registry data only.</p> </li> <li> <p>REGISTRY_AND_SHADOW - Your thing index contains registry and shadow data.</p> </li> <li> <p>OFF - Thing indexing is disabled.</p> </li> </ul>\"\
        },\
        \"thingConnectivityIndexingMode\":{\
          \"shape\":\"ThingConnectivityIndexingMode\",\
          \"documentation\":\"<p>Thing connectivity indexing mode. Valid values are: </p> <ul> <li> <p>STATUS â Your thing index contains connectivity status. To enable thing connectivity indexing, <i>thingIndexMode</i> must not be set to OFF.</p> </li> <li> <p>OFF - Thing connectivity status indexing is disabled.</p> </li> </ul>\"\
        },\
        \"deviceDefenderIndexingMode\":{\
          \"shape\":\"DeviceDefenderIndexingMode\",\
          \"documentation\":\"<p>Device Defender indexing mode. Valid values are:</p> <ul> <li> <p>VIOLATIONS â Your thing index contains Device Defender violations. To enable Device Defender indexing, <i>deviceDefenderIndexingMode</i> must not be set to OFF.</p> </li> <li> <p>OFF - Device Defender indexing is disabled.</p> </li> </ul> <p>For more information about Device Defender violations, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/device-defender-detect.html\\\">Device Defender Detect.</a> </p>\"\
        },\
        \"namedShadowIndexingMode\":{\
          \"shape\":\"NamedShadowIndexingMode\",\
          \"documentation\":\"<p>Named shadow indexing mode. Valid values are:</p> <ul> <li> <p>ON â Your thing index contains named shadow. To enable thing named shadow indexing, <i>namedShadowIndexingMode</i> must not be set to OFF.</p> </li> <li> <p>OFF - Named shadow indexing is disabled.</p> </li> </ul> <p>For more information about Shadows, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-device-shadows.html\\\">IoT Device Shadow service.</a> </p>\"\
        },\
        \"managedFields\":{\
          \"shape\":\"Fields\",\
          \"documentation\":\"<p>Contains fields that are indexed and whose types are already known by the Fleet Indexing service.</p>\"\
        },\
        \"customFields\":{\
          \"shape\":\"Fields\",\
          \"documentation\":\"<p>Contains custom field names and their data type.</p>\"\
        },\
        \"filter\":{\
          \"shape\":\"IndexingFilter\",\
          \"documentation\":\"<p>Provides additional filters for specific data sources. Named shadow is the only data source that currently supports and requires a filter. To add named shadows to your fleet indexing configuration, set <code>namedShadowIndexingMode</code> to be <code>ON</code> and specify your shadow names in <code>filter</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The thing indexing configuration. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/managing-index.html\\\">Managing Thing Indexing</a>.</p>\"\
    },\
    \"ThingIndexingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"REGISTRY\",\
        \"REGISTRY_AND_SHADOW\"\
      ]\
    },\
    \"ThingName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThingNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingName\"}\
    },\
    \"ThingTypeArn\":{\"type\":\"string\"},\
    \"ThingTypeDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"thingTypeArn\":{\
          \"shape\":\"ThingTypeArn\",\
          \"documentation\":\"<p>The thing type ARN.</p>\"\
        },\
        \"thingTypeProperties\":{\
          \"shape\":\"ThingTypeProperties\",\
          \"documentation\":\"<p>The ThingTypeProperties for the thing type.</p>\"\
        },\
        \"thingTypeMetadata\":{\
          \"shape\":\"ThingTypeMetadata\",\
          \"documentation\":\"<p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when it was deprecated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The definition of the thing type, including thing type name and description.</p>\"\
    },\
    \"ThingTypeDescription\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"ThingTypeId\":{\"type\":\"string\"},\
    \"ThingTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingTypeDefinition\"}\
    },\
    \"ThingTypeMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deprecated\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether the thing type is deprecated. If <b>true</b>, no new things could be associated with this type.</p>\"\
        },\
        \"deprecationDate\":{\
          \"shape\":\"DeprecationDate\",\
          \"documentation\":\"<p>The date and time when the thing type was deprecated.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>The date and time when the thing type was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when time was deprecated.</p>\"\
    },\
    \"ThingTypeName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThingTypeProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeDescription\":{\
          \"shape\":\"ThingTypeDescription\",\
          \"documentation\":\"<p>The description of the thing type.</p>\"\
        },\
        \"searchableAttributes\":{\
          \"shape\":\"SearchableAttributes\",\
          \"documentation\":\"<p>A list of searchable thing attribute names.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ThingTypeProperties contains information about the thing type including: a thing type description, and a list of searchable thing attribute names.</p>\"\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The rate exceeds the limit.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TimedOutThings\":{\"type\":\"integer\"},\
    \"TimeoutConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"inProgressTimeoutInMinutes\":{\
          \"shape\":\"InProgressTimeoutInMinutes\",\
          \"documentation\":\"<p>Specifies the amount of time, in minutes, this device has to finish execution of this job. The timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The in progress timer can't be updated and will apply to all job executions for the job. Whenever a job execution remains in the IN_PROGRESS status for longer than this interval, the job execution will fail and switch to the terminal <code>TIMED_OUT</code> status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>\"\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TimestreamAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"databaseName\",\
        \"tableName\",\
        \"dimensions\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the role that grants permission to write to the Amazon Timestream database table.</p>\"\
        },\
        \"databaseName\":{\
          \"shape\":\"TimestreamDatabaseName\",\
          \"documentation\":\"<p>The name of an Amazon Timestream database.</p>\"\
        },\
        \"tableName\":{\
          \"shape\":\"TimestreamTableName\",\
          \"documentation\":\"<p>The name of the database table into which to write the measure records.</p>\"\
        },\
        \"dimensions\":{\
          \"shape\":\"TimestreamDimensionList\",\
          \"documentation\":\"<p>Metadata attributes of the time series that are written in each measure record.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"TimestreamTimestamp\",\
          \"documentation\":\"<p>Specifies an application-defined value to replace the default value assigned to the Timestream record's timestamp in the <code>time</code> column.</p> <p>You can use this property to specify the value and the precision of the Timestream record's timestamp. You can specify a value from the message payload or a value computed by a substitution template.</p> <p>If omitted, the topic rule action assigns the timestamp, in milliseconds, at the time it processed the rule. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The Timestream rule action writes attributes (measures) from an MQTT message into an Amazon Timestream table. For more information, see the <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html\\\">Timestream</a> topic rule action documentation.</p>\"\
    },\
    \"TimestreamDatabaseName\":{\"type\":\"string\"},\
    \"TimestreamDimension\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"value\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"TimestreamDimensionName\",\
          \"documentation\":\"<p>The metadata dimension name. This is the name of the column in the Amazon Timestream database table record.</p> <p>Dimensions cannot be named: <code>measure_name</code>, <code>measure_value</code>, or <code>time</code>. These names are reserved. Dimension names cannot start with <code>ts_</code> or <code>measure_value</code> and they cannot contain the colon (<code>:</code>) character.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"TimestreamDimensionValue\",\
          \"documentation\":\"<p>The value to write in this column of the database record.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metadata attributes of the time series that are written in each measure record.</p>\"\
    },\
    \"TimestreamDimensionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TimestreamDimension\"},\
      \"max\":128,\
      \"min\":1\
    },\
    \"TimestreamDimensionName\":{\"type\":\"string\"},\
    \"TimestreamDimensionValue\":{\"type\":\"string\"},\
    \"TimestreamTableName\":{\"type\":\"string\"},\
    \"TimestreamTimestamp\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"value\",\
        \"unit\"\
      ],\
      \"members\":{\
        \"value\":{\
          \"shape\":\"TimestreamTimestampValue\",\
          \"documentation\":\"<p>An expression that returns a long epoch time value.</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"TimestreamTimestampUnit\",\
          \"documentation\":\"<p>The precision of the timestamp value that results from the expression described in <code>value</code>.</p> <p>Valid values: <code>SECONDS</code> | <code>MILLISECONDS</code> | <code>MICROSECONDS</code> | <code>NANOSECONDS</code>. The default is <code>MILLISECONDS</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes how to interpret an application-defined timestamp value from an MQTT message payload and the precision of that value.</p>\"\
    },\
    \"TimestreamTimestampUnit\":{\"type\":\"string\"},\
    \"TimestreamTimestampValue\":{\"type\":\"string\"},\
    \"TinyMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"TlsContext\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"serverName\":{\
          \"shape\":\"ServerName\",\
          \"documentation\":\"<p>The value of the <code>serverName</code> key in a TLS authorization request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the TLS context to use for the test authorizer request.</p>\"\
    },\
    \"Token\":{\
      \"type\":\"string\",\
      \"max\":6144,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"TokenKeyName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_-]+\"\
    },\
    \"TokenSignature\":{\
      \"type\":\"string\",\
      \"max\":2560,\
      \"min\":1,\
      \"pattern\":\"[A-Za-z0-9+/]+={0,2}\"\
    },\
    \"Topic\":{\"type\":\"string\"},\
    \"TopicPattern\":{\"type\":\"string\"},\
    \"TopicRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"sql\":{\
          \"shape\":\"SQL\",\
          \"documentation\":\"<p>The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to escape the newline characters.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the rule.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"CreatedAtDate\",\
          \"documentation\":\"<p>The date and time the rule was created.</p>\"\
        },\
        \"actions\":{\
          \"shape\":\"ActionList\",\
          \"documentation\":\"<p>The actions associated with the rule.</p>\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\"\
        },\
        \"awsIotSqlVersion\":{\
          \"shape\":\"AwsIotSqlVersion\",\
          \"documentation\":\"<p>The version of the SQL rules engine to use when evaluating the rule.</p>\"\
        },\
        \"errorAction\":{\
          \"shape\":\"Action\",\
          \"documentation\":\"<p>The action to perform when an error occurs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a rule.</p>\"\
    },\
    \"TopicRuleDestination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The topic rule destination URL.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"TopicRuleDestinationStatus\",\
          \"documentation\":\"<p>The status of the topic rule destination. Valid values are:</p> <dl> <dt>IN_PROGRESS</dt> <dd> <p>A topic rule destination was created but has not been confirmed. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p> </dd> <dt>ENABLED</dt> <dd> <p>Confirmation was completed, and traffic to this destination is allowed. You can set <code>status</code> to <code>DISABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p> </dd> <dt>DISABLED</dt> <dd> <p>Confirmation was completed, and traffic to this destination is not allowed. You can set <code>status</code> to <code>ENABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p> </dd> <dt>ERROR</dt> <dd> <p>Confirmation could not be completed, for example if the confirmation timed out. You can call <code>GetTopicRuleDestination</code> for details about the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p> </dd> </dl>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"CreatedAtDate\",\
          \"documentation\":\"<p>The date and time when the topic rule destination was created.</p>\"\
        },\
        \"lastUpdatedAt\":{\
          \"shape\":\"LastUpdatedAtDate\",\
          \"documentation\":\"<p>The date and time when the topic rule destination was last updated.</p>\"\
        },\
        \"statusReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Additional details or reason why the topic rule destination is in the current status.</p>\"\
        },\
        \"httpUrlProperties\":{\
          \"shape\":\"HttpUrlDestinationProperties\",\
          \"documentation\":\"<p>Properties of the HTTP URL.</p>\"\
        },\
        \"vpcProperties\":{\
          \"shape\":\"VpcDestinationProperties\",\
          \"documentation\":\"<p>Properties of the virtual private cloud (VPC) connection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A topic rule destination.</p>\"\
    },\
    \"TopicRuleDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"httpUrlConfiguration\":{\
          \"shape\":\"HttpUrlDestinationConfiguration\",\
          \"documentation\":\"<p>Configuration of the HTTP URL.</p>\"\
        },\
        \"vpcConfiguration\":{\
          \"shape\":\"VpcDestinationConfiguration\",\
          \"documentation\":\"<p>Configuration of the virtual private cloud (VPC) connection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of the topic rule destination.</p>\"\
    },\
    \"TopicRuleDestinationMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"TopicRuleDestinationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"IN_PROGRESS\",\
        \"DISABLED\",\
        \"ERROR\",\
        \"DELETING\"\
      ]\
    },\
    \"TopicRuleDestinationSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TopicRuleDestinationSummary\"}\
    },\
    \"TopicRuleDestinationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The topic rule destination ARN.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"TopicRuleDestinationStatus\",\
          \"documentation\":\"<p>The status of the topic rule destination. Valid values are:</p> <dl> <dt>IN_PROGRESS</dt> <dd> <p>A topic rule destination was created but has not been confirmed. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p> </dd> <dt>ENABLED</dt> <dd> <p>Confirmation was completed, and traffic to this destination is allowed. You can set <code>status</code> to <code>DISABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p> </dd> <dt>DISABLED</dt> <dd> <p>Confirmation was completed, and traffic to this destination is not allowed. You can set <code>status</code> to <code>ENABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p> </dd> <dt>ERROR</dt> <dd> <p>Confirmation could not be completed, for example if the confirmation timed out. You can call <code>GetTopicRuleDestination</code> for details about the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p> </dd> </dl>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"CreatedAtDate\",\
          \"documentation\":\"<p>The date and time when the topic rule destination was created.</p>\"\
        },\
        \"lastUpdatedAt\":{\
          \"shape\":\"LastUpdatedAtDate\",\
          \"documentation\":\"<p>The date and time when the topic rule destination was last updated.</p>\"\
        },\
        \"statusReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason the topic rule destination is in the current status.</p>\"\
        },\
        \"httpUrlSummary\":{\
          \"shape\":\"HttpUrlDestinationSummary\",\
          \"documentation\":\"<p>Information about the HTTP URL.</p>\"\
        },\
        \"vpcDestinationSummary\":{\
          \"shape\":\"VpcDestinationSummary\",\
          \"documentation\":\"<p>Information about the virtual private cloud (VPC) connection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the topic rule destination.</p>\"\
    },\
    \"TopicRuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TopicRuleListItem\"}\
    },\
    \"TopicRuleListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The rule ARN.</p>\"\
        },\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"topicPattern\":{\
          \"shape\":\"TopicPattern\",\
          \"documentation\":\"<p>The pattern for the topic names that apply.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"CreatedAtDate\",\
          \"documentation\":\"<p>The date and time the rule was created.</p>\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a rule.</p>\"\
    },\
    \"TopicRuleMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"TopicRulePayload\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"sql\",\
        \"actions\"\
      ],\
      \"members\":{\
        \"sql\":{\
          \"shape\":\"SQL\",\
          \"documentation\":\"<p>The SQL statement used to query the topic. For more information, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-sql-reference.html\\\">IoT SQL Reference</a> in the <i>IoT Developer Guide</i>.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the rule.</p>\"\
        },\
        \"actions\":{\
          \"shape\":\"ActionList\",\
          \"documentation\":\"<p>The actions associated with the rule.</p>\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\"\
        },\
        \"awsIotSqlVersion\":{\
          \"shape\":\"AwsIotSqlVersion\",\
          \"documentation\":\"<p>The version of the SQL rules engine to use when evaluating the rule.</p>\"\
        },\
        \"errorAction\":{\
          \"shape\":\"Action\",\
          \"documentation\":\"<p>The action to take when an error occurs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a rule.</p>\"\
    },\
    \"TotalChecksCount\":{\"type\":\"integer\"},\
    \"TotalFindingsCount\":{\"type\":\"long\"},\
    \"TotalResourcesCount\":{\"type\":\"long\"},\
    \"TransferAlreadyCompletedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You can't revert the certificate transfer because the transfer is already complete.</p>\",\
      \"error\":{\"httpStatusCode\":410},\
      \"exception\":true\
    },\
    \"TransferCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"certificateId\",\
        \"targetAwsAccount\"\
      ],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\"\
        },\
        \"targetAwsAccount\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The Amazon Web Services account.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"targetAwsAccount\"\
        },\
        \"transferMessage\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The transfer message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the TransferCertificate operation.</p>\"\
    },\
    \"TransferCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"transferredCertificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the TransferCertificate operation.</p>\"\
    },\
    \"TransferConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You can't transfer the certificate because authorization policies are still attached.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"TransferData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"transferMessage\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The transfer message.</p>\"\
        },\
        \"rejectReason\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The reason why the transfer was rejected.</p>\"\
        },\
        \"transferDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer took place.</p>\"\
        },\
        \"acceptDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer was accepted.</p>\"\
        },\
        \"rejectDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer was rejected.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Data used to transfer a certificate to an Amazon Web Services account.</p>\"\
    },\
    \"UnauthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You are not authorized to perform this operation.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"UndoDeprecate\":{\"type\":\"boolean\"},\
    \"UnsignedLong\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The ARN of the resource.</p>\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of the keys of the tags to be removed from the resource.</p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateAccountAuditConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the role that grants permission to IoT to access information about your devices, policies, certificates, and other items as required when performing an audit.</p>\"\
        },\
        \"auditNotificationTargetConfigurations\":{\
          \"shape\":\"AuditNotificationTargetConfigurations\",\
          \"documentation\":\"<p>Information about the targets to which audit notifications are sent.</p>\"\
        },\
        \"auditCheckConfigurations\":{\
          \"shape\":\"AuditCheckConfigurations\",\
          \"documentation\":\"<p>Specifies which audit checks are enabled and disabled for this account. Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are currently enabled.</p> <p>Some data collection might start immediately when certain checks are enabled. When a check is disabled, any data collected so far in relation to the check is deleted.</p> <p>You cannot disable a check if it's used by any scheduled audit. You must first delete the check from the scheduled audit or delete the scheduled audit itself.</p> <p>On the first call to <code>UpdateAccountAuditConfiguration</code>, this parameter is required and must specify at least one enabled check.</p>\"\
        }\
      }\
    },\
    \"UpdateAccountAuditConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateAuditSuppressionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"checkName\",\
        \"resourceIdentifier\"\
      ],\
      \"members\":{\
        \"checkName\":{\"shape\":\"AuditCheckName\"},\
        \"resourceIdentifier\":{\"shape\":\"ResourceIdentifier\"},\
        \"expirationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The expiration date (epoch timestamp in seconds) that you want the suppression to adhere to. </p>\"\
        },\
        \"suppressIndefinitely\":{\
          \"shape\":\"SuppressIndefinitely\",\
          \"documentation\":\"<p> Indicates whether a suppression should exist indefinitely or not. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"AuditDescription\",\
          \"documentation\":\"<p> The description of the audit suppression. </p>\"\
        }\
      }\
    },\
    \"UpdateAuditSuppressionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateAuthorizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"authorizerName\"],\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"authorizerName\"\
        },\
        \"authorizerFunctionArn\":{\
          \"shape\":\"AuthorizerFunctionArn\",\
          \"documentation\":\"<p>The ARN of the authorizer's Lambda function.</p>\"\
        },\
        \"tokenKeyName\":{\
          \"shape\":\"TokenKeyName\",\
          \"documentation\":\"<p>The key used to extract the token from the HTTP headers. </p>\"\
        },\
        \"tokenSigningPublicKeys\":{\
          \"shape\":\"PublicKeyMap\",\
          \"documentation\":\"<p>The public keys used to verify the token signature.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"AuthorizerStatus\",\
          \"documentation\":\"<p>The status of the update authorizer request.</p>\"\
        },\
        \"enableCachingForHttp\":{\
          \"shape\":\"EnableCachingForHttp\",\
          \"documentation\":\"<p>When <code>true</code>, the result from the authorizerâs Lambda function is cached for the time specified in <code>refreshAfterInSeconds</code>. The cached result is used while the device reuses the same HTTP connection.</p>\"\
        }\
      }\
    },\
    \"UpdateAuthorizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"authorizerName\":{\
          \"shape\":\"AuthorizerName\",\
          \"documentation\":\"<p>The authorizer name.</p>\"\
        },\
        \"authorizerArn\":{\
          \"shape\":\"AuthorizerArn\",\
          \"documentation\":\"<p>The authorizer ARN.</p>\"\
        }\
      }\
    },\
    \"UpdateBillingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"billingGroupName\",\
        \"billingGroupProperties\"\
      ],\
      \"members\":{\
        \"billingGroupName\":{\
          \"shape\":\"BillingGroupName\",\
          \"documentation\":\"<p>The name of the billing group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"billingGroupName\"\
        },\
        \"billingGroupProperties\":{\
          \"shape\":\"BillingGroupProperties\",\
          \"documentation\":\"<p>The properties of the billing group.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the billing group. If the version of the billing group does not match the expected version specified in the request, the <code>UpdateBillingGroup</code> request is rejected with a <code>VersionConflictException</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateBillingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The latest version of the billing group.</p>\"\
        }\
      }\
    },\
    \"UpdateCACertificateParams\":{\
      \"type\":\"structure\",\
      \"required\":[\"action\"],\
      \"members\":{\
        \"action\":{\
          \"shape\":\"CACertificateUpdateAction\",\
          \"documentation\":\"<p>The action that you want to apply to the CA certificate. The only supported value is <code>DEACTIVATE</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters to define a mitigation action that changes the state of the CA certificate to inactive.</p>\"\
    },\
    \"UpdateCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The CA certificate identifier.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\"\
        },\
        \"newStatus\":{\
          \"shape\":\"CACertificateStatus\",\
          \"documentation\":\"<p>The updated status of the CA certificate.</p> <p> <b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"newStatus\"\
        },\
        \"newAutoRegistrationStatus\":{\
          \"shape\":\"AutoRegistrationStatus\",\
          \"documentation\":\"<p>The new value for the auto registration status. Valid values are: \\\"ENABLE\\\" or \\\"DISABLE\\\".</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"newAutoRegistrationStatus\"\
        },\
        \"registrationConfig\":{\
          \"shape\":\"RegistrationConfig\",\
          \"documentation\":\"<p>Information about the registration configuration.</p>\"\
        },\
        \"removeAutoRegistration\":{\
          \"shape\":\"RemoveAutoRegistration\",\
          \"documentation\":\"<p>If true, removes auto registration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the UpdateCACertificate operation.</p>\"\
    },\
    \"UpdateCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"certificateId\",\
        \"newStatus\"\
      ],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\"\
        },\
        \"newStatus\":{\
          \"shape\":\"CertificateStatus\",\
          \"documentation\":\"<p>The new status.</p> <p> <b>Note:</b> Setting the status to PENDING_TRANSFER or PENDING_ACTIVATION will result in an exception being thrown. PENDING_TRANSFER and PENDING_ACTIVATION are statuses used internally by IoT. They are not intended for developer use.</p> <p> <b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"newStatus\"\
        }\
      },\
      \"documentation\":\"<p>The input for the UpdateCertificate operation.</p>\"\
    },\
    \"UpdateCustomMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"metricName\",\
        \"displayName\"\
      ],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric. Cannot be updated. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        },\
        \"displayName\":{\
          \"shape\":\"CustomMetricDisplayName\",\
          \"documentation\":\"<p> Field represents a friendly name in the console for the custom metric, it doesn't have to be unique. Don't use this name as the metric identifier in the device metric report. Can be updated. </p>\"\
        }\
      }\
    },\
    \"UpdateCustomMetricResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p> The name of the custom metric. </p>\"\
        },\
        \"metricArn\":{\
          \"shape\":\"CustomMetricArn\",\
          \"documentation\":\"<p> The Amazon Resource Number (ARN) of the custom metric. </p>\"\
        },\
        \"metricType\":{\
          \"shape\":\"CustomMetricType\",\
          \"documentation\":\"<p> The type of the custom metric. </p> <important> <p>The type <code>number</code> only takes a single metric value as an input, but while submitting the metrics value in the DeviceMetrics report, it must be passed as an array with a single value.</p> </important>\"\
        },\
        \"displayName\":{\
          \"shape\":\"CustomMetricDisplayName\",\
          \"documentation\":\"<p> A friendly name in the console for the custom metric </p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The creation date of the custom metric in milliseconds since epoch. </p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The time the custom metric was last modified in milliseconds since epoch. </p>\"\
        }\
      }\
    },\
    \"UpdateDeviceCertificateParams\":{\
      \"type\":\"structure\",\
      \"required\":[\"action\"],\
      \"members\":{\
        \"action\":{\
          \"shape\":\"DeviceCertificateUpdateAction\",\
          \"documentation\":\"<p>The action that you want to apply to the device certificate. The only supported value is <code>DEACTIVATE</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters to define a mitigation action that changes the state of the device certificate to inactive.</p>\"\
    },\
    \"UpdateDimensionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"stringValues\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>A unique identifier for the dimension. Choose something that describes the type and value to make it easy to remember what it does.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        },\
        \"stringValues\":{\
          \"shape\":\"DimensionStringValues\",\
          \"documentation\":\"<p>Specifies the value or list of values for the dimension. For <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the MQTT topic (for example, \\\"admin/#\\\").</p>\"\
        }\
      }\
    },\
    \"UpdateDimensionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>A unique identifier for the dimension.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"DimensionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN)of the created dimension.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"DimensionType\",\
          \"documentation\":\"<p>The type of the dimension.</p>\"\
        },\
        \"stringValues\":{\
          \"shape\":\"DimensionStringValues\",\
          \"documentation\":\"<p>The value or list of values used to scope the dimension. For example, for topic filters, this is the pattern used to match the MQTT topic name.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time, in milliseconds since epoch, when the dimension was initially created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time, in milliseconds since epoch, when the dimension was most recently updated.</p>\"\
        }\
      }\
    },\
    \"UpdateDomainConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainConfigurationName\"],\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"ReservedDomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration to be updated.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"domainConfigurationName\"\
        },\
        \"authorizerConfig\":{\
          \"shape\":\"AuthorizerConfig\",\
          \"documentation\":\"<p>An object that specifies the authorization service for a domain.</p>\"\
        },\
        \"domainConfigurationStatus\":{\
          \"shape\":\"DomainConfigurationStatus\",\
          \"documentation\":\"<p>The status to which the domain configuration should be updated.</p>\"\
        },\
        \"removeAuthorizerConfig\":{\
          \"shape\":\"RemoveAuthorizerConfig\",\
          \"documentation\":\"<p>Removes the authorization configuration from a domain.</p>\"\
        }\
      }\
    },\
    \"UpdateDomainConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainConfigurationName\":{\
          \"shape\":\"ReservedDomainConfigurationName\",\
          \"documentation\":\"<p>The name of the domain configuration that was updated.</p>\"\
        },\
        \"domainConfigurationArn\":{\
          \"shape\":\"DomainConfigurationArn\",\
          \"documentation\":\"<p>The ARN of the domain configuration that was updated.</p>\"\
        }\
      }\
    },\
    \"UpdateDynamicThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingGroupName\",\
        \"thingGroupProperties\"\
      ],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The name of the dynamic thing group to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"thingGroupProperties\":{\
          \"shape\":\"ThingGroupProperties\",\
          \"documentation\":\"<p>The dynamic thing group properties to update.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the dynamic thing group to update.</p>\"\
        },\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The dynamic thing group index to update.</p> <note> <p>Currently one index is supported: <code>AWS_Things</code>.</p> </note>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The dynamic thing group search query string to update.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The dynamic thing group query version to update.</p> <note> <p>Currently one query version is supported: \\\"2017-09-30\\\". If not specified, the query version defaults to this value.</p> </note>\"\
        }\
      }\
    },\
    \"UpdateDynamicThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The dynamic thing group version.</p>\"\
        }\
      }\
    },\
    \"UpdateEventConfigurationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"eventConfigurations\":{\
          \"shape\":\"EventConfigurations\",\
          \"documentation\":\"<p>The new event configuration values.</p>\"\
        }\
      }\
    },\
    \"UpdateEventConfigurationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateFleetMetricRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"metricName\",\
        \"indexName\"\
      ],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"FleetMetricName\",\
          \"documentation\":\"<p>The name of the fleet metric to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"metricName\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The search query string.</p>\"\
        },\
        \"aggregationType\":{\
          \"shape\":\"AggregationType\",\
          \"documentation\":\"<p>The type of the aggregation query.</p>\"\
        },\
        \"period\":{\
          \"shape\":\"FleetMetricPeriod\",\
          \"documentation\":\"<p>The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be multiple of 60.</p>\"\
        },\
        \"aggregationField\":{\
          \"shape\":\"AggregationField\",\
          \"documentation\":\"<p>The field to aggregate.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"FleetMetricDescription\",\
          \"documentation\":\"<p>The description of the fleet metric.</p>\"\
        },\
        \"queryVersion\":{\
          \"shape\":\"QueryVersion\",\
          \"documentation\":\"<p>The version of the query.</p>\"\
        },\
        \"indexName\":{\
          \"shape\":\"IndexName\",\
          \"documentation\":\"<p>The name of the index to search.</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"FleetMetricUnit\",\
          \"documentation\":\"<p>Used to support unit transformation such as milliseconds to seconds. The unit must be supported by <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html\\\">CW metric</a>.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the fleet metric record in the registry.</p>\"\
        }\
      }\
    },\
    \"UpdateIndexingConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingIndexingConfiguration\":{\
          \"shape\":\"ThingIndexingConfiguration\",\
          \"documentation\":\"<p>Thing indexing configuration.</p>\"\
        },\
        \"thingGroupIndexingConfiguration\":{\
          \"shape\":\"ThingGroupIndexingConfiguration\",\
          \"documentation\":\"<p>Thing group indexing configuration.</p>\"\
        }\
      }\
    },\
    \"UpdateIndexingConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobId\"],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The ID of the job to be updated.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"description\":{\
          \"shape\":\"JobDescription\",\
          \"documentation\":\"<p>A short text description of the job.</p>\"\
        },\
        \"presignedUrlConfig\":{\
          \"shape\":\"PresignedUrlConfig\",\
          \"documentation\":\"<p>Configuration information for pre-signed S3 URLs.</p>\"\
        },\
        \"jobExecutionsRolloutConfig\":{\
          \"shape\":\"JobExecutionsRolloutConfig\",\
          \"documentation\":\"<p>Allows you to create a staged rollout of the job.</p>\"\
        },\
        \"abortConfig\":{\
          \"shape\":\"AbortConfig\",\
          \"documentation\":\"<p>Allows you to create criteria to abort a job.</p>\"\
        },\
        \"timeoutConfig\":{\
          \"shape\":\"TimeoutConfig\",\
          \"documentation\":\"<p>Specifies the amount of time each device has to finish its execution of the job. The timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the time expires, it will be automatically set to <code>TIMED_OUT</code>. </p>\"\
        },\
        \"namespaceId\":{\
          \"shape\":\"NamespaceId\",\
          \"documentation\":\"<p>The namespace used to indicate that a job is a customer-managed job.</p> <p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p> <p> <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code> </p> <note> <p>The <code>namespaceId</code> feature is in public preview.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"namespaceId\"\
        },\
        \"jobExecutionsRetryConfig\":{\
          \"shape\":\"JobExecutionsRetryConfig\",\
          \"documentation\":\"<p>Allows you to create the criteria to retry a job.</p>\"\
        }\
      }\
    },\
    \"UpdateMitigationActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"actionName\"],\
      \"members\":{\
        \"actionName\":{\
          \"shape\":\"MitigationActionName\",\
          \"documentation\":\"<p>The friendly name for the mitigation action. You cannot change the name by using <code>UpdateMitigationAction</code>. Instead, you must delete and recreate the mitigation action with the new name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"actionName\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that is used to apply the mitigation action.</p>\"\
        },\
        \"actionParams\":{\
          \"shape\":\"MitigationActionParams\",\
          \"documentation\":\"<p>Defines the type of action and the parameters for that action.</p>\"\
        }\
      }\
    },\
    \"UpdateMitigationActionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"actionArn\":{\
          \"shape\":\"MitigationActionArn\",\
          \"documentation\":\"<p>The ARN for the new mitigation action.</p>\"\
        },\
        \"actionId\":{\
          \"shape\":\"MitigationActionId\",\
          \"documentation\":\"<p>A unique identifier for the mitigation action.</p>\"\
        }\
      }\
    },\
    \"UpdateProvisioningTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"templateName\"],\
      \"members\":{\
        \"templateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the provisioning template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateName\"\
        },\
        \"description\":{\
          \"shape\":\"TemplateDescription\",\
          \"documentation\":\"<p>The description of the provisioning template.</p>\"\
        },\
        \"enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>True to enable the provisioning template, otherwise false.</p>\"\
        },\
        \"defaultVersionId\":{\
          \"shape\":\"TemplateVersionId\",\
          \"documentation\":\"<p>The ID of the default provisioning template version.</p>\"\
        },\
        \"provisioningRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role associated with the provisioning template. This IoT role grants permission to provision a device.</p>\"\
        },\
        \"preProvisioningHook\":{\
          \"shape\":\"ProvisioningHook\",\
          \"documentation\":\"<p>Updates the pre-provisioning hook template. Only supports template of type <code>FLEET_PROVISIONING</code>. For more information about provisioning template types, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/apireference/API_CreateProvisioningTemplate.html#iot-CreateProvisioningTemplate-request-type\\\">type</a>.</p>\"\
        },\
        \"removePreProvisioningHook\":{\
          \"shape\":\"RemoveHook\",\
          \"documentation\":\"<p>Removes pre-provisioning hook template.</p>\"\
        }\
      }\
    },\
    \"UpdateProvisioningTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateRoleAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"roleAlias\"],\
      \"members\":{\
        \"roleAlias\":{\
          \"shape\":\"RoleAlias\",\
          \"documentation\":\"<p>The role alias to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"roleAlias\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The role ARN.</p>\"\
        },\
        \"credentialDurationSeconds\":{\
          \"shape\":\"CredentialDurationSeconds\",\
          \"documentation\":\"<p>The number of seconds the credential will be valid.</p> <p>This value must be less than or equal to the maximum session duration of the IAM role that the role alias references.</p>\"\
        }\
      }\
    },\
    \"UpdateRoleAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleAlias\":{\
          \"shape\":\"RoleAlias\",\
          \"documentation\":\"<p>The role alias.</p>\"\
        },\
        \"roleAliasArn\":{\
          \"shape\":\"RoleAliasArn\",\
          \"documentation\":\"<p>The role alias ARN.</p>\"\
        }\
      }\
    },\
    \"UpdateScheduledAuditRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"scheduledAuditName\"],\
      \"members\":{\
        \"frequency\":{\
          \"shape\":\"AuditFrequency\",\
          \"documentation\":\"<p>How often the scheduled audit takes place, either <code>DAILY</code>, <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The start time of each audit is determined by the system.</p>\"\
        },\
        \"dayOfMonth\":{\
          \"shape\":\"DayOfMonth\",\
          \"documentation\":\"<p>The day of the month on which the scheduled audit takes place. This can be <code>1</code> through <code>31</code> or <code>LAST</code>. This field is required if the <code>frequency</code> parameter is set to <code>MONTHLY</code>. If days 29-31 are specified, and the month does not have that many days, the audit takes place on the \\\"LAST\\\" day of the month.</p>\"\
        },\
        \"dayOfWeek\":{\
          \"shape\":\"DayOfWeek\",\
          \"documentation\":\"<p>The day of the week on which the scheduled audit takes place. This can be one of <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>. This field is required if the \\\"frequency\\\" parameter is set to <code>WEEKLY</code> or <code>BIWEEKLY</code>.</p>\"\
        },\
        \"targetCheckNames\":{\
          \"shape\":\"TargetAuditCheckNames\",\
          \"documentation\":\"<p>Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>\"\
        },\
        \"scheduledAuditName\":{\
          \"shape\":\"ScheduledAuditName\",\
          \"documentation\":\"<p>The name of the scheduled audit. (Max. 128 chars)</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"scheduledAuditName\"\
        }\
      }\
    },\
    \"UpdateScheduledAuditResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"scheduledAuditArn\":{\
          \"shape\":\"ScheduledAuditArn\",\
          \"documentation\":\"<p>The ARN of the scheduled audit.</p>\"\
        }\
      }\
    },\
    \"UpdateSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"securityProfileName\"],\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile you want to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"securityProfileName\"\
        },\
        \"securityProfileDescription\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>A description of the security profile.</p>\"\
        },\
        \"behaviors\":{\
          \"shape\":\"Behaviors\",\
          \"documentation\":\"<p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>\"\
        },\
        \"alertTargets\":{\
          \"shape\":\"AlertTargets\",\
          \"documentation\":\"<p>Where the alerts are sent. (Alerts are always sent to the console.)</p>\"\
        },\
        \"additionalMetricsToRetain\":{\
          \"shape\":\"AdditionalMetricsToRetainList\",\
          \"documentation\":\"<p> <i>Please use <a>UpdateSecurityProfileRequest$additionalMetricsToRetainV2</a> instead.</i> </p> <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Use additionalMetricsToRetainV2.\"\
        },\
        \"additionalMetricsToRetainV2\":{\
          \"shape\":\"AdditionalMetricsToRetainV2List\",\
          \"documentation\":\"<p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>\"\
        },\
        \"deleteBehaviors\":{\
          \"shape\":\"DeleteBehaviors\",\
          \"documentation\":\"<p>If true, delete all <code>behaviors</code> defined for this security profile. If any <code>behaviors</code> are defined in the current invocation, an exception occurs.</p>\"\
        },\
        \"deleteAlertTargets\":{\
          \"shape\":\"DeleteAlertTargets\",\
          \"documentation\":\"<p>If true, delete all <code>alertTargets</code> defined for this security profile. If any <code>alertTargets</code> are defined in the current invocation, an exception occurs.</p>\"\
        },\
        \"deleteAdditionalMetricsToRetain\":{\
          \"shape\":\"DeleteAdditionalMetricsToRetain\",\
          \"documentation\":\"<p>If true, delete all <code>additionalMetricsToRetain</code> defined for this security profile. If any <code>additionalMetricsToRetain</code> are defined in the current invocation, an exception occurs.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the security profile. A new version is generated whenever the security profile is updated. If you specify a value that is different from the actual version, a <code>VersionConflictException</code> is thrown.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\"\
        }\
      }\
    },\
    \"UpdateSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile that was updated.</p>\"\
        },\
        \"securityProfileArn\":{\
          \"shape\":\"SecurityProfileArn\",\
          \"documentation\":\"<p>The ARN of the security profile that was updated.</p>\"\
        },\
        \"securityProfileDescription\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"behaviors\":{\
          \"shape\":\"Behaviors\",\
          \"documentation\":\"<p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>\"\
        },\
        \"alertTargets\":{\
          \"shape\":\"AlertTargets\",\
          \"documentation\":\"<p>Where the alerts are sent. (Alerts are always sent to the console.)</p>\"\
        },\
        \"additionalMetricsToRetain\":{\
          \"shape\":\"AdditionalMetricsToRetainList\",\
          \"documentation\":\"<p> <i>Please use <a>UpdateSecurityProfileResponse$additionalMetricsToRetainV2</a> instead.</i> </p> <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the security profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Use additionalMetricsToRetainV2.\"\
        },\
        \"additionalMetricsToRetainV2\":{\
          \"shape\":\"AdditionalMetricsToRetainV2List\",\
          \"documentation\":\"<p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The updated version of the security profile.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the security profile was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the security profile was last modified.</p>\"\
        }\
      }\
    },\
    \"UpdateStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"streamId\"],\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"streamId\"\
        },\
        \"description\":{\
          \"shape\":\"StreamDescription\",\
          \"documentation\":\"<p>The description of the stream.</p>\"\
        },\
        \"files\":{\
          \"shape\":\"StreamFiles\",\
          \"documentation\":\"<p>The files associated with the stream.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>An IAM role that allows the IoT service principal assumes to access your S3 files.</p>\"\
        }\
      }\
    },\
    \"UpdateStreamResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"streamId\":{\
          \"shape\":\"StreamId\",\
          \"documentation\":\"<p>The stream ID.</p>\"\
        },\
        \"streamArn\":{\
          \"shape\":\"StreamArn\",\
          \"documentation\":\"<p>The stream ARN.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"StreamDescription\",\
          \"documentation\":\"<p>A description of the stream.</p>\"\
        },\
        \"streamVersion\":{\
          \"shape\":\"StreamVersion\",\
          \"documentation\":\"<p>The stream version.</p>\"\
        }\
      }\
    },\
    \"UpdateThingGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingGroupName\",\
        \"thingGroupProperties\"\
      ],\
      \"members\":{\
        \"thingGroupName\":{\
          \"shape\":\"ThingGroupName\",\
          \"documentation\":\"<p>The thing group to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingGroupName\"\
        },\
        \"thingGroupProperties\":{\
          \"shape\":\"ThingGroupProperties\",\
          \"documentation\":\"<p>The thing group properties.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the thing group. If this does not match the version of the thing group being updated, the update will fail.</p>\"\
        }\
      }\
    },\
    \"UpdateThingGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the updated thing group.</p>\"\
        }\
      }\
    },\
    \"UpdateThingGroupsForThingRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The thing whose group memberships will be updated.</p>\"\
        },\
        \"thingGroupsToAdd\":{\
          \"shape\":\"ThingGroupList\",\
          \"documentation\":\"<p>The groups to which the thing will be added.</p>\"\
        },\
        \"thingGroupsToRemove\":{\
          \"shape\":\"ThingGroupList\",\
          \"documentation\":\"<p>The groups from which the thing will be removed.</p>\"\
        },\
        \"overrideDynamicGroups\":{\
          \"shape\":\"OverrideDynamicGroups\",\
          \"documentation\":\"<p>Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing to a static group removes the thing from the last dynamic group.</p>\"\
        }\
      }\
    },\
    \"UpdateThingGroupsForThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing to update.</p> <p>You can't change a thing's name. To change a thing's name, you must create a new thing, give it the new name, and then delete the old thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"attributePayload\":{\
          \"shape\":\"AttributePayload\",\
          \"documentation\":\"<p>A list of thing attributes, a JSON string containing name-value pairs. For example:</p> <p> <code>{\\\\\\\"attributes\\\\\\\":{\\\\\\\"name1\\\\\\\":\\\\\\\"value2\\\\\\\"}}</code> </p> <p>This data is used to add new attributes or update existing attributes.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>UpdateThing</code> request is rejected with a <code>VersionConflictException</code>.</p>\"\
        },\
        \"removeThingType\":{\
          \"shape\":\"RemoveThingType\",\
          \"documentation\":\"<p>Remove a thing type association. If <b>true</b>, the association is removed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the UpdateThing operation.</p>\"\
    },\
    \"UpdateThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output from the UpdateThing operation.</p>\"\
    },\
    \"UpdateTopicRuleDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"arn\",\
        \"status\"\
      ],\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the topic rule destination.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"TopicRuleDestinationStatus\",\
          \"documentation\":\"<p>The status of the topic rule destination. Valid values are:</p> <dl> <dt>IN_PROGRESS</dt> <dd> <p>A topic rule destination was created but has not been confirmed. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p> </dd> <dt>ENABLED</dt> <dd> <p>Confirmation was completed, and traffic to this destination is allowed. You can set <code>status</code> to <code>DISABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p> </dd> <dt>DISABLED</dt> <dd> <p>Confirmation was completed, and traffic to this destination is not allowed. You can set <code>status</code> to <code>ENABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p> </dd> <dt>ERROR</dt> <dd> <p>Confirmation could not be completed, for example if the confirmation timed out. You can call <code>GetTopicRuleDestination</code> for details about the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p> </dd> </dl>\"\
        }\
      }\
    },\
    \"UpdateTopicRuleDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Url\":{\
      \"type\":\"string\",\
      \"max\":2000\
    },\
    \"UseBase64\":{\"type\":\"boolean\"},\
    \"UserProperties\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserProperty\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"UserProperty\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"key\",\
        \"value\"\
      ],\
      \"members\":{\
        \"key\":{\
          \"shape\":\"UserPropertyKey\",\
          \"documentation\":\"<p>A key to be specified in <code>UserProperty</code>.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"UserPropertyValue\",\
          \"documentation\":\"<p>A value to be specified in <code>UserProperty</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A key-value pair that you define in the header. Both the key and the value are either literal strings or valid <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html\\\">substitution templates</a>.</p>\"\
    },\
    \"UserPropertyKey\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"UserPropertyValue\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"Valid\":{\"type\":\"boolean\"},\
    \"ValidateSecurityProfileBehaviorsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"behaviors\"],\
      \"members\":{\
        \"behaviors\":{\
          \"shape\":\"Behaviors\",\
          \"documentation\":\"<p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>\"\
        }\
      }\
    },\
    \"ValidateSecurityProfileBehaviorsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"valid\":{\
          \"shape\":\"Valid\",\
          \"documentation\":\"<p>True if the behaviors were valid.</p>\"\
        },\
        \"validationErrors\":{\
          \"shape\":\"ValidationErrors\",\
          \"documentation\":\"<p>The list of any errors found in the behaviors.</p>\"\
        }\
      }\
    },\
    \"ValidationError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"errorMessage\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The description of an error found in the behaviors.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an error found in a behavior specification.</p>\"\
    },\
    \"ValidationErrors\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ValidationError\"}\
    },\
    \"Value\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"Variance\":{\"type\":\"double\"},\
    \"VerificationState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FALSE_POSITIVE\",\
        \"BENIGN_POSITIVE\",\
        \"TRUE_POSITIVE\",\
        \"UNKNOWN\"\
      ]\
    },\
    \"VerificationStateDescription\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"pattern\":\"[^\\\\p{Cntrl}]*\"\
    },\
    \"Version\":{\"type\":\"long\"},\
    \"VersionConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An exception thrown when the version of an entity specified with the <code>expectedVersion</code> parameter does not match the latest version in the system.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"VersionNumber\":{\"type\":\"long\"},\
    \"VersionsLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The number of policy versions exceeds the limit.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ViolationEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"violationId\":{\
          \"shape\":\"ViolationId\",\
          \"documentation\":\"<p>The ID of the violation event.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"DeviceDefenderThingName\",\
          \"documentation\":\"<p>The name of the thing responsible for the violation event.</p>\"\
        },\
        \"securityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile whose behavior was violated.</p>\"\
        },\
        \"behavior\":{\
          \"shape\":\"Behavior\",\
          \"documentation\":\"<p>The behavior that was violated.</p>\"\
        },\
        \"metricValue\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value of the metric (the measurement).</p>\"\
        },\
        \"violationEventAdditionalInfo\":{\
          \"shape\":\"ViolationEventAdditionalInfo\",\
          \"documentation\":\"<p> The details of a violation event. </p>\"\
        },\
        \"violationEventType\":{\
          \"shape\":\"ViolationEventType\",\
          \"documentation\":\"<p>The type of violation event.</p>\"\
        },\
        \"verificationState\":{\
          \"shape\":\"VerificationState\",\
          \"documentation\":\"<p>The verification state of the violation (detect alarm).</p>\"\
        },\
        \"verificationStateDescription\":{\
          \"shape\":\"VerificationStateDescription\",\
          \"documentation\":\"<p>The description of the verification state of the violation.</p>\"\
        },\
        \"violationEventTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the violation event occurred.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a Device Defender security profile behavior violation.</p>\"\
    },\
    \"ViolationEventAdditionalInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"confidenceLevel\":{\
          \"shape\":\"ConfidenceLevel\",\
          \"documentation\":\"<p> The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>, <code>Medium</code>, or <code>High</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The details of a violation event. </p>\"\
    },\
    \"ViolationEventOccurrenceRange\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"endTime\"\
      ],\
      \"members\":{\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The start date and time of a time period in which violation events occurred. </p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The end date and time of a time period in which violation events occurred. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Specifies the time period of which violation events occurred between. </p>\"\
    },\
    \"ViolationEventType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"in-alarm\",\
        \"alarm-cleared\",\
        \"alarm-invalidated\"\
      ]\
    },\
    \"ViolationEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ViolationEvent\"}\
    },\
    \"ViolationId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9\\\\-]+\"\
    },\
    \"VpcDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"subnetIds\",\
        \"vpcId\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"subnetIds\":{\
          \"shape\":\"SubnetIdList\",\
          \"documentation\":\"<p>The subnet IDs of the VPC destination.</p>\"\
        },\
        \"securityGroups\":{\
          \"shape\":\"SecurityGroupList\",\
          \"documentation\":\"<p>The security groups of the VPC destination.</p>\"\
        },\
        \"vpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration information for a virtual private cloud (VPC) destination.</p>\"\
    },\
    \"VpcDestinationProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"subnetIds\":{\
          \"shape\":\"SubnetIdList\",\
          \"documentation\":\"<p>The subnet IDs of the VPC destination.</p>\"\
        },\
        \"securityGroups\":{\
          \"shape\":\"SecurityGroupList\",\
          \"documentation\":\"<p>The security groups of the VPC destination.</p>\"\
        },\
        \"vpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The properties of a virtual private cloud (VPC) destination.</p>\"\
    },\
    \"VpcDestinationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"subnetIds\":{\
          \"shape\":\"SubnetIdList\",\
          \"documentation\":\"<p>The subnet IDs of the VPC destination.</p>\"\
        },\
        \"securityGroups\":{\
          \"shape\":\"SecurityGroupList\",\
          \"documentation\":\"<p>The security groups of the VPC destination.</p>\"\
        },\
        \"vpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The summary of a virtual private cloud (VPC) destination.</p>\"\
    },\
    \"VpcId\":{\"type\":\"string\"},\
    \"WaitingForDataCollectionChecksCount\":{\"type\":\"integer\"},\
    \"errorMessage\":{\"type\":\"string\"},\
    \"resourceArn\":{\"type\":\"string\"},\
    \"resourceId\":{\"type\":\"string\"},\
    \"stringValue\":{\"type\":\"string\"},\
    \"usePrefixAttributeValue\":{\"type\":\"boolean\"}\
  },\
  \"documentation\":\"<fullname>IoT</fullname> <p>IoT provides secure, bi-directional communication between Internet-connected devices (such as sensors, actuators, embedded devices, or smart appliances) and the Amazon Web Services cloud. You can discover your custom IoT-Data endpoint to communicate with, configure rules for data processing and integration with other services, organize resources associated with each device (Registry), configure logging, and create and manage policies and credentials to authenticate devices.</p> <p>The service endpoints that expose this API are listed in <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/iot-core.html\\\">Amazon Web Services IoT Core Endpoints and Quotas</a>. You must use the endpoint for the region that has the resources you want to access.</p> <p>The service name used by <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Amazon Web Services Signature Version 4</a> to sign the request is: <i>execute-api</i>.</p> <p>For more information about how IoT works, see the <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html\\\">Developer Guide</a>.</p> <p>For information about how to use the credentials provider for IoT, see <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/authorizing-direct-aws.html\\\">Authorizing Direct Calls to Amazon Web Services Services</a>.</p>\"\
}\
";
}

@end
