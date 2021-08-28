import logging
import json

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def handler(event, context):
    logger.info("Test lambda called")
    logger.debug(f"Event received: {json.dumps(event)}")

    reversed_message = event['message'][::-1]
    logger.info(f"Reversed message {reversed_message}")

    return reversed_message