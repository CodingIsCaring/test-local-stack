import boto3
import pytest
import json


@pytest.fixture
def lambda_client():
    return boto3.client('lambda',
                        region_name='eu-central-1',
                        endpoint_url="http://localhost:4566",
                        aws_access_key_id='mock',
                        aws_secret_access_key='mock',
                        aws_session_token='mock')

def test_expected_number_of_lambdas(lambda_client):
    response = lambda_client.list_functions()
    assert len(response['Functions']) == 1

def test_lambda_executes_successfully(lambda_client):
    response = lambda_client.invoke(FunctionName='test_lambda',
                                    LogType='Tail',
                                    Payload="{\"message\":\"this is a message\"}")

    assert response['ResponseMetadata']['HTTPStatusCode'] == 200

    payload = json.loads(response['Payload'].read())

    assert payload == "egassem a si siht"
