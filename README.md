# OneStop - One-Stop E-commerce Platform System

## Project Introduction
OneStop is a comprehensive e-commerce platform system developed based on Spring Boot and Vue.js, providing a complete e-commerce solution including user shopping, merchant management, administrator backend, and other functional modules. The system supports multi-role permission management and features core e-commerce functionalities such as product browsing, search, shopping cart, order management, and payment.

## System Architecture

### Frontend Architecture
- **Framework**: Vue 2.x
- **Routing Management**: Vue Router 3.x
- **UI Component Library**: Element UI
- **HTTP Requests**: Axios
- **Rich Text Editor**: wangEditor
- **Animation Effects**: animejs

### Backend Architecture
- **Framework**: Spring Boot 2.5.9
- **ORM Framework**: MyBatis
- **Database**: MySQL 8.0+
- **Authentication & Authorization**: JWT (JSON Web Token)
- **Object Storage**: MinIO 8.5.10
- **Caching**: Caffeine
- **Pagination Plugin**: PageHelper
- **API Documentation**: Swagger 3.0.0
- **Utility Library**: Hutool
- **Database Migration**: Flyway

## Functional Modules

### 1. User Module
- User registration and login
- Personal information management
- Address management
- Password modification

### 2. Product Module
- Product browsing and searching
- Product category display
- Product detail viewing
- Product reviews and ratings

### 3. Shopping Cart Module
- Add products to shopping cart
- Modify shopping cart product quantity
- Delete products from shopping cart
- Shopping cart checkout

### 4. Order Module
- Create orders
- Order status management
- Order history query
- Order detail viewing

### 5. Favorites Module
- Product collection
- Collection management

### 6. Merchant Module
- Merchant registration and verification
- Merchant information management
- Product management (add, modify, delete)
- Order management

### 7. Administrator Module
- User management
- Merchant management and verification
- Product management
- Order management
- Comment management
- Category management
- Announcement management

## Database Design
The system contains the following main data tables:
- `user` - User information table
- `admin` - Administrator information table
- `business` - Merchant information table
- `goods` - Product information table
- `type` - Product category table
- `orders` - Order information table
- `cart` - Shopping cart table
- `collect` - Collection information table
- `comment` - Comment information table
- `address` - Address information table
- `notice` - Announcement information table

## Deployment Guide

### Environment Requirements
- JDK 17+
- MySQL 8.0+
- Node.js 14+
- Maven 3.6+
- MinIO server (for file storage)

### MinIO Configuration (File Storage Service)
1. Download MinIO server
   Download the MinIO server suitable for your operating system from [MinIO official website](https://min.io/download)

2. Start MinIO service
   ```bash
   # Windows system
   minio.exe server D:\Program Files\Minio\minio-data --console-address ":9001"
   
   # Linux/Mac system
   ./minio server /path/to/minio-data --console-address ":9001"
   ```

3. Configure MinIO
   - Access MinIO console: `http://localhost:9001`
   - Login with default credentials: minioadmin/minioadmin (it is recommended to change the password after first login)
   - Create a bucket named `files`
   - Set the bucket's access policy to `public` (allowing public access to files)

### Backend Deployment
1. Clone the project locally
   ```bash
   git clone [project address]
   cd OneStop/springboot
   ```

2. Import database script
   ```bash
   mysql -u root -p < ../OneStop.sql
   ```

3. Configure application parameters
   - Modify database connection information in `src/main/resources/application.yml`
   - Configure MinIO connection information (address, access key, secret key, etc.)

4. Build and run the project
   ```bash
   mvn clean package
   java -jar target/springboot-0.0.1-SNAPSHOT.jar
   ```

### Frontend Deployment
1. Enter the frontend directory
   ```bash
   cd ../vue
   ```

2. Install dependencies
   ```bash
   npm install
   ```

3. Run in development environment
   ```bash
   npm run serve
   ```

4. Build for production environment
   ```bash
   npm run build
   ```
   The built files are in the `dist` directory and can be deployed to web servers like Nginx

### System Access
- Frontend access address: `http://localhost:8080`
- Administrator login address: `http://localhost:8080/login`
- Default administrator account: admin / admin

## System Screenshots
The following are screenshots of the system's main functional modules:

### Home Page Display
![Home Display 1](images/home-1.png)
![Home Display 2](images/home-2.png)
![Home Display 3](images/home-3.png)
![Home Category Display](images/home-category.png)

### User & Login
![Login Interface](images/login.png)
![Register Interface](images/register.png)

### Product Module
![Product Detail 1](images/goods-detail-1.png)
![Product Detail 2](images/goods-detail-2.png)
![Product Reviews](images/goods-reviews.png)

### Shopping Cart & Orders
![Shopping Cart Interface](images/cart.png)
![My Orders](images/orders.png)
![Address Management](images/address.png)
![Address Edit](images/address-edit.png)

### Personal Center
![My Favorites](images/myFavorite.png)

### Merchant Store
![Merchant Store](images/shop-home.png)

### Administrator Backend
![Administrator Home](images/admin-home.png)
![Product Management](images/admin-goods.png)
![Product Edit](images/admin-goods-edit.png)
![Product Detail Management](images/admin-goods-detail.png)
![Category Management](images/admin-categoryList.png)
![Order Management](images/admin-order.png)
![User Management](images/admin-user.png)
![Merchant Management](images/admin-shop.png)
![Announcement Management](images/admin-notice.png)
![Comment Management](images/admin-review.png)

### MinIO File Management
![MinIO Interface 1](images/minio-1.png)
![MinIO Interface 2](images/minio-2.png)

## License
[MIT License](LICENSE)

## Contact Information
For questions or suggestions, please contact the project development team.