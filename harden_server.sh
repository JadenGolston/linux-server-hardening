#!/bin/bash

echo "🔒 Starting Linux Hardening..."

# 1. Update and upgrade
apt update && apt upgrade -y

# 2. Create new user
read -p "Enter new admin username: " username
adduser $username
usermod -aG sudo $username

# 3. Configure SSH
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd

# 4. Enable UFW and set rules
ufw allow OpenSSH
ufw enable

# 5. Install Fail2Ban
apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban

# 6. Set up basic auditing (optional)
apt install auditd -y
systemctl enable auditd
systemctl start auditd

echo "✅ Hardening complete. Please log in as $username going forward."
