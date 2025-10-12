#!/bin/bash

set -e

# 현재 시각 기반의 postfix 생성 (예: huoguo-pick-server-20251011-153012)
LABEL="huoguo-pick-server-$(date +%Y%m%d-%H%M%S)"
REGEX_LABEL="huoguo-pick-server-[0-9]{8}-[0-9]{6}"

# 혹시 실행중인 컨테이너가 있다면 중지
if docker ps --format '{{.Names}}' | grep -Eq "^${REGEX_LABEL}$"; then
  echo "🧹 Stopping running container(s): huoguo-pick-server-*"
  docker ps --format '{{.Names}}' | grep -E "^${REGEX_LABEL}$" \
    | xargs -r docker stop >/dev/null 2>&1 || true
fi

# 혹시 동일 이름 컨테이너가 이미 있다면 제거
if docker ps -a --format '{{.Names}}' | grep -Eq "^${REGEX_LABEL}$"; then
  echo "🧹 Removing old container(s): huoguo-pick-server-*"
  docker ps -a --format '{{.Names}}' | grep -E "^${REGEX_LABEL}$" \
    | xargs -r docker rm -f >/dev/null 2>&1 || true
fi

# 새 컨테이너 실행
echo "🚀 Running new container: ${LABEL}"

docker build --build-arg PORT=4001 -t "${LABEL}" . -f ./backend/Dockerfile

docker run -d \
  --name "${LABEL}" \
  -p 4001:4001 \
  "${LABEL}"

echo "✅ Container '${LABEL}' is now running at http://localhost:4001"
