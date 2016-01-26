#!/bin/bash

set -e

# Exclude certain keys that prevent TB from regenerating caches or indexes
cat ~/.thunderbird/default/prefs.js \
                | grep -v app\.update\.lastUpdateTime \
                | grep -v calendar\.registry\..*\.syncToken\.events \
                | grep -v extensions\.gContactSync\..*\.gContactSynclastBackup \
                | grep -v extensions\.gContactSync\..*\.lastSync \
                | grep -v extensions\.gContactSync\.statusBarText \
                | grep -v extensions\.gContactSync\..*\.synchronizing \
                | grep -v extensions\.getAddons\..cache\..lastUpdate \
                | grep -v idle\.lastDailyNotification \
                | grep -v mail\.last_msg_movecopy_target_uri \
                | grep -v places\.database\.lastMaintenance \
                | grep -v storage\.vacuum \
                > files/default/prefs.js.sensitive
git diff
