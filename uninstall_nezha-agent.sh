#!/bin/bash

# 赋予脚本执行权限
chmod +x $0

# 停止 nezha-agent 服务
echo "正在停止 nezha-agent 服务..."
sudo systemctl stop nezha-agent

# 禁用 nezha-agent 服务
echo "正在禁用 nezha-agent 服务..."
sudo systemctl disable nezha-agent

# 删除 nezha 文件和配置
echo "正在删除 nezha 文件和配置..."
sudo rm -rf /usr/local/nezha /etc/nezha-agent.conf /var/log/nezha

# 删除 nezha systemd 服务
echo "正在删除 nezha systemd 服务..."
sudo rm -f /etc/systemd/system/nezha-agent.service

# 重新加载 systemd
echo "正在重新加载 systemd..."
sudo systemctl daemon-reload

# 检查服务是否已停止并禁用
echo "检查 nezha-agent 服务是否已停止并禁用..."
systemctl is-active --quiet nezha-agent || echo "nezha-agent 服务已停止。"
systemctl is-enabled --quiet nezha-agent || echo "nezha-agent 服务已禁用。"

# 检查相关文件是否已删除
echo "检查 nezha 文件和目录是否已删除..."
[ ! -d "/usr/local/nezha" ] && echo "/usr/local/nezha 目录已删除。" || echo "/usr/local/nezha 目录仍然存在。"
[ ! -f "/etc/nezha-agent.conf" ] && echo "/etc/nezha-agent.conf 文件已删除。" || echo "/etc/nezha-agent.conf 文件仍然存在。"
[ ! -d "/var/log/nezha" ] && echo "/var/log/nezha 目录已删除。" || echo "/var/log/nezha 目录仍然存在。"

# 检查 nezha-agent 进程是否仍在运行
echo "检查 nezha-agent 是否仍在运行..."
ps aux | grep -i nezha | grep -v grep || echo "没有 nezha-agent 进程在运行。"

# 完成卸载并打印成功信息
echo "nezha-agent 已成功卸载。"

