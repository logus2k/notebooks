#!/bin/bash

watch -n 5 az redis show --name "$REDIS_NAME" --resource-group learn-0ae13ebb-9d00-4cbf-88d4-5b86eb4850e8 --query provisioningState