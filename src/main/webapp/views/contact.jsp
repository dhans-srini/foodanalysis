<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FAS-Contact</title>
</head>
<body>
<!-- Header Jsp  -->
<%@ include file="header.jsp" %>

<div style="width:80%;height:80%; margin: 0 auto;">
<div style="text-align: center;">
</div>
<!--  <img src="img/contact_image.jpg" alt=""> -->
<br/>

<section>
</br>
<table>
<tr> 
<td> Enter Your First Name : </td>
<td> <input type="text" name="name" > </td> </tr>
<tr>
<td> Contact No. : </td>
<td> <input type="text" name="name" > </td> </tr>
<tr>
<td> Enter recipient Email Address : </td>
<td> <input type="text" name="name" > </td> </tr>  </table>
<br/>
<textarea rows="10" cols="50" placeholder = "Please ask your question here in 50-100 words and you can send it to any of the recipient mentioned below"></textarea>
<br/> <br/>
<div style="width:70%;">
<table border="1">
  <tr>
    <th>NAME</th>
    <th>EMAILID</th> 
    <th>Modile</th>
  </tr>
  <tr>
    <td>Abhishek Kesanapalli </td>
    <td>kesanapallia@mail.sacredheart.edu</td>
    <td>203-685-7473</td>
  </tr>
  <tr>
    <td>Mohammed Sayerwala</td>
    <td>Sayerwalam@mail.sacredheart.edu</td>
    <td>203-540-7127</td>
  </tr>
  <tr>
    <td>Vishnu Mallipudi</td>
    <td>maliipudiv@mail.sacredheart.edu</td>
    <td>425-647-7673</td>
  </tr>
  <tr>
    <td>Mihir Desai</td>
    <td>deasim@mail.sacredheart.edu</td>
    <td>203-908-1843</td>
  </tr>
  <tr>
    <td>Sravan Kumar Reddy</td>
    <td>Reddys@mail.sacredheart.edu</td>
    <td>203-895-9334</td>
  </tr>
</table>

</div>

	
</section>

</div>
<!-- footer Jsp -->
<%@ include file="footer.jsp" %>

</body>

</html>