#!/bin/bash

# 停止并禁用 nezha-agent 服务
echo "停止并禁用 nezha-agent 服务..."
sudo systemctl stop nezha-agent
sudo systemctl disable nezha-agent

# 删除 nezha-agent 服务文件
echo "删除 nezha-agent 服务文件..."
sudo rm -f /etc/systemd/system/nezha-agent.service

# 重新加载 systemd 配置
echo "重新加载 systemd 配置..."
sudo systemctl daemon-reload

# 删除安装目录
echo "删除安装目录..."
sudo rm -rf /usr/local/nezha

# 删除配置文件
echo "删除配置文件..."
sudo rm -f /etc/nezha-agent.conf

# 删除日志文件
echo "删除日志文件..."
sudo rm -rf /var/log/nezha

# 清理系统中其他相关依赖（如果使用 apt 安装）
echo "删除 nezha-agent 包..."
sudo apt remove -y nezha-agent
sudo apt autoremove -y

# 检查是否有残留进程
echo "检查是否有残留的 nezha 进程..."
ps aux | grep -i nezha

# 输出卸载完成的消息
echo "哪吒探针 agent 卸载完成！"
