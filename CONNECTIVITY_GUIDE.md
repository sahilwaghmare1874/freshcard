# FreshCart - Full Connectivity Guide

## 🚀 Quick Start (3 Easy Steps)

### Step 1: Setup Database
```bash
# Double-click this file or run:
setup-database.bat
```
Enter your MySQL root password when prompted.

### Step 2: Start Backend Server
```bash
# Double-click this file or run:
start.bat
```
Server will start on `http://localhost:5000`

### Step 3: Open Frontend
- **Option A**: Right-click `client/pages/index.html` → Open with Live Server
- **Option B**: Run in new terminal:
  ```bash
  cd client
  python -m http.server 5500
  ```
  Then open: `http://localhost:5500/pages/index.html`

---

## 🔗 Full System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                       USER BROWSER                           │
│                  http://localhost:5500                       │
└────────────────────┬────────────────────────────────────────┘
                     │
                     │ HTML/CSS/JavaScript
                     ↓
┌─────────────────────────────────────────────────────────────┐
│                    FRONTEND (Client)                         │
│  Pages: index.html, products.html, cart.html, etc.         │
│  Scripts: api.js, auth.js, cart.js, components.js          │
└────────────────────┬────────────────────────────────────────┘
                     │
                     │ HTTP/AJAX Requests
                     │ (API calls to /api/*)
                     ↓
┌─────────────────────────────────────────────────────────────┐
│              BACKEND SERVER (Express.js)                     │
│                http://localhost:5000                         │
├─────────────────────────────────────────────────────────────┤
│  Routes:                                                     │
│  - /api/auth       → Authentication (login, signup)         │
│  - /api/products   → Product listing, search                │
│  - /api/cart       → Shopping cart operations               │
│  - /api/orders     → Order management                       │
│  - /api/payment    → Payment processing (Stripe)            │
│  - /api/admin      → Admin dashboard & management           │
└────────────────────┬────────────────────────────────────────┘
                     │
                     │ SQL Queries
                     ↓
┌─────────────────────────────────────────────────────────────┐
│              MySQL DATABASE (freshcart)                      │
│                    localhost:3306                            │
├─────────────────────────────────────────────────────────────┤
│  Tables:                                                     │
│  - users          → User accounts & authentication          │
│  - products       → Product catalog                         │
│  - categories     → Product categories                      │
│  - carts          → Shopping carts                          │
│  - cart_items     → Items in carts                          │
│  - orders         → Customer orders                         │
│  - order_items    → Order line items                        │
│  - payments       → Payment transactions                    │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔌 API Endpoint Connectivity

### Authentication Endpoints
```
POST   /api/auth/signup          - Create new account
POST   /api/auth/login           - User login
GET    /api/auth/me              - Get current user (protected)
PUT    /api/auth/profile         - Update profile (protected)
POST   /api/auth/forgot-password - Request password reset
POST   /api/auth/reset-password  - Reset password with token
```

### Product Endpoints
```
GET    /api/products              - List all products (with filters)
GET    /api/products/:id          - Get single product
GET    /api/products/search/suggestions - Search autocomplete
GET    /api/categories            - List all categories
```

### Cart Endpoints (Protected - Requires Login)
```
GET    /api/cart                  - Get user's cart
POST   /api/cart/items            - Add item to cart
PUT    /api/cart/items/:id        - Update cart item quantity
DELETE /api/cart/items/:id        - Remove item from cart
DELETE /api/cart                  - Clear entire cart
```

### Order Endpoints (Protected)
```
POST   /api/orders                - Create new order
GET    /api/orders                - List user's orders
GET    /api/orders/:id            - Get order details
```

### Payment Endpoints (Protected)
```
POST   /api/payment/create-intent - Create Stripe payment intent
GET    /api/payment/status/:orderId - Check payment status
POST   /api/payment/webhook       - Stripe webhook (public)
```

### Admin Endpoints (Requires Admin Role)
```
GET    /api/admin/analytics/overview     - Dashboard statistics
GET    /api/admin/analytics/sales-chart  - Sales chart data
GET    /api/admin/analytics/top-products - Top selling products
GET    /api/admin/products/low-stock     - Low stock alerts
GET    /api/admin/orders                 - All orders
PUT    /api/admin/orders/:id/status      - Update order status
POST   /api/admin/products               - Create product
PUT    /api/admin/products/:id           - Update product
DELETE /api/admin/products/:id           - Delete product
GET    /api/admin/users                  - List all users
PUT    /api/admin/users/:id/role         - Update user role
```

---

## 🔐 Authentication Flow

```
1. User enters credentials on frontend
   ↓
2. Frontend sends POST to /api/auth/login
   ↓
3. Backend validates credentials against database
   ↓
4. Backend generates JWT token
   ↓
5. Frontend stores token in localStorage
   ↓
6. Frontend includes token in Authorization header for protected routes
   ↓
7. Backend middleware validates token on each protected request
```

---

## 🧪 Testing Connectivity

### Test Backend Health
```bash
curl http://localhost:5000/health
```
Expected response:
```json
{
  "success": true,
  "message": "FreshCart API is running",
  "timestamp": "2025-11-26T00:56:43.000Z"
}
```

### Test Database Connection
Server console should show:
```
✓ Database connected successfully
🛒 FreshCart server running on port 5000
📍 Environment: development
🌐 Frontend URL: http://localhost:5500
```

### Test Frontend-Backend Connection
1. Open browser console (F12)
2. Navigate to homepage
3. Should see products loading
4. No CORS errors
5. No 404 errors for API calls

---

## 📝 Environment Variables Explained

| Variable | Purpose | Example |
|----------|---------|---------|
| `NODE_ENV` | Environment mode | `development` or `production` |
| `PORT` | Backend server port | `5000` |
| `DB_HOST` | MySQL server address | `localhost` |
| `DB_USER` | MySQL username | `root` |
| `DB_PASSWORD` | MySQL password | Your MySQL password |
| `DB_NAME` | Database name | `freshcart` |
| `JWT_SECRET` | Secret key for tokens | Random strong string |
| `FRONTEND_URL` | Frontend origin for CORS | `http://localhost:5500` |
| `STRIPE_SECRET_KEY` | Stripe API key | Test key from Stripe dashboard |

---

## 🐛 Troubleshooting Connectivity Issues

### Backend won't start
- ✅ Check if MySQL is running
- ✅ Verify `.env` file exists
- ✅ Run `npm install` to install dependencies
- ✅ Check if port 5000 is available

### Database connection fails
- ✅ Verify MySQL is running on port 3306
- ✅ Check MySQL credentials in `.env`
- ✅ Ensure `freshcart` database exists
- ✅ Run `setup-database.bat` to create schema

### Frontend can't connect to backend
- ✅ Check backend is running on port 5000
- ✅ Verify `API_BASE_URL` in `client/assets/js/api.js`
- ✅ Check CORS settings in `server/server.js`
- ✅ Verify `FRONTEND_URL` in `.env` matches your frontend URL

### CORS errors in browser
- ✅ Update `FRONTEND_URL` in `.env` to match your frontend port
- ✅ Restart backend server after changing `.env`
- ✅ Check browser console for specific CORS error details

### 404 errors on API calls
- ✅ Check network tab in browser dev tools
- ✅ Verify API endpoint URLs in `client/assets/js/api.js`
- ✅ Check server logs for route registration
- ✅ Ensure backend routes are properly loaded

---

## 🎯 Connectivity Checklist

Before running the application, ensure:

- [x] ✅ JavaScript syntax error in `auth.js` fixed
- [ ] ✅ MySQL installed and running
- [ ] ✅ Node.js installed (v14+)
- [ ] ✅ `.env` file created with correct credentials
- [ ] ✅ Database `freshcart` created and seeded
- [ ] ✅ Dependencies installed (`npm install`)
- [ ] ✅ Backend server starts without errors
- [ ] ✅ Frontend served on port 5500
- [ ] ✅ No CORS errors in browser console
- [ ] ✅ Products load on homepage
- [ ] ✅ Login/signup functionality works

---

## 🚀 Production Deployment Notes

When deploying to production:

1. **Update Environment**:
   - Set `NODE_ENV=production`
   - Use strong `JWT_SECRET`
   - Add real Stripe keys
   - Configure production database

2. **Security**:
   - Enable HTTPS
   - Set proper CORS origins
   - Use environment-specific credentials
   - Enable rate limiting

3. **Database**:
   - Use production MySQL instance
   - Enable SSL for database connections
   - Set up regular backups

4. **Frontend**:
   - Update `API_BASE_URL` to production domain
   - Build and minify assets
   - Enable caching headers

---

## 📞 Support

If you encounter any connectivity issues:
1. Check the troubleshooting section above
2. Review browser console for errors (F12)
3. Check server terminal for error logs
4. Verify all services are running

**All connectivity configured! Your FreshCart system is ready to run.** 🎉
