# Software Testing & QA Course

## Question 1: API Testing using Postman

###  API Used
[Fakestore API](https://fakestoreapi.com/)

###  Test Scenarios
1. **Create User** - `POST /users` → Valid user creation and ID response.
2. **Get All Users** - `GET /users` → Non-empty user list and status 200.
3. **Login User** - `POST /auth/login` → Valid login returns token.
4. **Get All Products** - `GET /products` → Valid status and list.
5. **Get Product by ID** - `GET /products/1` → Response contains title field.
6. **Create Cart** - `POST /carts` → Valid body returns cart ID and status 201.
7. **Get Single Cart by ID** - `GET /carts/1` → Contains userId and product list.
8. **Delete Cart** - `DELETE /carts/1` → Status 200.
9. **Get All Carts** - `GET /carts` → Non-empty response.
10. **Negative Tests**:
    - Invalid login
    - Missing user fields
    - Wrong product ID
    - Malformed request body

---

##  Question 2: UI Testing with Robot Framework + Selenium

- Each test automates real user behavior on [AliExpress](https://www.aliexpress.com/)

### Test Cases
1. **Search Product**
   - Enters search query (e.g., "smart watch")
   - Verifies relevant results appear

2. **Filter by Category**
   - Applies price range filter (e.g., 580–1249)
   - Confirms results update and filter UI reflects selection

3. **Add to Cart**
   - Selects product from search
   - Adds item to cart and verifies cart content

4. **Change Website Language**
   - Opens language selector
   - Changes language (e.g., Arabic)
   - Verifies interface reflects selected language

5. **User Login**
   - Opens Sign In page
   - Enters valid credentials
   - Verifies dashboard or welcome message

6. **Change Currency**
   - Opens currency settings
   - Changes from EGP to USD
   - Verifies updated prices across page

###  Bonus (Optional)
7. **Product Image Zoom**
8. **Change Shipping Destination**


---

