#!/bin/bash
set -e

# Railsに対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /todo_app/tmp/pids/server.pid

# コンテナのプロセスを実行する。(Dockerfile 内の CMD に設定されているもの。)
exec "$@"