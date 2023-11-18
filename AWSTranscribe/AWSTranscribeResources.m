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

#import "AWSTranscribeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranscribeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranscribeResources

+ (instancetype)sharedInstance {
    static AWSTranscribeResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTranscribeResources new];
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
    \"apiVersion\":\"2017-10-26\",\
    \"endpointPrefix\":\"transcribe\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Transcribe Service\",\
    \"serviceId\":\"Transcribe\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"transcribe\",\
    \"targetPrefix\":\"Transcribe\",\
    \"uid\":\"transcribe-2017-10-26\"\
  },\
  \"operations\":{\
    \"CreateCallAnalyticsCategory\":{\
      \"name\":\"CreateCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"CreateCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Call Analytics category.</p> <p>All categories are automatically applied to your Call Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must create them before submitting your transcription request, as categories cannot be applied retroactively.</p> <p>When creating a new category, you can use the <code>InputType</code> parameter to label the category as a <code>POST_CALL</code> or a <code>REAL_TIME</code> category. <code>POST_CALL</code> categories can only be applied to post-call transcriptions and <code>REAL_TIME</code> categories can only be applied to real-time transcriptions. If you do not include <code>InputType</code>, your category is created as a <code>POST_CALL</code> category by default.</p> <p>Call Analytics categories are composed of rules. For each category, you must create between 1 and 20 rules. Rules can include these parameters: , , , and .</p> <p>To update an existing category, see .</p> <p>To learn more about Call Analytics categories, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html\\\">Creating categories for post-call transcriptions</a> and <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html\\\">Creating categories for real-time transcriptions</a>.</p>\"\
    },\
    \"CreateLanguageModel\":{\
      \"name\":\"CreateLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLanguageModelRequest\"},\
      \"output\":{\"shape\":\"CreateLanguageModelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom language model.</p> <p>When creating a new custom language model, you must specify:</p> <ul> <li> <p>If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model</p> </li> <li> <p>The location of your training and tuning files (this must be an Amazon S3 URI)</p> </li> <li> <p>The language of your model</p> </li> <li> <p>A unique name for your model</p> </li> </ul>\"\
    },\
    \"CreateMedicalVocabulary\":{\
      \"name\":\"CreateMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom medical vocabulary.</p> <p>Before creating a new custom medical vocabulary, you must first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that this differs from , where you can include a list of terms within your request using the <code>Phrases</code> flag; <code>CreateMedicalVocabulary</code> does not support the <code>Phrases</code> flag and only accepts vocabularies in table format.</p> <p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html\\\">Custom vocabularies</a>.</p>\"\
    },\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary.</p> <p>When creating a new custom vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI in your request. Or you can include a list of terms directly in your request using the <code>Phrases</code> flag.</p> <p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html\\\">Custom vocabularies</a>.</p>\"\
    },\
    \"CreateVocabularyFilter\":{\
      \"name\":\"CreateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary filter.</p> <p>You can use custom vocabulary filters to mask, delete, or flag specific words from your transcript. Custom vocabulary filters are commonly used to mask profanity in transcripts.</p> <p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html\\\">Vocabulary filtering</a>.</p>\"\
    },\
    \"DeleteCallAnalyticsCategory\":{\
      \"name\":\"DeleteCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"DeleteCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Call Analytics category. To use this operation, specify the name of the category you want to delete using <code>CategoryName</code>. Category names are case sensitive.</p>\"\
    },\
    \"DeleteCallAnalyticsJob\":{\
      \"name\":\"DeleteCallAnalyticsJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCallAnalyticsJobRequest\"},\
      \"output\":{\"shape\":\"DeleteCallAnalyticsJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete using <code>CallAnalyticsJobName</code>. Job names are case sensitive.</p>\"\
    },\
    \"DeleteLanguageModel\":{\
      \"name\":\"DeleteLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLanguageModelRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using <code>ModelName</code>. custom language model names are case sensitive.</p>\"\
    },\
    \"DeleteMedicalTranscriptionJob\":{\
      \"name\":\"DeleteMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMedicalTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a medical transcription job. To use this operation, specify the name of the job you want to delete using <code>MedicalTranscriptionJobName</code>. Job names are case sensitive.</p>\"\
    },\
    \"DeleteMedicalVocabulary\":{\
      \"name\":\"DeleteMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMedicalVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom medical vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using <code>VocabularyName</code>. Custom vocabulary names are case sensitive.</p>\"\
    },\
    \"DeleteTranscriptionJob\":{\
      \"name\":\"DeleteTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a transcription job. To use this operation, specify the name of the job you want to delete using <code>TranscriptionJobName</code>. Job names are case sensitive.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you want to delete using <code>VocabularyName</code>. Custom vocabulary names are case sensitive.</p>\"\
    },\
    \"DeleteVocabularyFilter\":{\
      \"name\":\"DeleteVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary filter you want to delete using <code>VocabularyFilterName</code>. Custom vocabulary filter names are case sensitive.</p>\"\
    },\
    \"DescribeLanguageModel\":{\
      \"name\":\"DescribeLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLanguageModelRequest\"},\
      \"output\":{\"shape\":\"DescribeLanguageModelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified custom language model.</p> <p>This operation also shows if the base language model that you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.</p> <p>If you tried to create a new custom language model and the request wasn't successful, you can use <code>DescribeLanguageModel</code> to help identify the reason for this failure.</p>\"\
    },\
    \"GetCallAnalyticsCategory\":{\
      \"name\":\"GetCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"GetCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified Call Analytics category.</p> <p>To get a list of your Call Analytics categories, use the operation.</p>\"\
    },\
    \"GetCallAnalyticsJob\":{\
      \"name\":\"GetCallAnalyticsJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCallAnalyticsJobRequest\"},\
      \"output\":{\"shape\":\"GetCallAnalyticsJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified Call Analytics job.</p> <p>To view the job's status, refer to <code>CallAnalyticsJobStatus</code>. If the status is <code>COMPLETED</code>, the job is finished. You can find your completed transcript at the URI specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p> <p>If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in <code>RedactedTranscriptFileUri</code>.</p> <p>If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in <code>RedactedMediaFileUri</code>.</p> <p>To get a list of your Call Analytics jobs, use the operation.</p>\"\
    },\
    \"GetMedicalTranscriptionJob\":{\
      \"name\":\"GetMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMedicalTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetMedicalTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified medical transcription job.</p> <p>To view the status of the specified medical transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p> <p>To get a list of your medical transcription jobs, use the operation.</p>\"\
    },\
    \"GetMedicalVocabulary\":{\
      \"name\":\"GetMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified custom medical vocabulary.</p> <p>To view the status of the specified custom medical vocabulary, check the <code>VocabularyState</code> field. If the status is <code>READY</code>, your custom vocabulary is available to use. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your vocabulary failed.</p> <p>To get a list of your custom medical vocabularies, use the operation.</p>\"\
    },\
    \"GetTranscriptionJob\":{\
      \"name\":\"GetTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified transcription job.</p> <p>To view the status of the specified transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p> <p>If you enabled content redaction, the redacted transcript can be found at the location specified in <code>RedactedTranscriptFileUri</code>.</p> <p>To get a list of your transcription jobs, use the operation.</p>\"\
    },\
    \"GetVocabulary\":{\
      \"name\":\"GetVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified custom vocabulary.</p> <p>To view the status of the specified custom vocabulary, check the <code>VocabularyState</code> field. If the status is <code>READY</code>, your custom vocabulary is available to use. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your custom vocabulary failed.</p> <p>To get a list of your custom vocabularies, use the operation.</p>\"\
    },\
    \"GetVocabularyFilter\":{\
      \"name\":\"GetVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the specified custom vocabulary filter.</p> <p>To get a list of your custom vocabulary filters, use the operation.</p>\"\
    },\
    \"ListCallAnalyticsCategories\":{\
      \"name\":\"ListCallAnalyticsCategories\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCallAnalyticsCategoriesRequest\"},\
      \"output\":{\"shape\":\"ListCallAnalyticsCategoriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of Call Analytics categories, including all rules that make up each category.</p> <p>To get detailed information about a specific Call Analytics category, use the operation.</p>\"\
    },\
    \"ListCallAnalyticsJobs\":{\
      \"name\":\"ListCallAnalyticsJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCallAnalyticsJobsRequest\"},\
      \"output\":{\"shape\":\"ListCallAnalyticsJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are specified, all Call Analytics jobs are returned.</p> <p>To get detailed information about a specific Call Analytics job, use the operation.</p>\"\
    },\
    \"ListLanguageModels\":{\
      \"name\":\"ListLanguageModels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListLanguageModelsRequest\"},\
      \"output\":{\"shape\":\"ListLanguageModelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of custom language models that match the specified criteria. If no criteria are specified, all custom language models are returned.</p> <p>To get detailed information about a specific custom language model, use the operation.</p>\"\
    },\
    \"ListMedicalTranscriptionJobs\":{\
      \"name\":\"ListMedicalTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMedicalTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListMedicalTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of medical transcription jobs that match the specified criteria. If no criteria are specified, all medical transcription jobs are returned.</p> <p>To get detailed information about a specific medical transcription job, use the operation.</p>\"\
    },\
    \"ListMedicalVocabularies\":{\
      \"name\":\"ListMedicalVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMedicalVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListMedicalVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are specified, all custom medical vocabularies are returned.</p> <p>To get detailed information about a specific custom medical vocabulary, use the operation.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all tags associated with the specified transcription job, vocabulary, model, or resource.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
    },\
    \"ListTranscriptionJobs\":{\
      \"name\":\"ListTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of transcription jobs that match the specified criteria. If no criteria are specified, all transcription jobs are returned.</p> <p>To get detailed information about a specific transcription job, use the operation.</p>\"\
    },\
    \"ListVocabularies\":{\
      \"name\":\"ListVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of custom vocabularies that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.</p> <p>To get detailed information about a specific custom vocabulary, use the operation.</p>\"\
    },\
    \"ListVocabularyFilters\":{\
      \"name\":\"ListVocabularyFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabularyFiltersRequest\"},\
      \"output\":{\"shape\":\"ListVocabularyFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are specified, all custom vocabularies are returned.</p> <p>To get detailed information about a specific custom vocabulary filter, use the operation.</p>\"\
    },\
    \"StartCallAnalyticsJob\":{\
      \"name\":\"StartCallAnalyticsJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartCallAnalyticsJobRequest\"},\
      \"output\":{\"shape\":\"StartCallAnalyticsJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Transcribes the audio from a customer service call and applies any additional Request Parameters you choose to include in your request.</p> <p>In addition to many standard transcription features, Call Analytics provides you with call characteristics, call summarization, speaker sentiment, and optional redaction of your text transcript and your audio file. You can also apply custom categories to flag specified conditions. To learn more about these features and insights, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html\\\">Analyzing call center audio with Call Analytics</a>.</p> <p>If you want to apply categories to your Call Analytics job, you must create them before submitting your job request. Categories cannot be retroactively applied to a job. To create a new category, use the operation. To learn more about Call Analytics categories, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html\\\">Creating categories for post-call transcriptions</a> and <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html\\\">Creating categories for real-time transcriptions</a>.</p> <p>To make a <code>StartCallAnalyticsJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p> <p>Note that job queuing is enabled by default for Call Analytics jobs.</p> <p>You must include the following parameters in your <code>StartCallAnalyticsJob</code> request:</p> <ul> <li> <p> <code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/transcribe.html\\\">Amazon Transcribe endpoints and quotas</a>.</p> </li> <li> <p> <code>CallAnalyticsJobName</code>: A custom name that you create for your transcription job that's unique within your Amazon Web Services account.</p> </li> <li> <p> <code>DataAccessRoleArn</code>: The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files.</p> </li> <li> <p> <code>Media</code> (<code>MediaFileUri</code> or <code>RedactedMediaFileUri</code>): The Amazon S3 location of your media file.</p> </li> </ul> <note> <p>With Call Analytics, you can redact the audio contained in your media file by including <code>RedactedMediaFileUri</code>, instead of <code>MediaFileUri</code>, to specify the location of your input audio. If you choose to redact your audio, you can find your redacted media at the location specified in the <code>RedactedMediaFileUri</code> field of your response.</p> </note>\"\
    },\
    \"StartMedicalTranscriptionJob\":{\
      \"name\":\"StartMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartMedicalTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartMedicalTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Transcribes the audio from a medical dictation or conversation and applies any additional Request Parameters you choose to include in your request.</p> <p>In addition to many standard transcription features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally, content identification, which adds flags to personal health information (PHI). To learn more about these features, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html\\\">How Amazon Transcribe Medical works</a>.</p> <p>To make a <code>StartMedicalTranscriptionJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the S3 location of the file using the <code>Media</code> parameter.</p> <p>You must include the following parameters in your <code>StartMedicalTranscriptionJob</code> request:</p> <ul> <li> <p> <code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/transcribe.html\\\">Amazon Transcribe endpoints and quotas</a>.</p> </li> <li> <p> <code>MedicalTranscriptionJobName</code>: A custom name you create for your transcription job that is unique within your Amazon Web Services account.</p> </li> <li> <p> <code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p> </li> <li> <p> <code>LanguageCode</code>: This must be <code>en-US</code>.</p> </li> <li> <p> <code>OutputBucketName</code>: The Amazon S3 bucket where you want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must also include <code>OutputKey</code>.</p> </li> <li> <p> <code>Specialty</code>: This must be <code>PRIMARYCARE</code>.</p> </li> <li> <p> <code>Type</code>: Choose whether your audio is a conversation or a dictation.</p> </li> </ul>\"\
    },\
    \"StartTranscriptionJob\":{\
      \"name\":\"StartTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Transcribes the audio from a media file and applies any additional Request Parameters you choose to include in your request.</p> <p>To make a <code>StartTranscriptionJob</code> request, you must first upload your media file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the <code>Media</code> parameter.</p> <p>You must include the following parameters in your <code>StartTranscriptionJob</code> request:</p> <ul> <li> <p> <code>region</code>: The Amazon Web Services Region where you are making your request. For a list of Amazon Web Services Regions supported with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/transcribe.html\\\">Amazon Transcribe endpoints and quotas</a>.</p> </li> <li> <p> <code>TranscriptionJobName</code>: A custom name you create for your transcription job that is unique within your Amazon Web Services account.</p> </li> <li> <p> <code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of your media file.</p> </li> <li> <p>One of <code>LanguageCode</code>, <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code>: If you know the language of your media file, specify it using the <code>LanguageCode</code> parameter; you can find all valid language codes in the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table. If you don't know the languages spoken in your media, use either <code>IdentifyLanguage</code> or <code>IdentifyMultipleLanguages</code> and let Amazon Transcribe identify the languages for you.</p> </li> </ul>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified Amazon Transcribe resource.</p> <p>If you include <code>UntagResource</code> in your request, you must also include <code>ResourceArn</code> and <code>TagKeys</code>.</p>\"\
    },\
    \"UpdateCallAnalyticsCategory\":{\
      \"name\":\"UpdateCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"UpdateCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified Call Analytics category with new rules. Note that the <code>UpdateCallAnalyticsCategory</code> operation overwrites all existing rules contained in the specified category. You cannot append additional rules onto an existing category.</p> <p>To create a new category, see .</p>\"\
    },\
    \"UpdateMedicalVocabulary\":{\
      \"name\":\"UpdateMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing custom medical vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.</p>\"\
    },\
    \"UpdateVocabulary\":{\
      \"name\":\"UpdateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing custom vocabulary with new values. This operation overwrites all existing information with your new values; you cannot append new terms onto an existing custom vocabulary.</p>\"\
    },\
    \"UpdateVocabularyFilter\":{\
      \"name\":\"UpdateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing custom vocabulary filter with a new list of words. The new list you provide overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary filter.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AbsoluteTimeRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartTime\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>The time, in milliseconds, when Amazon Transcribe starts searching for the specified criteria in your audio. If you include <code>StartTime</code> in your request, you must also include <code>EndTime</code>.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>The time, in milliseconds, when Amazon Transcribe stops searching for the specified criteria in your audio. If you include <code>EndTime</code> in your request, you must also include <code>StartTime</code>.</p>\"\
        },\
        \"First\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>The time, in milliseconds, from the start of your media file until the specified value. Amazon Transcribe searches for your specified criteria in this time segment.</p>\"\
        },\
        \"Last\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>The time, in milliseconds, from the specified value until the end of your media file. Amazon Transcribe searches for your specified criteria in this time segment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A time range, in milliseconds, between two points in your media file.</p> <p>You can use <code>StartTime</code> and <code>EndTime</code> to search a custom segment. For example, setting <code>StartTime</code> to 10000 and <code>EndTime</code> to 50000 only searches for your specified criteria in the audio contained between the 10,000 millisecond mark and the 50,000 millisecond mark of your media file. You must use <code>StartTime</code> and <code>EndTime</code> as a set; that is, if you include one, you must include both.</p> <p>You can use also <code>First</code> to search from the start of the audio until the time that you specify, or <code>Last</code> to search from the time that you specify until the end of the audio. For example, setting <code>First</code> to 50000 only searches for your specified criteria in the audio contained between the start of the media file to the 50,000 millisecond mark. You can use <code>First</code> and <code>Last</code> independently of each other.</p> <p>If you prefer to use percentage instead of milliseconds, see .</p>\"\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Your request didn't pass one or more validation tests. This can occur when the entity you're trying to delete doesn't exist or if it's in a non-terminal state (such as <code>IN PROGRESS</code>). See the exception message field for more information.</p>\",\
      \"exception\":true\
    },\
    \"BaseModelName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NarrowBand\",\
        \"WideBand\"\
      ]\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CLMLanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en-US\",\
        \"hi-IN\",\
        \"es-US\",\
        \"en-GB\",\
        \"en-AU\",\
        \"de-DE\",\
        \"ja-JP\"\
      ]\
    },\
    \"CallAnalyticsJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the Call Analytics job. Job names are case sensitive and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"CallAnalyticsJobStatus\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>Provides the status of the specified Call Analytics job.</p> <p>If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code> (or <code>RedactedTranscriptFileUri</code>, if you requested transcript redaction). If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code used to create your Call Analytics job. For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table.</p> <p>If you don't know the language spoken in your media file, you can omit this field and let Amazon Transcribe automatically identify the language of your media. To improve the accuracy of language identification, you can include several language codes and Amazon Transcribe chooses the closest match for your transcription.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in hertz, of the audio track in your input media file.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>Provides the Amazon S3 location of the media file you used in your Call Analytics request.</p>\"\
        },\
        \"Transcript\":{\"shape\":\"Transcript\"},\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified Call Analytics job began processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified Call Analytics job request was made.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified Call Analytics job finished processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>CallAnalyticsJobStatus</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the Call Analytics job request failed.</p> <p>The <code>FailureReason</code> field contains one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code>.</p> <p>The media format specified in <code>MediaFormat</code> isn't valid. Refer to <b>MediaFormat</b> for a list of supported formats.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code>.</p> <p>The media format specified in <code>MediaFormat</code> doesn't match the format of the input file. Check the media format of your media file and correct the specified value.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code>.</p> <p>The sample rate specified in <code>MediaSampleRateHertz</code> isn't valid. The sample rate must be between 8,000 and 48,000 hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code>.</p> <p>The sample rate specified in <code>MediaSampleRateHertz</code> doesn't match the sample rate detected in your input media file. Check the sample rate of your media file and correct the specified value.</p> </li> <li> <p> <code>Invalid file size: file size too large</code>.</p> <p>The size of your media file is larger than what Amazon Transcribe can process. For more information, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and quotas</a>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code>.</p> <p>Your audio contains more channels than Amazon Transcribe is able to process. For more information, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and quotas</a>.</p> </li> </ul>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) you included in your request.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>The confidence score associated with the language identified in your media file.</p> <p>Confidence scores are values between 0 and 1; a larger value indicates a higher probability that the identified language correctly matches the language spoken in your media.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"CallAnalyticsJobSettings\",\
          \"documentation\":\"<p>Provides information on any additional settings that were included in your request. Additional settings include content redaction and language identification settings.</p>\"\
        },\
        \"ChannelDefinitions\":{\
          \"shape\":\"ChannelDefinitions\",\
          \"documentation\":\"<p>Indicates which speaker is on which channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides detailed information about a Call Analytics job.</p> <p>To view the job's status, refer to <code>CallAnalyticsJobStatus</code>. If the status is <code>COMPLETED</code>, the job is finished. You can find your completed transcript at the URI specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p> <p>If you enabled personally identifiable information (PII) redaction, the redacted transcript appears at the location specified in <code>RedactedTranscriptFileUri</code>.</p> <p>If you chose to redact the audio in your media file, you can find your redacted media file at the location specified in the <code>RedactedMediaFileUri</code> field of your response.</p>\"\
    },\
    \"CallAnalyticsJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"CallAnalyticsJobSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you want to include in your Call Analytics transcription request. Custom vocabulary names are case sensitive.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the custom vocabulary filter you want to include in your Call Analytics transcription request. Custom vocabulary filter names are case sensitive.</p> <p>Note that if you include <code>VocabularyFilterName</code> in your request, you must also include <code>VocabularyFilterMethod</code>.</p>\"\
        },\
        \"VocabularyFilterMethod\":{\
          \"shape\":\"VocabularyFilterMethod\",\
          \"documentation\":\"<p>Specify how you want your custom vocabulary filter applied to your transcript.</p> <p>To replace words with <code>***</code>, choose <code>mask</code>.</p> <p>To delete words, choose <code>remove</code>.</p> <p>To flag words without changing them, choose <code>tag</code>.</p>\"\
        },\
        \"LanguageModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model you want to use when processing your Call Analytics job. Note that custom language model names are case sensitive.</p> <p>The language of the specified custom language model must match the language code that you specify in your transcription request. If the languages don't match, the custom language model isn't applied. There are no errors or warnings associated with a language mismatch.</p>\"\
        },\
        \"ContentRedaction\":{\"shape\":\"ContentRedaction\"},\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>You can specify two or more language codes that represent the languages you think may be present in your media. Including more than five is not recommended. If you're unsure what languages are present, do not include this parameter.</p> <p>Including language options can improve the accuracy of language identification.</p> <p>For a list of languages supported with Call Analytics, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table.</p> <p>To transcribe speech in Modern Standard Arabic (<code>ar-SA</code>), your media file must be encoded at a sample rate of 16,000 Hz or higher.</p>\"\
        },\
        \"LanguageIdSettings\":{\
          \"shape\":\"LanguageIdSettingsMap\",\
          \"documentation\":\"<p>If using automatic language identification in your request and you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter, include <code>LanguageIdSettings</code> with the relevant sub-parameters (<code>VocabularyName</code>, <code>LanguageModelName</code>, and <code>VocabularyFilterName</code>).</p> <p> <code>LanguageIdSettings</code> supports two to five language codes. Each language code you include can have an associated custom language model, custom vocabulary, and custom vocabulary filter. The language codes that you specify must match the languages of the associated custom language models, custom vocabularies, and custom vocabulary filters.</p> <p>It's recommended that you include <code>LanguageOptions</code> when using <code>LanguageIdSettings</code> to ensure that the correct language dialect is identified. For example, if you specify a custom vocabulary that is in <code>en-US</code> but Amazon Transcribe determines that the language spoken in your media is <code>en-AU</code>, your custom vocabulary <i>is not</i> applied to your transcription. If you include <code>LanguageOptions</code> and include <code>en-US</code> as the only English language dialect, your custom vocabulary <i>is</i> applied to your transcription.</p> <p>If you want to include a custom language model, custom vocabulary, or custom vocabulary filter with your request but <b>do not</b> want to use automatic language identification, use instead the <code/> parameter with the <code>LanguageModelName</code>, <code>VocabularyName</code>, or <code>VocabularyFilterName</code> sub-parameters.</p> <p>For a list of languages supported with Call Analytics, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages and language-specific features</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides additional optional settings for your request, including content redaction, automatic language identification; allows you to apply custom language models, custom vocabulary filters, and custom vocabularies.</p>\"\
    },\
    \"CallAnalyticsJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUED\",\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"CallAnalyticsJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CallAnalyticsJobSummary\"}\
    },\
    \"CallAnalyticsJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the Call Analytics job. Job names are case sensitive and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified Call Analytics job request was made.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time your Call Analytics job began processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified Call Analytics job finished processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code used to create your Call Analytics transcription.</p>\"\
        },\
        \"CallAnalyticsJobStatus\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>Provides the status of your Call Analytics job.</p> <p>If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code> (or <code>RedactedTranscriptFileUri</code>, if you requested transcript redaction). If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>CallAnalyticsJobStatus</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the Call Analytics job failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides detailed information about a specific Call Analytics job.</p>\"\
    },\
    \"CategoryName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"CategoryProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the Call Analytics category. Category names are case sensitive and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>The rules used to define a Call Analytics category. Each category can have between 1 and 20 rules.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified Call Analytics category was created.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"LastUpdateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified Call Analytics category was last updated.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-05T12:45:32.691000-07:00</code> represents 12:45 PM UTC-7 on May 5, 2022.</p>\"\
        },\
        \"InputType\":{\
          \"shape\":\"InputType\",\
          \"documentation\":\"<p>The input type associated with the specified category. <code>POST_CALL</code> refers to a category that is applied to batch transcriptions; <code>REAL_TIME</code> refers to a category that is applied to streaming transcriptions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides you with the properties of the Call Analytics category you specified in your request. This includes the list of rules that define the specified category.</p>\"\
    },\
    \"CategoryPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CategoryProperties\"}\
    },\
    \"ChannelDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelId\":{\
          \"shape\":\"ChannelId\",\
          \"documentation\":\"<p>Specify the audio channel you want to define.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>Specify the speaker you want to define. Omitting this parameter is equivalent to specifying both participants.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Makes it possible to specify which speaker is on which channel. For example, if your agent is the first participant to speak, you would set <code>ChannelId</code> to <code>0</code> (to indicate the first channel) and <code>ParticipantRole</code> to <code>AGENT</code> (to indicate that it's the agent speaking).</p>\"\
    },\
    \"ChannelDefinitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelDefinition\"},\
      \"max\":2,\
      \"min\":2\
    },\
    \"ChannelId\":{\
      \"type\":\"integer\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>A resource already exists with this name. Resource names must be unique within an Amazon Web Services account.</p>\",\
      \"exception\":true\
    },\
    \"ContentRedaction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RedactionType\",\
        \"RedactionOutput\"\
      ],\
      \"members\":{\
        \"RedactionType\":{\
          \"shape\":\"RedactionType\",\
          \"documentation\":\"<p>Specify the category of information you want to redact; <code>PII</code> (personally identifiable information) is the only valid value. You can use <code>PiiEntityTypes</code> to choose which types of PII you want to redact.</p>\"\
        },\
        \"RedactionOutput\":{\
          \"shape\":\"RedactionOutput\",\
          \"documentation\":\"<p>Specify if you want only a redacted transcript, or if you want a redacted and an unredacted transcript.</p> <p>When you choose <code>redacted</code> Amazon Transcribe creates only a redacted transcript.</p> <p>When you choose <code>redacted_and_unredacted</code> Amazon Transcribe creates a redacted and an unredacted transcript (as two separate files).</p>\"\
        },\
        \"PiiEntityTypes\":{\
          \"shape\":\"PiiEntityTypes\",\
          \"documentation\":\"<p>Specify which types of personally identifiable information (PII) you want to redact in your transcript. You can include as many types as you'd like, or you can select <code>ALL</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Makes it possible to redact or flag specified personally identifiable information (PII) in your transcript. If you use <code>ContentRedaction</code>, you must also include the sub-parameters: <code>PiiEntityTypes</code>, <code>RedactionOutput</code>, and <code>RedactionType</code>.</p>\"\
    },\
    \"CreateCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CategoryName\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your Call Analytics category. It's helpful to use a detailed naming system that will make sense to you in the future. For example, it's better to use <code>sentiment-positive-last30seconds</code> for a category over a generic name like <code>test-category</code>.</p> <p>Category names are case sensitive.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>Rules define a Call Analytics category. When creating a new category, you must create between 1 and 20 rules for that category. For each rule, you specify a filter you want applied to the attributes of a call. For example, you can choose a sentiment filter that detects if a customer's sentiment was positive during the last 30 seconds of the call.</p>\"\
        },\
        \"InputType\":{\
          \"shape\":\"InputType\",\
          \"documentation\":\"<p>Choose whether you want to create a real-time or a post-call category for your Call Analytics transcription.</p> <p>Specifying <code>POST_CALL</code> assigns your category to post-call transcriptions; categories with this input type cannot be applied to streaming (real-time) transcriptions.</p> <p>Specifying <code>REAL_TIME</code> assigns your category to streaming transcriptions; categories with this input type cannot be applied to post-call transcriptions.</p> <p>If you do not include <code>InputType</code>, your category is created as a post-call category by default.</p>\"\
        }\
      }\
    },\
    \"CreateCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryProperties\":{\
          \"shape\":\"CategoryProperties\",\
          \"documentation\":\"<p>Provides you with the properties of your new category, including its associated rules.</p>\"\
        }\
      }\
    },\
    \"CreateLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LanguageCode\",\
        \"BaseModelName\",\
        \"ModelName\",\
        \"InputDataConfig\"\
      ],\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of your model. Each custom language model must contain terms in only one language, and the language you select for your custom language model must match the language of your training and tuning data.</p> <p>For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table. Note that US English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p> <p>A custom language model can only be used to transcribe files in the same language as the model. For example, if you create a custom language model using US English (<code>en-US</code>), you can only apply this model to files that contain English audio.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model, used to create your custom language model. Amazon Transcribe offers two options for base models: Wideband and Narrowband.</p> <p>If the audio you want to transcribe has a sample rate of 16,000 Hz or greater, choose <code>WideBand</code>. To transcribe audio with a sample rate less than 16,000 Hz, choose <code>NarrowBand</code>.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your custom language model.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom language model with the same name as an existing custom language model, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Contains the Amazon S3 location of the training data you want to use to create a new custom language model, and permissions to access this location.</p> <p>When using <code>InputDataConfig</code>, you must include these sub-parameters: <code>S3Uri</code>, which is the Amazon S3 location of your training data, and <code>DataAccessRoleArn</code>, which is the Amazon Resource Name (ARN) of the role that has permission to access your specified Amazon S3 location. You can optionally include <code>TuningDataS3Uri</code>, which is the Amazon S3 location of your tuning data. If you specify different Amazon S3 locations for training and tuning data, the ARN you use must have permissions to access both locations.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to a new custom language model at the time you create this new model.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
        }\
      }\
    },\
    \"CreateLanguageModelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom language model.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model, you specified when creating your custom language model.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of your custom language model.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Lists your data access role ARN (Amazon Resource Name) and the Amazon S3 locations you provided for your training (<code>S3Uri</code>) and tuning (<code>TuningDataS3Uri</code>) data.</p>\"\
        },\
        \"ModelStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of your custom language model. When the status displays as <code>COMPLETED</code>, your model is ready to use.</p>\"\
        }\
      }\
    },\
    \"CreateMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"VocabularyFileUri\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your new custom medical vocabulary.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom medical vocabulary with the same name as an existing custom medical vocabulary, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in your custom vocabulary. US English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location (URI) of the text file that contains your custom medical vocabulary. The URI must be in the same Amazon Web Services Region as the resource you're calling.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code> </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to a new custom medical vocabulary at the time you create this new custom vocabulary.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
        }\
      }\
    },\
    \"CreateMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name you chose for your custom medical vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom medical vocabulary. US English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom medical vocabulary. If the state is <code>READY</code>, you can use the custom vocabulary in a <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time you created your custom medical vocabulary.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>VocabularyState</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the medical transcription job request failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyFilterName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your new custom vocabulary filter.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom vocabulary filter with the same name as an existing custom vocabulary filter, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in your vocabulary filter. Each custom vocabulary filter must contain terms in only one language.</p> <p>A custom vocabulary filter can only be used to transcribe files in the same language as the filter. For example, if you create a custom vocabulary filter using US English (<code>en-US</code>), you can only apply this filter to files that contain English audio.</p> <p>For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>Use this parameter if you want to create your custom vocabulary filter by including all desired terms, as comma-separated values, within your request. The other option for creating your vocabulary filter is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the <code>VocabularyFilterFileUri</code> parameter.</p> <p>Note that if you include <code>Words</code> in your request, you cannot use <code>VocabularyFilterFileUri</code>; you must choose one or the other.</p> <p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the text file that contains your custom vocabulary filter terms. The URI must be located in the same Amazon Web Services Region as the resource you're calling.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt</code> </p> <p>Note that if you include <code>VocabularyFilterFileUri</code> in your request, you cannot use <code>Words</code>; you must choose one or the other.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to a new custom vocabulary filter at the time you create this new vocabulary filter.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary filter). If the role that you specify doesnât have the appropriate permissions to access the specified Amazon S3 location, your request fails.</p> <p>IAM role ARNs have the format <code>arn:partition:iam::account:role/role-name-with-path</code>. For example: <code>arn:aws:iam::111122223333:role/Admin</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a>.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name you chose for your custom vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time you created your custom vocabulary filter.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your new custom vocabulary.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new custom vocabulary with the same name as an existing custom vocabulary, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in your custom vocabulary. Each custom vocabulary must contain terms in only one language.</p> <p>A custom vocabulary can only be used to transcribe files in the same language as the custom vocabulary. For example, if you create a custom vocabulary using US English (<code>en-US</code>), you can only apply this custom vocabulary to files that contain English audio.</p> <p>For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>Use this parameter if you want to create your custom vocabulary by including all desired terms, as comma-separated values, within your request. The other option for creating your custom vocabulary is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the <code>VocabularyFileUri</code> parameter.</p> <p>Note that if you include <code>Phrases</code> in your request, you cannot use <code>VocabularyFileUri</code>; you must choose one or the other.</p> <p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the text file that contains your custom vocabulary. The URI must be located in the same Amazon Web Services Region as the resource you're calling.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code> </p> <p>Note that if you include <code>VocabularyFileUri</code> in your request, you cannot use the <code>Phrases</code> flag; you must choose one or the other.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to a new custom vocabulary at the time you create this new custom vocabulary.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary). If the role that you specify doesnât have the appropriate permissions to access the specified Amazon S3 location, your request fails.</p> <p>IAM role ARNs have the format <code>arn:partition:iam::account:role/role-name-with-path</code>. For example: <code>arn:aws:iam::111122223333:role/Admin</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a>.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name you chose for your custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom vocabulary.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom vocabulary. If the state is <code>READY</code>, you can use the custom vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time you created your custom vocabulary.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>VocabularyState</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the custom vocabulary request failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        }\
      }\
    },\
    \"DataAccessRoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"^arn:(aws|aws-cn|aws-us-gov|aws-iso-{0,1}[a-z]{0,1}):iam::[0-9]{0,63}:role/[A-Za-z0-9:_/+=,@.-]{0,1024}$\"\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CategoryName\"],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the Call Analytics category you want to delete. Category names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteCallAnalyticsJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CallAnalyticsJobName\"],\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the Call Analytics job you want to delete. Job names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteCallAnalyticsJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model you want to delete. Model names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MedicalTranscriptionJobName\"],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job you want to delete. Job names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom medical vocabulary you want to delete. Custom medical vocabulary names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job you want to delete. Job names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the custom vocabulary filter you want to delete. Custom vocabulary filter names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you want to delete. Custom vocabulary names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DescribeLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model you want information about. Model names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"DescribeLanguageModelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageModel\":{\
          \"shape\":\"LanguageModel\",\
          \"documentation\":\"<p>Provides information about the specified custom language model.</p> <p>This parameter also shows if the base language model you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.</p> <p>If you tried to create a new custom language model and the request wasn't successful, you can use this <code>DescribeLanguageModel</code> to help identify the reason for this failure.</p>\"\
        }\
      }\
    },\
    \"DurationInSeconds\":{\"type\":\"float\"},\
    \"FailureReason\":{\"type\":\"string\"},\
    \"GetCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CategoryName\"],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the Call Analytics category you want information about. Category names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryProperties\":{\
          \"shape\":\"CategoryProperties\",\
          \"documentation\":\"<p>Provides you with the properties of the Call Analytics category you specified in your <code>GetCallAnalyticsCategory</code> request.</p>\"\
        }\
      }\
    },\
    \"GetCallAnalyticsJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CallAnalyticsJobName\"],\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the Call Analytics job you want information about. Job names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetCallAnalyticsJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJob\":{\
          \"shape\":\"CallAnalyticsJob\",\
          \"documentation\":\"<p>Provides detailed information about the specified Call Analytics job, including job status and, if applicable, failure reason.</p>\"\
        }\
      }\
    },\
    \"GetMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MedicalTranscriptionJobName\"],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job you want information about. Job names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetMedicalTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJob\":{\
          \"shape\":\"MedicalTranscriptionJob\",\
          \"documentation\":\"<p>Provides detailed information about the specified medical transcription job, including job status and, if applicable, failure reason.</p>\"\
        }\
      }\
    },\
    \"GetMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom medical vocabulary you want information about. Custom medical vocabulary names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom medical vocabulary you requested information about.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom medical vocabulary. US English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom medical vocabulary. If the state is <code>READY</code>, you can use the custom vocabulary in a <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom medical vocabulary was last modified.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>VocabularyState</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the custom medical vocabulary request failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the specified custom medical vocabulary is stored; use this URI to view or download the custom vocabulary.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job you want information about. Job names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>Provides detailed information about the specified transcription job, including job status and, if applicable, failure reason.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the custom vocabulary filter you want information about. Custom vocabulary filter names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the custom vocabulary filter you requested information about.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom vocabulary filter was last modified.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location where the custom vocabulary filter is stored; use this URI to view or download the custom vocabulary filter.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you want information about. Custom vocabulary names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you requested information about.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom vocabulary.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom vocabulary. If the state is <code>READY</code>, you can use the custom vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom vocabulary was last modified.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>VocabularyState</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the custom vocabulary request failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the custom vocabulary is stored; use this URI to view or download the custom vocabulary.</p>\"\
        }\
      }\
    },\
    \"IdentifiedLanguageScore\":{\"type\":\"float\"},\
    \"InputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location (URI) of the text files you want to use to train your custom language model.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-model-training-data/</code> </p>\"\
        },\
        \"TuningDataS3Uri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location (URI) of the text files you want to use to tune your custom language model.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-model-tuning-data/</code> </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files. If the role that you specify doesnât have the appropriate permissions to access the specified Amazon S3 location, your request fails.</p> <p>IAM role ARNs have the format <code>arn:partition:iam::account:role/role-name-with-path</code>. For example: <code>arn:aws:iam::111122223333:role/Admin</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the Amazon S3 location of the training data you want to use to create a new custom language model, and permissions to access this location.</p> <p>When using <code>InputDataConfig</code>, you must include these sub-parameters: <code>S3Uri</code> and <code>DataAccessRoleArn</code>. You can optionally include <code>TuningDataS3Uri</code>.</p>\"\
    },\
    \"InputType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"REAL_TIME\",\
        \"POST_CALL\"\
      ]\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There was an internal error. Check the error message, correct the issue, and try your request again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InterruptionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Threshold\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>Specify the duration of the interruptions in milliseconds. For example, you can flag speech that contains more than 10,000 milliseconds of interruptions.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>Specify the interrupter that you want to flag. Omitting this parameter is equivalent to specifying both participants.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for an interruption. See for more detail.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for an interruption. See for more detail.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to <code>TRUE</code> to flag speech that does not contain interruptions. Set to <code>FALSE</code> to flag speech that contains interruptions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Flag the presence or absence of interruptions in your Call Analytics transcription output.</p> <p>Rules using <code>InterruptionFilter</code> are designed to match:</p> <ul> <li> <p>Instances where an agent interrupts a customer</p> </li> <li> <p>Instances where a customer interrupts an agent</p> </li> <li> <p>Either participant interrupting the other</p> </li> <li> <p>A lack of interruptions</p> </li> </ul> <p>See <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch\\\">Rule criteria for post-call categories</a> for usage examples.</p>\"\
    },\
    \"JobExecutionSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowDeferredExecution\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Makes it possible to enable job queuing when your concurrent request limit is exceeded. When <code>AllowDeferredExecution</code> is set to <code>true</code>, transcription job requests are placed in a queue until the number of jobs falls below the concurrent request limit. If <code>AllowDeferredExecution</code> is set to <code>false</code> and the number of transcription job requests exceed the concurrent request limit, you get a <code>LimitExceededException</code> error.</p> <p>If you include <code>AllowDeferredExecution</code> in your request, you must also include <code>DataAccessRoleArn</code>.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files. If the role that you specify doesnât have the appropriate permissions to access the specified Amazon S3 location, your request fails.</p> <p>IAM role ARNs have the format <code>arn:partition:iam::account:role/role-name-with-path</code>. For example: <code>arn:aws:iam::111122223333:role/Admin</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a>.</p> <p>Note that if you include <code>DataAccessRoleArn</code> in your request, you must also include <code>AllowDeferredExecution</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Makes it possible to control how your transcription job is processed. Currently, the only <code>JobExecutionSettings</code> modification you can choose is enabling job queueing using the <code>AllowDeferredExecution</code> sub-parameter.</p> <p>If you include <code>JobExecutionSettings</code> in your request, you must also include the sub-parameters: <code>AllowDeferredExecution</code> and <code>DataAccessRoleArn</code>.</p>\"\
    },\
    \"KMSEncryptionContextMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"NonEmptyString\"},\
      \"value\":{\"shape\":\"NonEmptyString\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"KMSKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$\"\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"af-ZA\",\
        \"ar-AE\",\
        \"ar-SA\",\
        \"da-DK\",\
        \"de-CH\",\
        \"de-DE\",\
        \"en-AB\",\
        \"en-AU\",\
        \"en-GB\",\
        \"en-IE\",\
        \"en-IN\",\
        \"en-US\",\
        \"en-WL\",\
        \"es-ES\",\
        \"es-US\",\
        \"fa-IR\",\
        \"fr-CA\",\
        \"fr-FR\",\
        \"he-IL\",\
        \"hi-IN\",\
        \"id-ID\",\
        \"it-IT\",\
        \"ja-JP\",\
        \"ko-KR\",\
        \"ms-MY\",\
        \"nl-NL\",\
        \"pt-BR\",\
        \"pt-PT\",\
        \"ru-RU\",\
        \"ta-IN\",\
        \"te-IN\",\
        \"tr-TR\",\
        \"zh-CN\",\
        \"zh-TW\",\
        \"th-TH\",\
        \"en-ZA\",\
        \"en-NZ\",\
        \"vi-VN\",\
        \"sv-SE\"\
      ]\
    },\
    \"LanguageCodeItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>Provides the language code for each language identified in your media.</p>\"\
        },\
        \"DurationInSeconds\":{\
          \"shape\":\"DurationInSeconds\",\
          \"documentation\":\"<p>Provides the total time, in seconds, each identified language is spoken in your media.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information on the speech contained in a discreet utterance when multi-language identification is enabled in your request. This utterance represents a block of speech consisting of one language, preceded or followed by a block of speech in a different language.</p>\"\
    },\
    \"LanguageCodeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LanguageCodeItem\"}\
    },\
    \"LanguageIdSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you want to use when processing your transcription job. Custom vocabulary names are case sensitive.</p> <p>The language of the specified custom vocabulary must match the language code that you specify in your transcription request. If the languages don't match, the custom vocabulary isn't applied. There are no errors or warnings associated with a language mismatch.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the custom vocabulary filter you want to use when processing your transcription job. Custom vocabulary filter names are case sensitive.</p> <p>The language of the specified custom vocabulary filter must match the language code that you specify in your transcription request. If the languages don't match, the custom vocabulary filter isn't applied. There are no errors or warnings associated with a language mismatch.</p> <p>Note that if you include <code>VocabularyFilterName</code> in your request, you must also include <code>VocabularyFilterMethod</code>.</p>\"\
        },\
        \"LanguageModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model you want to use when processing your transcription job. Note that custom language model names are case sensitive.</p> <p>The language of the specified custom language model must match the language code that you specify in your transcription request. If the languages don't match, the custom language model isn't applied. There are no errors or warnings associated with a language mismatch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If using automatic language identification in your request and you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter, include <code>LanguageIdSettings</code> with the relevant sub-parameters (<code>VocabularyName</code>, <code>LanguageModelName</code>, and <code>VocabularyFilterName</code>). Note that multi-language identification (<code>IdentifyMultipleLanguages</code>) doesn't support custom language models.</p> <p> <code>LanguageIdSettings</code> supports two to five language codes. Each language code you include can have an associated custom language model, custom vocabulary, and custom vocabulary filter. The language codes that you specify must match the languages of the associated custom language models, custom vocabularies, and custom vocabulary filters.</p> <p>It's recommended that you include <code>LanguageOptions</code> when using <code>LanguageIdSettings</code> to ensure that the correct language dialect is identified. For example, if you specify a custom vocabulary that is in <code>en-US</code> but Amazon Transcribe determines that the language spoken in your media is <code>en-AU</code>, your custom vocabulary <i>is not</i> applied to your transcription. If you include <code>LanguageOptions</code> and include <code>en-US</code> as the only English language dialect, your custom vocabulary <i>is</i> applied to your transcription.</p> <p>If you want to include a custom language model with your request but <b>do not</b> want to use automatic language identification, use instead the <code/> parameter with the <code>LanguageModelName</code> sub-parameter. If you want to include a custom vocabulary or a custom vocabulary filter (or both) with your request but <b>do not</b> want to use automatic language identification, use instead the <code/> parameter with the <code>VocabularyName</code> or <code>VocabularyFilterName</code> (or both) sub-parameter.</p>\"\
    },\
    \"LanguageIdSettingsMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"LanguageCode\"},\
      \"value\":{\"shape\":\"LanguageIdSettings\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"LanguageModel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your custom language model.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom language model was created.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom language model was last modified.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language code used to create your custom language model. Each custom language model must contain terms in only one language, and the language you select for your custom language model must match the language of your training and tuning data.</p> <p>For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table. Note that U.S. English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model, used to create your custom language model.</p>\"\
        },\
        \"ModelStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of the specified custom language model. When the status displays as <code>COMPLETED</code> the model is ready for use.</p>\"\
        },\
        \"UpgradeAvailability\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Shows if a more current base model is available for use with the specified custom language model.</p> <p>If <code>false</code>, your custom language model is using the most up-to-date base model.</p> <p>If <code>true</code>, there is a newer base model available than the one your language model is using.</p> <p>Note that to update a base model, you must recreate the custom language model using the new base model. Base model upgrades for existing custom language models are not supported.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>ModelStatus</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the custom language model request failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The Amazon S3 location of the input files used to train and tune your custom language model, in addition to the data access role ARN (Amazon Resource Name) that has permissions to access these data.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom language model, including:</p> <ul> <li> <p>The base model name</p> </li> <li> <p>When the model was created</p> </li> <li> <p>The location of the files used to train the model</p> </li> <li> <p>When the model was last modified</p> </li> <li> <p>The name you chose for the model</p> </li> <li> <p>The model's language</p> </li> <li> <p>The model's processing state</p> </li> <li> <p>Any available upgrades for the base model</p> </li> </ul>\"\
    },\
    \"LanguageOptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LanguageCode\"},\
      \"min\":1\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>You've either sent too many requests or your input file is too long. Wait before retrying your request, or use a smaller file and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"ListCallAnalyticsCategoriesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListCallAnalyticsCategories</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of Call Analytics categories to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListCallAnalyticsCategoriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"Categories\":{\
          \"shape\":\"CategoryPropertiesList\",\
          \"documentation\":\"<p>Provides detailed information about your Call Analytics categories, including all the rules associated with each category.</p>\"\
        }\
      }\
    },\
    \"ListCallAnalyticsJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>Returns only Call Analytics jobs with the specified status. Jobs are ordered by creation date, with the newest job first. If you don't include <code>Status</code>, all Call Analytics jobs are returned.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>Returns only the Call Analytics jobs that contain the specified string. The search is not case sensitive.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListCallAnalyticsJobs</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of Call Analytics jobs to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListCallAnalyticsJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>Lists all Call Analytics jobs that have the status specified in your request. Jobs are ordered by creation date, with the newest job first.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"CallAnalyticsJobSummaries\":{\
          \"shape\":\"CallAnalyticsJobSummaries\",\
          \"documentation\":\"<p>Provides a summary of information about each result.</p>\"\
        }\
      }\
    },\
    \"ListLanguageModelsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusEquals\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>Returns only custom language models with the specified status. Language models are ordered by creation date, with the newest model first. If you don't include <code>StatusEquals</code>, all custom language models are returned.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>Returns only the custom language models that contain the specified string. The search is not case sensitive.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListLanguageModels</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of custom language models to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListLanguageModelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"Models\":{\
          \"shape\":\"Models\",\
          \"documentation\":\"<p>Provides information about the custom language models that match the criteria specified in your request.</p>\"\
        }\
      }\
    },\
    \"ListMedicalTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Returns only medical transcription jobs with the specified status. Jobs are ordered by creation date, with the newest job first. If you don't include <code>Status</code>, all medical transcription jobs are returned.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>Returns only the medical transcription jobs that contain the specified string. The search is not case sensitive.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListMedicalTranscriptionJobs</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of medical transcription jobs to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListMedicalTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Lists all medical transcription jobs that have the status specified in your request. Jobs are ordered by creation date, with the newest job first.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MedicalTranscriptionJobSummaries\":{\
          \"shape\":\"MedicalTranscriptionJobSummaries\",\
          \"documentation\":\"<p>Provides a summary of information about each result.</p>\"\
        }\
      }\
    },\
    \"ListMedicalVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListMedicalVocabularies</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of custom medical vocabularies to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>Returns only custom medical vocabularies with the specified state. Custom vocabularies are ordered by creation date, with the newest vocabulary first. If you don't include <code>StateEquals</code>, all custom medical vocabularies are returned.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>Returns only the custom medical vocabularies that contain the specified string. The search is not case sensitive.</p>\"\
        }\
      }\
    },\
    \"ListMedicalVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>Lists all custom medical vocabularies that have the status specified in your request. Custom vocabularies are ordered by creation date, with the newest vocabulary first.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>Provides information about the custom medical vocabularies that match the criteria specified in your request.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>Returns a list of all tags associated with the specified Amazon Resource Name (ARN). ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.</p> <p>For example, <code>arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name</code>.</p> <p>Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) specified in your request.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Lists all tags associated with the given transcription job, vocabulary, model, or resource.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest job first. If you don't include <code>Status</code>, all transcription jobs are returned.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>Returns only the transcription jobs that contain the specified string. The search is not case sensitive.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListTranscriptionJobs</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of transcription jobs to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Lists all transcription jobs that have the status specified in your request. Jobs are ordered by creation date, with the newest job first.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"TranscriptionJobSummaries\":{\
          \"shape\":\"TranscriptionJobSummaries\",\
          \"documentation\":\"<p>Provides a summary of information about each result.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListVocabularies</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of custom vocabularies to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>Returns only custom vocabularies with the specified state. Vocabularies are ordered by creation date, with the newest vocabulary first. If you don't include <code>StateEquals</code>, all custom medical vocabularies are returned.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>Returns only the custom vocabularies that contain the specified string. The search is not case sensitive.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>Lists all custom vocabularies that have the status specified in your request. Vocabularies are ordered by creation date, with the newest vocabulary first.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>Provides information about the custom vocabularies that match the criteria specified in your request.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If your <code>ListVocabularyFilters</code> request returns more results than can be displayed, <code>NextToken</code> is displayed in the response with an associated string. To get the next page of results, copy this string and repeat your request, including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of custom vocabulary filters to return in each page of results. If there are fewer results than the value that you specify, only the actual results are returned. If you don't specify a value, a default of 5 is used.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>Returns only the custom vocabulary filters that contain the specified string. The search is not case sensitive.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If <code>NextToken</code> is present in your response, it indicates that not all results are displayed. To view the next set of results, copy the string associated with the <code>NextToken</code> parameter in your results output, then run your request again including <code>NextToken</code> with the value of the copied string. Repeat as needed to view all your results.</p>\"\
        },\
        \"VocabularyFilters\":{\
          \"shape\":\"VocabularyFilters\",\
          \"documentation\":\"<p>Provides information about the custom vocabulary filters that match the criteria specified in your request.</p>\"\
        }\
      }\
    },\
    \"MaxAlternatives\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxSpeakers\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"Media\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the media file you want to transcribe. For example:</p> <ul> <li> <p> <code>s3://DOC-EXAMPLE-BUCKET/my-media-file.flac</code> </p> </li> <li> <p> <code>s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac</code> </p> </li> </ul> <p>Note that the Amazon S3 bucket that contains your input media must be located in the same Amazon Web Services Region where you're making your transcription request.</p>\"\
        },\
        \"RedactedMediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the media file you want to redact. For example:</p> <ul> <li> <p> <code>s3://DOC-EXAMPLE-BUCKET/my-media-file.flac</code> </p> </li> <li> <p> <code>s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac</code> </p> </li> </ul> <p>Note that the Amazon S3 bucket that contains your input media must be located in the same Amazon Web Services Region where you're making your transcription request.</p> <important> <p> <code>RedactedMediaFileUri</code> produces a redacted audio file in addition to a redacted transcript. It is only supported for Call Analytics (<code>StartCallAnalyticsJob</code>) transcription requests.</p> </important>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the Amazon S3 location of the media file you want to use in your request.</p> <p>For information on supported media formats, refer to the <a href=\\\"https://docs.aws.amazon.com/APIReference/API_StartTranscriptionJob.html#transcribe-StartTranscriptionJob-request-MediaFormat\\\">MediaFormat</a> parameter or the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio\\\">Media formats</a> section in the Amazon S3 Developer Guide.</p>\"\
    },\
    \"MediaFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"mp3\",\
        \"mp4\",\
        \"wav\",\
        \"flac\",\
        \"ogg\",\
        \"amr\",\
        \"webm\",\
        \"m4a\"\
      ]\
    },\
    \"MediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":8000\
    },\
    \"MedicalContentIdentificationType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PHI\"]\
    },\
    \"MedicalMediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":16000\
    },\
    \"MedicalTranscript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of your transcript. You can use this URI to access or download your transcript.</p> <p>Note that this is the Amazon S3 location you specified in your request using the <code>OutputBucketName</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides you with the Amazon S3 URI you can use to access your transcript.</p>\"\
    },\
    \"MedicalTranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Provides the status of the specified medical transcription job.</p> <p>If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code used to create your medical transcription job. US English (<code>en-US</code>) is the only supported language for medical transcriptions.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MedicalMediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in hertz, of the audio track in your input media file.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"Transcript\":{\
          \"shape\":\"MedicalTranscript\",\
          \"documentation\":\"<p>Provides you with the Amazon S3 URI you can use to access your transcript.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified medical transcription job began processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified medical transcription job request was made.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified medical transcription job finished processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>TranscriptionJobStatus</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the transcription job request failed.</p> <p>The <code>FailureReason</code> field contains one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code>.</p> <p>The media format specified in <code>MediaFormat</code> isn't valid. Refer to <b>MediaFormat</b> for a list of supported formats.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code>.</p> <p>The media format specified in <code>MediaFormat</code> doesn't match the format of the input file. Check the media format of your media file and correct the specified value.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code>.</p> <p>The sample rate specified in <code>MediaSampleRateHertz</code> isn't valid. The sample rate must be between 16,000 and 48,000 hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code>.</p> <p>The sample rate specified in <code>MediaSampleRateHertz</code> doesn't match the sample rate detected in your input media file. Check the sample rate of your media file and correct the specified value.</p> </li> <li> <p> <code>Invalid file size: file size too large</code>.</p> <p>The size of your media file is larger than what Amazon Transcribe can process. For more information, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and quotas</a>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code>.</p> <p>Your audio contains more channels than Amazon Transcribe is able to process. For more information, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and quotas</a>.</p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"MedicalTranscriptionSetting\",\
          \"documentation\":\"<p>Provides information on any additional settings that were included in your request. Additional settings include channel identification, alternative transcriptions, speaker partitioning, custom vocabularies, and custom vocabulary filters.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>Indicates whether content identification was enabled for your transcription request.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>Describes the medical specialty represented in your media.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>Indicates whether the input media is a dictation or a conversation, as specified in the <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags, each in the form of a key:value pair, assigned to the specified medical transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides detailed information about a medical transcription job.</p> <p>To view the status of the specified medical transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p>\"\
    },\
    \"MedicalTranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MedicalTranscriptionJobSummary\"}\
    },\
    \"MedicalTranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified medical transcription job request was made.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time your medical transcription job began processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified medical transcription job finished processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code used to create your medical transcription. US English (<code>en-US</code>) is the only supported language for medical transcriptions.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Provides the status of your medical transcription job.</p> <p>If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>TranscriptionJobStatus</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the transcription job failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates where the specified medical transcription output is stored.</p> <p>If the value is <code>CUSTOMER_BUCKET</code>, the location is the Amazon S3 bucket you specified using the <code>OutputBucketName</code> parameter in your request. If you also included <code>OutputKey</code> in your request, your output is located in the path you specified in your request.</p> <p>If the value is <code>SERVICE_BUCKET</code>, the location is a service-managed Amazon S3 bucket. To access a transcript stored in a service-managed bucket, use the URI shown in the <code>TranscriptFileUri</code> field.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>Provides the medical specialty represented in your media.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>Labels all personal health information (PHI) identified in your transcript. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html\\\">Identifying personal health information (PHI) in a transcription</a>.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>Indicates whether the input media is a dictation or a conversation, as specified in the <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides detailed information about a specific medical transcription job.</p>\"\
    },\
    \"MedicalTranscriptionSetting\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels the speech from individual speakers in your media file.</p> <p>If you enable <code>ShowSpeakerLabels</code> in your request, you must also include <code>MaxSpeakerLabels</code>.</p> <p>You can't include <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. Including both parameters returns a <code>BadRequestException</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html\\\">Partitioning speakers (diarization)</a>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>Specify the maximum number of speakers you want to partition in your media.</p> <p>Note that if your media contains more speakers than the specified number, multiple speakers are treated as a single speaker.</p> <p>If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Enables channel identification in multi-channel audio.</p> <p>Channel identification transcribes the audio on each channel independently, then appends the output for each channel into one transcript.</p> <p>If you have multi-channel audio and do not enable channel identification, your audio is transcribed in a continuous manner and your transcript does not separate the speech by channel.</p> <p>You can't include both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. Including both parameters returns a <code>BadRequestException</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html\\\">Transcribing multi-channel audio</a>.</p>\"\
        },\
        \"ShowAlternatives\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To include alternative transcriptions within your transcription output, include <code>ShowAlternatives</code> in your transcription request.</p> <p>If you include <code>ShowAlternatives</code>, you must also include <code>MaxAlternatives</code>, which is the maximum number of alternative transcriptions you want Amazon Transcribe Medical to generate.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html\\\">Alternative transcriptions</a>.</p>\"\
        },\
        \"MaxAlternatives\":{\
          \"shape\":\"MaxAlternatives\",\
          \"documentation\":\"<p>Indicate the maximum number of alternative transcriptions you want Amazon Transcribe Medical to include in your transcript.</p> <p>If you select a number greater than the number of alternative transcriptions generated by Amazon Transcribe Medical, only the actual number of alternative transcriptions are included.</p> <p>If you include <code>MaxAlternatives</code> in your request, you must also include <code>ShowAlternatives</code> with a value of <code>true</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html\\\">Alternative transcriptions</a>.</p>\"\
        },\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you want to use when processing your medical transcription job. Custom vocabulary names are case sensitive.</p> <p>The language of the specified custom vocabulary must match the language code that you specify in your transcription request. If the languages don't match, the custom vocabulary isn't applied. There are no errors or warnings associated with a language mismatch. US English (<code>en-US</code>) is the only valid language for Amazon Transcribe Medical.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Allows additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your medical transcription job.</p>\"\
    },\
    \"ModelName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"ModelSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model you want to use when processing your transcription job. Note that custom language model names are case sensitive.</p> <p>The language of the specified custom language model must match the language code that you specify in your transcription request. If the languages don't match, the custom language model isn't applied. There are no errors or warnings associated with a language mismatch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the name of the custom language model that was included in the specified transcription job.</p> <p>Only use <code>ModelSettings</code> with the <code>LanguageModelName</code> sub-parameter if you're <b>not</b> using automatic language identification (<code/>). If using <code>LanguageIdSettings</code> in your request, this parameter contains a <code>LanguageModelName</code> sub-parameter.</p>\"\
    },\
    \"ModelStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"Models\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LanguageModel\"}\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"pattern\":\".+\"\
    },\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"NonTalkTimeFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Threshold\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>Specify the duration, in milliseconds, of the period of silence that you want to flag. For example, you can flag a silent period that lasts 30,000 milliseconds.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for a period of silence. See for more detail.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for a period of silence. See for more detail.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to <code>TRUE</code> to flag periods of speech. Set to <code>FALSE</code> to flag periods of silence</p>\"\
        }\
      },\
      \"documentation\":\"<p>Flag the presence or absence of periods of silence in your Call Analytics transcription output.</p> <p>Rules using <code>NonTalkTimeFilter</code> are designed to match:</p> <ul> <li> <p>The presence of silence at specified periods throughout the call</p> </li> <li> <p>The presence of speech at specified periods throughout the call</p> </li> </ul> <p>See <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch\\\">Rule criteria for post-call categories</a> for usage examples.</p>\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>We can't find the requested resource. Check that the specified name is correct and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"OutputBucketName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"[a-z0-9][\\\\.\\\\-a-z0-9]{1,61}[a-z0-9]\"\
    },\
    \"OutputKey\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9-_.!*'()/]{1,1024}$\"\
    },\
    \"OutputLocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CUSTOMER_BUCKET\",\
        \"SERVICE_BUCKET\"\
      ]\
    },\
    \"ParticipantRole\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AGENT\",\
        \"CUSTOMER\"\
      ]\
    },\
    \"Percentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Phrase\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\".+\"\
    },\
    \"Phrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Phrase\"}\
    },\
    \"PiiEntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BANK_ACCOUNT_NUMBER\",\
        \"BANK_ROUTING\",\
        \"CREDIT_DEBIT_NUMBER\",\
        \"CREDIT_DEBIT_CVV\",\
        \"CREDIT_DEBIT_EXPIRY\",\
        \"PIN\",\
        \"EMAIL\",\
        \"ADDRESS\",\
        \"NAME\",\
        \"PHONE\",\
        \"SSN\",\
        \"ALL\"\
      ]\
    },\
    \"PiiEntityTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntityType\"},\
      \"max\":11,\
      \"min\":0\
    },\
    \"RedactionOutput\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"redacted\",\
        \"redacted_and_unredacted\"\
      ]\
    },\
    \"RedactionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PII\"]\
    },\
    \"RelativeTimeRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The time, in percentage, when Amazon Transcribe starts searching for the specified criteria in your media file. If you include <code>StartPercentage</code> in your request, you must also include <code>EndPercentage</code>.</p>\"\
        },\
        \"EndPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The time, in percentage, when Amazon Transcribe stops searching for the specified criteria in your media file. If you include <code>EndPercentage</code> in your request, you must also include <code>StartPercentage</code>.</p>\"\
        },\
        \"First\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The time, in percentage, from the start of your media file until the specified value. Amazon Transcribe searches for your specified criteria in this time segment.</p>\"\
        },\
        \"Last\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The time, in percentage, from the specified value until the end of your media file. Amazon Transcribe searches for your specified criteria in this time segment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A time range, in percentage, between two points in your media file.</p> <p>You can use <code>StartPercentage</code> and <code>EndPercentage</code> to search a custom segment. For example, setting <code>StartPercentage</code> to 10 and <code>EndPercentage</code> to 50 only searches for your specified criteria in the audio contained between the 10 percent mark and the 50 percent mark of your media file.</p> <p>You can use also <code>First</code> to search from the start of the media file until the time that you specify. Or use <code>Last</code> to search from the time that you specify until the end of the media file. For example, setting <code>First</code> to 10 only searches for your specified criteria in the audio contained in the first 10 percent of the media file.</p> <p>If you prefer to use milliseconds instead of percentage, see .</p>\"\
    },\
    \"Rule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NonTalkTimeFilter\":{\
          \"shape\":\"NonTalkTimeFilter\",\
          \"documentation\":\"<p>Flag the presence or absence of periods of silence in your Call Analytics transcription output. Refer to for more detail.</p>\"\
        },\
        \"InterruptionFilter\":{\
          \"shape\":\"InterruptionFilter\",\
          \"documentation\":\"<p>Flag the presence or absence of interruptions in your Call Analytics transcription output. Refer to for more detail.</p>\"\
        },\
        \"TranscriptFilter\":{\
          \"shape\":\"TranscriptFilter\",\
          \"documentation\":\"<p>Flag the presence or absence of specific words or phrases in your Call Analytics transcription output. Refer to for more detail.</p>\"\
        },\
        \"SentimentFilter\":{\
          \"shape\":\"SentimentFilter\",\
          \"documentation\":\"<p>Flag the presence or absence of specific sentiments in your Call Analytics transcription output. Refer to for more detail.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A rule is a set of criteria that you can specify to flag an attribute in your Call Analytics output. Rules define a Call Analytics category.</p> <p>Rules can include these parameters: , , , and .</p> <p>To learn more about Call Analytics rules and categories, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html\\\">Creating categories for post-call transcriptions</a> and <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html\\\">Creating categories for real-time transcriptions</a>.</p> <p>To learn more about Call Analytics, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html\\\">Analyzing call center audio with Call Analytics</a>.</p>\",\
      \"union\":true\
    },\
    \"RuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Rule\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"SentimentFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\"Sentiments\"],\
      \"members\":{\
        \"Sentiments\":{\
          \"shape\":\"SentimentValueList\",\
          \"documentation\":\"<p>Specify the sentiments that you want to flag.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for the specified sentiments. See for more detail.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for the specified sentiments. See for more detail.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>Specify the participant that you want to flag. Omitting this parameter is equivalent to specifying both participants.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to <code>TRUE</code> to flag the sentiments that you didn't include in your request. Set to <code>FALSE</code> to flag the sentiments that you specified in your request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Flag the presence or absence of specific sentiments detected in your Call Analytics transcription output.</p> <p>Rules using <code>SentimentFilter</code> are designed to match:</p> <ul> <li> <p>The presence or absence of a positive sentiment felt by the customer, agent, or both at specified points in the call</p> </li> <li> <p>The presence or absence of a negative sentiment felt by the customer, agent, or both at specified points in the call</p> </li> <li> <p>The presence or absence of a neutral sentiment felt by the customer, agent, or both at specified points in the call</p> </li> <li> <p>The presence or absence of a mixed sentiment felt by the customer, the agent, or both at specified points in the call</p> </li> </ul> <p>See <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch\\\">Rule criteria for post-call categories</a> for usage examples.</p>\"\
    },\
    \"SentimentValue\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"POSITIVE\",\
        \"NEGATIVE\",\
        \"NEUTRAL\",\
        \"MIXED\"\
      ]\
    },\
    \"SentimentValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SentimentValue\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"Settings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you want to use in your transcription job request. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels the speech from individual speakers in your media file.</p> <p>If you enable <code>ShowSpeakerLabels</code> in your request, you must also include <code>MaxSpeakerLabels</code>.</p> <p>You can't include both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. Including both parameters returns a <code>BadRequestException</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html\\\">Partitioning speakers (diarization)</a>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>Specify the maximum number of speakers you want to partition in your media.</p> <p>Note that if your media contains more speakers than the specified number, multiple speakers are treated as a single speaker.</p> <p>If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Enables channel identification in multi-channel audio.</p> <p>Channel identification transcribes the audio on each channel independently, then appends the output for each channel into one transcript.</p> <p>You can't include both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. Including both parameters returns a <code>BadRequestException</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html\\\">Transcribing multi-channel audio</a>.</p>\"\
        },\
        \"ShowAlternatives\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To include alternative transcriptions within your transcription output, include <code>ShowAlternatives</code> in your transcription request.</p> <p>If you have multi-channel audio and do not enable channel identification, your audio is transcribed in a continuous manner and your transcript does not separate the speech by channel.</p> <p>If you include <code>ShowAlternatives</code>, you must also include <code>MaxAlternatives</code>, which is the maximum number of alternative transcriptions you want Amazon Transcribe to generate.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html\\\">Alternative transcriptions</a>.</p>\"\
        },\
        \"MaxAlternatives\":{\
          \"shape\":\"MaxAlternatives\",\
          \"documentation\":\"<p>Indicate the maximum number of alternative transcriptions you want Amazon Transcribe to include in your transcript.</p> <p>If you select a number greater than the number of alternative transcriptions generated by Amazon Transcribe, only the actual number of alternative transcriptions are included.</p> <p>If you include <code>MaxAlternatives</code> in your request, you must also include <code>ShowAlternatives</code> with a value of <code>true</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html\\\">Alternative transcriptions</a>.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the custom vocabulary filter you want to use in your transcription job request. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.</p> <p>Note that if you include <code>VocabularyFilterName</code> in your request, you must also include <code>VocabularyFilterMethod</code>.</p>\"\
        },\
        \"VocabularyFilterMethod\":{\
          \"shape\":\"VocabularyFilterMethod\",\
          \"documentation\":\"<p>Specify how you want your custom vocabulary filter applied to your transcript.</p> <p>To replace words with <code>***</code>, choose <code>mask</code>.</p> <p>To delete words, choose <code>remove</code>.</p> <p>To flag words without changing them, choose <code>tag</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Allows additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your transcription job.</p>\"\
    },\
    \"Specialty\":{\
      \"type\":\"string\",\
      \"enum\":[\"PRIMARYCARE\"]\
    },\
    \"StartCallAnalyticsJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CallAnalyticsJobName\",\
        \"Media\"\
      ],\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your Call Analytics job.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new job with the same name as an existing job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>Describes the Amazon S3 location of the media file you want to use in your Call Analytics request.</p>\"\
        },\
        \"OutputLocation\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location where you want your Call Analytics transcription output stored. You can use any of the following formats to specify the output location:</p> <ol> <li> <p>s3://DOC-EXAMPLE-BUCKET</p> </li> <li> <p>s3://DOC-EXAMPLE-BUCKET/my-output-folder/</p> </li> <li> <p>s3://DOC-EXAMPLE-BUCKET/my-output-folder/my-call-analytics-job.json</p> </li> </ol> <p>Unless you specify a file name (option 3), the name of your output file has a default value that matches the name you specified for your transcription job using the <code>CallAnalyticsJobName</code> parameter.</p> <p>You can specify a KMS key to encrypt your output using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption.</p> <p>If you don't specify <code>OutputLocation</code>, your transcript is placed in a service-managed Amazon S3 bucket and you are provided with a URI to access your transcript.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The KMS key you want to use to encrypt your Call Analytics output.</p> <p>If using a key located in the <b>current</b> Amazon Web Services account, you can specify your KMS key in one of four ways:</p> <ol> <li> <p>Use the KMS key ID itself. For example, <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use an alias for the KMS key ID. For example, <code>alias/ExampleAlias</code>.</p> </li> <li> <p>Use the Amazon Resource Name (ARN) for the KMS key ID. For example, <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use the ARN for the KMS key alias. For example, <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.</p> </li> </ol> <p>If using a key located in a <b>different</b> Amazon Web Services account than the current Amazon Web Services account, you can specify your KMS key in one of two ways:</p> <ol> <li> <p>Use the ARN for the KMS key ID. For example, <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use the ARN for the KMS key alias. For example, <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.</p> </li> </ol> <p>If you don't specify an encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3).</p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location using the <code>OutputLocation</code> parameter.</p> <p>Note that the role making the request must have permission to use the specified KMS key.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files. If the role that you specify doesnât have the appropriate permissions to access the specified Amazon S3 location, your request fails.</p> <p>IAM role ARNs have the format <code>arn:partition:iam::account:role/role-name-with-path</code>. For example: <code>arn:aws:iam::111122223333:role/Admin</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a>.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"CallAnalyticsJobSettings\",\
          \"documentation\":\"<p>Specify additional optional settings in your request, including content redaction; allows you to apply custom language models, vocabulary filters, and custom vocabularies to your Call Analytics job.</p>\"\
        },\
        \"ChannelDefinitions\":{\
          \"shape\":\"ChannelDefinitions\",\
          \"documentation\":\"<p>Makes it possible to specify which speaker is on which channel. For example, if your agent is the first participant to speak, you would set <code>ChannelId</code> to <code>0</code> (to indicate the first channel) and <code>ParticipantRole</code> to <code>AGENT</code> (to indicate that it's the agent speaking).</p>\"\
        }\
      }\
    },\
    \"StartCallAnalyticsJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJob\":{\
          \"shape\":\"CallAnalyticsJob\",\
          \"documentation\":\"<p>Provides detailed information about the current Call Analytics job, including job status and, if applicable, failure reason.</p>\"\
        }\
      }\
    },\
    \"StartMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MedicalTranscriptionJobName\",\
        \"LanguageCode\",\
        \"Media\",\
        \"OutputBucketName\",\
        \"Specialty\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your medical transcription job. The name that you specify is also used as the default name of your transcription output file. If you want to specify a different name for your transcription output, use the <code>OutputKey</code> parameter.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new job with the same name as an existing job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language spoken in the input media file. US English (<code>en-US</code>) is the only valid value for medical transcription jobs. Any other value you enter for language code results in a <code>BadRequestException</code> error.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MedicalMediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in hertz, of the audio track in your input media file.</p> <p>If you don't specify the media sample rate, Amazon Transcribe Medical determines it for you. If you specify the sample rate, it must match the rate detected by Amazon Transcribe Medical; if there's a mismatch between the value that you specify and the value detected, your job fails. Therefore, in most cases, it's advised to omit <code>MediaSampleRateHertz</code> and let Amazon Transcribe Medical determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>Specify the format of your input media file.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The name of the Amazon S3 bucket where you want your medical transcription output stored. Do not include the <code>S3://</code> prefix of the specified bucket.</p> <p>If you want your output to go to a sub-folder of this bucket, specify it using the <code>OutputKey</code> parameter; <code>OutputBucketName</code> only accepts the name of a bucket.</p> <p>For example, if you want your output stored in <code>S3://DOC-EXAMPLE-BUCKET</code>, set <code>OutputBucketName</code> to <code>DOC-EXAMPLE-BUCKET</code>. However, if you want your output stored in <code>S3://DOC-EXAMPLE-BUCKET/test-files/</code>, set <code>OutputBucketName</code> to <code>DOC-EXAMPLE-BUCKET</code> and <code>OutputKey</code> to <code>test-files/</code>.</p> <p>Note that Amazon Transcribe must have permission to use the specified location. You can change Amazon S3 permissions using the <a href=\\\"https://console.aws.amazon.com/s3\\\">Amazon Web Services Management Console</a>. See also <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p>\"\
        },\
        \"OutputKey\":{\
          \"shape\":\"OutputKey\",\
          \"documentation\":\"<p>Use in combination with <code>OutputBucketName</code> to specify the output location of your transcript and, optionally, a unique name for your output file. The default name for your transcription output is the same as the name you specified for your medical transcription job (<code>MedicalTranscriptionJobName</code>).</p> <p>Here are some examples of how you can use <code>OutputKey</code>:</p> <ul> <li> <p>If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code> and 'my-transcript.json' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/my-transcript.json</code>.</p> </li> <li> <p>If you specify 'my-first-transcription' as the <code>MedicalTranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>, and 'my-transcript' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json</code>.</p> </li> <li> <p>If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code> and 'test-files/my-transcript.json' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json</code>.</p> </li> <li> <p>If you specify 'my-first-transcription' as the <code>MedicalTranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>, and 'test-files/my-transcript' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json</code>.</p> </li> </ul> <p>If you specify the name of an Amazon S3 bucket sub-folder that doesn't exist, one is created for you.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The KMS key you want to use to encrypt your medical transcription output.</p> <p>If using a key located in the <b>current</b> Amazon Web Services account, you can specify your KMS key in one of four ways:</p> <ol> <li> <p>Use the KMS key ID itself. For example, <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use an alias for the KMS key ID. For example, <code>alias/ExampleAlias</code>.</p> </li> <li> <p>Use the Amazon Resource Name (ARN) for the KMS key ID. For example, <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use the ARN for the KMS key alias. For example, <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.</p> </li> </ol> <p>If using a key located in a <b>different</b> Amazon Web Services account than the current Amazon Web Services account, you can specify your KMS key in one of two ways:</p> <ol> <li> <p>Use the ARN for the KMS key ID. For example, <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use the ARN for the KMS key alias. For example, <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.</p> </li> </ol> <p>If you don't specify an encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3).</p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location using the <code>OutputLocation</code> parameter.</p> <p>Note that the role making the request must have permission to use the specified KMS key.</p>\"\
        },\
        \"KMSEncryptionContext\":{\
          \"shape\":\"KMSEncryptionContextMap\",\
          \"documentation\":\"<p>A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context\\\">KMS encryption context</a> and <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html\\\">Asymmetric keys in KMS</a>.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"MedicalTranscriptionSetting\",\
          \"documentation\":\"<p>Specify additional optional settings in your request, including channel identification, alternative transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your transcription job.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>Labels all personal health information (PHI) identified in your transcript. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html\\\">Identifying personal health information (PHI) in a transcription</a>.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>Specify the predominant medical specialty represented in your media. For batch transcriptions, <code>PRIMARYCARE</code> is the only valid value. If you require additional specialties, refer to .</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>Specify whether your input media contains only one person (<code>DICTATION</code>) or contains a conversation between two people (<code>CONVERSATION</code>).</p> <p>For example, <code>DICTATION</code> could be used for a medical professional wanting to transcribe voice memos; <code>CONVERSATION</code> could be used for transcribing the doctor-patient dialogue during the patient's office visit.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to a new medical transcription job at the time you start this new job.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
        }\
      }\
    },\
    \"StartMedicalTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJob\":{\
          \"shape\":\"MedicalTranscriptionJob\",\
          \"documentation\":\"<p>Provides detailed information about the current medical transcription job, including job status and, if applicable, failure reason.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptionJobName\",\
        \"Media\"\
      ],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your transcription job. The name that you specify is also used as the default name of your transcription output file. If you want to specify a different name for your transcription output, use the <code>OutputKey</code> parameter.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new job with the same name as an existing job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language spoken in the input media file.</p> <p>If you're unsure of the language spoken in your media file, consider using <code>IdentifyLanguage</code> or <code>IdentifyMultipleLanguages</code> to enable automatic language identification.</p> <p>Note that you must include one of <code>LanguageCode</code>, <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code> in your request. If you include more than one of these parameters, your transcription job fails.</p> <p>For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table.</p> <note> <p>To transcribe speech in Modern Standard Arabic (<code>ar-SA</code>), your media file must be encoded at a sample rate of 16,000 Hz or higher.</p> </note>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in hertz, of the audio track in your input media file.</p> <p>If you don't specify the media sample rate, Amazon Transcribe determines it for you. If you specify the sample rate, it must match the rate detected by Amazon Transcribe. If there's a mismatch between the value that you specify and the value detected, your job fails. In most cases, you can omit <code>MediaSampleRateHertz</code> and let Amazon Transcribe determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>Specify the format of your input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>Describes the Amazon S3 location of the media file you want to use in your request.</p>\"\
        },\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The name of the Amazon S3 bucket where you want your transcription output stored. Do not include the <code>S3://</code> prefix of the specified bucket.</p> <p>If you want your output to go to a sub-folder of this bucket, specify it using the <code>OutputKey</code> parameter; <code>OutputBucketName</code> only accepts the name of a bucket.</p> <p>For example, if you want your output stored in <code>S3://DOC-EXAMPLE-BUCKET</code>, set <code>OutputBucketName</code> to <code>DOC-EXAMPLE-BUCKET</code>. However, if you want your output stored in <code>S3://DOC-EXAMPLE-BUCKET/test-files/</code>, set <code>OutputBucketName</code> to <code>DOC-EXAMPLE-BUCKET</code> and <code>OutputKey</code> to <code>test-files/</code>.</p> <p>Note that Amazon Transcribe must have permission to use the specified location. You can change Amazon S3 permissions using the <a href=\\\"https://console.aws.amazon.com/s3\\\">Amazon Web Services Management Console</a>. See also <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p> <p>If you don't specify <code>OutputBucketName</code>, your transcript is placed in a service-managed Amazon S3 bucket and you are provided with a URI to access your transcript.</p>\"\
        },\
        \"OutputKey\":{\
          \"shape\":\"OutputKey\",\
          \"documentation\":\"<p>Use in combination with <code>OutputBucketName</code> to specify the output location of your transcript and, optionally, a unique name for your output file. The default name for your transcription output is the same as the name you specified for your transcription job (<code>TranscriptionJobName</code>).</p> <p>Here are some examples of how you can use <code>OutputKey</code>:</p> <ul> <li> <p>If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code> and 'my-transcript.json' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/my-transcript.json</code>.</p> </li> <li> <p>If you specify 'my-first-transcription' as the <code>TranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>, and 'my-transcript' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json</code>.</p> </li> <li> <p>If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code> and 'test-files/my-transcript.json' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json</code>.</p> </li> <li> <p>If you specify 'my-first-transcription' as the <code>TranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>, and 'test-files/my-transcript' as the <code>OutputKey</code>, your transcription output path is <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json</code>.</p> </li> </ul> <p>If you specify the name of an Amazon S3 bucket sub-folder that doesn't exist, one is created for you.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The KMS key you want to use to encrypt your transcription output.</p> <p>If using a key located in the <b>current</b> Amazon Web Services account, you can specify your KMS key in one of four ways:</p> <ol> <li> <p>Use the KMS key ID itself. For example, <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use an alias for the KMS key ID. For example, <code>alias/ExampleAlias</code>.</p> </li> <li> <p>Use the Amazon Resource Name (ARN) for the KMS key ID. For example, <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use the ARN for the KMS key alias. For example, <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.</p> </li> </ol> <p>If using a key located in a <b>different</b> Amazon Web Services account than the current Amazon Web Services account, you can specify your KMS key in one of two ways:</p> <ol> <li> <p>Use the ARN for the KMS key ID. For example, <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p> </li> <li> <p>Use the ARN for the KMS key alias. For example, <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.</p> </li> </ol> <p>If you don't specify an encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3).</p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location using the <code>OutputLocation</code> parameter.</p> <p>Note that the role making the request must have permission to use the specified KMS key.</p>\"\
        },\
        \"KMSEncryptionContext\":{\
          \"shape\":\"KMSEncryptionContextMap\",\
          \"documentation\":\"<p>A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context\\\">KMS encryption context</a> and <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html\\\">Asymmetric keys in KMS</a>.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>Specify additional optional settings in your request, including channel identification, alternative transcriptions, speaker partitioning. You can use that to apply custom vocabularies and vocabulary filters.</p> <p>If you want to include a custom vocabulary or a custom vocabulary filter (or both) with your request but <b>do not</b> want to use automatic language identification, use <code>Settings</code> with the <code>VocabularyName</code> or <code>VocabularyFilterName</code> (or both) sub-parameter.</p> <p>If you're using automatic language identification with your request and want to include a custom language model, a custom vocabulary, or a custom vocabulary filter, use instead the <code/> parameter with the <code>LanguageModelName</code>, <code>VocabularyName</code> or <code>VocabularyFilterName</code> sub-parameters.</p>\"\
        },\
        \"ModelSettings\":{\
          \"shape\":\"ModelSettings\",\
          \"documentation\":\"<p>Specify the custom language model you want to include with your transcription job. If you include <code>ModelSettings</code> in your request, you must include the <code>LanguageModelName</code> sub-parameter.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html\\\">Custom language models</a>.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Makes it possible to control how your transcription job is processed. Currently, the only <code>JobExecutionSettings</code> modification you can choose is enabling job queueing using the <code>AllowDeferredExecution</code> sub-parameter.</p> <p>If you include <code>JobExecutionSettings</code> in your request, you must also include the sub-parameters: <code>AllowDeferredExecution</code> and <code>DataAccessRoleArn</code>.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>Makes it possible to redact or flag specified personally identifiable information (PII) in your transcript. If you use <code>ContentRedaction</code>, you must also include the sub-parameters: <code>PiiEntityTypes</code>, <code>RedactionOutput</code>, and <code>RedactionType</code>.</p>\"\
        },\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Enables automatic language identification in your transcription job request. Use this parameter if your media file contains only one language. If your media contains multiple languages, use <code>IdentifyMultipleLanguages</code> instead.</p> <p>If you include <code>IdentifyLanguage</code>, you can optionally include a list of language codes, using <code>LanguageOptions</code>, that you think may be present in your media file. Including <code>LanguageOptions</code> restricts <code>IdentifyLanguage</code> to only the language options that you specify, which can improve transcription accuracy.</p> <p>If you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter to your automatic language identification request, include <code>LanguageIdSettings</code> with the relevant sub-parameters (<code>VocabularyName</code>, <code>LanguageModelName</code>, and <code>VocabularyFilterName</code>). If you include <code>LanguageIdSettings</code>, also include <code>LanguageOptions</code>.</p> <p>Note that you must include one of <code>LanguageCode</code>, <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code> in your request. If you include more than one of these parameters, your transcription job fails.</p>\"\
        },\
        \"IdentifyMultipleLanguages\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Enables automatic multi-language identification in your transcription job request. Use this parameter if your media file contains more than one language. If your media contains only one language, use <code>IdentifyLanguage</code> instead.</p> <p>If you include <code>IdentifyMultipleLanguages</code>, you can optionally include a list of language codes, using <code>LanguageOptions</code>, that you think may be present in your media file. Including <code>LanguageOptions</code> restricts <code>IdentifyLanguage</code> to only the language options that you specify, which can improve transcription accuracy.</p> <p>If you want to apply a custom vocabulary or a custom vocabulary filter to your automatic language identification request, include <code>LanguageIdSettings</code> with the relevant sub-parameters (<code>VocabularyName</code> and <code>VocabularyFilterName</code>). If you include <code>LanguageIdSettings</code>, also include <code>LanguageOptions</code>.</p> <p>Note that you must include one of <code>LanguageCode</code>, <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code> in your request. If you include more than one of these parameters, your transcription job fails.</p>\"\
        },\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>You can specify two or more language codes that represent the languages you think may be present in your media. Including more than five is not recommended. If you're unsure what languages are present, do not include this parameter.</p> <p>If you include <code>LanguageOptions</code> in your request, you must also include <code>IdentifyLanguage</code>.</p> <p>For more information, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a>.</p> <p>To transcribe speech in Modern Standard Arabic (<code>ar-SA</code>), your media file must be encoded at a sample rate of 16,000 Hz or higher.</p>\"\
        },\
        \"Subtitles\":{\
          \"shape\":\"Subtitles\",\
          \"documentation\":\"<p>Produces subtitle files for your input media. You can specify WebVTT (*.vtt) and SubRip (*.srt) formats.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to a new transcription job at the time you start this new job.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
        },\
        \"LanguageIdSettings\":{\
          \"shape\":\"LanguageIdSettingsMap\",\
          \"documentation\":\"<p>If using automatic language identification in your request and you want to apply a custom language model, a custom vocabulary, or a custom vocabulary filter, include <code>LanguageIdSettings</code> with the relevant sub-parameters (<code>VocabularyName</code>, <code>LanguageModelName</code>, and <code>VocabularyFilterName</code>). Note that multi-language identification (<code>IdentifyMultipleLanguages</code>) doesn't support custom language models.</p> <p> <code>LanguageIdSettings</code> supports two to five language codes. Each language code you include can have an associated custom language model, custom vocabulary, and custom vocabulary filter. The language codes that you specify must match the languages of the associated custom language models, custom vocabularies, and custom vocabulary filters.</p> <p>It's recommended that you include <code>LanguageOptions</code> when using <code>LanguageIdSettings</code> to ensure that the correct language dialect is identified. For example, if you specify a custom vocabulary that is in <code>en-US</code> but Amazon Transcribe determines that the language spoken in your media is <code>en-AU</code>, your custom vocabulary <i>is not</i> applied to your transcription. If you include <code>LanguageOptions</code> and include <code>en-US</code> as the only English language dialect, your custom vocabulary <i>is</i> applied to your transcription.</p> <p>If you want to include a custom language model with your request but <b>do not</b> want to use automatic language identification, use instead the <code/> parameter with the <code>LanguageModelName</code> sub-parameter. If you want to include a custom vocabulary or a custom vocabulary filter (or both) with your request but <b>do not</b> want to use automatic language identification, use instead the <code/> parameter with the <code>VocabularyName</code> or <code>VocabularyFilterName</code> (or both) sub-parameter.</p>\"\
        },\
        \"ToxicityDetection\":{\
          \"shape\":\"ToxicityDetection\",\
          \"documentation\":\"<p>Enables toxic speech detection in your transcript. If you include <code>ToxicityDetection</code> in your request, you must also include <code>ToxicityCategories</code>.</p> <p>For information on the types of toxic speech Amazon Transcribe can detect, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/toxic-language.html\\\">Detecting toxic speech</a>.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>Provides detailed information about the current transcription job, including job status and, if applicable, failure reason.</p>\"\
        }\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringTargetList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"},\
      \"min\":1\
    },\
    \"SubtitleFileUris\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Uri\"}\
    },\
    \"SubtitleFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"vtt\",\
        \"srt\"\
      ]\
    },\
    \"SubtitleFormats\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubtitleFormat\"}\
    },\
    \"SubtitleOutputStartIndex\":{\
      \"type\":\"integer\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"Subtitles\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Formats\":{\
          \"shape\":\"SubtitleFormats\",\
          \"documentation\":\"<p>Specify the output format for your subtitle file; if you select both WebVTT (<code>vtt</code>) and SubRip (<code>srt</code>) formats, two output files are generated.</p>\"\
        },\
        \"OutputStartIndex\":{\
          \"shape\":\"SubtitleOutputStartIndex\",\
          \"documentation\":\"<p>Specify the starting value that is assigned to the first subtitle segment.</p> <p>The default start index for Amazon Transcribe is <code>0</code>, which differs from the more widely used standard of <code>1</code>. If you're uncertain which value to use, we recommend choosing <code>1</code>, as this may improve compatibility with other services.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Generate subtitles for your media file with your transcription request.</p> <p>You can choose a start index of 0 or 1, and you can specify either WebVTT or SubRip (or both) as your output format.</p> <p>Note that your subtitle files are placed in the same location as your transcription output.</p>\"\
    },\
    \"SubtitlesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Formats\":{\
          \"shape\":\"SubtitleFormats\",\
          \"documentation\":\"<p>Provides the format of your subtitle files. If your request included both WebVTT (<code>vtt</code>) and SubRip (<code>srt</code>) formats, both formats are shown.</p>\"\
        },\
        \"SubtitleFileUris\":{\
          \"shape\":\"SubtitleFileUris\",\
          \"documentation\":\"<p>The Amazon S3 location of your transcript. You can use this URI to access or download your subtitle file. Your subtitle file is stored in the same location as your transcript. If you specified both WebVTT and SubRip subtitle formats, two URIs are provided.</p> <p>If you included <code>OutputBucketName</code> in your transcription job request, this is the URI of that bucket. If you also included <code>OutputKey</code> in your request, your output is located in the path you specified in your request.</p> <p>If you didn't include <code>OutputBucketName</code> in your transcription job request, your subtitle file is stored in a service-managed bucket, and <code>TranscriptFileUri</code> provides you with a temporary URI you can use for secure access to your subtitle file.</p> <note> <p>Temporary URIs for service-managed Amazon S3 buckets are only valid for 15 minutes. If you get an <code>AccesDenied</code> error, you can get a new temporary URI by running a <code>GetTranscriptionJob</code> or <code>ListTranscriptionJob</code> request.</p> </note>\"\
        },\
        \"OutputStartIndex\":{\
          \"shape\":\"SubtitleOutputStartIndex\",\
          \"documentation\":\"<p>Provides the start index value for your subtitle files. If you did not specify a value in your request, the default value of <code>0</code> is used.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about your subtitle file, including format, start index, and Amazon S3 location.</p>\"\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The first part of a key:value pair that forms a tag associated with a given resource. For example, in the tag <code>Department:Sales</code>, the key is 'Department'.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The second part of a key:value pair that forms a tag associated with a given resource. For example, in the tag <code>Department:Sales</code>, the value is 'Sales'.</p> <p>Note that you can set the value of a tag to an empty string, but you can't set the value of a tag to null. Omitting the tag value is the same as using an empty string.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Adds metadata, in the form of a key:value pair, to the specified resource.</p> <p>For example, you could add the tag <code>Department:Sales</code> to a resource to indicate that it pertains to your organization's sales department. You can also use tags for tag-based access control.</p> <p>To learn more about tagging, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":200,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":200,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource you want to tag. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.</p> <p>For example, <code>arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name</code>.</p> <p>Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more custom tags, each in the form of a key:value pair, to the specified resource.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
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
    \"TimestampMilliseconds\":{\
      \"type\":\"long\",\
      \"max\":14400000,\
      \"min\":0\
    },\
    \"ToxicityCategories\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ToxicityCategory\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"ToxicityCategory\":{\
      \"type\":\"string\",\
      \"enum\":[\"ALL\"]\
    },\
    \"ToxicityDetection\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ToxicityDetectionSettings\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"ToxicityDetectionSettings\":{\
      \"type\":\"structure\",\
      \"required\":[\"ToxicityCategories\"],\
      \"members\":{\
        \"ToxicityCategories\":{\
          \"shape\":\"ToxicityCategories\",\
          \"documentation\":\"<p> If you include <code>ToxicityDetection</code> in your transcription request, you must also include <code>ToxicityCategories</code>. The only accepted value for this parameter is <code>ALL</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains <code>ToxicityCategories</code>, which is a required parameter if you want to enable toxicity detection (<code>ToxicityDetection</code>) in your transcription request.</p>\"\
    },\
    \"TranscribeArn\":{\
      \"type\":\"string\",\
      \"max\":1011,\
      \"min\":1,\
      \"pattern\":\"arn:aws(-[^:]+)?:transcribe:[a-zA-Z0-9-]*:[0-9]{12}:[a-zA-Z-]*/[0-9a-zA-Z._-]+\"\
    },\
    \"Transcript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of your transcript. You can use this URI to access or download your transcript.</p> <p>If you included <code>OutputBucketName</code> in your transcription job request, this is the URI of that bucket. If you also included <code>OutputKey</code> in your request, your output is located in the path you specified in your request.</p> <p>If you didn't include <code>OutputBucketName</code> in your transcription job request, your transcript is stored in a service-managed bucket, and <code>TranscriptFileUri</code> provides you with a temporary URI you can use for secure access to your transcript.</p> <note> <p>Temporary URIs for service-managed Amazon S3 buckets are only valid for 15 minutes. If you get an <code>AccesDenied</code> error, you can get a new temporary URI by running a <code>GetTranscriptionJob</code> or <code>ListTranscriptionJob</code> request.</p> </note>\"\
        },\
        \"RedactedTranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of your redacted transcript. You can use this URI to access or download your transcript.</p> <p>If you included <code>OutputBucketName</code> in your transcription job request, this is the URI of that bucket. If you also included <code>OutputKey</code> in your request, your output is located in the path you specified in your request.</p> <p>If you didn't include <code>OutputBucketName</code> in your transcription job request, your transcript is stored in a service-managed bucket, and <code>RedactedTranscriptFileUri</code> provides you with a temporary URI you can use for secure access to your transcript.</p> <note> <p>Temporary URIs for service-managed Amazon S3 buckets are only valid for 15 minutes. If you get an <code>AccesDenied</code> error, you can get a new temporary URI by running a <code>GetTranscriptionJob</code> or <code>ListTranscriptionJob</code> request.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Provides you with the Amazon S3 URI you can use to access your transcript.</p>\"\
    },\
    \"TranscriptFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptFilterType\",\
        \"Targets\"\
      ],\
      \"members\":{\
        \"TranscriptFilterType\":{\
          \"shape\":\"TranscriptFilterType\",\
          \"documentation\":\"<p>Flag the presence or absence of an exact match to the phrases that you specify. For example, if you specify the phrase \\\"speak to a manager\\\" as your <code>Targets</code> value, only that exact phrase is flagged.</p> <p>Note that semantic matching is not supported. For example, if your customer says \\\"speak to <i>the</i> manager\\\", instead of \\\"speak to <i>a</i> manager\\\", your content is not flagged.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to search for the specified key words or phrases. See for more detail.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>Makes it possible to specify a time range (in percentage) in your media file, during which you want to search for the specified key words or phrases. See for more detail.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>Specify the participant that you want to flag. Omitting this parameter is equivalent to specifying both participants.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to <code>TRUE</code> to flag the absence of the phrase that you specified in your request. Set to <code>FALSE</code> to flag the presence of the phrase that you specified in your request.</p>\"\
        },\
        \"Targets\":{\
          \"shape\":\"StringTargetList\",\
          \"documentation\":\"<p>Specify the phrases that you want to flag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Flag the presence or absence of specific words or phrases detected in your Call Analytics transcription output.</p> <p>Rules using <code>TranscriptFilter</code> are designed to match:</p> <ul> <li> <p>Custom words or phrases spoken by the agent, the customer, or both</p> </li> <li> <p>Custom words or phrases <b>not</b> spoken by the agent, the customer, or either</p> </li> <li> <p>Custom words or phrases that occur at a specific time frame</p> </li> </ul> <p>See <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch\\\">Rule criteria for post-call categories</a> and <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html#tca-rules-stream\\\">Rule criteria for streaming categories</a> for usage examples.</p>\"\
    },\
    \"TranscriptFilterType\":{\
      \"type\":\"string\",\
      \"enum\":[\"EXACT\"]\
    },\
    \"TranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Provides the status of the specified transcription job.</p> <p>If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code> (or <code>RedactedTranscriptFileUri</code>, if you requested transcript redaction). If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code used to create your transcription job. This parameter is used with single-language identification. For multi-language identification requests, refer to the plural version of this parameter, <code>LanguageCodes</code>.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in hertz, of the audio track in your input media file.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>Provides the Amazon S3 location of the media file you used in your request.</p>\"\
        },\
        \"Transcript\":{\
          \"shape\":\"Transcript\",\
          \"documentation\":\"<p>Provides you with the Amazon S3 URI you can use to access your transcript.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified transcription job began processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified transcription job request was made.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified transcription job finished processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>TranscriptionJobStatus</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the transcription job request failed.</p> <p>The <code>FailureReason</code> field contains one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code>.</p> <p>The media format specified in <code>MediaFormat</code> isn't valid. Refer to <b>MediaFormat</b> for a list of supported formats.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code>.</p> <p>The media format specified in <code>MediaFormat</code> doesn't match the format of the input file. Check the media format of your media file and correct the specified value.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code>.</p> <p>The sample rate specified in <code>MediaSampleRateHertz</code> isn't valid. The sample rate must be between 8,000 and 48,000 hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code>.</p> <p>The sample rate specified in <code>MediaSampleRateHertz</code> doesn't match the sample rate detected in your input media file. Check the sample rate of your media file and correct the specified value.</p> </li> <li> <p> <code>Invalid file size: file size too large</code>.</p> <p>The size of your media file is larger than what Amazon Transcribe can process. For more information, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and quotas</a>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code>.</p> <p>Your audio contains more channels than Amazon Transcribe is able to process. For more information, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and quotas</a>.</p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>Provides information on any additional settings that were included in your request. Additional settings include channel identification, alternative transcriptions, speaker partitioning, custom vocabularies, and custom vocabulary filters.</p>\"\
        },\
        \"ModelSettings\":{\
          \"shape\":\"ModelSettings\",\
          \"documentation\":\"<p>Provides information on the custom language model you included in your request.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Provides information about how your transcription job was processed. This parameter shows if your request was queued and what data access role was used.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>Indicates whether redaction was enabled in your transcript.</p>\"\
        },\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether automatic language identification was enabled (<code>TRUE</code>) for the specified transcription job.</p>\"\
        },\
        \"IdentifyMultipleLanguages\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether automatic multi-language identification was enabled (<code>TRUE</code>) for the specified transcription job.</p>\"\
        },\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>Provides the language codes you specified in your request.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>The confidence score associated with the language identified in your media file.</p> <p>Confidence scores are values between 0 and 1; a larger value indicates a higher probability that the identified language correctly matches the language spoken in your media.</p>\"\
        },\
        \"LanguageCodes\":{\
          \"shape\":\"LanguageCodeList\",\
          \"documentation\":\"<p>The language codes used to create your transcription job. This parameter is used with multi-language identification. For single-language identification requests, refer to the singular version of this parameter, <code>LanguageCode</code>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags, each in the form of a key:value pair, assigned to the specified transcription job.</p>\"\
        },\
        \"Subtitles\":{\
          \"shape\":\"SubtitlesOutput\",\
          \"documentation\":\"<p>Indicates whether subtitles were generated with your transcription.</p>\"\
        },\
        \"LanguageIdSettings\":{\
          \"shape\":\"LanguageIdSettingsMap\",\
          \"documentation\":\"<p>Provides the name and language of all custom language models, custom vocabularies, and custom vocabulary filters that you included in your request.</p>\"\
        },\
        \"ToxicityDetection\":{\
          \"shape\":\"ToxicityDetection\",\
          \"documentation\":\"<p>Provides information about the toxicity detection settings applied to your transcription.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides detailed information about a transcription job.</p> <p>To view the status of the specified transcription job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p> <p>If you enabled content redaction, the redacted transcript can be found at the location specified in <code>RedactedTranscriptFileUri</code>.</p>\"\
    },\
    \"TranscriptionJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"TranscriptionJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUED\",\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"TranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TranscriptionJobSummary\"}\
    },\
    \"TranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job. Job names are case sensitive and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified transcription job request was made.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time your transcription job began processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified transcription job finished processing.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code used to create your transcription.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>Provides the status of your transcription job.</p> <p>If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in <code>TranscriptFileUri</code> (or <code>RedactedTranscriptFileUri</code>, if you requested transcript redaction). If the status is <code>FAILED</code>, <code>FailureReason</code> provides details on why your transcription job failed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If <code>TranscriptionJobStatus</code> is <code>FAILED</code>, <code>FailureReason</code> contains information about why the transcription job failed. See also: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a>.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates where the specified transcription output is stored.</p> <p>If the value is <code>CUSTOMER_BUCKET</code>, the location is the Amazon S3 bucket you specified using the <code>OutputBucketName</code> parameter in your request. If you also included <code>OutputKey</code> in your request, your output is located in the path you specified in your request.</p> <p>If the value is <code>SERVICE_BUCKET</code>, the location is a service-managed Amazon S3 bucket. To access a transcript stored in a service-managed bucket, use the URI shown in the <code>TranscriptFileUri</code> or <code>RedactedTranscriptFileUri</code> field.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>The content redaction settings of the transcription job.</p>\"\
        },\
        \"ModelSettings\":{\"shape\":\"ModelSettings\"},\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether automatic language identification was enabled (<code>TRUE</code>) for the specified transcription job.</p>\"\
        },\
        \"IdentifyMultipleLanguages\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether automatic multi-language identification was enabled (<code>TRUE</code>) for the specified transcription job.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>The confidence score associated with the language identified in your media file.</p> <p>Confidence scores are values between 0 and 1; a larger value indicates a higher probability that the identified language correctly matches the language spoken in your media.</p>\"\
        },\
        \"LanguageCodes\":{\
          \"shape\":\"LanguageCodeList\",\
          \"documentation\":\"<p>The language codes used to create your transcription job. This parameter is used with multi-language identification. For single-language identification, the singular version of this parameter, <code>LanguageCode</code>, is present.</p>\"\
        },\
        \"ToxicityDetection\":{\
          \"shape\":\"ToxicityDetection\",\
          \"documentation\":\"<p>Indicates whether toxicity detection was enabled for the specified transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides detailed information about a specific transcription job.</p>\"\
    },\
    \"Type\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONVERSATION\",\
        \"DICTATION\"\
      ]\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want to remove tags from. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.</p> <p>For example, <code>arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name</code>.</p> <p>Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>Removes the specified tag keys from the specified Amazon Transcribe resource.</p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CategoryName\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the Call Analytics category you want to update. Category names are case sensitive.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>The rules used for the updated Call Analytics category. The rules you provide in this field replace the ones that are currently being used in the specified category.</p>\"\
        },\
        \"InputType\":{\
          \"shape\":\"InputType\",\
          \"documentation\":\"<p>Choose whether you want to update a real-time or a post-call category. The input type you specify must match the input type specified when the category was created. For example, if you created a category with the <code>POST_CALL</code> input type, you must use <code>POST_CALL</code> as the input type when updating this category.</p>\"\
        }\
      }\
    },\
    \"UpdateCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryProperties\":{\
          \"shape\":\"CategoryProperties\",\
          \"documentation\":\"<p>Provides you with the properties of the Call Analytics category you specified in your <code>UpdateCallAnalyticsCategory</code> request.</p>\"\
        }\
      }\
    },\
    \"UpdateMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"VocabularyFileUri\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom medical vocabulary you want to update. Custom medical vocabulary names are case sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in the custom vocabulary you want to update. US English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the text file that contains your custom medical vocabulary. The URI must be located in the same Amazon Web Services Region as the resource you're calling.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code> </p>\"\
        }\
      }\
    },\
    \"UpdateMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the updated custom medical vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom medical vocabulary. US English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom medical vocabulary was last updated.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom medical vocabulary. If the state is <code>READY</code>, you can use the custom vocabulary in a <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the custom vocabulary filter you want to update. Custom vocabulary filter names are case sensitive.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>Use this parameter if you want to update your custom vocabulary filter by including all desired terms, as comma-separated values, within your request. The other option for updating your vocabulary filter is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the <code>VocabularyFilterFileUri</code> parameter.</p> <p>Note that if you include <code>Words</code> in your request, you cannot use <code>VocabularyFilterFileUri</code>; you must choose one or the other.</p> <p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the text file that contains your custom vocabulary filter terms. The URI must be located in the same Amazon Web Services Region as the resource you're calling.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt</code> </p> <p>Note that if you include <code>VocabularyFilterFileUri</code> in your request, you cannot use <code>Words</code>; you must choose one or the other.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary filter). If the role that you specify doesnât have the appropriate permissions to access the specified Amazon S3 location, your request fails.</p> <p>IAM role ARNs have the format <code>arn:partition:iam::account:role/role-name-with-path</code>. For example: <code>arn:aws:iam::111122223333:role/Admin</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the updated custom vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom vocabulary filter was last updated.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary you want to update. Custom vocabulary names are case sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in the custom vocabulary you want to update. Each custom vocabulary must contain terms in only one language.</p> <p>A custom vocabulary can only be used to transcribe files in the same language as the custom vocabulary. For example, if you create a custom vocabulary using US English (<code>en-US</code>), you can only apply this custom vocabulary to files that contain English audio.</p> <p>For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>Use this parameter if you want to update your custom vocabulary by including all desired terms, as comma-separated values, within your request. The other option for updating your custom vocabulary is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the location of your file using the <code>VocabularyFileUri</code> parameter.</p> <p>Note that if you include <code>Phrases</code> in your request, you cannot use <code>VocabularyFileUri</code>; you must choose one or the other.</p> <p>Each language has a character set that contains all allowed characters for that specific language. If you use unsupported characters, your custom vocabulary filter request fails. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a> to get the character set for your language.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the text file that contains your custom vocabulary. The URI must be located in the same Amazon Web Services Region as the resource you're calling.</p> <p>Here's an example URI path: <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code> </p> <p>Note that if you include <code>VocabularyFileUri</code> in your request, you cannot use the <code>Phrases</code> flag; you must choose one or the other.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket that contains your input files (in this case, your custom vocabulary). If the role that you specify doesnât have the appropriate permissions to access the specified Amazon S3 location, your request fails.</p> <p>IAM role ARNs have the format <code>arn:partition:iam::account:role/role-name-with-path</code>. For example: <code>arn:aws:iam::111122223333:role/Admin</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns\\\">IAM ARNs</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the updated custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom vocabulary was last updated.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom vocabulary. If the state is <code>READY</code>, you can use the custom vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1,\
      \"pattern\":\"(s3://|http(s*)://).+\"\
    },\
    \"Vocabularies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyInfo\"}\
    },\
    \"VocabularyFilterInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your custom vocabulary filter. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in your vocabulary filter. Each custom vocabulary filter must contain terms in only one language.</p> <p>A custom vocabulary filter can only be used to transcribe files in the same language as the filter. For example, if you create a custom vocabulary filter using US English (<code>en-US</code>), you can only apply this filter to files that contain English audio.</p> <p>For a list of supported languages and their associated language codes, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> table.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom vocabulary filter was last modified.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom vocabulary filter, including the language of the filter, when it was last modified, and its name.</p>\"\
    },\
    \"VocabularyFilterMethod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"remove\",\
        \"mask\",\
        \"tag\"\
      ]\
    },\
    \"VocabularyFilterName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyFilterInfo\"}\
    },\
    \"VocabularyInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your custom vocabulary. This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code used to create your custom vocabulary. Each custom vocabulary must contain terms in only one language.</p> <p>A custom vocabulary can only be used to transcribe files in the same language as the custom vocabulary. For example, if you create a custom vocabulary using US English (<code>en-US</code>), you can only apply this custom vocabulary to files that contain English audio.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the specified custom vocabulary was last modified.</p> <p>Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>. For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32 PM UTC-7 on May 4, 2022.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom vocabulary. If the state is <code>READY</code>, you can use the custom vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom vocabulary, including the language of the custom vocabulary, when it was last modified, its name, and the processing state.</p>\"\
    },\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"READY\",\
        \"FAILED\"\
      ]\
    },\
    \"Word\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Words\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Word\"},\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p>Amazon Transcribe offers three main types of batch transcription: <b>Standard</b>, <b>Medical</b>, and <b>Call Analytics</b>.</p> <ul> <li> <p> <b>Standard transcriptions</b> are the most common option. Refer to for details.</p> </li> <li> <p> <b>Medical transcriptions</b> are tailored to medical professionals and incorporate medical terms. A common use case for this service is transcribing doctor-patient dialogue into after-visit notes. Refer to for details.</p> </li> <li> <p> <b>Call Analytics transcriptions</b> are designed for use with call center audio on two different channels; if you're looking for insight into customer service calls, use this option. Refer to for details.</p> </li> </ul>\"\
}\
";
}

@end
