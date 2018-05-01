
function validate()
{
    if(document.getElementById("name").value==="")
    {
        alert("Name cannot be empty ");
        return false;
    }

    if (document.getElementById("login").value === "") {
        alert("Login cannot be empty ");
        return false;
    }

    if (document.getElementById("password").value === "") {
        alert("Password cannot be empty ");
        return false;
    }

    if (document.getElementById("email").value === "") {
        alert("Email cannot be empty ");
        return false;
    }

    if (document.getElementById("NIC").value === "") {
        alert("NIC cannot be empty ");
        return false;
    }

    var alphaExp = /^[A-Za-z\d\s]+$/;
    var numExp = /^[0-9]+$/;
    var alphanumExp = /^[0-9a-zA-Z]+$/;
    if (!document.getElementById("login").value.match(alphanumExp)) {
        alert('Login Must contain alpha num only.');
        return false;
    }

    if (!document.getElementById("name").value.match(alphaExp)) {
        alert('Name Must only contain Alphabets.');
        return false;
    }

    if (!document.getElementById("NIC").value.match(numExp)) {
        alert('NIC Must only contain Numbers.');
        return false;
    }



    var email = document.getElementById("email").value;
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if (atpos < 1 || (dotpos - atpos < 2)) {
        alert("Please enter your correct email.");
        return false;
    }

    return true;
}

function clear()
{
    alert("in clear");
    console.log("adkas");
document.getElementById("name").value = ""; 

document.getElementById("login").value = "";

document.getElementById("password").value = "";

document.getElementById("email").value = "";

document.getElementById("NIC").value = "";

document.getElementById("File1").value = "";

document.getElementById("address").value = "";

document.getElementById("age").value = 0;

document.getElementById("date").value = "";

document.getElementById("Cricket").checked = 'false';
document.getElementById("Hockey").checked = 'false';
document.getElementById("Chess").checked = 'false';

return false;
}

function validateLoginPass()
{
    if (document.getElementById("login").value === "") {
        alert("Login cannot be empty ");
        return false;
    }

    if (document.getElementById("Password").value === "") {
        alert("Password cannot be empty ");
        return false;
    }

    return true;
}

function validateEmail()
{

    var email = document.getElementById("email").value;
    if (email === "") {
        alert("Email cannot be empty ");
        return false;
    }


    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if (atpos < 1 || (dotpos - atpos < 2)) {
        alert("Please enter your correct email.");
        return false;
    }

    return true;
}