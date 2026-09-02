# 🛒 FreshCart - Modern Grocery E-commerce Platform

A full-stack grocery e-commerce platform built with **Node.js**, **Express**, **MySQL**, and vanilla **HTML/CSS/JavaScript**. Inspired by Blinkit and BigBasket.

## ✨ Features

### Customer Features
- 🔐 User authentication (signup, login, password reset)
- 🛍️ Browse products by organic/inorganic categories
- 🔍 Advanced search with auto-suggestions
- 🛒 Shopping cart management
- 💳 Secure checkout with Stripe payment integration
- 📦 Order history and tracking
- 👤 User profile management

### Admin Features
- 📊 Analytics dashboard with charts
- 📦 Product management (CRUD operations)
- 🏷️ Category management
- 📋 Order management
- 👥 User management
- ⚠️ Low stock alerts
- 📥 CSV export for orders

### Technical Features
- 🔒 Secure JWT-based authentication
- 💾 MySQL database with proper indexing
- 🎨 Modern, responsive UI with smooth animations
- 📱 Mobile-first design
- 🚀 RESTful API architecture
- 🔔 Real-time notifications
- 📧 Email notifications (password reset, order confirmation)

## 🛠️ Tech Stack

### Backend
- **Node.js** with **Express.js**
- **MySQL** (v8.0+)
- **JWT** for authentication
- **Bcrypt** for password hashing
- **Stripe** for payment processing
- **Nodemailer** for emails
- **Multer** for file uploads

### Frontend
- Vanilla **JavaScript** (ES6+)
- **HTML5** & **CSS3**
- **Inter** font from Google Fonts
- No frontend frameworks - pure web standards

### DevOps
- **Docker** & **Docker Compose**
- **Git** for version control

## 📋 Prerequisites

- Node.js >= 18.x
- MySQL >= 8.0
- npm or yarn
- Docker & Docker Compose (optional)

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone <repository-url>
cd freshcart
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Environment Configuration
Create a `.env` file in the root directory:
```env
# Server
NODE_ENV=development
PORT=5000

# Database
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=freshcart
DB_PORT=3306

# JWT
JWT_SECRET=your_super_secret_jwt_key_change_this
JWT_EXPIRE=7d

# Stripe (Test Mode)
STRIPE_SECRET_KEY=sk_test_your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=pk_test_your_stripe_publishable_key
STRIPE_WEBHOOK_SECRET=whsec_your_webhook_secret

# Email (SMTP)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=your_app_specific_password
EMAIL_FROM=FreshCart <noreply@freshcart.com>

# Frontend
FRONTEND_URL=http://localhost:5500
```

### 4. Database Setup
```bash
# Login to MySQL
mysql -u root -p

# Run schema
mysql -u root -p < database/schema.sql

# Run seed data
mysql -u root -p < database/seed.sql
```

### 5. Start the Server
```bash
# Development mode with nodemon
npm run dev

# Production mode
npm start
```

The server will run on `http://localhost:5000`

### 6. Frontend Development
Open `client/pages/index.html` in a browser or use a development server:
```bash
# Using Python
python -m http.server 5500

# Using Node.js
npx serve client -p 5500
```

## 🐳 Docker Setup

### Using Docker Compose
```bash
# Build and start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

The application will be available at `http://localhost:5000`

## 📁 Project Structure

```
freshcart/
├── client/                  # Frontend files
│   ├── assets/
│   │   ├── css/            # Stylesheets
│   │   │   ├── main.css        # Design system & utilities
│   │   │   ├── components.css  # Component styles
│   │   │   └── pages.css       # Page-specific styles
│   │   ├── js/             # JavaScript modules
│   │   │   ├── api.js          # API client
│   │   │   ├── auth.js         # Authentication
│   │   │   ├── cart.js         # Cart management
│   │   │   ├── components.js   # UI components
│   │   │   └── utils.js        # Utilities
│   │   └── images/         # Image assets
│   └── pages/              # HTML pages
│       ├── index.html          # Home page
│       ├── products.html       # Product listing
│       ├── product.html        # Product detail
│       ├── cart.html           # Shopping cart
│       ├── checkout.html       # Checkout
│       ├── login.html          # Login
│       ├── signup.html         # Registration
│       ├── profile.html        # User profile
│       ├── orders.html         # Order history
│       └── admin.html          # Admin dashboard
├── server/                  # Backend files
│   ├── controllers/        # Request handlers
│   ├── models/             # Database models
│   ├── routes/             # API routes
│   ├── middleware/         # Custom middleware
│   ├── utils/              # Utility functions
│   ├── uploads/            # File uploads
│   ├── server.js           # App entry point
│   └── config.js           # Configuration
├── database/
│   ├── schema.sql          # Database schema
│   └── seed.sql            # Sample data
├── docker-compose.yml      # Docker orchestration
├── Dockerfile              # Docker image config
├── package.json            # Dependencies
└── README.md               # This file
```

## 🔑 Default Credentials

### Admin Account
- **Email**: admin@freshcart.com
- **Password**: Password123!

### Test Customer Account
- **Email**: john@example.com
- **Password**: Password123!

## 📡 API Endpoints

### Authentication
- `POST /api/auth/signup` - Register new user
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/reset-password` - Reset password

### Products
- `GET /api/products` - List products (with filters & pagination)
- `GET /api/products/:id` - Get product details
- `GET /api/products/search/suggestions` - Search autocomplete

### Categories
- `GET /api/categories` - List all categories

### Cart (Protected)
- `GET /api/cart` - Get user cart
- `POST /api/cart/items` - Add item to cart
- `PUT /api/cart/items/:id` - Update cart item
- `DELETE /api/cart/items/:id` - Remove cart item

### Orders (Protected)
- `POST /api/orders` - Create order
- `GET /api/orders` - Get order history
- `GET /api/orders/:id` - Get order details

### Payment (Protected)
- `POST /api/payment/create-intent` - Create Stripe payment
- `POST /api/payment/webhook` - Stripe webhook handler
- `GET /api/payment/status/:orderId` - Get payment status

### Admin (Protected - Admin Only)
- `GET /api/admin/analytics/overview` - Dashboard stats
- `GET /api/admin/analytics/sales-chart` - Sales data
- `GET /api/admin/analytics/top-products` - Best sellers
- `POST /api/admin/products` - Create product
- `PUT /api/admin/products/:id` - Update product
- `DELETE /api/admin/products/:id` - Delete product
- `GET /api/admin/products/low-stock` - Low stock alerts
- `GET /api/admin/orders` - List all orders
- `PUT /api/admin/orders/:id/status` - Update order status
- `GET /api/admin/users` - List users
- `GET /api/admin/orders/export` - Export orders to CSV

## 💳 Stripe Payment Integration

### Test Cards
```
Success: 4242 4242 4242 4242
Decline: 4000 0000 0000 0002
```
- Use any future expiry date
- Use any 3-digit CVC

### Webhook Setup (Development)
```bash
# Install Stripe CLI
brew install stripe/stripe-cli/stripe

# Login
stripe login

# Forward webhooks
stripe listen --forward-to localhost:5000/api/payment/webhook
```

## 📧 Email Configuration

### Using Gmail
1. Enable 2-factor authentication
2. Generate an App Password
3. Use the app password in EMAIL_PASSWORD

### Using SendGrid
1. Create SendGrid account
2. Get API key
3. Configure SMTP settings

## 🚀 Deployment

### VPS/Cloud Deployment (Ubuntu/Debian)

1. **Install Dependencies**
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install MySQL
sudo apt install -y mysql-server

# Install PM2
sudo npm install -g pm2
```

2. **Setup MySQL**
```bash
sudo mysql_secure_installation
```

3. **Clone & Configure**
```bash
git clone <repository-url>
cd freshcart
npm install --production
cp .env.example .env
# Edit .env with production values
```

4. **Setup Database**
```bash
mysql -u root -p < database/schema.sql
mysql -u root -p < database/seed.sql
```

5. **Start with PM2**
```bash
pm2 start server/server.js --name freshcart
pm2 save
pm2 startup
```

6. **Setup Nginx**
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

7. **SSL with Let's Encrypt**
```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com
```

## 🔒 Security Checklist

- ✅ Passwords hashed with bcrypt
- ✅ JWT token-based authentication
- ✅ SQL injection protection (parameterized queries)
- ✅ XSS protection (input validation)
- ✅ CORS configured
- ✅ Rate limiting on auth endpoints
- ✅ Helmet.js security headers
- ✅ Environment variables for sensitive data

## 🎨 Design Philosophy

- **Mobile-First**: Responsive design that works on all devices
- **Modern UI**: Clean, minimal interface with smooth animations
- **Performance**: Optimized assets, lazy loading, pagination
- **Accessibility**: Semantic HTML, ARIA labels where needed
- **User Experience**: Intuitive navigation, helpful feedback

## 🧪 Testing

```bash
# Test API endpoints
npm run test

# Check health
curl http://localhost:5000/health
```

## 📝 License

MIT License - feel free to use this project for personal or commercial purposes.

## 👨‍💻 Author

FreshCart Team

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

For support, email support@freshcart.com or open an issue.

---

**Built with ❤️ using Node.js, Express, MySQL, and lots of coffee ☕**
