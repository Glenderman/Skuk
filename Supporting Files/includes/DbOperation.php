<?php
/**
* Created by PhpStorm.
* User: sgggrif2
* Date: 22/04/19
* Time: 8:39 PM
*/

ini_set('display_errors', 1);

class DbOperation
{
    private $conn;
 
    function __construct()
    {
        require_once dirname(__FILE__) . '/Constants.php';
        require_once dirname(__FILE__) . '/DbConnect.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }
 
    /*
     * This method is added
     * We are taking username and password
     * and then verifying it from the database
     * */
 
    public function userLogin($username, $pass)
    {
        $password = md5($pass);
        $stmt = $this->conn->prepare("SELECT UserID FROM user_table WHERE Username = ? AND Password = ?");
        $stmt->bind_param("ss", $username, $password);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }
 
    /*
     * After the successful login we will call this method
     * this method will return the user data in an array
     * */
 
    public function getUserByUsername($username)
    {
        $stmt = $this->conn->prepare("SELECT id, username, email FROM users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($id, $uname, $email);
        $stmt->fetch();
        $user = array();
        $user['id'] = $id;
        $user['username'] = $uname;
        $user['email'] = $email;
        return $user;
    }
 
    public function createUser($username, $pass, $email, $name)
    {
        if (!$this->isUserExist($username)) {
            $password = md5($pass);
            $stmt = $this->conn->prepare("INSERT INTO user_table (Username, Password, Email, Name) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("ssss", $username, $password, $email, $name);
            if ($stmt->execute()) {
                return USER_CREATED;
            } else {
                return USER_NOT_CREATED;
            }
        } else {
            return USER_ALREADY_EXIST;
        }
    }
 
 
    private function isUserExist($username)
    {
        $stmt = $this->conn->prepare("SELECT UserID FROM user_table WHERE Username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }
    
         
     public function createRecipe($method, $recipeName)
     {
         $stmt = $this->conn->prepare("INSERT INTO recipe_table (Method, RecipeName, Published) VALUES (?, ?, ?,)");
         $stmt->bind_param("sss", $method, $recipeName, 'CURDATE()');
         $stmt->execute(); 
     }
}