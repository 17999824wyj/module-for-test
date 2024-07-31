#!/bin/bash

# 脚本文件路径
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# 输出 Hello World
echo "Hello World"

# 检测输出是否正确
if [ "$(echo "Hello World")" == "Hello World" ]; then
    # 如果正确输出，则在result.json内写入正确的结果
    cat <<EOF >"${SCRIPT_DIR}/result.json"
{
    "name": "function",
    "res": "ok"
}
EOF
else
    # 如果输出不正确，则在result.json内写入错误结果
    cat <<EOF >"${SCRIPT_DIR}/result.json"
{
    "name": "function",
    "res": "err"
}
EOF
fi

# @ 2024-07-31, this is used to test the testing-system, just print('Hello World')!
