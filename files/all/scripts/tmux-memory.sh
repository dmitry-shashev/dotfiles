#!/bin/sh

if [ "$(uname -s)" = 'Darwin' ]; then
  total_bytes="$(sysctl -n hw.memsize)"

  vm_stat | awk -v total_bytes="$total_bytes" '
    NR == 1 {
      gsub(/\./, "", $8)
      page_size = $8
    }
    /Pages active:/ {
      gsub(/\./, "", $3)
      active = $3
    }
    /Pages wired down:/ {
      gsub(/\./, "", $4)
      wired = $4
    }
    /Pages occupied by compressor:/ {
      gsub(/\./, "", $5)
      compressed = $5
    }
    END {
      used_gb = int(((active + wired + compressed) * page_size) / 1073741824)
      total_gb = int(total_bytes / 1073741824)
      printf "%d/%dGB", used_gb, total_gb
    }
  '

  exit 0
fi

free -m | awk '/^Mem:/ { printf "%d/%dGB", int($3 / 1024), int($2 / 1024) }'
