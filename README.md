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

##  Instructions to Run

###  Postman
1. Open Postman.
2. Import the collection `.json` file.
3. (Optional) Import the environment file.
4. Run all requests manually or with Collection Runner.

###  Robot Framework
1. Make sure `Python`, `pip`, `robotframework`, and `seleniumlibrary` are installed.
2. Install WebDriver (e.g., `chromedriver`) and make sure it matches your browser version.
3. Run the suite:
```bash
robot RobotTests/TestSuite.robot


----------------------TEST CASES OVERVIEW-----------------------

Test Number - Method To test    - What to test -   result
1- create cart - when it takes all parameters correctly it returns 201  -  FAILED
   create cart - when it takes all parameters correctly it returns the cart id created -  PASSED
2- create cart - when it doesn't take product list to add to cart it returns 400  -  FAILED
 - create cart - when it doesn't take product list to add to cart it should Detect that there is no list sent  - PASSED
3- create cart - when it takes empty product list to add to cart it returns 400  -  PASSED
 - create cart - when it takes empty product list to add to cart it should Detect that the list is empty  - PASSED
4- get single cart - When it takes a valid cart ID it should return 200 - PASSED
   get single cart - When it takes a valid cart ID it should return the correct cart with the same ID - PASSED
   get single cart - When it takes a valid cart ID it should return the products in this cart - PASSED
5- get single cart - When it takes a invalid cart ID it should return NULL - PASSED
6- get all carts -  When it is requested to get all carts it should return 200 - PASSED
   get all carts -  When it is requested to get all carts it should return non empty array of the carts- PASSED
7- get all carts - when all carts are requested by an invalid URL it should return not found 404 - PASSED
8- delete cart  - When it takes a valid cart ID to delete it should return 200   - PASSED
---------NOT ADDED YET---------------
   delete cart  - When it takes a valid cart ID to delete it should return the details of this cart   - PASSED 
9- delete cart  - When it takes an invalid cart ID to delete it should return bad request 400   - PASSED

## 🧪 Cart API Test Cases Summary

| Test # | Method to Test     | What to Test                                                                 | Result  |
|--------|---------------------|------------------------------------------------------------------------------|------------|
| 1      | Create Cart         | When it takes all parameters correctly, it returns 201                       | ❌ FAILED |
|        |                     | When it takes all parameters correctly, it returns the cart ID created       | ✅ PASSED |
| 2      | Create Cart         | When it doesn't take product list, it returns 400                            | ❌ FAILED |
|        |                     | Should detect that there is no product list sent                             | ✅ PASSED |
| 3      | Create Cart         | When it takes an empty product list, it returns 400                          | ❌ FAILED |
|        |                     | Should detect that the list is empty                                         | ✅ PASSED |
| 4      | Get Single Cart     | With valid cart ID, should return 200                                        | ✅ PASSED |
|        |                     | Should return the correct cart with the same ID                              | ✅ PASSED |
|        |                     | Should return the products in this cart                                      | ✅ PASSED |
| 5      | Get Single Cart     | With invalid cart ID, should return NULL                                     | ✅ PASSED |
| 6      | Get All Carts       | Should return 200 when all carts are requested                               | ✅ PASSED |
|        |                     | Should return non-empty array of carts                                       | ✅ PASSED |
| 7      | Get All Carts       | With invalid URL, should return 404 Not Found                                | ✅ PASSED |
| 8      | Delete Cart         | With valid cart ID, should return 200                                        | ✅ PASSED |
|        |                     | With valid cart ID, should return the details of this cart                   | ✅ PASSED *(Not added yet)* |
| 9      | Delete Cart         | With invalid cart ID, should return 400 Bad Request                          | ✅ PASSED |




