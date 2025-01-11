#!/bin/bash
cd "$(dirname "$0")/MC" && java -Xmx14G -Xms12G -jar server.jar nogui
