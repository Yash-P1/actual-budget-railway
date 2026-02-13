# Deployment Verification Checklist

Use this checklist to ensure your ActualBudget deployment on Railway is secure, performant, and production-ready.

---

## Pre-Deployment

### Planning
- [ ] Created Railway account
- [ ] Received $5 free credit confirmation
- [ ] Read README.md overview
- [ ] Backed up data from PikaPods
- [ ] Tested PikaPods export file
- [ ] Set aside 30 minutes for deployment

### Preparation
- [ ] Git installed and working
- [ ] Terminal/command line ready
- [ ] Cloned this repository
- [ ] Reviewed `railway.toml` configuration
- [ ] Reviewed `Dockerfile` setup
- [ ] Understood Docker basics (or ready to learn)

---

## During Deployment

### Railway Setup
- [ ] `railway login` successful
- [ ] `railway init` completed
- [ ] Selected "Docker" as build method
- [ ] App name set (e.g., "actual-budget")
- [ ] Environment variables configured:
  - [ ] `ACTUAL_PORT=3006`
  - [ ] `NODE_ENV=production`
  - [ ] `LOG_LEVEL=info`

### Deployment
- [ ] `railway up` command executed
- [ ] No error messages in output
- [ ] Deployment completed successfully
- [ ] Build took <5 minutes
- [ ] No port conflicts
- [ ] Volume mounted correctly

### App Accessibility  
- [ ] `railway open` or URL access works
- [ ] Page loads without 404/500 errors
- [ ] HTTPS connection successful (padlock icon)
- [ ] Response time < 3 seconds
- [ ] No certificate warnings

---

## Initial Configuration

### First Login
- [ ] Initial welcome page appears
- [ ] Password setup dialog shown
- [ ] Password set to **16+ characters**
- [ ] Password includes: uppercase, lowercase, numbers, symbols
- [ ] Password saved securely
- [ ] Login successful with new password

### Dashboard Verification
- [ ] Main dashboard visible
- [ ] "Import Budget" option available
- [ ] Settings accessible
- [ ] UI responsive on desktop

---

## Data Import

### Import Preparation
- [ ] PikaPods export file located
- [ ] Export file is `.zip` format
- [ ] File size reasonable (< 50MB)
- [ ] File integrity verified (not corrupted)
- [ ] Backup copy saved separately

### Import Process
- [ ] Click "Import Budget"
- [ ] Select "Actual Format" (not nYNAB)
- [ ] File uploaded successfully
- [ ] Upload progress shown
- [ ] No timeout errors
- [ ] Import completed (not stuck > 5 min)
- [ ] Success message received

### Post-Import Verification
- [ ] Dashboard loads without errors
- [ ] Budget name visible
- [ ] Accounts list populated
- [ ] Transaction count matches expectations
- [ ] Recent transactions visible
- [ ] Account balances correct
- [ ] Categories intact
- [ ] Payees loaded

---

## Security Verification

### Password Security
- [ ] Server password is 16+ characters
- [ ] Password not in browser autocomplete
- [ ] Password saved in password manager (recommended)
- [ ] Password not shared via email/chat
- [ ] Password different from PikaPods password

### Connection Security
- [ ] URL is `https://` (not `http://`)
- [ ] HTTPS certificate valid (green padlock)
- [ ] No mixed content warnings
- [ ] No "insecure" browser warnings
- [ ] Can navigate without login prompts

### Data Security
- [ ] No credentials in logs
- [ ] No PII visible in URL parameters
- [ ] No database passwords exposed
- [ ] Privacy policy reviewed (if any)
- [ ] Data stays encrypted at rest (Railway managed)

---

## Performance Testing

### Load Testing
- [ ] App loads in < 2 seconds
- [ ] No memory leaks visible
- [ ] CPU usage reasonable (< 50%)
- [ ] Page responsive (no lag)
- [ ] Smooth scrolling
- [ ] Fast search/filter

### Feature Testing
- [ ] Add new transaction: Works
- [ ] Edit transaction: Works
- [ ] Delete transaction: Works
- [ ] Category selection: Fast
- [ ] Payee auto-complete: Works
- [ ] Budget view: Renders
- [ ] Reports: Generate < 5 seconds

### Sync Testing
- [ ] Add transaction
- [ ] Refresh page
- [ ] Transaction persisted
- [ ] Data synced (page reload)
- [ ] No data loss

---

## Multi-Device Setup

### Desktop/Laptop
- [ ] Access from different browser (Chrome, Firefox, Safari)
- [ ] Works on Windows/Mac/Linux
- [ ] Bookmark set for easy access
- [ ] PWA installed (Chrome: three-dots > Install app)
- [ ] PWA works offline

### Mobile Device
- [ ] Open URL in mobile browser
- [ ] Responsive design works
- [ ] Touch interactions smooth
- [ ] Can add transactions on mobile
- [ ] Install as PWA (iOS: Share > Add to Home Screen)
- [ ] Mobile app appearance correct

### Sync Between Devices
- [ ] Add transaction on desktop
- [ ] Refresh on mobile
- [ ] Transaction appears
- [ ] Add on mobile
- [ ] Appears on desktop within 30 seconds
- [ ] Offline queuing works

---

## Railway Dashboard Verification

### Deployment Status
- [ ] Deployment shows "active" or "running"
- [ ] No "crashed" or "failed" status
- [ ] No error messages in dashboard
- [ ] Health check: Passing
- [ ] Uptime: > 99%

### Resource Monitoring
- [ ] Memory usage: < 400 MB
- [ ] CPU usage: < 200 mCPU average
- [ ] Storage usage: Reasonable
- [ ] Bandwidth: Low (< 10 MB/month)
- [ ] Build time: Recorded

### Volume Status
- [ ] Volume mounted: `actual-data` at `/data`
- [ ] Volume size: Sufficient
- [ ] Volume backup: Available
- [ ] Volume restoration: Possible

---

## Backup Strategy

### Initial Backup
- [ ] First backup taken immediately
- [ ] Exported from ActualBudget UI
- [ ] File saved to encrypted storage
- [ ] Backup location documented
- [ ] Backup verified (can restore)

### Backup Schedule
- [ ] Automated weekly backup configured (if using CI/CD)
- [ ] Manual backup reminders set
- [ ] Backup retention policy defined
- [ ] Backup encryption enabled
- [ ] Backup location secure

---

## Monitoring & Alerting

### Log Monitoring
- [ ] Check logs regularly: `railway logs`
- [ ] No persistent error patterns
- [ ] No memory/CPU warnings
- [ ] Normal startup sequence visible
- [ ] No security warnings

### Health Checks
- [ ] Docker health check: Passing
- [ ] Railway health check: Passing
- [ ] Uptime monitor: Running
- [ ] Response time: Stable

### Update Readiness
- [ ] Know where to get updates
- [ ] Update procedure documented
- [ ] Rollback procedure known
- [ ] Change log reviewed

---

## Cost & Billing

### Railway Account
- [ ] Free tier selected (or Hobby plan if needed)
- [ ] $5 credit confirmed
- [ ] No payment method required for free tier
- [ ] Billing notifications enabled
- [ ] Budget alerts set (if available)

### Usage Monitoring
- [ ] Actual usage < $5/month expected
- [ ] Cost breakdown understood
- [ ] No unexpected charges
- [ ] Scaling implications understood
- [ ] Cost optimization complete

---

## Documentation

### Internal Documentation
- [ ] Railway URL bookmarked/documented
- [ ] Server password stored securely
- [ ] Backup procedure documented
- [ ] Update procedure documented
- [ ] Emergency contacts/procedures

### External Documentation  
- [ ] README.md reviewed
- [ ] Migration guide reviewed
- [ ] Troubleshooting guide accessible
- [ ] Code review notes understood
- [ ] GitHub issues/discussions known

---

## Post-Deployment

### Cleanup
- [ ] Local temp files removed
- [ ] Export files backed up
- [ ] PikaPods instance kept as backup (1-2 weeks)
- [ ] Old configs archived
- [ ] Documentation updated

### Handover (if needed)
- [ ] Family members can access
- [ ] Everyone knows server password
- [ ] Instructions shared
- [ ] Support contacts provided
- [ ] Backup procedure communicated

### Long-term
- [ ] First backup completed
- [ ] Weekly backup schedule active
- [ ] Monthly monitoring scheduled
- [ ] Quarterly update schedule set
- [ ] Annual review planned

---

## Troubleshooting Preparedness

### Common Issues Understood
- [ ] Know how to check deployment status
- [ ] Know how to view logs
- [ ] Know how to restart app
- [ ] Know how to restore from backup
- [ ] Know where to get help

### Emergency Procedures
- [ ] Know Railway support contact
- [ ] Know GitHub issue process
- [ ] Know rollback procedure
- [ ] Know data recovery process
- [ ] Know escalation contacts

---

## Sign-Off

### Deployment Verified
- [ ] All critical items checked
- [ ] No major issues found
- [ ] System is production-ready
- [ ] Ready for daily use
- [ ] Family can use safely

### Date Deployed
Date: _______________

### Reviewed By
Name: _______________

### Notes
```
[Add any notes about deployment experience, issues encountered, customizations made]


```

---

**Deployment verified and ready for use!** ✅
