##  Instructions to Run

###  Postman
### 1. Import the Collection
- Open Postman.
- Click **Import** (top left).
- Choose the file `CollectionName.postman_collection.json`.

### 2. Import the Environment (Optional)
- Go to the **Environments** tab.
- Click **Import** and select `EnvironmentName.postman_environment.json`.
- Set the imported environment as **active** (top-right dropdown).

### 3. Run the Collection
- In the left sidebar, open the collection.
- Click **Run** to open the Collection Runner.
- Select the environment.
- Click **Start Run**.

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
2- create cart - when it doesn't take product list to add to cart it returns 400  -  PASSED
 - create cart - when it doesn't take product list to add to cart it should Detect that there is no list sent  - PASSED
3- create cart - when it takes empty product list to add to cart it returns 400  -  FAILED
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
10- create user - when it takes all parameters correctly it returns 200 - PASSED  
   create user - when it takes all parameters correctly it returns a user ID - PASSED  
   create user - when it takes all parameters correctly it should return a numeric user ID - PASSED 
   create user - when it sends a request with missing fields it should return 400 - PASSED  
   create user - when the password is missing it should detect the missing field - PASSED 
11- get all users - when the request is valid it should return status 200 - PASSED  
    get all users - when the request is valid it should return a non-empty array of users - PASSED 
    get all users - when requested with an invalid URL it should return status 404 - PASSED  
12- login user - when correct username and password are provided it should return status 200 - PASSED  
   login user - when correct credentials are provided it should return a token - PASSED   
   login user - when username is missing it should return status 400 - PASSED       


| Test # | Method to Test     | What to Test                                                                 | Result  |
|--------|---------------------|------------------------------------------------------------------------------|------------|
| 1      | Create Cart         | When it takes all parameters correctly, it returns 201                       | ❌ FAILED |
|        |                     | When it takes all parameters correctly, it returns the cart ID created       | ✅ PASSED |
| 2      | Create Cart         | When it doesn't take product list, it returns 400                            | ✅ PASSED |
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
| 10     | Create User         | When it takes all parameters correctly, it returns 200                       | ✅ PASSED |
|        |                     | When it takes all parameters correctly, it returns a user ID                 | ✅ PASSED |
|        |                     | Should return a numeric user ID                                              | ✅ PASSED |
|        |                     | When a request with missing fields is sent, it returns 400                   | ✅ PASSED |
|        |                     | Should detect that the password is missing                                   | ✅ PASSED |
| 11     | Get All Users       | When the request is valid, it returns status 200                             | ✅ PASSED |
|        |                     | Should return a non-empty array of users                                     | ✅ PASSED |
|        |                     | With invalid URL, should return status 404                                   | ✅ PASSED |
| 12     | Login User          | With correct username and password, should return status 200                 | ✅ PASSED |
|        |                     | With valid credentials, should return a token                                | ✅ PASSED |
|        |                     | When username is missing, should return status 400                           | ✅ PASSED |