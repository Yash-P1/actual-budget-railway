# ActualBudget on Railway - Free Self-Hosted Setup

A complete guide to deploy ActualBudget for **FREE** on Railway, with step-by-step instructions to migrate your existing data from PikaPods.

## Why Railway Over PikaPods?

| Feature | PikaPods | Railway |
|---------|----------|---------|
| **Cost** | $1.40-3/month | $0/month (via $5 free credit) |
| **Annual Cost** | $16.80-36/month | $0 (paid plan: $5/month only if you exceed $5 usage) |
| **Free Trial** | None | $5 one-time credit |
| **Savings** | - | **Up to $36/year** |
| **Setup Time** | 5 min (one-click) | 10 min (CLI) |
| **Auto-Updates** | Yes | Manual (5 min via CLI) |

**Bottom Line**: Railway's free credit covers ActualBudget indefinitely for personal use (~$2-3/month actual usage).

---

## Prerequisites

Before starting, you'll need:

1. **Railway Account** - Sign up at [railway.app](https://railway.app) (get $5 free credit)
2. **Access to Your PikaPods ActualBudget** - For data export
3. **GitHub Account** - To store your config (optional, but recommended)
4. **Terminal/Command Line** - Familiarity with basic commands
5. **Git Installed** - Download from [git-scm.com](https://git-scm.com)

---

## Part 1: Export Your Data from PikaPods

### Step 1.1: Login to Your PikaPods Instance

1. Go to your PikaPods ActualBudget URL (e.g., `https://your-domain.pikapod.net/budget/`)
2. Enter your server password
3. Click on your budget file

### Step 1.2: Export Your Budget

1. In ActualBudget, go to **Settings** (gear icon, top right)
2. Scroll down to **Backup**
3. Click **Export Budget** - this downloads a `.zip` file containing your budget data
4. **Save this file securely** - you'll need it for import

**What you're exporting:**
- All transactions
- Accounts & balances
- Budget categories
- Payees & rules
- Reports & filters
- Any custom settings

### Step 1.3: Document Your Setup

Before you leave PikaPods, note:
- [ ] Number of accounts
- [ ] Date range of transactions
- [ ] Any custom categories or payee rules
- [ ] Total number of transactions

---

## Part 2: Deploy ActualBudget on Railway

### Step 2.1: Clone This Repository

Open your terminal and run:

```bash
git clone https://github.com/Yash-P1/actual-budget-railway.git
cd actual-budget-railway
```

### Step 2.2: Create Railway Account & Connect

```bash
# Install Railway CLI (macOS/Linux)
curl -L https://railway.app/install.sh | sh

# For Windows, see: https://docs.railway.app/guides/cli

# Login to Railway
railway login
```

### Step 2.3: Link Project to Railway

```bash
# Create new Railway project
railway init

# When prompted:
# - Give it a name (e.g., "actual-budget")
# - Select "Docker" when asked for deployment method
```

### Step 2.4: Configure Environment Variables

```bash
railway variables set ACTUAL_PORT=3006
railway variables set NODE_ENV=production
```

### Step 2.5: Deploy to Railway

```bash
# Deploy the app
railway up

# Wait for deployment to complete (2-3 minutes)
# Once done, you'll see: ✓ Deployment successful

# Get your public URL
railway open
```

**Your app is now live!** 🎉

---

## Part 3: Import Your Data

### Step 3.1: First Login

1. Open the Railway URL from Step 2.5
2. Set a **new secure password** for your server (different from PikaPods)
3. Click **Import Budget**

### Step 3.2: Import Process

1. Select **"Actual Format"** from the dropdown
2. Click **Choose File**
3. Select the `.zip` file you exported from PikaPods (Step 1.2)
4. Click **Import**

**Expected behavior:**
- File upload may take 1-2 minutes depending on file size
- You'll see a progress indicator
- Once complete, you'll have all your data synced

### Step 3.3: Verify Import

After import completes:

1. ✓ Check that all **accounts** are present
2. ✓ Verify **transaction counts** match your notes from Step 1.3
3. ✓ Review **budget categories** are intact
4. ✓ Test **payee matching** with recent transactions

---

## Part 4: Post-Deployment Setup

### Enable PWA (Progressive Web App) - Recommended

For offline access and app-like experience:

**Chrome/Edge:**
1. Click the three-dot menu (top right)
2. Select "Install app"
3. Confirm installation

**Firefox:**
1. Right-click the address bar → "Bookmark This Page"
2. Or use browser extensions like PWA Manager

**Safari (macOS/iOS):**
1. Click Share icon → "Add to Home Screen"

### Enable Browser Notifications (Optional)

In ActualBudget Settings:
1. Turn on **"Enable notifications"**
2. You'll get alerts for budget updates

### Set Up 2FA (Optional but Recommended)

Since you're accessing over the internet:
1. Go to Settings → Security
2. Enable **Server Password Protection** (already set)
3. Consider adding a VPN layer for extra security

---

## Part 5: Data Sync & Multi-Device Setup

### Desktop/Laptop

Simply access your Railway URL from any browser:
- [Your-Railway-URL].railway.app

### Mobile Device

1. Open the URL in your mobile browser
2. Tap Share → "Add to Home Screen" (iOS) or the three-dot menu → "Install app" (Android)
3. The app will work offline; sync happens when you reconnect

### Multiple Devices

ActualBudget automatically syncs between devices:
- Changes on phone appear on desktop within seconds
- Works offline; queues changes until reconnected
- No manual syncing needed

---

## Cost Breakdown & Optimization

### Railway Monthly Usage

ActualBudget for personal use typically costs:

| Resource | Monthly Usage |
|----------|---------------|
| RAM | 256MB-512MB |
| CPU | 0.1-0.25 vCPU |
| Storage | 1-5GB |
| **Estimated Cost** | **$2-4/month** |

**You have $5/month free credit** → Completely FREE ✨

### If You Exceed $5/Month

This is unlikely for single-user budget. If it happens:
1. Upgrade to **Hobby Plan** ($5/month base)
2. Usage charges only apply above the included amount
3. Set spending limits in Railway dashboard

### Cost Optimization Tips

1. **No load balancer needed** for personal use
2. **Auto-deploy disabled** (manual updates only)
3. **No database needed** (data stored as files)
4. **Minimal redundancy** sufficient for personal finance

---

## Maintenance & Updates

### Update to Latest ActualBudget Version

Every ~2-4 weeks, new ActualBudget versions are released.

**To update:**

```bash
# From your local directory
railway variables set ACTUAL_VERSION=latest

# Redeploy
railway up

# Check new version deployed
railway logs
```

### Backup Your Data

**Manual Backup (Weekly Recommended):**

1. Go to Settings → Backup
2. Click **Export Budget**
3. Save `.zip` to encrypted cloud storage (Google Drive, Dropbox, etc.)

**Automated Backup (Optional):**

See `.github/workflows/backup.yml` in this repo to set up automatic weekly exports.

### Monitor Deployments

```bash
# View deployment history
railway deployments

# View logs in real-time
railway logs --follow

# Check resource usage
railway info
```

---

## Troubleshooting

### Issue: "Can't Connect to Railway URL"

**Solution:**
```bash
# Check if deployment is running
railway status

# View error logs
railway logs

# Redeploy if needed
railway up
```

### Issue: "Import Failed - Unknown Error"

**Causes & Fixes:**

1. **File too large (>50MB)**
   - Export from PikaPods again with fewer years of data
   - Import in chunks (2-3 year periods)

2. **Invalid file format**
   - Make sure you exported as `.zip` from ActualBudget
   - Don't manually unzip or modify files

3. **Conflicting category names**
   - Rename categories like "Income" to "Income 2024" in export
   - Common issue when merging budgets

**Debug:**
1. Check file size: Should be 1-10MB for typical budget
2. Try importing on [Actual Demo](https://demo.actualbudget.org)
3. If demo import works, Railway deployment issue
4. If demo fails, export file issue

### Issue: "Stuck on 'Importing...'"

- Wait at least 5 minutes (large imports take time)
- Check browser console for errors (F12 → Console tab)
- Try from different browser
- Contact support if persists beyond 10 minutes

### Issue: "Budget Won't Sync Between Devices"

**Solution:**
1. Force refresh on all devices (Ctrl+Shift+R / Cmd+Shift+R)
2. Close and reopen PWA if installed
3. Check internet connection on all devices
4. Restart Railway instance: `railway restart`

---

## Security Best Practices

### ✅ Do

- ✓ Use **strong server password** (mix of letters, numbers, symbols)
- ✓ Enable **HTTPS** (Railway provides by default)
- ✓ **Backup regularly** (weekly via export)
- ✓ Use **PWA for offline access** (doesn't expose data)
- ✓ Keep **browser updated** for security patches

### ❌ Don't

- ✗ Share your Railway URL publicly
- ✗ Use same password as other services
- ✗ Store credentials in browser bookmarks/notes unencrypted
- ✗ Access from untrusted WiFi without VPN
- ✗ Leave browser logged in on shared devices

### Optional: Add Tailscale for Private Network

For extra security, access Railway only via Tailscale private network:

```bash
# Requires Tailscale subscription (~$5/month) but adds VPN layer
# See docs: https://tailscale.com/kb/1131/app-connectors
```

---

## Switching from PikaPods to Railway

### Timeline

| Step | Time | Task |
|------|------|------|
| 1 | 5 min | Export from PikaPods |
| 2 | 10 min | Deploy to Railway |
| 3 | 5 min | Import data |
| 4 | 5 min | Verify & test |
| **Total** | **25 min** | **Live migration** |

### No Downtime Required

- Keep PikaPods running during migration
- Test Railway instance thoroughly
- Only switch DNS/bookmarks when confident
- Can run both in parallel while testing

### After Migration

- Keep PikaPods instance for 1-2 weeks as backup
- Archive export files in encrypted storage
- Update bookmarks/PWA to Railway URL
- Consider sharing Railway URL with family/coworkers

---

## File Structure

```
actual-budget-railway/
├── Dockerfile              # Container configuration
├── railway.toml           # Railway deployment config
├── docker-compose.yml     # Local development setup
├── .github/
│   └── workflows/
│       └── backup.yml     # Automated backup workflow
├── scripts/
│   ├── export-data.sh     # Export budget script
│   └── import-data.sh     # Import budget script
├── config/
│   └── startup.sh         # Pre-deployment setup
└── README.md              # This file
```

---

## Advanced Configuration

### Custom Domain

To use your own domain:

```bash
# In Railway dashboard:
# 1. Go to Settings → Domain
# 2. Add custom domain
# 3. Update DNS records (Railroad will show you how)
```

### Environment Variables Reference

| Variable | Value | Purpose |
|----------|-------|---------|
| `ACTUAL_PORT` | 3006 | Server port |
| `NODE_ENV` | production | Runtime environment |
| `DB_PATH` | /data | Data storage location |
| `LOG_LEVEL` | info | Logging verbosity |

### Database

- ActualBudget uses **file-based storage** (no SQL database needed)
- Data stored in `/data` volume automatically persisted on Railway
- Backup by exporting from Settings

---

## Getting Help

### Resources

- **ActualBudget Docs**: https://actualbudget.org/docs/
- **Railway Docs**: https://docs.railway.app/
- **GitHub Issues**: https://github.com/actualbudget/actual/issues
- **Community Discord**: https://discord.gg/actualbudget

### Report Issues

If you encounter problems:

1. Check [Troubleshooting](#troubleshooting) section
2. Review Railway logs: `railway logs`
3. Test on [Actual Demo](https://demo.actualbudget.org)
4. Open GitHub issue with:
   - Error message
   - Railway logs excerpt
   - Steps to reproduce

---

## License

This deployment guide is MIT Licensed. ActualBudget is licensed under the Business Source License.

---

## FAQ

**Q: Will I really get free hosting forever?**
A: Railway offers $5/month free credits. ActualBudget uses $2-4/month. If it goes over $5, you'd pay the difference (~$0-1/month). Still way cheaper than PikaPods!

**Q: Can I switch back to PikaPods easily?**
A: Yes! Export from Railway (same process), then import on PikaPods. No data loss.

**Q: Is Railway reliable?**
A: Yes. 99.99% uptime SLA. Used by thousands in production.

**Q: Can I share access with family?**
A: Yes! Share the Railway URL. Each person logs in with the same server password.

**Q: What if my data gets corrupted?**
A: Always maintain weekly backups. Restore from backup (see Settings → Restore).

**Q: Can I self-host on my own server instead?**
A: Yes! See `docker-compose.yml` for Docker setup on home server/NAS.

---

## Changelog

- **v1.0** (Feb 2026) - Initial setup guide for Railway deployment
- **v1.1** - Added backup automation workflow
- **v1.2** - Added troubleshooting section

---

**Last Updated**: February 2026  
**Maintained By**: [Your Name]  
**Repository**: https://github.com/Yash-P1/actual-budget-railway
