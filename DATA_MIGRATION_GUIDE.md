# Data Migration Guide: PikaPods → Railway

Complete step-by-step instructions to migrate your ActualBudget data from PikaPods to Railway without losing any data.

---

## Table of Contents

1. [Pre-Migration Checklist](#pre-migration-checklist)
2. [Export from PikaPods](#export-from-pikapods)
3. [Import to Railway](#import-to-railway)
4. [Verify Data Integrity](#verify-data-integrity)
5. [Troubleshooting](#troubleshooting)
6. [Rollback Procedure](#rollback-procedure)

---

## Pre-Migration Checklist

Before starting, ensure you have:

- [ ] Railway account created with $5 free credit
- [ ] ActualBudget deployed on Railway (see main README.md)
- [ ] Railway URL is accessible (logged in, password set)
- [ ] Access to your PikaPods instance
- [ ] 30 minutes of time (most takes 10 min, but allow buffer)
- [ ] **Backup of PikaPods database** (see Export section)
- [ ] Stable internet connection on all devices

---

## Export from PikaPods

### Step 1: Access PikaPods Instance

1. Open your PikaPods ActualBudget URL in browser (saved in bookmarks)
   - URL format: `https://[your-pod-name].pikapod.net/budget/`
2. Enter your **server password** (NOT PikaPods account password)
3. Click on your budget file to open it

### Step 2: Create Backup Export

**⚠️ Important**: Always export your data before migrations.

1. Click **Settings** (gear icon, top right)
2. Scroll down to **Backup** section
3. Click **Export Budget**
   - Downloads a `.zip` file (format: `actual-backup-YYYY-MM-DD.zip`)
4. Save file to secure location (we'll use it for import)

**File Details:**
- Size: Typically 1-10MB depending on transaction volume
- Contains: All accounts, transactions, payees, budgets, reports, settings
- Format: ZIP archive with JSON files inside
- Can be imported into any ActualBudget instance

### Step 3: Document Your Setup

Before export, note these details for verification after import:

```
PikaPods Instance Details:
- [ ] Number of accounts: _____
- [ ] Budget name: ___________________
- [ ] Date range: From ________ to ________
- [ ] Approximate transaction count: _____
- [ ] Custom payee rules count: _____
- [ ] Primary currency: _____
- [ ] Any active scheduled transactions: YES / NO
```

### Step 4: Verify Export File

```bash
# On your computer, verify the ZIP file

# macOS/Linux
ls -lh ~/Downloads/actual-backup-*.zip
unzip -l ~/Downloads/actual-backup-*.zip | head -20

# Windows (PowerShell)
Get-Item "$env:USERPROFILE\Downloads\actual-backup-*.zip" | Select-Object Length
Expand-Archive -Path "$env:USERPROFILE\Downloads\actual-backup-*.zip" -DestinationPath "$env:TEMP\actual-test" -Force
```

**Expected contents:**
```
actual-backup-2026-02-13.zip
├── budget.json          (Main budget file)
├── transactions.json    (All transactions)
├── payees.json         (Payee database)
├── rules.json          (Transaction rules)
└── metadata.json       (Settings & reports)
```

---

## Import to Railway

### Step 1: Access Your Railway Instance

1. Open your Railway URL (from deployment, saved in bookmarks)
   - URL format: `https://[your-app-name].railway.app`
2. Enter your **server password** (set during initial Railway setup)
3. You should see the ActualBudget dashboard

### Step 2: Start Import Process

1. On the main screen, click **Import Budget** (or if in an existing budget, go to **File → Import**)
2. You'll see format options:
   - **Actual Format** ← Select this for PikaPods export
   - nYNAB (for importing from YNAB)
3. Click **"Actual Format"** to select it

### Step 3: Upload Export File

1. Click **Choose File**
2. Navigate to your downloaded `.zip` file (`actual-backup-YYYY-MM-DD.zip`)
3. Select and open the file
4. You'll see upload progress indicator

**Upload Progress:**
- Small budgets (< 5MB): ~10 seconds
- Medium budgets (5-20MB): ~30 seconds
- Large budgets (> 20MB): ~1-2 minutes

### Step 4: Monitor Import Process

During import, you'll see:

```
Importing...
⏳ Reading budget data
⏳ Processing transactions
⏳ Validating payees
⏳ Setting up accounts
✓ Import Complete!
```

**Expected behavior:**
- Page may appear to "freeze" during import (normal)
- Don't close the browser or refresh page
- Import typically takes 1-3 minutes

### Step 5: Verify Initial Import

After import completes, you should see:

```
✓ Budget imported successfully
✓ Your budgets: [List of account names]
✓ Last transaction: [Date and amount]
```

If you see **error**, jump to [Troubleshooting](#troubleshooting) section.

---

## Verify Data Integrity

### Verification Checklist

After successful import, verify all data migrated correctly:

#### 1. Account Verification

- [ ] All accounts present
- [ ] Account balances match PikaPods
- [ ] Account types correct (Checking, Savings, Credit, etc.)

**Action items:**
```
In Railway ActualBudget:
1. Go to Accounts tab
2. Compare with PikaPods screenshot:
   - Count: Does number match?
   - Names: All accounts present?
   - Balances: Amounts match?
```

#### 2. Transaction Verification

- [ ] Transaction count reasonable (~same as documented)
- [ ] Date range is complete
- [ ] Recent transactions visible
- [ ] Amounts correct (no corruption)

**Action items:**
```
1. Go to each account
2. Scroll through recent transactions
3. Spot-check amounts and dates
4. Count sample of transactions vs. PikaPods
```

#### 3. Category/Payee Verification

- [ ] All categories present
- [ ] Payee list intact
- [ ] Custom rules working

**Action items:**
```
1. Click a transaction
2. Verify category is correct
3. Check if payee auto-completes
4. Test auto-categorization on new transaction
```

#### 4. Budget Rules Verification

- [ ] Budget categories with amounts showing
- [ ] Rules are applying to new transactions
- [ ] Reports generating correctly

**Action items:**
```
1. Go to Budget tab
2. Check that budget amounts show
3. Go to Reports
4. Verify spending trends chart loads
```

#### 5. Settings Verification

- [ ] Currency correct
- [ ] Date format matches preference
- [ ] Hidden accounts still hidden
- [ ] Favorite accounts starred

**Action items:**
```
1. Go to Settings → General
2. Check currency selection
3. Verify date format preference
4. Check account visibility settings
```

### Quick Verification Script

**Create a test transaction to verify sync:**

1. Add a new transaction:
   - Account: Any account
   - Date: Today
   - Amount: $1.23
   - Category: Testing
   - Payee: "Test Sync"

2. Refresh page (Ctrl+R / Cmd+R)

3. **Expected**: Transaction still visible after refresh

4. If visible → **Data syncing works! ✓**

5. Delete the test transaction

---

## Handling Large Exports

If your budget export is > 50MB:

### Option 1: Split Export (Recommended)

```
Export in time periods:
1. First export: Transactions up to end of 2024
2. Second export: 2025+ transactions
3. Import first export to Railway
4. Then import second export (will merge)
```

### Option 2: Compress Export

```bash
# Windows 7-Zip (if available)
7z a -tzip -mx=9 actual-budget-compressed.zip actual-backup-*.zip

# macOS/Linux
zip -r -9 actual-budget-compressed.zip actual-backup-*/
```

### Option 3: Direct Data Migration

For very large budgets (>100MB), consider:

1. Export only recent 2 years of transactions
2. Archive older transactions separately
3. Import recent transactions to Railway
4. Keep archive for reference

---

## Troubleshooting

### Issue: "Import Failed - Unknown Error"

**Possible Causes:**

**Cause 1: File format issue**
```
✓ Solution:
1. Download fresh export from PikaPods
2. Ensure file is .zip (not renamed)
3. Don't modify file after download
4. Try import again
```

**Cause 2: Category naming conflict**
```
✓ Solution:
1. Open the .zip file on your computer
2. Extract and open budget.json in text editor
3. Search for "Income" category group
4. If found, rename to "Income 2026"
5. Re-zip the folder
6. Try import again
```

**Cause 3: File too large**
```
✓ Solution:
1. Export in smaller time periods
2. Delete very old transactions from PikaPods
3. Export again with recent data only
4. Try import again
```

### Issue: "Import Appears Stuck"

```
✓ Solution:
1. Wait full 5 minutes (large imports take time)
2. Check browser console for errors (F12)
3. Try from different browser (Chrome vs Firefox)
4. Check internet connection (no packet loss)
5. If still stuck after 10 min, reload and try again
```

### Issue: "Accounts Missing After Import"

```
✓ Solution:
1. Check if accounts are hidden (Settings → Account visibility)
2. Try toggling account visibility
3. Go to All Accounts view
4. If still missing:
   - Delete budget from Railway
   - Export fresh from PikaPods
   - Import again
```

### Issue: "Transaction Amounts Wrong"

```
✓ Solution:
1. Check currency settings (Settings → General)
2. Compare transaction with PikaPods original
3. If off by factor (like 100x), likely decimal issue
4. Export from PikaPods again and re-import
5. If persists, check for special characters in amounts
```

### Issue: "Can't Access Railway URL"

```
✓ Solution:
1. Verify Railway app is deployed (railway status)
2. Check app logs for errors (railway logs)
3. Try redeploy: railway up
4. Ensure password was set during initial setup
5. Try incognito/private browser mode
```

---

## Post-Migration Steps

### Update Bookmarks

```
Remove:
- https://[old-pod].pikapod.net/budget/

Add:
- https://[new-railway-app].railway.app
```

### Install PWA (Recommended)

**Desktop:**
- Chrome: Three dots → "Install app"
- Firefox: Right-click URL bar → "Create bookmark"
- Safari: Share → "Add to Home Screen"

**Mobile:**
- iOS: Share → "Add to Home Screen"
- Android: Three dots → "Install app"

### Test Multi-Device Sync

1. Add transaction on Desktop
2. Wait 5 seconds
3. Refresh on Mobile
4. **Expected**: Transaction appears

### Archive Export Files

```
Store backups securely:
1. Keep latest export in encrypted cloud storage
2. Delete auto-exported copies
3. Consider encrypted external drive backup
4. Document where backups are stored
```

---

## Rollback Procedure

If something goes wrong and you need to revert to PikaPods:

### Quick Rollback (within 24 hours)

```
1. PikaPods instance is still running
2. Simply go back to PikaPods URL
3. Your data is exactly as before
4. No data loss occurs
```

### Full Rollback (any time)

```
1. Export backup from Railway (Settings → Backup → Export)
2. Log into PikaPods
3. Create new budget → Import
4. Select Railway export file
5. PikaPods now has Railway data as backup
```

### Data Recovery

If data corrupted during migration:

```
1. Use your original export file (from Step 2)
2. Delete all data from Railway
3. Re-import original file
4. Manually add any new transactions since export
```

---

## FAQ

**Q: Will I lose any data during migration?**
A: No. Export creates complete snapshot. Import adds all data. Nothing is deleted unless you explicitly delete it.

**Q: Can I run both PikaPods and Railway simultaneously?**
A: Yes. Good practice during testing. Keep PikaPods as backup for 1-2 weeks.

**Q: What if import fails halfway?**
A: Simply try import again. Actual Budget handles partial imports gracefully.

**Q: Can I merge data from two different PikaPods instances?**
A: Advanced scenario. Export from both, import first, then import second (will merge accounts).

**Q: How often should I backup?**
A: Weekly recommended. Use scheduled backups (see README.md for automation).

**Q: What if file is corrupted?**
A: Export again from PikaPods. Previous exports may have the same issue.

---

## Success! 🎉

If you've completed all verification checks, your migration is successful!

**Next steps:**
1. ✓ Update bookmarks to Railway URL
2. ✓ Install PWA on devices
3. ✓ Set weekly backup schedule
4. ✓ Consider canceling PikaPods subscription (after 1-2 week safety period)
5. ✓ Share Railway URL with family members if desired

---

**Questions?** Check [Troubleshooting](#troubleshooting) or open GitHub issue.
