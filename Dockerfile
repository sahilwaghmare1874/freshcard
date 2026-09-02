FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application code
COPY server ./server
COPY client ./client

# Create uploads directory
RUN mkdir -p server/uploads/products

# Expose port
EXPOSE 5000

# Start application
CMD ["npm", "start"]
