<%@ taglib uri="webwork" prefix="ww" %>
<html>
<head>
<title>Login error</title>
<h1>Unable to login</h1>
<ww:iterator value="errorMessages">
    <ww:property/><br>
</ww:iterator>
Error code: <ww:property value="errorCode"/>
<table>
    <tr><td>PSW_RES_OK           </td><td>1</td><td>
    <tr><td>PSW_RES_OK_EXPERING  </td><td>2</td><td>
    <tr><td>PSW_ERR_INV_CONTEXT  </td><td>3</td><td>
    <tr><td>PSW_ERR_INV_USER     </td><td>4</td><td>
    <tr><td>PSW_ERR_INV_PASSWORD </td><td>5</td><td>
    <tr><td>PSE_ERR_EXPIRED      </td><td>6</td><td>
    <tr><td>PSW_ERR_BLOCKED      </td><td>7</td><td>
    <tr><td>PSW_ERR_LOGGED_ON    </td><td>8</td><td>
    <tr><td>PSW_ERR_INV_VERSION  </td><td>9</td><td>
    <tr><td>PSW_ERR_ERROR        </td><td>10</td><td>
    <tr><td>PSW_ERR_SERVER_ERROR </td><td>11</td><td>
    <tr><td>CONNECTION_ERROR     </td><td>100</td><td>
</table>
</head>
</html>


