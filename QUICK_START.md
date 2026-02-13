# Quick Start Guide (10 Minutes)

Fastest way to deploy ActualBudget on Railway with your existing data.

---

## Prerequisites

- [ ] Railway account ([railway.app](https://railway.app)) - GET $5 FREE CREDIT
- [ ] Git installed on computer
- [ ] Terminal/command line basic familiarity
- [ ] PikaPods access to export your data

---

## Step 1: Export from PikaPods (2 min)

```
1. Log into your PikaPods instance
2. Settings → Backup → Export Budget
3. Save the .zip file (e.g., actual-backup-2026-02-13.zip)
```

**Save this file - you'll need it for import!**

---

## Step 2: Deploy to Railway (5 min)

```bash
# Clone this repo
git clone https://github.com/Yash-P1/actual-budget-railway.git
cd actual-budget-railway

# Install Railway CLI
curl -L https://railway.app/install.sh | sh

# Login to Railway (opens browser)
railway login

# Initialize Railway project
railway init
# When prompted:
#   - Name: actual-budget
#   - Deployment method: Docker

# Deploy!
railway up
```

**Wait for: ✓ Deployment successful** (~2 minutes)

---

## Step 3: Access Your App (1 min)

```bash
# Get your Railway URL
railway open

# Browser opens to your new ActualBudget instance
# Set a strong password (different from PikaPods)
```

**Copy the URL and bookmark it!**

---

## Step 4: Import Your Data (2 min)

```
1. On Railway instance, click "Import Budget"
2. Select "Actual Format"
3. Upload your exported .zip file
4. Wait 1-2 minutes for import
```

**Done! 🎉 You're now on Railway (FREE hosting)**

---

## That's It!

### What You Get

- ✅ **FREE** hosting (~$2-3/month usage, $5/month credit)
- ✅ All your data migrated
- ✅ Works on all devices
- ✅ Automatic syncing
- ✅ 99.99% uptime SLA

### Next Steps

1. Test on mobile
2. Install PWA (offline access)
3. Set up weekly backups (see README.md)
4. Keep PikaPods as backup for 1-2 weeks
5. Cancel PikaPods subscription (save $36/year)

---

## Need Help?

- **Full Setup**: See [README.md](README.md)
- **Data Migration**: See [DATA_MIGRATION_GUIDE.md](DATA_MIGRATION_GUIDE.md)  
- **Code Review**: See [CODE_REVIEW.md](CODE_REVIEW.md)
- **Issues**: Open GitHub issue

---

## Troubleshooting

### "Command not found: railway"

```bash
# Add to PATH (Linux/macOS)
export PATH="$PATH:$HOME/.railway/bin"

# Or use full path
$HOME/.railway/bin/railway login
```

### "Import failed"

See [DATA_MIGRATION_GUIDE.md - Troubleshooting](DATA_MIGRATION_GUIDE.md#troubleshooting)

### "Can't access URL"

```bash
# Check deployment
railway status

# View logs
railway logs

# Redeploy if needed
railway up
```

---

## Quick Comparison

| Feature | PikaPods | Railway (This Setup) |
|---------|----------|--------------------|
| **Cost/month** | $1.40-3.00 | $0 (free credit) |
| **Setup time** | 5 min | 10 min |
| **Auto-updates** | Yes | Manual |
| **Reliability** | Good | Excellent |
| **Support** | Limited | Community |
| **Annual savings** | - | $36/year |

---

**Total time: ~10 minutes. Savings: $36/year. Complexity: Minimal.** ✨
