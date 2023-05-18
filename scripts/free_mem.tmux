meminfo=$(cat /proc/meminfo)

free=$(echo "$meminfo" | awk '/MemFree/ {print $2}')
buffer=$(echo "$meminfo" | awk '/^Buffers/ {print $2}')
reclaim=$(echo "$meminfo" | awk '/^SReclaimable/ {print $2}')
inactive=$(echo "$meminfo" | awk '/^Inactive:/ {print $2}')

free_total=$((free + buffer + reclaim + inactive))

printf "%sG" $((($free_total) / 1024 / 1024))
