#!/bin/bash
# set -x
BOT_URL="https://api.telegram.org/5728771694:AAG10xSevg3Uz7UsmjOlPrxuQKocypeilgI/sendMessage"
                                                
TELEGRAM_CHAT_ID="1692690779"

send_msg () {
    curl -s -X POST ${BOT_URL} -d chat_id=$TELEGRAM_CHAT_ID \
        -d text="$1" -d parse_mode=${PARSE_MODE}
}

