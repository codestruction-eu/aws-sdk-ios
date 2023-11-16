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

#import "AWSFirehoseResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSFirehoseResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSFirehoseResources

+ (instancetype)sharedInstance {
    static AWSFirehoseResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSFirehoseResources new];
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
    \"apiVersion\":\"2015-08-04\",\
    \"endpointPrefix\":\"firehose\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceAbbreviation\":\"Firehose\",\
    \"serviceFullName\":\"Amazon Kinesis Firehose\",\
    \"serviceId\":\"Firehose\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"Firehose_20150804\",\
    \"uid\":\"firehose-2015-08-04\"\
  },\
  \"operations\":{\
    \"CreateDeliveryStream\":{\
      \"name\":\"CreateDeliveryStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDeliveryStreamInput\"},\
      \"output\":{\"shape\":\"CreateDeliveryStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidKMSResourceException\"}\
      ],\
      \"documentation\":\"<p>Creates a Kinesis Data Firehose delivery stream.</p> <p>By default, you can create up to 50 delivery streams per Amazon Web Services Region.</p> <p>This is an asynchronous operation that immediately returns. The initial status of the delivery stream is <code>CREATING</code>. After the delivery stream is created, its status is <code>ACTIVE</code> and it now accepts data. If the delivery stream creation fails, the status transitions to <code>CREATING_FAILED</code>. Attempts to send data to a delivery stream that is not in the <code>ACTIVE</code> state cause an exception. To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p> <p>If the status of a delivery stream is <code>CREATING_FAILED</code>, this status doesn't change, and you can't invoke <code>CreateDeliveryStream</code> again on it. However, you can invoke the <a>DeleteDeliveryStream</a> operation to delete it.</p> <p>A Kinesis Data Firehose delivery stream can be configured to receive records directly from providers using <a>PutRecord</a> or <a>PutRecordBatch</a>, or it can be configured to use an existing Kinesis stream as its source. To specify a Kinesis data stream as input, set the <code>DeliveryStreamType</code> parameter to <code>KinesisStreamAsSource</code>, and provide the Kinesis stream Amazon Resource Name (ARN) and role ARN in the <code>KinesisStreamSourceConfiguration</code> parameter.</p> <p>To create a delivery stream with server-side encryption (SSE) enabled, include <a>DeliveryStreamEncryptionConfigurationInput</a> in your request. This is optional. You can also invoke <a>StartDeliveryStreamEncryption</a> to turn on SSE for an existing delivery stream that doesn't have SSE enabled.</p> <p>A delivery stream is configured with a single destination, such as Amazon Simple Storage Service (Amazon S3), Amazon Redshift, Amazon OpenSearch Service, Amazon OpenSearch Serverless, Splunk, and any custom HTTP endpoint or HTTP endpoints owned by or supported by third-party service providers, including Datadog, Dynatrace, LogicMonitor, MongoDB, New Relic, and Sumo Logic. You must specify only one of the following destination configuration parameters: <code>ExtendedS3DestinationConfiguration</code>, <code>S3DestinationConfiguration</code>, <code>ElasticsearchDestinationConfiguration</code>, <code>RedshiftDestinationConfiguration</code>, or <code>SplunkDestinationConfiguration</code>.</p> <p>When you specify <code>S3DestinationConfiguration</code>, you can also provide the following optional values: BufferingHints, <code>EncryptionConfiguration</code>, and <code>CompressionFormat</code>. By default, if no <code>BufferingHints</code> value is provided, Kinesis Data Firehose buffers data up to 5 MB or for 5 minutes, whichever condition is satisfied first. <code>BufferingHints</code> is a hint, so there are some cases where the service cannot adhere to these conditions strictly. For example, record boundaries might be such that the size is a little over or under the configured buffering size. By default, no encryption is performed. We strongly recommend that you enable encryption to ensure secure data storage in Amazon S3.</p> <p>A few notes about Amazon Redshift as a destination:</p> <ul> <li> <p>An Amazon Redshift destination requires an S3 bucket as intermediate location. Kinesis Data Firehose first delivers data to Amazon S3 and then uses <code>COPY</code> syntax to load data into an Amazon Redshift table. This is specified in the <code>RedshiftDestinationConfiguration.S3Configuration</code> parameter.</p> </li> <li> <p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <code>RedshiftDestinationConfiguration.S3Configuration</code> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p> </li> <li> <p>We strongly recommend that you use the user name and password you provide exclusively with Kinesis Data Firehose, and that the permissions for the account are restricted for Amazon Redshift <code>INSERT</code> permissions.</p> </li> </ul> <p>Kinesis Data Firehose assumes the IAM role that is configured as part of the destination. The role should allow the Kinesis Data Firehose principal to assume the role, and the role should have permissions that allow the service to deliver the data. For more information, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3\\\">Grant Kinesis Data Firehose Access to an Amazon S3 Destination</a> in the <i>Amazon Kinesis Data Firehose Developer Guide</i>.</p>\"\
    },\
    \"DeleteDeliveryStream\":{\
      \"name\":\"DeleteDeliveryStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDeliveryStreamInput\"},\
      \"output\":{\"shape\":\"DeleteDeliveryStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes a delivery stream and its data.</p> <p>To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>. You can delete a delivery stream only if it is in one of the following states: <code>ACTIVE</code>, <code>DELETING</code>, <code>CREATING_FAILED</code>, or <code>DELETING_FAILED</code>. You can't delete a delivery stream that is in the <code>CREATING</code> state. While the deletion request is in process, the delivery stream is in the <code>DELETING</code> state.</p> <p>While the delivery stream is in the <code>DELETING</code> state, the service might continue to accept records, but it doesn't make any guarantees with respect to delivering the data. Therefore, as a best practice, first stop any applications that are sending records before you delete a delivery stream.</p>\"\
    },\
    \"DescribeDeliveryStream\":{\
      \"name\":\"DescribeDeliveryStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDeliveryStreamInput\"},\
      \"output\":{\"shape\":\"DescribeDeliveryStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified delivery stream and its status. For example, after your delivery stream is created, call <code>DescribeDeliveryStream</code> to see whether the delivery stream is <code>ACTIVE</code> and therefore ready for data to be sent to it. </p> <p>If the status of a delivery stream is <code>CREATING_FAILED</code>, this status doesn't change, and you can't invoke <a>CreateDeliveryStream</a> again on it. However, you can invoke the <a>DeleteDeliveryStream</a> operation to delete it. If the status is <code>DELETING_FAILED</code>, you can force deletion by invoking <a>DeleteDeliveryStream</a> again but with <a>DeleteDeliveryStreamInput$AllowForceDelete</a> set to true.</p>\"\
    },\
    \"ListDeliveryStreams\":{\
      \"name\":\"ListDeliveryStreams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDeliveryStreamsInput\"},\
      \"output\":{\"shape\":\"ListDeliveryStreamsOutput\"},\
      \"documentation\":\"<p>Lists your delivery streams in alphabetical order of their names.</p> <p>The number of delivery streams might be too large to return using a single call to <code>ListDeliveryStreams</code>. You can limit the number of delivery streams returned, using the <code>Limit</code> parameter. To determine whether there are more delivery streams to list, check the value of <code>HasMoreDeliveryStreams</code> in the output. If there are more delivery streams to list, you can request them by calling this operation again and setting the <code>ExclusiveStartDeliveryStreamName</code> parameter to the name of the last delivery stream returned in the last call.</p>\"\
    },\
    \"ListTagsForDeliveryStream\":{\
      \"name\":\"ListTagsForDeliveryStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForDeliveryStreamInput\"},\
      \"output\":{\"shape\":\"ListTagsForDeliveryStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags for the specified delivery stream. This operation has a limit of five transactions per second per account. </p>\"\
    },\
    \"PutRecord\":{\
      \"name\":\"PutRecord\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutRecordInput\"},\
      \"output\":{\"shape\":\"PutRecordOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"InvalidKMSResourceException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Writes a single data record into an Amazon Kinesis Data Firehose delivery stream. To write multiple data records into a delivery stream, use <a>PutRecordBatch</a>. Applications using these operations are referred to as producers.</p> <p>By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. If you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits and how to request an increase, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/limits.html\\\">Amazon Kinesis Data Firehose Limits</a>. </p> <p>Kinesis Data Firehose accumulates and publishes a particular metric for a customer account in one minute intervals. It is possible that the bursts of incoming bytes/records ingested to a delivery stream last only for a few seconds. Due to this, the actual spikes in the traffic might not be fully visible in the customer's 1 minute CloudWatch metrics.</p> <p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KiB in size, and any kind of data. For example, it can be a segment from a log file, geographic location data, website clickstream data, and so on.</p> <p>Kinesis Data Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\\\\n</code>) or some other character unique within the data. This allows the consumer application to parse individual data items when reading the data from the destination.</p> <p>The <code>PutRecord</code> operation returns a <code>RecordId</code>, which is a unique string assigned to each record. Producer applications can use this ID for purposes such as auditability and investigation.</p> <p>If the <code>PutRecord</code> operation throws a <code>ServiceUnavailableException</code>, the API is automatically reinvoked (retried) 3 times. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream. </p> <p>Re-invoking the Put API operations (for example, PutRecord and PutRecordBatch) can result in data duplicates. For larger data assets, allow for a longer time out before retrying Put API operations.</p> <p>Data records sent to Kinesis Data Firehose are stored for 24 hours from the time they are added to a delivery stream as it tries to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p> <important> <p>Don't concatenate two or more base64 strings to form the data fields of your records. Instead, concatenate the raw data, then perform base64 encoding.</p> </important>\"\
    },\
    \"PutRecordBatch\":{\
      \"name\":\"PutRecordBatch\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutRecordBatchInput\"},\
      \"output\":{\"shape\":\"PutRecordBatchOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"InvalidKMSResourceException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Writes multiple data records into a delivery stream in a single call, which can achieve higher throughput per producer than when writing single records. To write single data records into a delivery stream, use <a>PutRecord</a>. Applications using these operations are referred to as producers.</p> <p>Kinesis Data Firehose accumulates and publishes a particular metric for a customer account in one minute intervals. It is possible that the bursts of incoming bytes/records ingested to a delivery stream last only for a few seconds. Due to this, the actual spikes in the traffic might not be fully visible in the customer's 1 minute CloudWatch metrics.</p> <p>For information about service quota, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/limits.html\\\">Amazon Kinesis Data Firehose Quota</a>.</p> <p>Each <a>PutRecordBatch</a> request supports up to 500 records. Each record in the request can be as large as 1,000 KB (before base64 encoding), up to a limit of 4 MB for the entire request. These limits cannot be changed.</p> <p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data. For example, it could be a segment from a log file, geographic location data, website clickstream data, and so on.</p> <p>Kinesis Data Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\\\\n</code>) or some other character unique within the data. This allows the consumer application to parse individual data items when reading the data from the destination.</p> <p>The <a>PutRecordBatch</a> response includes a count of failed records, <code>FailedPutCount</code>, and an array of responses, <code>RequestResponses</code>. Even if the <a>PutRecordBatch</a> call succeeds, the value of <code>FailedPutCount</code> may be greater than 0, indicating that there are records for which the operation didn't succeed. Each entry in the <code>RequestResponses</code> array provides additional information about the processed record. It directly correlates with a record in the request array using the same ordering, from the top to the bottom. The response array always includes the same number of records as the request array. <code>RequestResponses</code> includes both successfully and unsuccessfully processed records. Kinesis Data Firehose tries to process all records in each <a>PutRecordBatch</a> request. A single record failure does not stop the processing of subsequent records. </p> <p>A successfully processed record includes a <code>RecordId</code> value, which is unique for the record. An unsuccessfully processed record includes <code>ErrorCode</code> and <code>ErrorMessage</code> values. <code>ErrorCode</code> reflects the type of error, and is one of the following values: <code>ServiceUnavailableException</code> or <code>InternalFailure</code>. <code>ErrorMessage</code> provides more detailed information about the error.</p> <p>If there is an internal server error or a timeout, the write might have completed or it might have failed. If <code>FailedPutCount</code> is greater than 0, retry the request, resending only those records that might have failed processing. This minimizes the possible duplicate records and also reduces the total bytes sent (and corresponding charges). We recommend that you handle any duplicates at the destination.</p> <p>If <a>PutRecordBatch</a> throws <code>ServiceUnavailableException</code>, the API is automatically reinvoked (retried) 3 times. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream.</p> <p>Re-invoking the Put API operations (for example, PutRecord and PutRecordBatch) can result in data duplicates. For larger data assets, allow for a longer time out before retrying Put API operations.</p> <p>Data records sent to Kinesis Data Firehose are stored for 24 hours from the time they are added to a delivery stream as it attempts to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p> <important> <p>Don't concatenate two or more base64 strings to form the data fields of your records. Instead, concatenate the raw data, then perform base64 encoding.</p> </important>\"\
    },\
    \"StartDeliveryStreamEncryption\":{\
      \"name\":\"StartDeliveryStreamEncryption\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartDeliveryStreamEncryptionInput\"},\
      \"output\":{\"shape\":\"StartDeliveryStreamEncryptionOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidKMSResourceException\"}\
      ],\
      \"documentation\":\"<p>Enables server-side encryption (SSE) for the delivery stream. </p> <p>This operation is asynchronous. It returns immediately. When you invoke it, Kinesis Data Firehose first sets the encryption status of the stream to <code>ENABLING</code>, and then to <code>ENABLED</code>. The encryption status of a delivery stream is the <code>Status</code> property in <a>DeliveryStreamEncryptionConfiguration</a>. If the operation fails, the encryption status changes to <code>ENABLING_FAILED</code>. You can continue to read and write data to your delivery stream while the encryption status is <code>ENABLING</code>, but the data is not encrypted. It can take up to 5 seconds after the encryption status changes to <code>ENABLED</code> before all records written to the delivery stream are encrypted. To find out whether a record or a batch of records was encrypted, check the response elements <a>PutRecordOutput$Encrypted</a> and <a>PutRecordBatchOutput$Encrypted</a>, respectively.</p> <p>To check the encryption status of a delivery stream, use <a>DescribeDeliveryStream</a>.</p> <p>Even if encryption is currently enabled for a delivery stream, you can still invoke this operation on it to change the ARN of the CMK or both its type and ARN. If you invoke this method to change the CMK, and the old CMK is of type <code>CUSTOMER_MANAGED_CMK</code>, Kinesis Data Firehose schedules the grant it had on the old CMK for retirement. If the new CMK is of type <code>CUSTOMER_MANAGED_CMK</code>, Kinesis Data Firehose creates a grant that enables it to use the new CMK to encrypt and decrypt data and to manage the grant.</p> <p>For the KMS grant creation to be successful, Kinesis Data Firehose APIs <code>StartDeliveryStreamEncryption</code> and <code>CreateDeliveryStream</code> should not be called with session credentials that are more than 6 hours old.</p> <p>If a delivery stream already has encryption enabled and then you invoke this operation to change the ARN of the CMK or both its type and ARN and you get <code>ENABLING_FAILED</code>, this only means that the attempt to change the CMK failed. In this case, encryption remains enabled with the old CMK.</p> <p>If the encryption status of your delivery stream is <code>ENABLING_FAILED</code>, you can invoke this operation again with a valid CMK. The CMK must be enabled and the key policy mustn't explicitly deny the permission for Kinesis Data Firehose to invoke KMS encrypt and decrypt operations.</p> <p>You can enable SSE for a delivery stream only if it's a delivery stream that uses <code>DirectPut</code> as its source. </p> <p>The <code>StartDeliveryStreamEncryption</code> and <code>StopDeliveryStreamEncryption</code> operations have a combined limit of 25 calls per delivery stream per 24 hours. For example, you reach the limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery stream in a 24-hour period.</p>\"\
    },\
    \"StopDeliveryStreamEncryption\":{\
      \"name\":\"StopDeliveryStreamEncryption\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopDeliveryStreamEncryptionInput\"},\
      \"output\":{\"shape\":\"StopDeliveryStreamEncryptionOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Disables server-side encryption (SSE) for the delivery stream. </p> <p>This operation is asynchronous. It returns immediately. When you invoke it, Kinesis Data Firehose first sets the encryption status of the stream to <code>DISABLING</code>, and then to <code>DISABLED</code>. You can continue to read and write data to your stream while its status is <code>DISABLING</code>. It can take up to 5 seconds after the encryption status changes to <code>DISABLED</code> before all records written to the delivery stream are no longer subject to encryption. To find out whether a record or a batch of records was encrypted, check the response elements <a>PutRecordOutput$Encrypted</a> and <a>PutRecordBatchOutput$Encrypted</a>, respectively.</p> <p>To check the encryption state of a delivery stream, use <a>DescribeDeliveryStream</a>. </p> <p>If SSE is enabled using a customer managed CMK and then you invoke <code>StopDeliveryStreamEncryption</code>, Kinesis Data Firehose schedules the related KMS grant for retirement and then retires it after it ensures that it is finished delivering records to the destination.</p> <p>The <code>StartDeliveryStreamEncryption</code> and <code>StopDeliveryStreamEncryption</code> operations have a combined limit of 25 calls per delivery stream per 24 hours. For example, you reach the limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery stream in a 24-hour period.</p>\"\
    },\
    \"TagDeliveryStream\":{\
      \"name\":\"TagDeliveryStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagDeliveryStreamInput\"},\
      \"output\":{\"shape\":\"TagDeliveryStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Adds or updates tags for the specified delivery stream. A tag is a key-value pair that you can define and assign to Amazon Web Services resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Tags are metadata. For example, you can add friendly names and descriptions or other types of information that can help you distinguish the delivery stream. For more information about tags, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html\\\">Using Cost Allocation Tags</a> in the <i>Amazon Web Services Billing and Cost Management User Guide</i>. </p> <p>Each delivery stream can have up to 50 tags. </p> <p>This operation has a limit of five transactions per second per account. </p>\"\
    },\
    \"UntagDeliveryStream\":{\
      \"name\":\"UntagDeliveryStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagDeliveryStreamInput\"},\
      \"output\":{\"shape\":\"UntagDeliveryStreamOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Removes tags from the specified delivery stream. Removed tags are deleted, and you can't recover them after this operation successfully completes.</p> <p>If you specify a tag that doesn't exist, the operation ignores it.</p> <p>This operation has a limit of five transactions per second per account. </p>\"\
    },\
    \"UpdateDestination\":{\
      \"name\":\"UpdateDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDestinationInput\"},\
      \"output\":{\"shape\":\"UpdateDestinationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified destination of the specified delivery stream.</p> <p>Use this operation to change the destination type (for example, to replace the Amazon S3 destination with Amazon Redshift) or change the parameters associated with a destination (for example, to change the bucket name of the Amazon S3 destination). The update might not occur immediately. The target delivery stream remains active while the configurations are updated, so data writes to the delivery stream can continue during this process. The updated configurations are usually effective within a few minutes.</p> <p>Switching between Amazon OpenSearch Service and other services is not supported. For an Amazon OpenSearch Service destination, you can only update to another Amazon OpenSearch Service destination.</p> <p>If the destination type is the same, Kinesis Data Firehose merges the configuration parameters specified with the destination configuration that already exists on the delivery stream. If any of the parameters are not specified in the call, the existing values are retained. For example, in the Amazon S3 destination, if <a>EncryptionConfiguration</a> is not specified, then the existing <code>EncryptionConfiguration</code> is maintained on the destination.</p> <p>If the destination type is not the same, for example, changing the destination from Amazon S3 to Amazon Redshift, Kinesis Data Firehose does not merge any parameters. In this case, all parameters must be specified.</p> <p>Kinesis Data Firehose uses <code>CurrentDeliveryStreamVersionId</code> to avoid race conditions and conflicting merges. This is a required field, and the service updates the configuration only if the existing configuration has a version ID that matches. After the update is applied successfully, the version ID is updated, and can be retrieved using <a>DescribeDeliveryStream</a>. Use the new version ID to set <code>CurrentDeliveryStreamVersionId</code> in the next call.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AWSKMSKeyARN\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"AmazonOpenSearchServerlessBufferingHints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntervalInSeconds\":{\
          \"shape\":\"AmazonOpenSearchServerlessBufferingIntervalInSeconds\",\
          \"documentation\":\"<p>Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300 (5 minutes).</p>\"\
        },\
        \"SizeInMBs\":{\
          \"shape\":\"AmazonOpenSearchServerlessBufferingSizeInMBs\",\
          \"documentation\":\"<p>Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. </p> <p>We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the buffering to perform before delivering data to the Serverless offering for Amazon OpenSearch Service destination.</p>\"\
    },\
    \"AmazonOpenSearchServerlessBufferingIntervalInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":900,\
      \"min\":60\
    },\
    \"AmazonOpenSearchServerlessBufferingSizeInMBs\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AmazonOpenSearchServerlessCollectionEndpoint\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"https:.*\"\
    },\
    \"AmazonOpenSearchServerlessDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"IndexName\",\
        \"S3Configuration\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data Firehose for calling the Serverless offering for Amazon OpenSearch Service Configuration API and for indexing documents.</p>\"\
        },\
        \"CollectionEndpoint\":{\
          \"shape\":\"AmazonOpenSearchServerlessCollectionEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the collection in the Serverless offering for Amazon OpenSearch Service.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"AmazonOpenSearchServerlessIndexName\",\
          \"documentation\":\"<p>The Serverless offering for Amazon OpenSearch Service index name.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"AmazonOpenSearchServerlessBufferingHints\",\
          \"documentation\":\"<p>The buffering options. If no value is specified, the default values for AmazonopensearchserviceBufferingHints are used.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"AmazonOpenSearchServerlessRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to the Serverless offering for Amazon OpenSearch Service. The default value is 300 (5 minutes).</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"AmazonOpenSearchServerlessS3BackupMode\",\
          \"documentation\":\"<p>Defines how documents should be delivered to Amazon S3. When it is set to FailedDocumentsOnly, Kinesis Data Firehose writes any documents that could not be indexed to the configured Amazon S3 destination, with AmazonOpenSearchService-failed/ appended to the key prefix. When set to AllDocuments, Kinesis Data Firehose delivers all incoming records to Amazon S3, and also writes failed documents with AmazonOpenSearchService-failed/ appended to the prefix.</p>\"\
        },\
        \"S3Configuration\":{\"shape\":\"S3DestinationConfiguration\"},\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"VpcConfiguration\":{\"shape\":\"VpcConfiguration\"}\
      },\
      \"documentation\":\"<p>Describes the configuration of a destination in the Serverless offering for Amazon OpenSearch Service.</p>\"\
    },\
    \"AmazonOpenSearchServerlessDestinationDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials.</p>\"\
        },\
        \"CollectionEndpoint\":{\
          \"shape\":\"AmazonOpenSearchServerlessCollectionEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the collection in the Serverless offering for Amazon OpenSearch Service.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"AmazonOpenSearchServerlessIndexName\",\
          \"documentation\":\"<p>The Serverless offering for Amazon OpenSearch Service index name.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"AmazonOpenSearchServerlessBufferingHints\",\
          \"documentation\":\"<p>The buffering options.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"AmazonOpenSearchServerlessRetryOptions\",\
          \"documentation\":\"<p>The Serverless offering for Amazon OpenSearch Service retry options.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"AmazonOpenSearchServerlessS3BackupMode\",\
          \"documentation\":\"<p>The Amazon S3 backup mode.</p>\"\
        },\
        \"S3DestinationDescription\":{\"shape\":\"S3DestinationDescription\"},\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"VpcConfigurationDescription\":{\"shape\":\"VpcConfigurationDescription\"}\
      },\
      \"documentation\":\"<p>The destination description in the Serverless offering for Amazon OpenSearch Service.</p>\"\
    },\
    \"AmazonOpenSearchServerlessDestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data Firehose for calling the Serverless offering for Amazon OpenSearch Service Configuration API and for indexing documents.</p>\"\
        },\
        \"CollectionEndpoint\":{\
          \"shape\":\"AmazonOpenSearchServerlessCollectionEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the collection in the Serverless offering for Amazon OpenSearch Service.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"AmazonOpenSearchServerlessIndexName\",\
          \"documentation\":\"<p>The Serverless offering for Amazon OpenSearch Service index name.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"AmazonOpenSearchServerlessBufferingHints\",\
          \"documentation\":\"<p>The buffering options. If no value is specified, AmazonopensearchBufferingHints object default values are used.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"AmazonOpenSearchServerlessRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to the Serverless offering for Amazon OpenSearch Service. The default value is 300 (5 minutes).</p>\"\
        },\
        \"S3Update\":{\"shape\":\"S3DestinationUpdate\"},\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"}\
      },\
      \"documentation\":\"<p>Describes an update for a destination in the Serverless offering for Amazon OpenSearch Service.</p>\"\
    },\
    \"AmazonOpenSearchServerlessIndexName\":{\
      \"type\":\"string\",\
      \"max\":80,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"AmazonOpenSearchServerlessRetryDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":7200,\
      \"min\":0\
    },\
    \"AmazonOpenSearchServerlessRetryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DurationInSeconds\":{\
          \"shape\":\"AmazonOpenSearchServerlessRetryDurationInSeconds\",\
          \"documentation\":\"<p>After an initial failure to deliver to the Serverless offering for Amazon OpenSearch Service, the total amount of time during which Kinesis Data Firehose retries delivery (including the first attempt). After this time has elapsed, the failed documents are written to Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero) results in no retries.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures retry behavior in case Kinesis Data Firehose is unable to deliver documents to the Serverless offering for Amazon OpenSearch Service.</p>\"\
    },\
    \"AmazonOpenSearchServerlessS3BackupMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FailedDocumentsOnly\",\
        \"AllDocuments\"\
      ]\
    },\
    \"AmazonopensearchserviceBufferingHints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntervalInSeconds\":{\
          \"shape\":\"AmazonopensearchserviceBufferingIntervalInSeconds\",\
          \"documentation\":\"<p>Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300 (5 minutes). </p>\"\
        },\
        \"SizeInMBs\":{\
          \"shape\":\"AmazonopensearchserviceBufferingSizeInMBs\",\
          \"documentation\":\"<p>Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5.</p> <p>We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the buffering to perform before delivering data to the Amazon OpenSearch Service destination. </p>\"\
    },\
    \"AmazonopensearchserviceBufferingIntervalInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":900,\
      \"min\":60\
    },\
    \"AmazonopensearchserviceBufferingSizeInMBs\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AmazonopensearchserviceClusterEndpoint\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"https:.*\"\
    },\
    \"AmazonopensearchserviceDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"IndexName\",\
        \"S3Configuration\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data Firehose for calling the Amazon OpenSearch Service Configuration API and for indexing documents.</p>\"\
        },\
        \"DomainARN\":{\
          \"shape\":\"AmazonopensearchserviceDomainARN\",\
          \"documentation\":\"<p>The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for DescribeElasticsearchDomain, DescribeElasticsearchDomains, and DescribeElasticsearchDomainConfig after assuming the role specified in RoleARN. </p>\"\
        },\
        \"ClusterEndpoint\":{\
          \"shape\":\"AmazonopensearchserviceClusterEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the cluster. Specify either this ClusterEndpoint or the DomainARN field. </p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"AmazonopensearchserviceIndexName\",\
          \"documentation\":\"<p>The ElasticsearAmazon OpenSearch Service index name.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"AmazonopensearchserviceTypeName\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be only one type per index. If you try to specify a new type for an existing index that already has another type, Kinesis Data Firehose returns an error during run time. </p>\"\
        },\
        \"IndexRotationPeriod\":{\
          \"shape\":\"AmazonopensearchserviceIndexRotationPeriod\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service index rotation period. Index rotation appends a timestamp to the IndexName to facilitate the expiration of old data.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"AmazonopensearchserviceBufferingHints\",\
          \"documentation\":\"<p>The buffering options. If no value is specified, the default values for AmazonopensearchserviceBufferingHints are used. </p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"AmazonopensearchserviceRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon OpenSearch Service. The default value is 300 (5 minutes). </p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"AmazonopensearchserviceS3BackupMode\",\
          \"documentation\":\"<p>Defines how documents should be delivered to Amazon S3. When it is set to FailedDocumentsOnly, Kinesis Data Firehose writes any documents that could not be indexed to the configured Amazon S3 destination, with AmazonOpenSearchService-failed/ appended to the key prefix. When set to AllDocuments, Kinesis Data Firehose delivers all incoming records to Amazon S3, and also writes failed documents with AmazonOpenSearchService-failed/ appended to the prefix. </p>\"\
        },\
        \"S3Configuration\":{\"shape\":\"S3DestinationConfiguration\"},\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"VpcConfiguration\":{\"shape\":\"VpcConfiguration\"},\
        \"DocumentIdOptions\":{\
          \"shape\":\"DocumentIdOptions\",\
          \"documentation\":\"<p>Indicates the method for setting up document ID. The supported methods are Kinesis Data Firehose generated document ID and OpenSearch Service generated document ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of a destination in Amazon OpenSearch Service</p>\"\
    },\
    \"AmazonopensearchserviceDestinationDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. </p>\"\
        },\
        \"DomainARN\":{\
          \"shape\":\"AmazonopensearchserviceDomainARN\",\
          \"documentation\":\"<p>The ARN of the Amazon OpenSearch Service domain.</p>\"\
        },\
        \"ClusterEndpoint\":{\
          \"shape\":\"AmazonopensearchserviceClusterEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the cluster. Kinesis Data Firehose uses either this ClusterEndpoint or the DomainARN field to send data to Amazon OpenSearch Service. </p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"AmazonopensearchserviceIndexName\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service index name.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"AmazonopensearchserviceTypeName\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service type name. This applies to Elasticsearch 6.x and lower versions. For Elasticsearch 7.x and OpenSearch Service 1.x, there's no value for TypeName. </p>\"\
        },\
        \"IndexRotationPeriod\":{\
          \"shape\":\"AmazonopensearchserviceIndexRotationPeriod\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service index rotation period</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"AmazonopensearchserviceBufferingHints\",\
          \"documentation\":\"<p>The buffering options.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"AmazonopensearchserviceRetryOptions\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service retry options.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"AmazonopensearchserviceS3BackupMode\",\
          \"documentation\":\"<p>The Amazon S3 backup mode.</p>\"\
        },\
        \"S3DestinationDescription\":{\"shape\":\"S3DestinationDescription\"},\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"VpcConfigurationDescription\":{\"shape\":\"VpcConfigurationDescription\"},\
        \"DocumentIdOptions\":{\
          \"shape\":\"DocumentIdOptions\",\
          \"documentation\":\"<p>Indicates the method for setting up document ID. The supported methods are Kinesis Data Firehose generated document ID and OpenSearch Service generated document ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The destination description in Amazon OpenSearch Service.</p>\"\
    },\
    \"AmazonopensearchserviceDestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data Firehose for calling the Amazon OpenSearch Service Configuration API and for indexing documents. </p>\"\
        },\
        \"DomainARN\":{\
          \"shape\":\"AmazonopensearchserviceDomainARN\",\
          \"documentation\":\"<p>The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for DescribeDomain, DescribeDomains, and DescribeDomainConfig after assuming the IAM role specified in RoleARN.</p>\"\
        },\
        \"ClusterEndpoint\":{\
          \"shape\":\"AmazonopensearchserviceClusterEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the cluster. Specify either this ClusterEndpoint or the DomainARN field. </p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"AmazonopensearchserviceIndexName\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service index name.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"AmazonopensearchserviceTypeName\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be only one type per index. If you try to specify a new type for an existing index that already has another type, Kinesis Data Firehose returns an error during runtime. </p> <p>If you upgrade Elasticsearch from 6.x to 7.x and donât update your delivery stream, Kinesis Data Firehose still delivers data to Elasticsearch with the old index name and type name. If you want to update your delivery stream with a new index name, provide an empty string for TypeName. </p>\"\
        },\
        \"IndexRotationPeriod\":{\
          \"shape\":\"AmazonopensearchserviceIndexRotationPeriod\",\
          \"documentation\":\"<p>The Amazon OpenSearch Service index rotation period. Index rotation appends a timestamp to IndexName to facilitate the expiration of old data.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"AmazonopensearchserviceBufferingHints\",\
          \"documentation\":\"<p>The buffering options. If no value is specified, AmazonopensearchBufferingHints object default values are used. </p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"AmazonopensearchserviceRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon OpenSearch Service. The default value is 300 (5 minutes). </p>\"\
        },\
        \"S3Update\":{\"shape\":\"S3DestinationUpdate\"},\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"DocumentIdOptions\":{\
          \"shape\":\"DocumentIdOptions\",\
          \"documentation\":\"<p>Indicates the method for setting up document ID. The supported methods are Kinesis Data Firehose generated document ID and OpenSearch Service generated document ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an update for a destination in Amazon OpenSearch Service.</p>\"\
    },\
    \"AmazonopensearchserviceDomainARN\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"AmazonopensearchserviceIndexName\":{\
      \"type\":\"string\",\
      \"max\":80,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"AmazonopensearchserviceIndexRotationPeriod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NoRotation\",\
        \"OneHour\",\
        \"OneDay\",\
        \"OneWeek\",\
        \"OneMonth\"\
      ]\
    },\
    \"AmazonopensearchserviceRetryDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":7200,\
      \"min\":0\
    },\
    \"AmazonopensearchserviceRetryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DurationInSeconds\":{\
          \"shape\":\"AmazonopensearchserviceRetryDurationInSeconds\",\
          \"documentation\":\"<p>After an initial failure to deliver to Amazon OpenSearch Service, the total amount of time during which Kinesis Data Firehose retries delivery (including the first attempt). After this time has elapsed, the failed documents are written to Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero) results in no retries. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon OpenSearch Service. </p>\"\
    },\
    \"AmazonopensearchserviceS3BackupMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FailedDocumentsOnly\",\
        \"AllDocuments\"\
      ]\
    },\
    \"AmazonopensearchserviceTypeName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"AuthenticationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"Connectivity\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The ARN of the role used to access the Amazon MSK cluster.</p>\"\
        },\
        \"Connectivity\":{\
          \"shape\":\"Connectivity\",\
          \"documentation\":\"<p>The type of connectivity used to access the Amazon MSK cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The authentication configuration of the Amazon MSK cluster.</p>\"\
    },\
    \"BlockSizeBytes\":{\
      \"type\":\"integer\",\
      \"min\":67108864\
    },\
    \"BooleanObject\":{\"type\":\"boolean\"},\
    \"BucketARN\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"BufferingHints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SizeInMBs\":{\
          \"shape\":\"SizeInMBs\",\
          \"documentation\":\"<p>Buffer incoming data to the specified size, in MiBs, before delivering it to the destination. The default value is 5. This parameter is optional but if you specify a value for it, you must also specify a value for <code>IntervalInSeconds</code>, and vice versa.</p> <p>We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MiB/sec, the value should be 10 MiB or higher.</p>\"\
        },\
        \"IntervalInSeconds\":{\
          \"shape\":\"IntervalInSeconds\",\
          \"documentation\":\"<p>Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300. This parameter is optional but if you specify a value for it, you must also specify a value for <code>SizeInMBs</code>, and vice versa.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes hints for the buffering to perform before delivering data to the destination. These options are treated as hints, and therefore Kinesis Data Firehose might choose to use different values when it is optimal. The <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are optional. However, if specify a value for one of them, you must also provide a value for the other.</p>\"\
    },\
    \"CloudWatchLoggingOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Enables or disables CloudWatch logging.</p>\"\
        },\
        \"LogGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The CloudWatch group name for logging. This value is required if CloudWatch logging is enabled.</p>\"\
        },\
        \"LogStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The CloudWatch log stream name for logging. This value is required if CloudWatch logging is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the Amazon CloudWatch logging options for your delivery stream.</p>\"\
    },\
    \"ClusterJDBCURL\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"jdbc:(redshift|postgresql)://((?!-)[A-Za-z0-9-]{1,63}(?<!-)\\\\.)+(redshift(-serverless)?)\\\\.([a-zA-Z0-9\\\\.]+):\\\\d{1,5}/[a-zA-Z0-9_$-]+\"\
    },\
    \"ColumnToJsonKeyMappings\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"NonEmptyStringWithoutWhitespace\"},\
      \"value\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"CompressionFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNCOMPRESSED\",\
        \"GZIP\",\
        \"ZIP\",\
        \"Snappy\",\
        \"HADOOP_SNAPPY\"\
      ]\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message that provides information about the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Another modification has already happened. Fetch <code>VersionId</code> again and use it to update the destination.</p>\",\
      \"exception\":true\
    },\
    \"Connectivity\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUBLIC\",\
        \"PRIVATE\"\
      ]\
    },\
    \"ContentEncoding\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NONE\",\
        \"GZIP\"\
      ]\
    },\
    \"CopyCommand\":{\
      \"type\":\"structure\",\
      \"required\":[\"DataTableName\"],\
      \"members\":{\
        \"DataTableName\":{\
          \"shape\":\"DataTableName\",\
          \"documentation\":\"<p>The name of the target table. The table must already exist in the database.</p>\"\
        },\
        \"DataTableColumns\":{\
          \"shape\":\"DataTableColumns\",\
          \"documentation\":\"<p>A comma-separated list of column names.</p>\"\
        },\
        \"CopyOptions\":{\
          \"shape\":\"CopyOptions\",\
          \"documentation\":\"<p>Optional parameters to use with the Amazon Redshift <code>COPY</code> command. For more information, see the \\\"Optional Parameters\\\" section of <a href=\\\"https://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html\\\">Amazon Redshift COPY command</a>. Some possible examples that would apply to Kinesis Data Firehose are as follows:</p> <p> <code>delimiter '\\\\t' lzop;</code> - fields are delimited with \\\"\\\\t\\\" (TAB character) and compressed using lzop.</p> <p> <code>delimiter '|'</code> - fields are delimited with \\\"|\\\" (this is the default delimiter).</p> <p> <code>delimiter '|' escape</code> - the delimiter should be escaped.</p> <p> <code>fixedwidth 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6'</code> - fields are fixed width in the source, with each width specified after every column in the table.</p> <p> <code>JSON 's3://mybucket/jsonpaths.txt'</code> - data is in JSON format, and the path specified is the format of the data.</p> <p>For more examples, see <a href=\\\"https://docs.aws.amazon.com/redshift/latest/dg/r_COPY_command_examples.html\\\">Amazon Redshift COPY command examples</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a <code>COPY</code> command for Amazon Redshift.</p>\"\
    },\
    \"CopyOptions\":{\
      \"type\":\"string\",\
      \"max\":204800,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"CreateDeliveryStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliveryStreamName\"],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream. This name must be unique per Amazon Web Services account in the same Amazon Web Services Region. If the delivery streams are in different accounts or different Regions, you can have multiple delivery streams with the same name.</p>\"\
        },\
        \"DeliveryStreamType\":{\
          \"shape\":\"DeliveryStreamType\",\
          \"documentation\":\"<p>The delivery stream type. This parameter can be one of the following values:</p> <ul> <li> <p> <code>DirectPut</code>: Provider applications access the delivery stream directly.</p> </li> <li> <p> <code>KinesisStreamAsSource</code>: The delivery stream uses a Kinesis data stream as a source.</p> </li> </ul>\"\
        },\
        \"KinesisStreamSourceConfiguration\":{\
          \"shape\":\"KinesisStreamSourceConfiguration\",\
          \"documentation\":\"<p>When a Kinesis data stream is used as the source for the delivery stream, a <a>KinesisStreamSourceConfiguration</a> containing the Kinesis data stream Amazon Resource Name (ARN) and the role ARN for the source stream.</p>\"\
        },\
        \"DeliveryStreamEncryptionConfigurationInput\":{\
          \"shape\":\"DeliveryStreamEncryptionConfigurationInput\",\
          \"documentation\":\"<p>Used to specify the type and Amazon Resource Name (ARN) of the KMS key needed for Server-Side Encryption (SSE).</p>\"\
        },\
        \"S3DestinationConfiguration\":{\
          \"shape\":\"S3DestinationConfiguration\",\
          \"documentation\":\"<p>[Deprecated] The destination in Amazon S3. You can specify only one destination.</p>\",\
          \"deprecated\":true\
        },\
        \"ExtendedS3DestinationConfiguration\":{\
          \"shape\":\"ExtendedS3DestinationConfiguration\",\
          \"documentation\":\"<p>The destination in Amazon S3. You can specify only one destination.</p>\"\
        },\
        \"RedshiftDestinationConfiguration\":{\
          \"shape\":\"RedshiftDestinationConfiguration\",\
          \"documentation\":\"<p>The destination in Amazon Redshift. You can specify only one destination.</p>\"\
        },\
        \"ElasticsearchDestinationConfiguration\":{\
          \"shape\":\"ElasticsearchDestinationConfiguration\",\
          \"documentation\":\"<p>The destination in Amazon ES. You can specify only one destination.</p>\"\
        },\
        \"AmazonopensearchserviceDestinationConfiguration\":{\
          \"shape\":\"AmazonopensearchserviceDestinationConfiguration\",\
          \"documentation\":\"<p>The destination in Amazon OpenSearch Service. You can specify only one destination.</p>\"\
        },\
        \"SplunkDestinationConfiguration\":{\
          \"shape\":\"SplunkDestinationConfiguration\",\
          \"documentation\":\"<p>The destination in Splunk. You can specify only one destination.</p>\"\
        },\
        \"HttpEndpointDestinationConfiguration\":{\
          \"shape\":\"HttpEndpointDestinationConfiguration\",\
          \"documentation\":\"<p>Enables configuring Kinesis Firehose to deliver data to any HTTP endpoint destination. You can specify only one destination.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagDeliveryStreamInputTagList\",\
          \"documentation\":\"<p>A set of tags to assign to the delivery stream. A tag is a key-value pair that you can define and assign to Amazon Web Services resources. Tags are metadata. For example, you can add friendly names and descriptions or other types of information that can help you distinguish the delivery stream. For more information about tags, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html\\\">Using Cost Allocation Tags</a> in the Amazon Web Services Billing and Cost Management User Guide.</p> <p>You can specify up to 50 tags when creating a delivery stream.</p>\"\
        },\
        \"AmazonOpenSearchServerlessDestinationConfiguration\":{\
          \"shape\":\"AmazonOpenSearchServerlessDestinationConfiguration\",\
          \"documentation\":\"<p>The destination in the Serverless offering for Amazon OpenSearch Service. You can specify only one destination.</p>\"\
        },\
        \"MSKSourceConfiguration\":{\"shape\":\"MSKSourceConfiguration\"}\
      }\
    },\
    \"CreateDeliveryStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeliveryStreamARN\":{\
          \"shape\":\"DeliveryStreamARN\",\
          \"documentation\":\"<p>The ARN of the delivery stream.</p>\"\
        }\
      }\
    },\
    \"Data\":{\
      \"type\":\"blob\",\
      \"max\":1024000,\
      \"min\":0\
    },\
    \"DataFormatConversionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SchemaConfiguration\":{\
          \"shape\":\"SchemaConfiguration\",\
          \"documentation\":\"<p>Specifies the Amazon Web Services Glue Data Catalog table that contains the column information. This parameter is required if <code>Enabled</code> is set to true.</p>\"\
        },\
        \"InputFormatConfiguration\":{\
          \"shape\":\"InputFormatConfiguration\",\
          \"documentation\":\"<p>Specifies the deserializer that you want Kinesis Data Firehose to use to convert the format of your data from JSON. This parameter is required if <code>Enabled</code> is set to true.</p>\"\
        },\
        \"OutputFormatConfiguration\":{\
          \"shape\":\"OutputFormatConfiguration\",\
          \"documentation\":\"<p>Specifies the serializer that you want Kinesis Data Firehose to use to convert the format of your data to the Parquet or ORC format. This parameter is required if <code>Enabled</code> is set to true.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Defaults to <code>true</code>. Set it to <code>false</code> if you want to disable format conversion while preserving the configuration details.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies that you want Kinesis Data Firehose to convert data from the JSON format to the Parquet or ORC format before writing it to Amazon S3. Kinesis Data Firehose uses the serializer and deserializer that you specify, in addition to the column information from the Amazon Web Services Glue table, to deserialize your input data from JSON and then serialize it to the Parquet or ORC format. For more information, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html\\\">Kinesis Data Firehose Record Format Conversion</a>.</p>\"\
    },\
    \"DataTableColumns\":{\
      \"type\":\"string\",\
      \"max\":204800,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"DataTableName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"DefaultDocumentIdFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FIREHOSE_DEFAULT\",\
        \"NO_DOCUMENT_ID\"\
      ]\
    },\
    \"DeleteDeliveryStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliveryStreamName\"],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream.</p>\"\
        },\
        \"AllowForceDelete\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Set this to true if you want to delete the delivery stream even if Kinesis Data Firehose is unable to retire the grant for the CMK. Kinesis Data Firehose might be unable to retire the grant due to a customer error, such as when the CMK or the grant are in an invalid state. If you force deletion, you can then use the <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html\\\">RevokeGrant</a> operation to revoke the grant you gave to Kinesis Data Firehose. If a failure to retire the grant happens due to an Amazon Web Services KMS issue, Kinesis Data Firehose keeps retrying the delete operation.</p> <p>The default value is false.</p>\"\
        }\
      }\
    },\
    \"DeleteDeliveryStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeliveryStartTimestamp\":{\"type\":\"timestamp\"},\
    \"DeliveryStreamARN\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"DeliveryStreamDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryStreamName\",\
        \"DeliveryStreamARN\",\
        \"DeliveryStreamStatus\",\
        \"DeliveryStreamType\",\
        \"VersionId\",\
        \"Destinations\",\
        \"HasMoreDestinations\"\
      ],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream.</p>\"\
        },\
        \"DeliveryStreamARN\":{\
          \"shape\":\"DeliveryStreamARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the delivery stream. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"DeliveryStreamStatus\":{\
          \"shape\":\"DeliveryStreamStatus\",\
          \"documentation\":\"<p>The status of the delivery stream. If the status of a delivery stream is <code>CREATING_FAILED</code>, this status doesn't change, and you can't invoke <code>CreateDeliveryStream</code> again on it. However, you can invoke the <a>DeleteDeliveryStream</a> operation to delete it.</p>\"\
        },\
        \"FailureDescription\":{\
          \"shape\":\"FailureDescription\",\
          \"documentation\":\"<p>Provides details in case one of the following operations fails due to an error related to KMS: <a>CreateDeliveryStream</a>, <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>, <a>StopDeliveryStreamEncryption</a>.</p>\"\
        },\
        \"DeliveryStreamEncryptionConfiguration\":{\
          \"shape\":\"DeliveryStreamEncryptionConfiguration\",\
          \"documentation\":\"<p>Indicates the server-side encryption (SSE) status for the delivery stream.</p>\"\
        },\
        \"DeliveryStreamType\":{\
          \"shape\":\"DeliveryStreamType\",\
          \"documentation\":\"<p>The delivery stream type. This can be one of the following values:</p> <ul> <li> <p> <code>DirectPut</code>: Provider applications access the delivery stream directly.</p> </li> <li> <p> <code>KinesisStreamAsSource</code>: The delivery stream uses a Kinesis data stream as a source.</p> </li> </ul>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"DeliveryStreamVersionId\",\
          \"documentation\":\"<p>Each time the destination is updated for a delivery stream, the version ID is changed, and the current version ID is required when updating the destination. This is so that the service knows it is applying the changes to the correct version of the delivery stream.</p>\"\
        },\
        \"CreateTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the delivery stream was created.</p>\"\
        },\
        \"LastUpdateTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the delivery stream was last updated.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"SourceDescription\",\
          \"documentation\":\"<p>If the <code>DeliveryStreamType</code> parameter is <code>KinesisStreamAsSource</code>, a <a>SourceDescription</a> object describing the source Kinesis data stream.</p>\"\
        },\
        \"Destinations\":{\
          \"shape\":\"DestinationDescriptionList\",\
          \"documentation\":\"<p>The destinations.</p>\"\
        },\
        \"HasMoreDestinations\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Indicates whether there are more destinations available to list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a delivery stream.</p>\"\
    },\
    \"DeliveryStreamEncryptionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyARN\":{\
          \"shape\":\"AWSKMSKeyARN\",\
          \"documentation\":\"<p>If <code>KeyType</code> is <code>CUSTOMER_MANAGED_CMK</code>, this field contains the ARN of the customer managed CMK. If <code>KeyType</code> is <code>Amazon Web Services_OWNED_CMK</code>, <code>DeliveryStreamEncryptionConfiguration</code> doesn't contain a value for <code>KeyARN</code>.</p>\"\
        },\
        \"KeyType\":{\
          \"shape\":\"KeyType\",\
          \"documentation\":\"<p>Indicates the type of customer master key (CMK) that is used for encryption. The default setting is <code>Amazon Web Services_OWNED_CMK</code>. For more information about CMKs, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys\\\">Customer Master Keys (CMKs)</a>.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DeliveryStreamEncryptionStatus\",\
          \"documentation\":\"<p>This is the server-side encryption (SSE) status for the delivery stream. For a full description of the different values of this status, see <a>StartDeliveryStreamEncryption</a> and <a>StopDeliveryStreamEncryption</a>. If this status is <code>ENABLING_FAILED</code> or <code>DISABLING_FAILED</code>, it is the status of the most recent attempt to enable or disable SSE, respectively.</p>\"\
        },\
        \"FailureDescription\":{\
          \"shape\":\"FailureDescription\",\
          \"documentation\":\"<p>Provides details in case one of the following operations fails due to an error related to KMS: <a>CreateDeliveryStream</a>, <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>, <a>StopDeliveryStreamEncryption</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the server-side encryption (SSE) status for the delivery stream, the type customer master key (CMK) in use, if any, and the ARN of the CMK. You can get <code>DeliveryStreamEncryptionConfiguration</code> by invoking the <a>DescribeDeliveryStream</a> operation. </p>\"\
    },\
    \"DeliveryStreamEncryptionConfigurationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyType\"],\
      \"members\":{\
        \"KeyARN\":{\
          \"shape\":\"AWSKMSKeyARN\",\
          \"documentation\":\"<p>If you set <code>KeyType</code> to <code>CUSTOMER_MANAGED_CMK</code>, you must specify the Amazon Resource Name (ARN) of the CMK. If you set <code>KeyType</code> to <code>Amazon Web Services_OWNED_CMK</code>, Kinesis Data Firehose uses a service-account CMK.</p>\"\
        },\
        \"KeyType\":{\
          \"shape\":\"KeyType\",\
          \"documentation\":\"<p>Indicates the type of customer master key (CMK) to use for encryption. The default setting is <code>Amazon Web Services_OWNED_CMK</code>. For more information about CMKs, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys\\\">Customer Master Keys (CMKs)</a>. When you invoke <a>CreateDeliveryStream</a> or <a>StartDeliveryStreamEncryption</a> with <code>KeyType</code> set to CUSTOMER_MANAGED_CMK, Kinesis Data Firehose invokes the Amazon KMS operation <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateGrant.html\\\">CreateGrant</a> to create a grant that allows the Kinesis Data Firehose service to use the customer managed CMK to perform encryption and decryption. Kinesis Data Firehose manages that grant. </p> <p>When you invoke <a>StartDeliveryStreamEncryption</a> to change the CMK for a delivery stream that is encrypted with a customer managed CMK, Kinesis Data Firehose schedules the grant it had on the old CMK for retirement.</p> <p>You can use a CMK of type CUSTOMER_MANAGED_CMK to encrypt up to 500 delivery streams. If a <a>CreateDeliveryStream</a> or <a>StartDeliveryStreamEncryption</a> operation exceeds this limit, Kinesis Data Firehose throws a <code>LimitExceededException</code>. </p> <important> <p>To encrypt your delivery stream, use symmetric CMKs. Kinesis Data Firehose doesn't support asymmetric CMKs. For information about symmetric and asymmetric CMKs, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html\\\">About Symmetric and Asymmetric CMKs</a> in the Amazon Web Services Key Management Service developer guide.</p> </important>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the type and Amazon Resource Name (ARN) of the CMK to use for Server-Side Encryption (SSE). </p>\"\
    },\
    \"DeliveryStreamEncryptionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"ENABLING\",\
        \"ENABLING_FAILED\",\
        \"DISABLED\",\
        \"DISABLING\",\
        \"DISABLING_FAILED\"\
      ]\
    },\
    \"DeliveryStreamFailureType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RETIRE_KMS_GRANT_FAILED\",\
        \"CREATE_KMS_GRANT_FAILED\",\
        \"KMS_ACCESS_DENIED\",\
        \"DISABLED_KMS_KEY\",\
        \"INVALID_KMS_KEY\",\
        \"KMS_KEY_NOT_FOUND\",\
        \"KMS_OPT_IN_REQUIRED\",\
        \"CREATE_ENI_FAILED\",\
        \"DELETE_ENI_FAILED\",\
        \"SUBNET_NOT_FOUND\",\
        \"SECURITY_GROUP_NOT_FOUND\",\
        \"ENI_ACCESS_DENIED\",\
        \"SUBNET_ACCESS_DENIED\",\
        \"SECURITY_GROUP_ACCESS_DENIED\",\
        \"UNKNOWN_ERROR\"\
      ]\
    },\
    \"DeliveryStreamName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"DeliveryStreamNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeliveryStreamName\"}\
    },\
    \"DeliveryStreamStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATING\",\
        \"CREATING_FAILED\",\
        \"DELETING\",\
        \"DELETING_FAILED\",\
        \"ACTIVE\"\
      ]\
    },\
    \"DeliveryStreamType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DirectPut\",\
        \"KinesisStreamAsSource\",\
        \"MSKAsSource\"\
      ]\
    },\
    \"DeliveryStreamVersionId\":{\
      \"type\":\"string\",\
      \"max\":50,\
      \"min\":1,\
      \"pattern\":\"[0-9]+\"\
    },\
    \"DescribeDeliveryStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliveryStreamName\"],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"DescribeDeliveryStreamInputLimit\",\
          \"documentation\":\"<p>The limit on the number of destinations to return. You can have one destination per delivery stream.</p>\"\
        },\
        \"ExclusiveStartDestinationId\":{\
          \"shape\":\"DestinationId\",\
          \"documentation\":\"<p>The ID of the destination to start returning the destination information. Kinesis Data Firehose supports one destination per delivery stream.</p>\"\
        }\
      }\
    },\
    \"DescribeDeliveryStreamInputLimit\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"DescribeDeliveryStreamOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliveryStreamDescription\"],\
      \"members\":{\
        \"DeliveryStreamDescription\":{\
          \"shape\":\"DeliveryStreamDescription\",\
          \"documentation\":\"<p>Information about the delivery stream.</p>\"\
        }\
      }\
    },\
    \"Deserializer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OpenXJsonSerDe\":{\
          \"shape\":\"OpenXJsonSerDe\",\
          \"documentation\":\"<p>The OpenX SerDe. Used by Kinesis Data Firehose for deserializing data, which means converting it from the JSON format in preparation for serializing it to the Parquet or ORC format. This is one of two deserializers you can choose, depending on which one offers the functionality you need. The other option is the native Hive / HCatalog JsonSerDe.</p>\"\
        },\
        \"HiveJsonSerDe\":{\
          \"shape\":\"HiveJsonSerDe\",\
          \"documentation\":\"<p>The native Hive / HCatalog JsonSerDe. Used by Kinesis Data Firehose for deserializing data, which means converting it from the JSON format in preparation for serializing it to the Parquet or ORC format. This is one of two deserializers you can choose, depending on which one offers the functionality you need. The other option is the OpenX SerDe.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The deserializer you want Kinesis Data Firehose to use for converting the input data from JSON. Kinesis Data Firehose then serializes the data to its final format using the <a>Serializer</a>. Kinesis Data Firehose supports two types of deserializers: the <a href=\\\"https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-JSON\\\">Apache Hive JSON SerDe</a> and the <a href=\\\"https://github.com/rcongiu/Hive-JSON-Serde\\\">OpenX JSON SerDe</a>.</p>\"\
    },\
    \"DestinationDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\"DestinationId\"],\
      \"members\":{\
        \"DestinationId\":{\
          \"shape\":\"DestinationId\",\
          \"documentation\":\"<p>The ID of the destination.</p>\"\
        },\
        \"S3DestinationDescription\":{\
          \"shape\":\"S3DestinationDescription\",\
          \"documentation\":\"<p>[Deprecated] The destination in Amazon S3.</p>\"\
        },\
        \"ExtendedS3DestinationDescription\":{\
          \"shape\":\"ExtendedS3DestinationDescription\",\
          \"documentation\":\"<p>The destination in Amazon S3.</p>\"\
        },\
        \"RedshiftDestinationDescription\":{\
          \"shape\":\"RedshiftDestinationDescription\",\
          \"documentation\":\"<p>The destination in Amazon Redshift.</p>\"\
        },\
        \"ElasticsearchDestinationDescription\":{\
          \"shape\":\"ElasticsearchDestinationDescription\",\
          \"documentation\":\"<p>The destination in Amazon ES.</p>\"\
        },\
        \"AmazonopensearchserviceDestinationDescription\":{\
          \"shape\":\"AmazonopensearchserviceDestinationDescription\",\
          \"documentation\":\"<p>The destination in Amazon OpenSearch Service.</p>\"\
        },\
        \"SplunkDestinationDescription\":{\
          \"shape\":\"SplunkDestinationDescription\",\
          \"documentation\":\"<p>The destination in Splunk.</p>\"\
        },\
        \"HttpEndpointDestinationDescription\":{\
          \"shape\":\"HttpEndpointDestinationDescription\",\
          \"documentation\":\"<p>Describes the specified HTTP endpoint destination.</p>\"\
        },\
        \"AmazonOpenSearchServerlessDestinationDescription\":{\
          \"shape\":\"AmazonOpenSearchServerlessDestinationDescription\",\
          \"documentation\":\"<p>The destination in the Serverless offering for Amazon OpenSearch Service.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the destination for a delivery stream.</p>\"\
    },\
    \"DestinationDescriptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DestinationDescription\"}\
    },\
    \"DestinationId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"DocumentIdOptions\":{\
      \"type\":\"structure\",\
      \"required\":[\"DefaultDocumentIdFormat\"],\
      \"members\":{\
        \"DefaultDocumentIdFormat\":{\
          \"shape\":\"DefaultDocumentIdFormat\",\
          \"documentation\":\"<p>When the <code>FIREHOSE_DEFAULT</code> option is chosen, Kinesis Data Firehose generates a unique document ID for each record based on a unique internal identifier. The generated document ID is stable across multiple delivery attempts, which helps prevent the same record from being indexed multiple times with different document IDs.</p> <p>When the <code>NO_DOCUMENT_ID</code> option is chosen, Kinesis Data Firehose does not include any document IDs in the requests it sends to the Amazon OpenSearch Service. This causes the Amazon OpenSearch Service domain to generate document IDs. In case of multiple delivery attempts, this may cause the same record to be indexed more than once with different document IDs. This option enables write-heavy operations, such as the ingestion of logs and observability data, to consume less resources in the Amazon OpenSearch Service domain, resulting in improved performance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the method for setting up document ID. The supported methods are Kinesis Data Firehose generated document ID and OpenSearch Service generated document ID.</p> <p/>\"\
    },\
    \"DynamicPartitioningConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RetryOptions\":{\
          \"shape\":\"RetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver data to an Amazon S3 prefix.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Specifies that the dynamic partitioning is enabled for this Kinesis Data Firehose delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration of the dynamic partitioning mechanism that creates smaller data sets from the streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only supported for Amazon S3 destinations. </p>\"\
    },\
    \"ElasticsearchBufferingHints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntervalInSeconds\":{\
          \"shape\":\"ElasticsearchBufferingIntervalInSeconds\",\
          \"documentation\":\"<p>Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300 (5 minutes).</p>\"\
        },\
        \"SizeInMBs\":{\
          \"shape\":\"ElasticsearchBufferingSizeInMBs\",\
          \"documentation\":\"<p>Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5.</p> <p>We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the buffering to perform before delivering data to the Amazon ES destination.</p>\"\
    },\
    \"ElasticsearchBufferingIntervalInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":900,\
      \"min\":60\
    },\
    \"ElasticsearchBufferingSizeInMBs\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ElasticsearchClusterEndpoint\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"https:.*\"\
    },\
    \"ElasticsearchDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"IndexName\",\
        \"S3Configuration\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data Firehose for calling the Amazon ES Configuration API and for indexing documents. For more information, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3\\\">Grant Kinesis Data Firehose Access to an Amazon S3 Destination</a> and <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"DomainARN\":{\
          \"shape\":\"ElasticsearchDomainARN\",\
          \"documentation\":\"<p>The ARN of the Amazon ES domain. The IAM role must have permissions forÂ <code>DescribeDomain</code>, <code>DescribeDomains</code>, and <code>DescribeDomainConfig</code>Â after assuming the role specified in <b>RoleARN</b>. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p> <p>Specify either <code>ClusterEndpoint</code> or <code>DomainARN</code>.</p>\"\
        },\
        \"ClusterEndpoint\":{\
          \"shape\":\"ElasticsearchClusterEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the cluster. Specify either this <code>ClusterEndpoint</code> or the <code>DomainARN</code> field.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ElasticsearchIndexName\",\
          \"documentation\":\"<p>The Elasticsearch index name.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"ElasticsearchTypeName\",\
          \"documentation\":\"<p>The Elasticsearch type name. For Elasticsearch 6.x, there can be only one type per index. If you try to specify a new type for an existing index that already has another type, Kinesis Data Firehose returns an error during run time.</p> <p>For Elasticsearch 7.x, don't specify a <code>TypeName</code>.</p>\"\
        },\
        \"IndexRotationPeriod\":{\
          \"shape\":\"ElasticsearchIndexRotationPeriod\",\
          \"documentation\":\"<p>The Elasticsearch index rotation period. Index rotation appends a timestamp to the <code>IndexName</code> to facilitate the expiration of old data. For more information, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation\\\">Index Rotation for the Amazon ES Destination</a>. The default value isÂ <code>OneDay</code>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"ElasticsearchBufferingHints\",\
          \"documentation\":\"<p>The buffering options. If no value is specified, the default values for <code>ElasticsearchBufferingHints</code> are used.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"ElasticsearchRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon ES. The default value is 300 (5 minutes).</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"ElasticsearchS3BackupMode\",\
          \"documentation\":\"<p>Defines how documents should be delivered to Amazon S3. When it is set to <code>FailedDocumentsOnly</code>, Kinesis Data Firehose writes any documents that could not be indexed to the configured Amazon S3 destination, with <code>AmazonOpenSearchService-failed/</code> appended to the key prefix. When set to <code>AllDocuments</code>, Kinesis Data Firehose delivers all incoming records to Amazon S3, and also writes failed documents with <code>AmazonOpenSearchService-failed/</code> appended to the prefix. For more information, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-s3-backup\\\">Amazon S3 Backup for the Amazon ES Destination</a>. Default value is <code>FailedDocumentsOnly</code>.</p> <p>You can't change this backup mode after you create the delivery stream. </p>\"\
        },\
        \"S3Configuration\":{\
          \"shape\":\"S3DestinationConfiguration\",\
          \"documentation\":\"<p>The configuration for the backup Amazon S3 location.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        },\
        \"VpcConfiguration\":{\
          \"shape\":\"VpcConfiguration\",\
          \"documentation\":\"<p>The details of the VPC of the Amazon destination.</p>\"\
        },\
        \"DocumentIdOptions\":{\
          \"shape\":\"DocumentIdOptions\",\
          \"documentation\":\"<p>Indicates the method for setting up document ID. The supported methods are Kinesis Data Firehose generated document ID and OpenSearch Service generated document ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of a destination in Amazon ES.</p>\"\
    },\
    \"ElasticsearchDestinationDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"DomainARN\":{\
          \"shape\":\"ElasticsearchDomainARN\",\
          \"documentation\":\"<p>The ARN of the Amazon ES domain. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p> <p>Kinesis Data Firehose uses either <code>ClusterEndpoint</code> or <code>DomainARN</code> to send data to Amazon ES.</p>\"\
        },\
        \"ClusterEndpoint\":{\
          \"shape\":\"ElasticsearchClusterEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the cluster. Kinesis Data Firehose uses either this <code>ClusterEndpoint</code> or the <code>DomainARN</code> field to send data to Amazon ES.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ElasticsearchIndexName\",\
          \"documentation\":\"<p>The Elasticsearch index name.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"ElasticsearchTypeName\",\
          \"documentation\":\"<p>The Elasticsearch type name. This applies to Elasticsearch 6.x and lower versions. For Elasticsearch 7.x and OpenSearch Service 1.x, there's no value for <code>TypeName</code>.</p>\"\
        },\
        \"IndexRotationPeriod\":{\
          \"shape\":\"ElasticsearchIndexRotationPeriod\",\
          \"documentation\":\"<p>The Elasticsearch index rotation period</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"ElasticsearchBufferingHints\",\
          \"documentation\":\"<p>The buffering options.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"ElasticsearchRetryOptions\",\
          \"documentation\":\"<p>The Amazon ES retry options.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"ElasticsearchS3BackupMode\",\
          \"documentation\":\"<p>The Amazon S3 backup mode.</p>\"\
        },\
        \"S3DestinationDescription\":{\
          \"shape\":\"S3DestinationDescription\",\
          \"documentation\":\"<p>The Amazon S3 destination.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options.</p>\"\
        },\
        \"VpcConfigurationDescription\":{\
          \"shape\":\"VpcConfigurationDescription\",\
          \"documentation\":\"<p>The details of the VPC of the Amazon OpenSearch or the Amazon OpenSearch Serverless destination.</p>\"\
        },\
        \"DocumentIdOptions\":{\
          \"shape\":\"DocumentIdOptions\",\
          \"documentation\":\"<p>Indicates the method for setting up document ID. The supported methods are Kinesis Data Firehose generated document ID and OpenSearch Service generated document ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The destination description in Amazon ES.</p>\"\
    },\
    \"ElasticsearchDestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data Firehose for calling the Amazon ES Configuration API and for indexing documents. For more information, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3\\\">Grant Kinesis Data Firehose Access to an Amazon S3 Destination</a> and <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"DomainARN\":{\
          \"shape\":\"ElasticsearchDomainARN\",\
          \"documentation\":\"<p>The ARN of the Amazon ES domain. The IAM role must have permissions forÂ <code>DescribeDomain</code>, <code>DescribeDomains</code>, and <code>DescribeDomainConfig</code>Â after assuming the IAM role specified in <code>RoleARN</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p> <p>Specify either <code>ClusterEndpoint</code> or <code>DomainARN</code>.</p>\"\
        },\
        \"ClusterEndpoint\":{\
          \"shape\":\"ElasticsearchClusterEndpoint\",\
          \"documentation\":\"<p>The endpoint to use when communicating with the cluster. Specify either this <code>ClusterEndpoint</code> or the <code>DomainARN</code> field.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ElasticsearchIndexName\",\
          \"documentation\":\"<p>The Elasticsearch index name.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"ElasticsearchTypeName\",\
          \"documentation\":\"<p>The Elasticsearch type name. For Elasticsearch 6.x, there can be only one type per index. If you try to specify a new type for an existing index that already has another type, Kinesis Data Firehose returns an error during runtime.</p> <p>If you upgrade Elasticsearch from 6.x to 7.x and donât update your delivery stream, Kinesis Data Firehose still delivers data to Elasticsearch with the old index name and type name. If you want to update your delivery stream with a new index name, provide an empty string for <code>TypeName</code>. </p>\"\
        },\
        \"IndexRotationPeriod\":{\
          \"shape\":\"ElasticsearchIndexRotationPeriod\",\
          \"documentation\":\"<p>The Elasticsearch index rotation period. Index rotation appends a timestamp to <code>IndexName</code> to facilitate the expiration of old data. For more information, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation\\\">Index Rotation for the Amazon ES Destination</a>. Default value isÂ <code>OneDay</code>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"ElasticsearchBufferingHints\",\
          \"documentation\":\"<p>The buffering options. If no value is specified, <code>ElasticsearchBufferingHints</code> object default values are used. </p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"ElasticsearchRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon ES. The default value is 300 (5 minutes).</p>\"\
        },\
        \"S3Update\":{\
          \"shape\":\"S3DestinationUpdate\",\
          \"documentation\":\"<p>The Amazon S3 destination.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The CloudWatch logging options for your delivery stream.</p>\"\
        },\
        \"DocumentIdOptions\":{\
          \"shape\":\"DocumentIdOptions\",\
          \"documentation\":\"<p>Indicates the method for setting up document ID. The supported methods are Kinesis Data Firehose generated document ID and OpenSearch Service generated document ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an update for a destination in Amazon ES.</p>\"\
    },\
    \"ElasticsearchDomainARN\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"ElasticsearchIndexName\":{\
      \"type\":\"string\",\
      \"max\":80,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"ElasticsearchIndexRotationPeriod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NoRotation\",\
        \"OneHour\",\
        \"OneDay\",\
        \"OneWeek\",\
        \"OneMonth\"\
      ]\
    },\
    \"ElasticsearchRetryDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":7200,\
      \"min\":0\
    },\
    \"ElasticsearchRetryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DurationInSeconds\":{\
          \"shape\":\"ElasticsearchRetryDurationInSeconds\",\
          \"documentation\":\"<p>After an initial failure to deliver to Amazon ES, the total amount of time during which Kinesis Data Firehose retries delivery (including the first attempt). After this time has elapsed, the failed documents are written to Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero) results in no retries.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon ES.</p>\"\
    },\
    \"ElasticsearchS3BackupMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FailedDocumentsOnly\",\
        \"AllDocuments\"\
      ]\
    },\
    \"ElasticsearchTypeName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"EncryptionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NoEncryptionConfig\":{\
          \"shape\":\"NoEncryptionConfig\",\
          \"documentation\":\"<p>Specifically override existing encryption information to ensure that no encryption is used.</p>\"\
        },\
        \"KMSEncryptionConfig\":{\
          \"shape\":\"KMSEncryptionConfig\",\
          \"documentation\":\"<p>The encryption key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the encryption for a destination in Amazon S3.</p>\"\
    },\
    \"ErrorCode\":{\"type\":\"string\"},\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"ErrorOutputPrefix\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"ExtendedS3DestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"BucketARN\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"BucketARN\":{\
          \"shape\":\"BucketARN\",\
          \"documentation\":\"<p>The ARN of the S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The \\\"YYYY/MM/DD/HH\\\" time format prefix is automatically used for delivered Amazon S3 files. You can also specify a custom prefix, as described in <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"ErrorOutputPrefix\":{\
          \"shape\":\"ErrorOutputPrefix\",\
          \"documentation\":\"<p>A prefix that Kinesis Data Firehose evaluates and adds to failed records before writing them to S3. This prefix appears immediately following the bucket name. For information about how to specify this prefix, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"BufferingHints\",\
          \"documentation\":\"<p>The buffering option.</p>\"\
        },\
        \"CompressionFormat\":{\
          \"shape\":\"CompressionFormat\",\
          \"documentation\":\"<p>The compression format. If no value is specified, the default is UNCOMPRESSED.</p>\"\
        },\
        \"EncryptionConfiguration\":{\
          \"shape\":\"EncryptionConfiguration\",\
          \"documentation\":\"<p>The encryption configuration. If no value is specified, the default is no encryption.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"S3BackupMode\",\
          \"documentation\":\"<p>The Amazon S3 backup mode. After you create a delivery stream, you can update it to enable Amazon S3 backup if it is disabled. If backup is enabled, you can't update the delivery stream to disable it. </p>\"\
        },\
        \"S3BackupConfiguration\":{\
          \"shape\":\"S3DestinationConfiguration\",\
          \"documentation\":\"<p>The configuration for backup in Amazon S3.</p>\"\
        },\
        \"DataFormatConversionConfiguration\":{\
          \"shape\":\"DataFormatConversionConfiguration\",\
          \"documentation\":\"<p>The serializer, deserializer, and schema for converting data from the JSON format to the Parquet or ORC format before writing it to Amazon S3.</p>\"\
        },\
        \"DynamicPartitioningConfiguration\":{\
          \"shape\":\"DynamicPartitioningConfiguration\",\
          \"documentation\":\"<p>The configuration of the dynamic partitioning mechanism that creates smaller data sets from the streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only supported for Amazon S3 destinations. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of a destination in Amazon S3.</p>\"\
    },\
    \"ExtendedS3DestinationDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"BucketARN\",\
        \"BufferingHints\",\
        \"CompressionFormat\",\
        \"EncryptionConfiguration\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"BucketARN\":{\
          \"shape\":\"BucketARN\",\
          \"documentation\":\"<p>The ARN of the S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The \\\"YYYY/MM/DD/HH\\\" time format prefix is automatically used for delivered Amazon S3 files. You can also specify a custom prefix, as described in <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"ErrorOutputPrefix\":{\
          \"shape\":\"ErrorOutputPrefix\",\
          \"documentation\":\"<p>A prefix that Kinesis Data Firehose evaluates and adds to failed records before writing them to S3. This prefix appears immediately following the bucket name. For information about how to specify this prefix, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"BufferingHints\",\
          \"documentation\":\"<p>The buffering option.</p>\"\
        },\
        \"CompressionFormat\":{\
          \"shape\":\"CompressionFormat\",\
          \"documentation\":\"<p>The compression format. If no value is specified, the default is <code>UNCOMPRESSED</code>.</p>\"\
        },\
        \"EncryptionConfiguration\":{\
          \"shape\":\"EncryptionConfiguration\",\
          \"documentation\":\"<p>The encryption configuration. If no value is specified, the default is no encryption.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"S3BackupMode\",\
          \"documentation\":\"<p>The Amazon S3 backup mode.</p>\"\
        },\
        \"S3BackupDescription\":{\
          \"shape\":\"S3DestinationDescription\",\
          \"documentation\":\"<p>The configuration for backup in Amazon S3.</p>\"\
        },\
        \"DataFormatConversionConfiguration\":{\
          \"shape\":\"DataFormatConversionConfiguration\",\
          \"documentation\":\"<p>The serializer, deserializer, and schema for converting data from the JSON format to the Parquet or ORC format before writing it to Amazon S3.</p>\"\
        },\
        \"DynamicPartitioningConfiguration\":{\
          \"shape\":\"DynamicPartitioningConfiguration\",\
          \"documentation\":\"<p>The configuration of the dynamic partitioning mechanism that creates smaller data sets from the streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only supported for Amazon S3 destinations. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a destination in Amazon S3.</p>\"\
    },\
    \"ExtendedS3DestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"BucketARN\":{\
          \"shape\":\"BucketARN\",\
          \"documentation\":\"<p>The ARN of the S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The \\\"YYYY/MM/DD/HH\\\" time format prefix is automatically used for delivered Amazon S3 files. You can also specify a custom prefix, as described in <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"ErrorOutputPrefix\":{\
          \"shape\":\"ErrorOutputPrefix\",\
          \"documentation\":\"<p>A prefix that Kinesis Data Firehose evaluates and adds to failed records before writing them to S3. This prefix appears immediately following the bucket name. For information about how to specify this prefix, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"BufferingHints\",\
          \"documentation\":\"<p>The buffering option.</p>\"\
        },\
        \"CompressionFormat\":{\
          \"shape\":\"CompressionFormat\",\
          \"documentation\":\"<p>The compression format. If no value is specified, the default is <code>UNCOMPRESSED</code>. </p>\"\
        },\
        \"EncryptionConfiguration\":{\
          \"shape\":\"EncryptionConfiguration\",\
          \"documentation\":\"<p>The encryption configuration. If no value is specified, the default is no encryption.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"S3BackupMode\",\
          \"documentation\":\"<p>You can update a delivery stream to enable Amazon S3 backup if it is disabled. If backup is enabled, you can't update the delivery stream to disable it. </p>\"\
        },\
        \"S3BackupUpdate\":{\
          \"shape\":\"S3DestinationUpdate\",\
          \"documentation\":\"<p>The Amazon S3 destination for backup.</p>\"\
        },\
        \"DataFormatConversionConfiguration\":{\
          \"shape\":\"DataFormatConversionConfiguration\",\
          \"documentation\":\"<p>The serializer, deserializer, and schema for converting data from the JSON format to the Parquet or ORC format before writing it to Amazon S3.</p>\"\
        },\
        \"DynamicPartitioningConfiguration\":{\
          \"shape\":\"DynamicPartitioningConfiguration\",\
          \"documentation\":\"<p>The configuration of the dynamic partitioning mechanism that creates smaller data sets from the streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only supported for Amazon S3 destinations. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an update for a destination in Amazon S3.</p>\"\
    },\
    \"FailureDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"Details\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"DeliveryStreamFailureType\",\
          \"documentation\":\"<p>The type of error that caused the failure.</p>\"\
        },\
        \"Details\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A message providing details about the error that caused the failure.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides details in case one of the following operations fails due to an error related to KMS: <a>CreateDeliveryStream</a>, <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>, <a>StopDeliveryStreamEncryption</a>.</p>\"\
    },\
    \"HECAcknowledgmentTimeoutInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":600,\
      \"min\":180\
    },\
    \"HECEndpoint\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"HECEndpointType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Raw\",\
        \"Event\"\
      ]\
    },\
    \"HECToken\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"HiveJsonSerDe\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TimestampFormats\":{\
          \"shape\":\"ListOfNonEmptyStrings\",\
          \"documentation\":\"<p>Indicates how you want Kinesis Data Firehose to parse the date and timestamps that may be present in your input data JSON. To specify these format strings, follow the pattern syntax of JodaTime's DateTimeFormat format strings. For more information, see <a href=\\\"https://www.joda.org/joda-time/apidocs/org/joda/time/format/DateTimeFormat.html\\\">Class DateTimeFormat</a>. You can also use the special value <code>millis</code> to parse timestamps in epoch milliseconds. If you don't specify a format, Kinesis Data Firehose uses <code>java.sql.Timestamp::valueOf</code> by default.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The native Hive / HCatalog JsonSerDe. Used by Kinesis Data Firehose for deserializing data, which means converting it from the JSON format in preparation for serializing it to the Parquet or ORC format. This is one of two deserializers you can choose, depending on which one offers the functionality you need. The other option is the OpenX SerDe.</p>\"\
    },\
    \"HttpEndpointAccessKey\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"HttpEndpointAttributeName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^(?!\\\\s*$).+\",\
      \"sensitive\":true\
    },\
    \"HttpEndpointAttributeValue\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"HttpEndpointBufferingHints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SizeInMBs\":{\
          \"shape\":\"HttpEndpointBufferingSizeInMBs\",\
          \"documentation\":\"<p>Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. </p> <p>We recommend setting this parameter to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec, the value should be 10 MB or higher. </p>\"\
        },\
        \"IntervalInSeconds\":{\
          \"shape\":\"HttpEndpointBufferingIntervalInSeconds\",\
          \"documentation\":\"<p>Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300 (5 minutes). </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the buffering options that can be applied before data is delivered to the HTTP endpoint destination. Kinesis Data Firehose treats these options as hints, and it might choose to use more optimal values. The <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are optional. However, if specify a value for one of them, you must also provide a value for the other. </p>\"\
    },\
    \"HttpEndpointBufferingIntervalInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":900,\
      \"min\":60\
    },\
    \"HttpEndpointBufferingSizeInMBs\":{\
      \"type\":\"integer\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"HttpEndpointCommonAttribute\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AttributeName\",\
        \"AttributeValue\"\
      ],\
      \"members\":{\
        \"AttributeName\":{\
          \"shape\":\"HttpEndpointAttributeName\",\
          \"documentation\":\"<p>The name of the HTTP endpoint common attribute.</p>\"\
        },\
        \"AttributeValue\":{\
          \"shape\":\"HttpEndpointAttributeValue\",\
          \"documentation\":\"<p>The value of the HTTP endpoint common attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the metadata that's delivered to the specified HTTP endpoint destination.</p>\"\
    },\
    \"HttpEndpointCommonAttributesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HttpEndpointCommonAttribute\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"HttpEndpointConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Url\"],\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"HttpEndpointUrl\",\
          \"documentation\":\"<p>The URL of the HTTP endpoint selected as the destination.</p> <important> <p>If you choose an HTTP endpoint as your destination, review and follow the instructions in the <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/httpdeliveryrequestresponse.html\\\">Appendix - HTTP Endpoint Delivery Request and Response Specifications</a>.</p> </important>\"\
        },\
        \"Name\":{\
          \"shape\":\"HttpEndpointName\",\
          \"documentation\":\"<p>The name of the HTTP endpoint selected as the destination.</p>\"\
        },\
        \"AccessKey\":{\
          \"shape\":\"HttpEndpointAccessKey\",\
          \"documentation\":\"<p>The access key required for Kinesis Firehose to authenticate with the HTTP endpoint selected as the destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of the HTTP endpoint to which Kinesis Firehose delivers data.</p>\"\
    },\
    \"HttpEndpointDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"HttpEndpointUrl\",\
          \"documentation\":\"<p>The URL of the HTTP endpoint selected as the destination.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HttpEndpointName\",\
          \"documentation\":\"<p>The name of the HTTP endpoint selected as the destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the HTTP endpoint selected as the destination. </p>\"\
    },\
    \"HttpEndpointDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointConfiguration\",\
        \"S3Configuration\"\
      ],\
      \"members\":{\
        \"EndpointConfiguration\":{\
          \"shape\":\"HttpEndpointConfiguration\",\
          \"documentation\":\"<p>The configuration of the HTTP endpoint selected as the destination.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"HttpEndpointBufferingHints\",\
          \"documentation\":\"<p>The buffering options that can be used before data is delivered to the specified destination. Kinesis Data Firehose treats these options as hints, and it might choose to use more optimal values. The <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are optional. However, if you specify a value for one of them, you must also provide a value for the other. </p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"RequestConfiguration\":{\
          \"shape\":\"HttpEndpointRequestConfiguration\",\
          \"documentation\":\"<p>The configuration of the requeste sent to the HTTP endpoint specified as the destination.</p>\"\
        },\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>Kinesis Data Firehose uses this IAM role for all the permissions that the delivery stream needs.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"HttpEndpointRetryOptions\",\
          \"documentation\":\"<p>Describes the retry behavior in case Kinesis Data Firehose is unable to deliver data to the specified HTTP endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified HTTP endpoint destination.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"HttpEndpointS3BackupMode\",\
          \"documentation\":\"<p>Describes the S3 bucket backup options for the data that Kinesis Data Firehose delivers to the HTTP endpoint destination. You can back up all documents (<code>AllData</code>) or only the documents that Kinesis Data Firehose could not deliver to the specified HTTP endpoint destination (<code>FailedDataOnly</code>).</p>\"\
        },\
        \"S3Configuration\":{\"shape\":\"S3DestinationConfiguration\"}\
      },\
      \"documentation\":\"<p>Describes the configuration of the HTTP endpoint destination.</p>\"\
    },\
    \"HttpEndpointDestinationDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointConfiguration\":{\
          \"shape\":\"HttpEndpointDescription\",\
          \"documentation\":\"<p>The configuration of the specified HTTP endpoint destination.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"HttpEndpointBufferingHints\",\
          \"documentation\":\"<p>Describes buffering options that can be applied to the data before it is delivered to the HTTPS endpoint destination. Kinesis Data Firehose teats these options as hints, and it might choose to use more optimal values. The <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are optional. However, if specify a value for one of them, you must also provide a value for the other. </p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"RequestConfiguration\":{\
          \"shape\":\"HttpEndpointRequestConfiguration\",\
          \"documentation\":\"<p>The configuration of request sent to the HTTP endpoint specified as the destination.</p>\"\
        },\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>Kinesis Data Firehose uses this IAM role for all the permissions that the delivery stream needs.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"HttpEndpointRetryOptions\",\
          \"documentation\":\"<p>Describes the retry behavior in case Kinesis Data Firehose is unable to deliver data to the specified HTTP endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified HTTP endpoint destination.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"HttpEndpointS3BackupMode\",\
          \"documentation\":\"<p>Describes the S3 bucket backup options for the data that Kinesis Firehose delivers to the HTTP endpoint destination. You can back up all documents (<code>AllData</code>) or only the documents that Kinesis Data Firehose could not deliver to the specified HTTP endpoint destination (<code>FailedDataOnly</code>).</p>\"\
        },\
        \"S3DestinationDescription\":{\"shape\":\"S3DestinationDescription\"}\
      },\
      \"documentation\":\"<p>Describes the HTTP endpoint destination.</p>\"\
    },\
    \"HttpEndpointDestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointConfiguration\":{\
          \"shape\":\"HttpEndpointConfiguration\",\
          \"documentation\":\"<p>Describes the configuration of the HTTP endpoint destination.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"HttpEndpointBufferingHints\",\
          \"documentation\":\"<p>Describes buffering options that can be applied to the data before it is delivered to the HTTPS endpoint destination. Kinesis Data Firehose teats these options as hints, and it might choose to use more optimal values. The <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are optional. However, if specify a value for one of them, you must also provide a value for the other. </p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\"shape\":\"CloudWatchLoggingOptions\"},\
        \"RequestConfiguration\":{\
          \"shape\":\"HttpEndpointRequestConfiguration\",\
          \"documentation\":\"<p>The configuration of the request sent to the HTTP endpoint specified as the destination.</p>\"\
        },\
        \"ProcessingConfiguration\":{\"shape\":\"ProcessingConfiguration\"},\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>Kinesis Data Firehose uses this IAM role for all the permissions that the delivery stream needs.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"HttpEndpointRetryOptions\",\
          \"documentation\":\"<p>Describes the retry behavior in case Kinesis Data Firehose is unable to deliver data to the specified HTTP endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified HTTP endpoint destination.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"HttpEndpointS3BackupMode\",\
          \"documentation\":\"<p>Describes the S3 bucket backup options for the data that Kinesis Firehose delivers to the HTTP endpoint destination. You can back up all documents (<code>AllData</code>) or only the documents that Kinesis Data Firehose could not deliver to the specified HTTP endpoint destination (<code>FailedDataOnly</code>).</p>\"\
        },\
        \"S3Update\":{\"shape\":\"S3DestinationUpdate\"}\
      },\
      \"documentation\":\"<p>Updates the specified HTTP endpoint destination.</p>\"\
    },\
    \"HttpEndpointName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^(?!\\\\s*$).+\"\
    },\
    \"HttpEndpointRequestConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContentEncoding\":{\
          \"shape\":\"ContentEncoding\",\
          \"documentation\":\"<p>Kinesis Data Firehose uses the content encoding to compress the body of a request before sending the request to the destination. For more information, see <a href=\\\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Encoding\\\">Content-Encoding</a> in MDN Web Docs, the official Mozilla documentation.</p>\"\
        },\
        \"CommonAttributes\":{\
          \"shape\":\"HttpEndpointCommonAttributesList\",\
          \"documentation\":\"<p>Describes the metadata sent to the HTTP endpoint destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration of the HTTP endpoint request.</p>\"\
    },\
    \"HttpEndpointRetryDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":7200,\
      \"min\":0\
    },\
    \"HttpEndpointRetryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DurationInSeconds\":{\
          \"shape\":\"HttpEndpointRetryDurationInSeconds\",\
          \"documentation\":\"<p>The total amount of time that Kinesis Data Firehose spends on retries. This duration starts after the initial attempt to send data to the custom destination via HTTPS endpoint fails. It doesn't include the periods during which Kinesis Data Firehose waits for acknowledgment from the specified destination after each attempt. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the retry behavior in case Kinesis Data Firehose is unable to deliver data to the specified HTTP endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified HTTP endpoint destination.</p>\"\
    },\
    \"HttpEndpointS3BackupMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FailedDataOnly\",\
        \"AllData\"\
      ]\
    },\
    \"HttpEndpointUrl\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1,\
      \"pattern\":\"https://.*\",\
      \"sensitive\":true\
    },\
    \"InputFormatConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Deserializer\":{\
          \"shape\":\"Deserializer\",\
          \"documentation\":\"<p>Specifies which deserializer to use. You can choose either the Apache Hive JSON SerDe or the OpenX JSON SerDe. If both are non-null, the server rejects the request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the deserializer you want to use to convert the format of the input data. This parameter is required if <code>Enabled</code> is set to true.</p>\"\
    },\
    \"IntervalInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":900,\
      \"min\":60\
    },\
    \"InvalidArgumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message that provides information about the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified input parameter has a value that is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidKMSResourceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"ErrorCode\"},\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Kinesis Data Firehose throws this exception when an attempt to put records or to start or stop delivery stream encryption fails. This happens when the KMS service throws one of the following exception types: <code>AccessDeniedException</code>, <code>InvalidStateException</code>, <code>DisabledException</code>, or <code>NotFoundException</code>.</p>\",\
      \"exception\":true\
    },\
    \"KMSEncryptionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"AWSKMSKeyARN\"],\
      \"members\":{\
        \"AWSKMSKeyARN\":{\
          \"shape\":\"AWSKMSKeyARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the encryption key. Must belong to the same Amazon Web Services Region as the destination Amazon S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an encryption key for a destination in Amazon S3.</p>\"\
    },\
    \"KeyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS_OWNED_CMK\",\
        \"CUSTOMER_MANAGED_CMK\"\
      ]\
    },\
    \"KinesisStreamARN\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"KinesisStreamSourceConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KinesisStreamARN\",\
        \"RoleARN\"\
      ],\
      \"members\":{\
        \"KinesisStreamARN\":{\
          \"shape\":\"KinesisStreamARN\",\
          \"documentation\":\"<p>The ARN of the source Kinesis data stream. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams\\\">Amazon Kinesis Data Streams ARN Format</a>.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The ARN of the role that provides access to the source Kinesis data stream. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam\\\">Amazon Web Services Identity and Access Management (IAM) ARN Format</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The stream and role Amazon Resource Names (ARNs) for a Kinesis data stream used as the source for a delivery stream.</p>\"\
    },\
    \"KinesisStreamSourceDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KinesisStreamARN\":{\
          \"shape\":\"KinesisStreamARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source Kinesis data stream. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams\\\">Amazon Kinesis Data Streams ARN Format</a>.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The ARN of the role used by the source Kinesis data stream. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam\\\">Amazon Web Services Identity and Access Management (IAM) ARN Format</a>.</p>\"\
        },\
        \"DeliveryStartTimestamp\":{\
          \"shape\":\"DeliveryStartTimestamp\",\
          \"documentation\":\"<p>Kinesis Data Firehose starts retrieving records from the Kinesis data stream starting with this timestamp.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a Kinesis data stream used as the source for a Kinesis Data Firehose delivery stream.</p>\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message that provides information about the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You have already reached the limit for a requested resource.</p>\",\
      \"exception\":true\
    },\
    \"ListDeliveryStreamsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"ListDeliveryStreamsInputLimit\",\
          \"documentation\":\"<p>The maximum number of delivery streams to list. The default value is 10.</p>\"\
        },\
        \"DeliveryStreamType\":{\
          \"shape\":\"DeliveryStreamType\",\
          \"documentation\":\"<p>The delivery stream type. This can be one of the following values:</p> <ul> <li> <p> <code>DirectPut</code>: Provider applications access the delivery stream directly.</p> </li> <li> <p> <code>KinesisStreamAsSource</code>: The delivery stream uses a Kinesis data stream as a source.</p> </li> </ul> <p>This parameter is optional. If this parameter is omitted, delivery streams of all types are returned.</p>\"\
        },\
        \"ExclusiveStartDeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The list of delivery streams returned by this call to <code>ListDeliveryStreams</code> will start with the delivery stream whose name comes alphabetically immediately after the name you specify in <code>ExclusiveStartDeliveryStreamName</code>.</p>\"\
        }\
      }\
    },\
    \"ListDeliveryStreamsInputLimit\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"ListDeliveryStreamsOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryStreamNames\",\
        \"HasMoreDeliveryStreams\"\
      ],\
      \"members\":{\
        \"DeliveryStreamNames\":{\
          \"shape\":\"DeliveryStreamNameList\",\
          \"documentation\":\"<p>The names of the delivery streams.</p>\"\
        },\
        \"HasMoreDeliveryStreams\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Indicates whether there are more delivery streams available to list.</p>\"\
        }\
      }\
    },\
    \"ListOfNonEmptyStrings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"ListOfNonEmptyStringsWithoutWhitespace\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyStringWithoutWhitespace\"}\
    },\
    \"ListTagsForDeliveryStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliveryStreamName\"],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream whose tags you want to list.</p>\"\
        },\
        \"ExclusiveStartTagKey\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key to use as the starting point for the list of tags. If you set this parameter, <code>ListTagsForDeliveryStream</code> gets all tags that occur after <code>ExclusiveStartTagKey</code>.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"ListTagsForDeliveryStreamInputLimit\",\
          \"documentation\":\"<p>The number of tags to return. If this number is less than the total number of tags associated with the delivery stream, <code>HasMoreTags</code> is set to <code>true</code> in the response. To list additional tags, set <code>ExclusiveStartTagKey</code> to the last key in the response. </p>\"\
        }\
      }\
    },\
    \"ListTagsForDeliveryStreamInputLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"ListTagsForDeliveryStreamOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Tags\",\
        \"HasMoreTags\"\
      ],\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"ListTagsForDeliveryStreamOutputTagList\",\
          \"documentation\":\"<p>A list of tags associated with <code>DeliveryStreamName</code>, starting with the first tag after <code>ExclusiveStartTagKey</code> and up to the specified <code>Limit</code>.</p>\"\
        },\
        \"HasMoreTags\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>If this is <code>true</code> in the response, more tags are available. To list the remaining tags, set <code>ExclusiveStartTagKey</code> to the key of the last tag returned and call <code>ListTagsForDeliveryStream</code> again.</p>\"\
        }\
      }\
    },\
    \"ListTagsForDeliveryStreamOutputTagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"LogGroupName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":0,\
      \"pattern\":\"[\\\\.\\\\-_/#A-Za-z0-9]*\"\
    },\
    \"LogStreamName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":0,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"MSKClusterARN\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"MSKSourceConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MSKClusterARN\",\
        \"TopicName\",\
        \"AuthenticationConfiguration\"\
      ],\
      \"members\":{\
        \"MSKClusterARN\":{\
          \"shape\":\"MSKClusterARN\",\
          \"documentation\":\"<p>The ARN of the Amazon MSK cluster.</p>\"\
        },\
        \"TopicName\":{\
          \"shape\":\"TopicName\",\
          \"documentation\":\"<p>The topic name within the Amazon MSK cluster. </p>\"\
        },\
        \"AuthenticationConfiguration\":{\
          \"shape\":\"AuthenticationConfiguration\",\
          \"documentation\":\"<p>The authentication configuration of the Amazon MSK cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration for the Amazon MSK cluster to be used as the source for a delivery stream.</p>\"\
    },\
    \"MSKSourceDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MSKClusterARN\":{\
          \"shape\":\"MSKClusterARN\",\
          \"documentation\":\"<p>The ARN of the Amazon MSK cluster.</p>\"\
        },\
        \"TopicName\":{\
          \"shape\":\"TopicName\",\
          \"documentation\":\"<p>The topic name within the Amazon MSK cluster.</p>\"\
        },\
        \"AuthenticationConfiguration\":{\
          \"shape\":\"AuthenticationConfiguration\",\
          \"documentation\":\"<p>The authentication configuration of the Amazon MSK cluster.</p>\"\
        },\
        \"DeliveryStartTimestamp\":{\
          \"shape\":\"DeliveryStartTimestamp\",\
          \"documentation\":\"<p>Kinesis Data Firehose starts retrieving records from the topic within the Amazon MSK cluster starting with this timestamp.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the Amazon MSK cluster used as the source for a Kinesis Data Firehose delivery stream.</p>\"\
    },\
    \"NoEncryptionConfig\":{\
      \"type\":\"string\",\
      \"enum\":[\"NoEncryption\"]\
    },\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^(?!\\\\s*$).+\"\
    },\
    \"NonEmptyStringWithoutWhitespace\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^\\\\S+$\"\
    },\
    \"NonNegativeIntegerObject\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"OpenXJsonSerDe\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConvertDotsInJsonKeysToUnderscores\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>When set to <code>true</code>, specifies that the names of the keys include dots and that you want Kinesis Data Firehose to replace them with underscores. This is useful because Apache Hive does not allow dots in column names. For example, if the JSON contains a key whose name is \\\"a.b\\\", you can define the column name to be \\\"a_b\\\" when using this option.</p> <p>The default is <code>false</code>.</p>\"\
        },\
        \"CaseInsensitive\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>When set to <code>true</code>, which is the default, Kinesis Data Firehose converts JSON keys to lowercase before deserializing them.</p>\"\
        },\
        \"ColumnToJsonKeyMappings\":{\
          \"shape\":\"ColumnToJsonKeyMappings\",\
          \"documentation\":\"<p>Maps column names to JSON keys that aren't identical to the column names. This is useful when the JSON contains keys that are Hive keywords. For example, <code>timestamp</code> is a Hive keyword. If you have a JSON key named <code>timestamp</code>, set this parameter to <code>{\\\"ts\\\": \\\"timestamp\\\"}</code> to map this key to a column named <code>ts</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The OpenX SerDe. Used by Kinesis Data Firehose for deserializing data, which means converting it from the JSON format in preparation for serializing it to the Parquet or ORC format. This is one of two deserializers you can choose, depending on which one offers the functionality you need. The other option is the native Hive / HCatalog JsonSerDe.</p>\"\
    },\
    \"OrcCompression\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NONE\",\
        \"ZLIB\",\
        \"SNAPPY\"\
      ]\
    },\
    \"OrcFormatVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"V0_11\",\
        \"V0_12\"\
      ]\
    },\
    \"OrcRowIndexStride\":{\
      \"type\":\"integer\",\
      \"min\":1000\
    },\
    \"OrcSerDe\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StripeSizeBytes\":{\
          \"shape\":\"OrcStripeSizeBytes\",\
          \"documentation\":\"<p>The number of bytes in each stripe. The default is 64 MiB and the minimum is 8 MiB.</p>\"\
        },\
        \"BlockSizeBytes\":{\
          \"shape\":\"BlockSizeBytes\",\
          \"documentation\":\"<p>The Hadoop Distributed File System (HDFS) block size. This is useful if you intend to copy the data from Amazon S3 to HDFS before querying. The default is 256 MiB and the minimum is 64 MiB. Kinesis Data Firehose uses this value for padding calculations.</p>\"\
        },\
        \"RowIndexStride\":{\
          \"shape\":\"OrcRowIndexStride\",\
          \"documentation\":\"<p>The number of rows between index entries. The default is 10,000 and the minimum is 1,000.</p>\"\
        },\
        \"EnablePadding\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Set this to <code>true</code> to indicate that you want stripes to be padded to the HDFS block boundaries. This is useful if you intend to copy the data from Amazon S3 to HDFS before querying. The default is <code>false</code>.</p>\"\
        },\
        \"PaddingTolerance\":{\
          \"shape\":\"Proportion\",\
          \"documentation\":\"<p>A number between 0 and 1 that defines the tolerance for block padding as a decimal fraction of stripe size. The default value is 0.05, which means 5 percent of stripe size.</p> <p>For the default values of 64 MiB ORC stripes and 256 MiB HDFS blocks, the default block padding tolerance of 5 percent reserves a maximum of 3.2 MiB for padding within the 256 MiB block. In such a case, if the available size within the block is more than 3.2 MiB, a new, smaller stripe is inserted to fit within that space. This ensures that no stripe crosses block boundaries and causes remote reads within a node-local task.</p> <p>Kinesis Data Firehose ignores this parameter when <a>OrcSerDe$EnablePadding</a> is <code>false</code>.</p>\"\
        },\
        \"Compression\":{\
          \"shape\":\"OrcCompression\",\
          \"documentation\":\"<p>The compression code to use over data blocks. The default is <code>SNAPPY</code>.</p>\"\
        },\
        \"BloomFilterColumns\":{\
          \"shape\":\"ListOfNonEmptyStringsWithoutWhitespace\",\
          \"documentation\":\"<p>The column names for which you want Kinesis Data Firehose to create bloom filters. The default is <code>null</code>.</p>\"\
        },\
        \"BloomFilterFalsePositiveProbability\":{\
          \"shape\":\"Proportion\",\
          \"documentation\":\"<p>The Bloom filter false positive probability (FPP). The lower the FPP, the bigger the Bloom filter. The default value is 0.05, the minimum is 0, and the maximum is 1.</p>\"\
        },\
        \"DictionaryKeyThreshold\":{\
          \"shape\":\"Proportion\",\
          \"documentation\":\"<p>Represents the fraction of the total number of non-null rows. To turn off dictionary encoding, set this fraction to a number that is less than the number of distinct keys in a dictionary. To always use dictionary encoding, set this threshold to 1.</p>\"\
        },\
        \"FormatVersion\":{\
          \"shape\":\"OrcFormatVersion\",\
          \"documentation\":\"<p>The version of the file to write. The possible values are <code>V0_11</code> and <code>V0_12</code>. The default is <code>V0_12</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A serializer to use for converting data to the ORC format before storing it in Amazon S3. For more information, see <a href=\\\"https://orc.apache.org/docs/\\\">Apache ORC</a>.</p>\"\
    },\
    \"OrcStripeSizeBytes\":{\
      \"type\":\"integer\",\
      \"min\":8388608\
    },\
    \"OutputFormatConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Serializer\":{\
          \"shape\":\"Serializer\",\
          \"documentation\":\"<p>Specifies which serializer to use. You can choose either the ORC SerDe or the Parquet SerDe. If both are non-null, the server rejects the request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the serializer that you want Kinesis Data Firehose to use to convert the format of your data before it writes it to Amazon S3. This parameter is required if <code>Enabled</code> is set to true.</p>\"\
    },\
    \"ParquetCompression\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNCOMPRESSED\",\
        \"GZIP\",\
        \"SNAPPY\"\
      ]\
    },\
    \"ParquetPageSizeBytes\":{\
      \"type\":\"integer\",\
      \"min\":65536\
    },\
    \"ParquetSerDe\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BlockSizeBytes\":{\
          \"shape\":\"BlockSizeBytes\",\
          \"documentation\":\"<p>The Hadoop Distributed File System (HDFS) block size. This is useful if you intend to copy the data from Amazon S3 to HDFS before querying. The default is 256 MiB and the minimum is 64 MiB. Kinesis Data Firehose uses this value for padding calculations.</p>\"\
        },\
        \"PageSizeBytes\":{\
          \"shape\":\"ParquetPageSizeBytes\",\
          \"documentation\":\"<p>The Parquet page size. Column chunks are divided into pages. A page is conceptually an indivisible unit (in terms of compression and encoding). The minimum value is 64 KiB and the default is 1 MiB.</p>\"\
        },\
        \"Compression\":{\
          \"shape\":\"ParquetCompression\",\
          \"documentation\":\"<p>The compression code to use over data blocks. The possible values are <code>UNCOMPRESSED</code>, <code>SNAPPY</code>, and <code>GZIP</code>, with the default being <code>SNAPPY</code>. Use <code>SNAPPY</code> for higher decompression speed. Use <code>GZIP</code> if the compression ratio is more important than speed.</p>\"\
        },\
        \"EnableDictionaryCompression\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Indicates whether to enable dictionary compression.</p>\"\
        },\
        \"MaxPaddingBytes\":{\
          \"shape\":\"NonNegativeIntegerObject\",\
          \"documentation\":\"<p>The maximum amount of padding to apply. This is useful if you intend to copy the data from Amazon S3 to HDFS before querying. The default is 0.</p>\"\
        },\
        \"WriterVersion\":{\
          \"shape\":\"ParquetWriterVersion\",\
          \"documentation\":\"<p>Indicates the version of row format to output. The possible values are <code>V1</code> and <code>V2</code>. The default is <code>V1</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A serializer to use for converting data to the Parquet format before storing it in Amazon S3. For more information, see <a href=\\\"https://parquet.apache.org/documentation/latest/\\\">Apache Parquet</a>.</p>\"\
    },\
    \"ParquetWriterVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"V1\",\
        \"V2\"\
      ]\
    },\
    \"Password\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":6,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"Prefix\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"ProcessingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Enables or disables data processing.</p>\"\
        },\
        \"Processors\":{\
          \"shape\":\"ProcessorList\",\
          \"documentation\":\"<p>The data processors.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a data processing configuration.</p>\"\
    },\
    \"Processor\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ProcessorType\",\
          \"documentation\":\"<p>The type of processor.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"ProcessorParameterList\",\
          \"documentation\":\"<p>The processor parameters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a data processor.</p>\"\
    },\
    \"ProcessorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Processor\"}\
    },\
    \"ProcessorParameter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ParameterName\",\
        \"ParameterValue\"\
      ],\
      \"members\":{\
        \"ParameterName\":{\
          \"shape\":\"ProcessorParameterName\",\
          \"documentation\":\"<p>The name of the parameter. Currently the following default values are supported: 3 for <code>NumberOfRetries</code> and 60 for the <code>BufferIntervalInSeconds</code>. The <code>BufferSizeInMBs</code> ranges between 0.2 MB and up to 3MB. The default buffering hint is 1MB for all destinations, except Splunk. For Splunk, the default buffering hint is 256 KB. </p>\"\
        },\
        \"ParameterValue\":{\
          \"shape\":\"ProcessorParameterValue\",\
          \"documentation\":\"<p>The parameter value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the processor parameter. </p>\"\
    },\
    \"ProcessorParameterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProcessorParameter\"}\
    },\
    \"ProcessorParameterName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LambdaArn\",\
        \"NumberOfRetries\",\
        \"MetadataExtractionQuery\",\
        \"JsonParsingEngine\",\
        \"RoleArn\",\
        \"BufferSizeInMBs\",\
        \"BufferIntervalInSeconds\",\
        \"SubRecordType\",\
        \"Delimiter\",\
        \"CompressionFormat\"\
      ]\
    },\
    \"ProcessorParameterValue\":{\
      \"type\":\"string\",\
      \"max\":5120,\
      \"min\":1,\
      \"pattern\":\"^(?!\\\\s*$).+\"\
    },\
    \"ProcessorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RecordDeAggregation\",\
        \"Decompression\",\
        \"Lambda\",\
        \"MetadataExtraction\",\
        \"AppendDelimiterToRecord\"\
      ]\
    },\
    \"Proportion\":{\
      \"type\":\"double\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"PutRecordBatchInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryStreamName\",\
        \"Records\"\
      ],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream.</p>\"\
        },\
        \"Records\":{\
          \"shape\":\"PutRecordBatchRequestEntryList\",\
          \"documentation\":\"<p>One or more records.</p>\"\
        }\
      }\
    },\
    \"PutRecordBatchOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FailedPutCount\",\
        \"RequestResponses\"\
      ],\
      \"members\":{\
        \"FailedPutCount\":{\
          \"shape\":\"NonNegativeIntegerObject\",\
          \"documentation\":\"<p>The number of records that might have failed processing. This number might be greater than 0 even if the <a>PutRecordBatch</a> call succeeds. Check <code>FailedPutCount</code> to determine whether there are records that you need to resend.</p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Indicates whether server-side encryption (SSE) was enabled during this operation.</p>\"\
        },\
        \"RequestResponses\":{\
          \"shape\":\"PutRecordBatchResponseEntryList\",\
          \"documentation\":\"<p>The results array. For each record, the index of the response element is the same as the index used in the request array.</p>\"\
        }\
      }\
    },\
    \"PutRecordBatchRequestEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Record\"},\
      \"max\":500,\
      \"min\":1\
    },\
    \"PutRecordBatchResponseEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecordId\":{\
          \"shape\":\"PutResponseRecordId\",\
          \"documentation\":\"<p>The ID of the record.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"ErrorCode\",\
          \"documentation\":\"<p>The error code for an individual record result.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The error message for an individual record result.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the result for an individual record from a <a>PutRecordBatch</a> request. If the record is successfully added to your delivery stream, it receives a record ID. If the record fails to be added to your delivery stream, the result includes an error code and an error message.</p>\"\
    },\
    \"PutRecordBatchResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PutRecordBatchResponseEntry\"},\
      \"max\":500,\
      \"min\":1\
    },\
    \"PutRecordInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryStreamName\",\
        \"Record\"\
      ],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream.</p>\"\
        },\
        \"Record\":{\
          \"shape\":\"Record\",\
          \"documentation\":\"<p>The record.</p>\"\
        }\
      }\
    },\
    \"PutRecordOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"RecordId\"],\
      \"members\":{\
        \"RecordId\":{\
          \"shape\":\"PutResponseRecordId\",\
          \"documentation\":\"<p>The ID of the record.</p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Indicates whether server-side encryption (SSE) was enabled during this operation.</p>\"\
        }\
      }\
    },\
    \"PutResponseRecordId\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"Record\":{\
      \"type\":\"structure\",\
      \"required\":[\"Data\"],\
      \"members\":{\
        \"Data\":{\
          \"shape\":\"Data\",\
          \"documentation\":\"<p>The data blob, which is base64-encoded when the blob is serialized. The maximum size of the data blob, before base64-encoding, is 1,000 KiB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The unit of data in a delivery stream.</p>\"\
    },\
    \"RedshiftDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"ClusterJDBCURL\",\
        \"CopyCommand\",\
        \"Username\",\
        \"Password\",\
        \"S3Configuration\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"ClusterJDBCURL\":{\
          \"shape\":\"ClusterJDBCURL\",\
          \"documentation\":\"<p>The database connection string.</p>\"\
        },\
        \"CopyCommand\":{\
          \"shape\":\"CopyCommand\",\
          \"documentation\":\"<p>The <code>COPY</code> command.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"Username\",\
          \"documentation\":\"<p>The name of the user.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"Password\",\
          \"documentation\":\"<p>The user password.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"RedshiftRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).</p>\"\
        },\
        \"S3Configuration\":{\
          \"shape\":\"S3DestinationConfiguration\",\
          \"documentation\":\"<p>The configuration for the intermediate Amazon S3 location from which Amazon Redshift obtains data. Restrictions are described in the topic for <a>CreateDeliveryStream</a>.</p> <p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <code>RedshiftDestinationConfiguration.S3Configuration</code> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"RedshiftS3BackupMode\",\
          \"documentation\":\"<p>The Amazon S3 backup mode. After you create a delivery stream, you can update it to enable Amazon S3 backup if it is disabled. If backup is enabled, you can't update the delivery stream to disable it. </p>\"\
        },\
        \"S3BackupConfiguration\":{\
          \"shape\":\"S3DestinationConfiguration\",\
          \"documentation\":\"<p>The configuration for backup in Amazon S3.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of a destination in Amazon Redshift.</p>\"\
    },\
    \"RedshiftDestinationDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"ClusterJDBCURL\",\
        \"CopyCommand\",\
        \"Username\",\
        \"S3DestinationDescription\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"ClusterJDBCURL\":{\
          \"shape\":\"ClusterJDBCURL\",\
          \"documentation\":\"<p>The database connection string.</p>\"\
        },\
        \"CopyCommand\":{\
          \"shape\":\"CopyCommand\",\
          \"documentation\":\"<p>The <code>COPY</code> command.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"Username\",\
          \"documentation\":\"<p>The name of the user.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"RedshiftRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).</p>\"\
        },\
        \"S3DestinationDescription\":{\
          \"shape\":\"S3DestinationDescription\",\
          \"documentation\":\"<p>The Amazon S3 destination.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"RedshiftS3BackupMode\",\
          \"documentation\":\"<p>The Amazon S3 backup mode.</p>\"\
        },\
        \"S3BackupDescription\":{\
          \"shape\":\"S3DestinationDescription\",\
          \"documentation\":\"<p>The configuration for backup in Amazon S3.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a destination in Amazon Redshift.</p>\"\
    },\
    \"RedshiftDestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"ClusterJDBCURL\":{\
          \"shape\":\"ClusterJDBCURL\",\
          \"documentation\":\"<p>The database connection string.</p>\"\
        },\
        \"CopyCommand\":{\
          \"shape\":\"CopyCommand\",\
          \"documentation\":\"<p>The <code>COPY</code> command.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"Username\",\
          \"documentation\":\"<p>The name of the user.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"Password\",\
          \"documentation\":\"<p>The user password.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"RedshiftRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon Redshift. Default value is 3600 (60 minutes).</p>\"\
        },\
        \"S3Update\":{\
          \"shape\":\"S3DestinationUpdate\",\
          \"documentation\":\"<p>The Amazon S3 destination.</p> <p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <code>RedshiftDestinationUpdate.S3Update</code> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"RedshiftS3BackupMode\",\
          \"documentation\":\"<p>You can update a delivery stream to enable Amazon S3 backup if it is disabled. If backup is enabled, you can't update the delivery stream to disable it. </p>\"\
        },\
        \"S3BackupUpdate\":{\
          \"shape\":\"S3DestinationUpdate\",\
          \"documentation\":\"<p>The Amazon S3 destination for backup.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an update for a destination in Amazon Redshift.</p>\"\
    },\
    \"RedshiftRetryDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":7200,\
      \"min\":0\
    },\
    \"RedshiftRetryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DurationInSeconds\":{\
          \"shape\":\"RedshiftRetryDurationInSeconds\",\
          \"documentation\":\"<p>The length of time during which Kinesis Data Firehose retries delivery after a failure, starting from the initial request and including the first attempt. The default value is 3600 seconds (60 minutes). Kinesis Data Firehose does not retry if the value of <code>DurationInSeconds</code> is 0 (zero) or if the first delivery attempt takes longer than the current value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures retry behavior in case Kinesis Data Firehose is unable to deliver documents to Amazon Redshift.</p>\"\
    },\
    \"RedshiftS3BackupMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Disabled\",\
        \"Enabled\"\
      ]\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message that provides information about the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource is already in use and not available for this operation.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message that provides information about the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified resource could not be found.</p>\",\
      \"exception\":true\
    },\
    \"RetryDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":7200,\
      \"min\":0\
    },\
    \"RetryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DurationInSeconds\":{\
          \"shape\":\"RetryDurationInSeconds\",\
          \"documentation\":\"<p>The period of time during which Kinesis Data Firehose retries to deliver data to the specified Amazon S3 prefix.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The retry behavior in case Kinesis Data Firehose is unable to deliver data to an Amazon S3 prefix.</p>\"\
    },\
    \"RoleARN\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"arn:.*\"\
    },\
    \"S3BackupMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Disabled\",\
        \"Enabled\"\
      ]\
    },\
    \"S3DestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"BucketARN\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"BucketARN\":{\
          \"shape\":\"BucketARN\",\
          \"documentation\":\"<p>The ARN of the S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The \\\"YYYY/MM/DD/HH\\\" time format prefix is automatically used for delivered Amazon S3 files. You can also specify a custom prefix, as described in <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"ErrorOutputPrefix\":{\
          \"shape\":\"ErrorOutputPrefix\",\
          \"documentation\":\"<p>A prefix that Kinesis Data Firehose evaluates and adds to failed records before writing them to S3. This prefix appears immediately following the bucket name. For information about how to specify this prefix, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"BufferingHints\",\
          \"documentation\":\"<p>The buffering option. If no value is specified, <code>BufferingHints</code> object default values are used.</p>\"\
        },\
        \"CompressionFormat\":{\
          \"shape\":\"CompressionFormat\",\
          \"documentation\":\"<p>The compression format. If no value is specified, the default is <code>UNCOMPRESSED</code>.</p> <p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket.</p>\"\
        },\
        \"EncryptionConfiguration\":{\
          \"shape\":\"EncryptionConfiguration\",\
          \"documentation\":\"<p>The encryption configuration. If no value is specified, the default is no encryption.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of a destination in Amazon S3.</p>\"\
    },\
    \"S3DestinationDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoleARN\",\
        \"BucketARN\",\
        \"BufferingHints\",\
        \"CompressionFormat\",\
        \"EncryptionConfiguration\"\
      ],\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"BucketARN\":{\
          \"shape\":\"BucketARN\",\
          \"documentation\":\"<p>The ARN of the S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The \\\"YYYY/MM/DD/HH\\\" time format prefix is automatically used for delivered Amazon S3 files. You can also specify a custom prefix, as described in <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"ErrorOutputPrefix\":{\
          \"shape\":\"ErrorOutputPrefix\",\
          \"documentation\":\"<p>A prefix that Kinesis Data Firehose evaluates and adds to failed records before writing them to S3. This prefix appears immediately following the bucket name. For information about how to specify this prefix, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"BufferingHints\",\
          \"documentation\":\"<p>The buffering option. If no value is specified, <code>BufferingHints</code> object default values are used.</p>\"\
        },\
        \"CompressionFormat\":{\
          \"shape\":\"CompressionFormat\",\
          \"documentation\":\"<p>The compression format. If no value is specified, the default is <code>UNCOMPRESSED</code>.</p>\"\
        },\
        \"EncryptionConfiguration\":{\
          \"shape\":\"EncryptionConfiguration\",\
          \"documentation\":\"<p>The encryption configuration. If no value is specified, the default is no encryption.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a destination in Amazon S3.</p>\"\
    },\
    \"S3DestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"BucketARN\":{\
          \"shape\":\"BucketARN\",\
          \"documentation\":\"<p>The ARN of the S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The \\\"YYYY/MM/DD/HH\\\" time format prefix is automatically used for delivered Amazon S3 files. You can also specify a custom prefix, as described in <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"ErrorOutputPrefix\":{\
          \"shape\":\"ErrorOutputPrefix\",\
          \"documentation\":\"<p>A prefix that Kinesis Data Firehose evaluates and adds to failed records before writing them to S3. This prefix appears immediately following the bucket name. For information about how to specify this prefix, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html\\\">Custom Prefixes for Amazon S3 Objects</a>.</p>\"\
        },\
        \"BufferingHints\":{\
          \"shape\":\"BufferingHints\",\
          \"documentation\":\"<p>The buffering option. If no value is specified, <code>BufferingHints</code> object default values are used.</p>\"\
        },\
        \"CompressionFormat\":{\
          \"shape\":\"CompressionFormat\",\
          \"documentation\":\"<p>The compression format. If no value is specified, the default is <code>UNCOMPRESSED</code>.</p> <p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket.</p>\"\
        },\
        \"EncryptionConfiguration\":{\
          \"shape\":\"EncryptionConfiguration\",\
          \"documentation\":\"<p>The encryption configuration. If no value is specified, the default is no encryption.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an update for a destination in Amazon S3.</p>\"\
    },\
    \"SchemaConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleARN\":{\
          \"shape\":\"NonEmptyStringWithoutWhitespace\",\
          \"documentation\":\"<p>The role that Kinesis Data Firehose can use to access Amazon Web Services Glue. This role must be in the same account you use for Kinesis Data Firehose. Cross-account roles aren't allowed.</p> <important> <p>If the <code>SchemaConfiguration</code> request parameter is used as part of invoking the <code>CreateDeliveryStream</code> API, then the <code>RoleARN</code> property is required and its value must be specified.</p> </important>\"\
        },\
        \"CatalogId\":{\
          \"shape\":\"NonEmptyStringWithoutWhitespace\",\
          \"documentation\":\"<p>The ID of the Amazon Web Services Glue Data Catalog. If you don't supply this, the Amazon Web Services account ID is used by default.</p>\"\
        },\
        \"DatabaseName\":{\
          \"shape\":\"NonEmptyStringWithoutWhitespace\",\
          \"documentation\":\"<p>Specifies the name of the Amazon Web Services Glue database that contains the schema for the output data.</p> <important> <p>If the <code>SchemaConfiguration</code> request parameter is used as part of invoking the <code>CreateDeliveryStream</code> API, then the <code>DatabaseName</code> property is required and its value must be specified.</p> </important>\"\
        },\
        \"TableName\":{\
          \"shape\":\"NonEmptyStringWithoutWhitespace\",\
          \"documentation\":\"<p>Specifies the Amazon Web Services Glue table that contains the column information that constitutes your data schema.</p> <important> <p>If the <code>SchemaConfiguration</code> request parameter is used as part of invoking the <code>CreateDeliveryStream</code> API, then the <code>TableName</code> property is required and its value must be specified.</p> </important>\"\
        },\
        \"Region\":{\
          \"shape\":\"NonEmptyStringWithoutWhitespace\",\
          \"documentation\":\"<p>If you don't specify an Amazon Web Services Region, the default is the current Region.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"NonEmptyStringWithoutWhitespace\",\
          \"documentation\":\"<p>Specifies the table version for the output data schema. If you don't specify this version ID, or if you set it to <code>LATEST</code>, Kinesis Data Firehose uses the most recent version. This means that any updates to the table are automatically picked up.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the schema to which you want Kinesis Data Firehose to configure your data before it writes it to Amazon S3. This parameter is required if <code>Enabled</code> is set to true.</p>\"\
    },\
    \"SecurityGroupIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyStringWithoutWhitespace\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"Serializer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParquetSerDe\":{\
          \"shape\":\"ParquetSerDe\",\
          \"documentation\":\"<p>A serializer to use for converting data to the Parquet format before storing it in Amazon S3. For more information, see <a href=\\\"https://parquet.apache.org/documentation/latest/\\\">Apache Parquet</a>.</p>\"\
        },\
        \"OrcSerDe\":{\
          \"shape\":\"OrcSerDe\",\
          \"documentation\":\"<p>A serializer to use for converting data to the ORC format before storing it in Amazon S3. For more information, see <a href=\\\"https://orc.apache.org/docs/\\\">Apache ORC</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The serializer that you want Kinesis Data Firehose to use to convert data to the target format before writing it to Amazon S3. Kinesis Data Firehose supports two types of serializers: the <a href=\\\"https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/orc/OrcSerde.html\\\">ORC SerDe</a> and the <a href=\\\"https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/parquet/serde/ParquetHiveSerDe.html\\\">Parquet SerDe</a>.</p>\"\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message that provides information about the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The service is unavailable. Back off and retry the operation. If you continue to see the exception, throughput limits for the delivery stream may have been exceeded. For more information about limits and how to request an increase, see <a href=\\\"https://docs.aws.amazon.com/firehose/latest/dev/limits.html\\\">Amazon Kinesis Data Firehose Limits</a>.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"SizeInMBs\":{\
      \"type\":\"integer\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"SourceDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KinesisStreamSourceDescription\":{\
          \"shape\":\"KinesisStreamSourceDescription\",\
          \"documentation\":\"<p>The <a>KinesisStreamSourceDescription</a> value for the source Kinesis data stream.</p>\"\
        },\
        \"MSKSourceDescription\":{\
          \"shape\":\"MSKSourceDescription\",\
          \"documentation\":\"<p>The configuration description for the Amazon MSK cluster to be used as the source for a delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a Kinesis data stream used as the source for a Kinesis Data Firehose delivery stream.</p>\"\
    },\
    \"SplunkDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HECEndpoint\",\
        \"HECEndpointType\",\
        \"HECToken\",\
        \"S3Configuration\"\
      ],\
      \"members\":{\
        \"HECEndpoint\":{\
          \"shape\":\"HECEndpoint\",\
          \"documentation\":\"<p>The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose sends your data.</p>\"\
        },\
        \"HECEndpointType\":{\
          \"shape\":\"HECEndpointType\",\
          \"documentation\":\"<p>This type can be either \\\"Raw\\\" or \\\"Event.\\\"</p>\"\
        },\
        \"HECToken\":{\
          \"shape\":\"HECToken\",\
          \"documentation\":\"<p>This is a GUID that you obtain from your Splunk cluster when you create a new HEC endpoint.</p>\"\
        },\
        \"HECAcknowledgmentTimeoutInSeconds\":{\
          \"shape\":\"HECAcknowledgmentTimeoutInSeconds\",\
          \"documentation\":\"<p>The amount of time that Kinesis Data Firehose waits to receive an acknowledgment from Splunk after it sends it data. At the end of the timeout period, Kinesis Data Firehose either tries to send the data again or considers it an error, based on your retry settings.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"SplunkRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver data to Splunk, or if it doesn't receive an acknowledgment of receipt from Splunk.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"SplunkS3BackupMode\",\
          \"documentation\":\"<p>Defines how documents should be delivered to Amazon S3. When set to <code>FailedEventsOnly</code>, Kinesis Data Firehose writes any data that could not be indexed to the configured Amazon S3 destination. When set to <code>AllEvents</code>, Kinesis Data Firehose delivers all incoming records to Amazon S3, and also writes failed documents to Amazon S3. The default value is <code>FailedEventsOnly</code>.</p> <p>You can update this backup mode from <code>FailedEventsOnly</code> to <code>AllEvents</code>. You can't update it from <code>AllEvents</code> to <code>FailedEventsOnly</code>.</p>\"\
        },\
        \"S3Configuration\":{\
          \"shape\":\"S3DestinationConfiguration\",\
          \"documentation\":\"<p>The configuration for the backup Amazon S3 location.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of a destination in Splunk.</p>\"\
    },\
    \"SplunkDestinationDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HECEndpoint\":{\
          \"shape\":\"HECEndpoint\",\
          \"documentation\":\"<p>The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose sends your data.</p>\"\
        },\
        \"HECEndpointType\":{\
          \"shape\":\"HECEndpointType\",\
          \"documentation\":\"<p>This type can be either \\\"Raw\\\" or \\\"Event.\\\"</p>\"\
        },\
        \"HECToken\":{\
          \"shape\":\"HECToken\",\
          \"documentation\":\"<p>A GUID you obtain from your Splunk cluster when you create a new HEC endpoint.</p>\"\
        },\
        \"HECAcknowledgmentTimeoutInSeconds\":{\
          \"shape\":\"HECAcknowledgmentTimeoutInSeconds\",\
          \"documentation\":\"<p>The amount of time that Kinesis Data Firehose waits to receive an acknowledgment from Splunk after it sends it data. At the end of the timeout period, Kinesis Data Firehose either tries to send the data again or considers it an error, based on your retry settings.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"SplunkRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver data to Splunk or if it doesn't receive an acknowledgment of receipt from Splunk.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"SplunkS3BackupMode\",\
          \"documentation\":\"<p>Defines how documents should be delivered to Amazon S3. When set to <code>FailedDocumentsOnly</code>, Kinesis Data Firehose writes any data that could not be indexed to the configured Amazon S3 destination. When set to <code>AllDocuments</code>, Kinesis Data Firehose delivers all incoming records to Amazon S3, and also writes failed documents to Amazon S3. Default value is <code>FailedDocumentsOnly</code>. </p>\"\
        },\
        \"S3DestinationDescription\":{\
          \"shape\":\"S3DestinationDescription\",\
          \"documentation\":\"<p>The Amazon S3 destination.&gt;</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a destination in Splunk.</p>\"\
    },\
    \"SplunkDestinationUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HECEndpoint\":{\
          \"shape\":\"HECEndpoint\",\
          \"documentation\":\"<p>The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose sends your data.</p>\"\
        },\
        \"HECEndpointType\":{\
          \"shape\":\"HECEndpointType\",\
          \"documentation\":\"<p>This type can be either \\\"Raw\\\" or \\\"Event.\\\"</p>\"\
        },\
        \"HECToken\":{\
          \"shape\":\"HECToken\",\
          \"documentation\":\"<p>A GUID that you obtain from your Splunk cluster when you create a new HEC endpoint.</p>\"\
        },\
        \"HECAcknowledgmentTimeoutInSeconds\":{\
          \"shape\":\"HECAcknowledgmentTimeoutInSeconds\",\
          \"documentation\":\"<p>The amount of time that Kinesis Data Firehose waits to receive an acknowledgment from Splunk after it sends data. At the end of the timeout period, Kinesis Data Firehose either tries to send the data again or considers it an error, based on your retry settings.</p>\"\
        },\
        \"RetryOptions\":{\
          \"shape\":\"SplunkRetryOptions\",\
          \"documentation\":\"<p>The retry behavior in case Kinesis Data Firehose is unable to deliver data to Splunk or if it doesn't receive an acknowledgment of receipt from Splunk.</p>\"\
        },\
        \"S3BackupMode\":{\
          \"shape\":\"SplunkS3BackupMode\",\
          \"documentation\":\"<p>Specifies how you want Kinesis Data Firehose to back up documents to Amazon S3. When set to <code>FailedDocumentsOnly</code>, Kinesis Data Firehose writes any data that could not be indexed to the configured Amazon S3 destination. When set to <code>AllEvents</code>, Kinesis Data Firehose delivers all incoming records to Amazon S3, and also writes failed documents to Amazon S3. The default value is <code>FailedEventsOnly</code>.</p> <p>You can update this backup mode from <code>FailedEventsOnly</code> to <code>AllEvents</code>. You can't update it from <code>AllEvents</code> to <code>FailedEventsOnly</code>.</p>\"\
        },\
        \"S3Update\":{\
          \"shape\":\"S3DestinationUpdate\",\
          \"documentation\":\"<p>Your update to the configuration of the backup Amazon S3 location.</p>\"\
        },\
        \"ProcessingConfiguration\":{\
          \"shape\":\"ProcessingConfiguration\",\
          \"documentation\":\"<p>The data processing configuration.</p>\"\
        },\
        \"CloudWatchLoggingOptions\":{\
          \"shape\":\"CloudWatchLoggingOptions\",\
          \"documentation\":\"<p>The Amazon CloudWatch logging options for your delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an update for a destination in Splunk.</p>\"\
    },\
    \"SplunkRetryDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":7200,\
      \"min\":0\
    },\
    \"SplunkRetryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DurationInSeconds\":{\
          \"shape\":\"SplunkRetryDurationInSeconds\",\
          \"documentation\":\"<p>The total amount of time that Kinesis Data Firehose spends on retries. This duration starts after the initial attempt to send data to Splunk fails. It doesn't include the periods during which Kinesis Data Firehose waits for acknowledgment from Splunk after each attempt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures retry behavior in case Kinesis Data Firehose is unable to deliver documents to Splunk, or if it doesn't receive an acknowledgment from Splunk.</p>\"\
    },\
    \"SplunkS3BackupMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FailedEventsOnly\",\
        \"AllEvents\"\
      ]\
    },\
    \"StartDeliveryStreamEncryptionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliveryStreamName\"],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream for which you want to enable server-side encryption (SSE).</p>\"\
        },\
        \"DeliveryStreamEncryptionConfigurationInput\":{\
          \"shape\":\"DeliveryStreamEncryptionConfigurationInput\",\
          \"documentation\":\"<p>Used to specify the type and Amazon Resource Name (ARN) of the KMS key needed for Server-Side Encryption (SSE).</p>\"\
        }\
      }\
    },\
    \"StartDeliveryStreamEncryptionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopDeliveryStreamEncryptionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliveryStreamName\"],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream for which you want to disable server-side encryption (SSE).</p>\"\
        }\
      }\
    },\
    \"StopDeliveryStreamEncryptionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"SubnetIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyStringWithoutWhitespace\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % @</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>An optional string, which you can use to describe or define the tag. Maximum length: 256 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % @</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metadata that you can assign to a delivery stream, consisting of a key-value pair.</p>\"\
    },\
    \"TagDeliveryStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryStreamName\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream to which you want to add the tags.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagDeliveryStreamInputTagList\",\
          \"documentation\":\"<p>A set of key-value pairs to use to create the tags.</p>\"\
        }\
      }\
    },\
    \"TagDeliveryStreamInputTagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagDeliveryStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^(?!aws:)[\\\\p{L}\\\\p{Z}\\\\p{N}_.:\\\\/=+\\\\-@%]*$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^[\\\\p{L}\\\\p{Z}\\\\p{N}_.:\\\\/=+\\\\-@%]*$\"\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TopicName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9\\\\\\\\._\\\\\\\\-]+\"\
    },\
    \"UntagDeliveryStreamInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryStreamName\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of tag keys. Each corresponding tag is removed from the delivery stream.</p>\"\
        }\
      }\
    },\
    \"UntagDeliveryStreamOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateDestinationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryStreamName\",\
        \"CurrentDeliveryStreamVersionId\",\
        \"DestinationId\"\
      ],\
      \"members\":{\
        \"DeliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The name of the delivery stream.</p>\"\
        },\
        \"CurrentDeliveryStreamVersionId\":{\
          \"shape\":\"DeliveryStreamVersionId\",\
          \"documentation\":\"<p>Obtain this value from the <code>VersionId</code> result of <a>DeliveryStreamDescription</a>. This value is required, and helps the service perform conditional operations. For example, if there is an interleaving update and this value is null, then the update destination fails. After the update is successful, the <code>VersionId</code> value is updated. The service then performs a merge of the old configuration with the new configuration.</p>\"\
        },\
        \"DestinationId\":{\
          \"shape\":\"DestinationId\",\
          \"documentation\":\"<p>The ID of the destination.</p>\"\
        },\
        \"S3DestinationUpdate\":{\
          \"shape\":\"S3DestinationUpdate\",\
          \"documentation\":\"<p>[Deprecated] Describes an update for a destination in Amazon S3.</p>\",\
          \"deprecated\":true\
        },\
        \"ExtendedS3DestinationUpdate\":{\
          \"shape\":\"ExtendedS3DestinationUpdate\",\
          \"documentation\":\"<p>Describes an update for a destination in Amazon S3.</p>\"\
        },\
        \"RedshiftDestinationUpdate\":{\
          \"shape\":\"RedshiftDestinationUpdate\",\
          \"documentation\":\"<p>Describes an update for a destination in Amazon Redshift.</p>\"\
        },\
        \"ElasticsearchDestinationUpdate\":{\
          \"shape\":\"ElasticsearchDestinationUpdate\",\
          \"documentation\":\"<p>Describes an update for a destination in Amazon ES.</p>\"\
        },\
        \"AmazonopensearchserviceDestinationUpdate\":{\
          \"shape\":\"AmazonopensearchserviceDestinationUpdate\",\
          \"documentation\":\"<p>Describes an update for a destination in Amazon OpenSearch Service.</p>\"\
        },\
        \"SplunkDestinationUpdate\":{\
          \"shape\":\"SplunkDestinationUpdate\",\
          \"documentation\":\"<p>Describes an update for a destination in Splunk.</p>\"\
        },\
        \"HttpEndpointDestinationUpdate\":{\
          \"shape\":\"HttpEndpointDestinationUpdate\",\
          \"documentation\":\"<p>Describes an update to the specified HTTP endpoint destination.</p>\"\
        },\
        \"AmazonOpenSearchServerlessDestinationUpdate\":{\
          \"shape\":\"AmazonOpenSearchServerlessDestinationUpdate\",\
          \"documentation\":\"<p>Describes an update for a destination in the Serverless offering for Amazon OpenSearch Service.</p>\"\
        }\
      }\
    },\
    \"UpdateDestinationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Username\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"VpcConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SubnetIds\",\
        \"RoleARN\",\
        \"SecurityGroupIds\"\
      ],\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIdList\",\
          \"documentation\":\"<p>The IDs of the subnets that you want Kinesis Data Firehose to use to create ENIs in the VPC of the Amazon ES destination. Make sure that the routing tables and inbound and outbound rules allow traffic to flow from the subnets whose IDs are specified here to the subnets that have the destination Amazon ES endpoints. Kinesis Data Firehose creates at least one ENI in each of the subnets that are specified here. Do not delete or modify these ENIs.</p> <p>The number of ENIs that Kinesis Data Firehose creates in the subnets specified here scales up and down automatically based on throughput. To enable Kinesis Data Firehose to scale up the number of ENIs to match throughput, ensure that you have sufficient quota. To help you calculate the quota you need, assume that Kinesis Data Firehose can create up to three ENIs for this delivery stream for each of the subnets specified here. For more information about ENI quota, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis\\\">Network Interfaces </a> in the Amazon VPC Quotas topic.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The ARN of the IAM role that you want the delivery stream to use to create endpoints in the destination VPC. You can use your existing Kinesis Data Firehose delivery role or you can specify a new role. In either case, make sure that the role trusts the Kinesis Data Firehose service principal and that it grants the following permissions:</p> <ul> <li> <p> <code>ec2:DescribeVpcs</code> </p> </li> <li> <p> <code>ec2:DescribeVpcAttribute</code> </p> </li> <li> <p> <code>ec2:DescribeSubnets</code> </p> </li> <li> <p> <code>ec2:DescribeSecurityGroups</code> </p> </li> <li> <p> <code>ec2:DescribeNetworkInterfaces</code> </p> </li> <li> <p> <code>ec2:CreateNetworkInterface</code> </p> </li> <li> <p> <code>ec2:CreateNetworkInterfacePermission</code> </p> </li> <li> <p> <code>ec2:DeleteNetworkInterface</code> </p> </li> </ul> <p>If you revoke these permissions after you create the delivery stream, Kinesis Data Firehose can't scale out by creating more ENIs when necessary. You might therefore see a degradation in performance.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIdList\",\
          \"documentation\":\"<p>The IDs of the security groups that you want Kinesis Data Firehose to use when it creates ENIs in the VPC of the Amazon ES destination. You can use the same security group that the Amazon ES domain uses or different ones. If you specify different security groups here, ensure that they allow outbound HTTPS traffic to the Amazon ES domain's security group. Also ensure that the Amazon ES domain's security group allows HTTPS traffic from the security groups specified here. If you use the same security group for both your delivery stream and the Amazon ES domain, make sure the security group inbound rule allows HTTPS traffic. For more information about security group rules, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules\\\">Security group rules</a> in the Amazon VPC documentation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the VPC of the Amazon OpenSearch or Amazon OpenSearch Serverless destination.</p>\"\
    },\
    \"VpcConfigurationDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SubnetIds\",\
        \"RoleARN\",\
        \"SecurityGroupIds\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIdList\",\
          \"documentation\":\"<p>The IDs of the subnets that Kinesis Data Firehose uses to create ENIs in the VPC of the Amazon ES destination. Make sure that the routing tables and inbound and outbound rules allow traffic to flow from the subnets whose IDs are specified here to the subnets that have the destination Amazon ES endpoints. Kinesis Data Firehose creates at least one ENI in each of the subnets that are specified here. Do not delete or modify these ENIs.</p> <p>The number of ENIs that Kinesis Data Firehose creates in the subnets specified here scales up and down automatically based on throughput. To enable Kinesis Data Firehose to scale up the number of ENIs to match throughput, ensure that you have sufficient quota. To help you calculate the quota you need, assume that Kinesis Data Firehose can create up to three ENIs for this delivery stream for each of the subnets specified here. For more information about ENI quota, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis\\\">Network Interfaces </a> in the Amazon VPC Quotas topic.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The ARN of the IAM role that the delivery stream uses to create endpoints in the destination VPC. You can use your existing Kinesis Data Firehose delivery role or you can specify a new role. In either case, make sure that the role trusts the Kinesis Data Firehose service principal and that it grants the following permissions:</p> <ul> <li> <p> <code>ec2:DescribeVpcs</code> </p> </li> <li> <p> <code>ec2:DescribeVpcAttribute</code> </p> </li> <li> <p> <code>ec2:DescribeSubnets</code> </p> </li> <li> <p> <code>ec2:DescribeSecurityGroups</code> </p> </li> <li> <p> <code>ec2:DescribeNetworkInterfaces</code> </p> </li> <li> <p> <code>ec2:CreateNetworkInterface</code> </p> </li> <li> <p> <code>ec2:CreateNetworkInterfacePermission</code> </p> </li> <li> <p> <code>ec2:DeleteNetworkInterface</code> </p> </li> </ul> <p>If you revoke these permissions after you create the delivery stream, Kinesis Data Firehose can't scale out by creating more ENIs when necessary. You might therefore see a degradation in performance.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIdList\",\
          \"documentation\":\"<p>The IDs of the security groups that Kinesis Data Firehose uses when it creates ENIs in the VPC of the Amazon ES destination. You can use the same security group that the Amazon ES domain uses or different ones. If you specify different security groups, ensure that they allow outbound HTTPS traffic to the Amazon ES domain's security group. Also ensure that the Amazon ES domain's security group allows HTTPS traffic from the security groups specified here. If you use the same security group for both your delivery stream and the Amazon ES domain, make sure the security group inbound rule allows HTTPS traffic. For more information about security group rules, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules\\\">Security group rules</a> in the Amazon VPC documentation.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"NonEmptyStringWithoutWhitespace\",\
          \"documentation\":\"<p>The ID of the Amazon ES destination's VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the VPC of the Amazon ES destination.</p>\"\
    }\
  },\
  \"documentation\":\"<fullname>Amazon Kinesis Data Firehose API Reference</fullname> <p>Amazon Kinesis Data Firehose is a fully managed service that delivers real-time streaming data to destinations such as Amazon Simple Storage Service (Amazon S3), Amazon OpenSearch Service, Amazon Redshift, Splunk, and various other supportd destinations.</p>\"\
}\
";
}

@end
