#!/bin/bash
# 停止并禁用服务
sudo systemctl stop nezha-agent
sudo systemctl disable nezha-agent

# 删除文件和目录
sudo rm -rf /usr/local/nezha
sudo rm -f /etc/nezha-agent.conf
sudo rm -rf /var/log/nezha

# 删除 systemd 服务文件
sudo rm -f /etc/systemd/system/nezha-agent.service

# 删除依赖（如果需要）
sudo apt remove nezha-agent -y
sudo apt autoremove -y

echo "哪吒探针 agent 已成功卸载！"
