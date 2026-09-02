# FreshCart - Quick Start Guide

## 🚀 3-Step Quick Start

### Step 1️⃣: Setup Database
Double-click: **`setup-database.bat`**
- Creates the `freshcart` database
- Sets up all tables
- Adds sample products and admin user

### Step 2️⃣: Start Backend
Double-click: **`start.bat`**
- Installs dependencies automatically
- Creates .env file if needed
- Starts server on http://localhost:5000

### Step 3️⃣: Open Frontend
Right-click `client/pages/index.html` → **Open with Live Server**

OR use Python:
```bash
cd client
python -m http.server 5500
```
Then open: http://localhost:5500/pages/index.html

---

## 🧪 Test Connectivity

Open: **`test-connectivity.html`** in your browser
- Click "Test All Endpoints"
- Verify all connections are working
- Check that backend is responding

---

## 📁 Files Created

| File | Purpose |
|------|---------|
| `.env.development` | Environment config template |
| `setup-database.bat` | Database setup script |
| `start.bat` | Server startup script |
| `test-connectivity.html` | API connectivity tester |
| `CONNECTIVITY_GUIDE.md` | Full documentation |

---

## ✅ What's Fixed

- ✅ JavaScript syntax error in `auth.js`
- ✅ Full connectivity setup scripts
- ✅ Environment configuration
- ✅ Database initialization
- ✅ API endpoint testing

---

## 🎯 Default Credentials

After running database setup, use these to login:

**Admin Account:**
- Email: `admin@freshcart.com`  
- Password: `admin123`

**Test Customer:**
- Email: `customer@example.com`
- Password: `password123`

---

## 💡 Quick Commands

```bash
# Install dependencies
npm install

# Start server
npm start

# Create database
setup-database.bat

# Start everything
start.bat
```

---

Your FreshCart website is now fully connected and ready to use! 🎉
