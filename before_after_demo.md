# Before and After Hardening (Demo)

## 🔓 Before
- Root login enabled via SSH
- No firewall active
- No intrusion prevention system (Fail2Ban)
- No auditing

## 🔒 After
- Root login blocked, password auth disabled
- Firewall (UFW) running
- Fail2Ban monitoring brute-force
- AuditD capturing activity logs
- New sudo user created
