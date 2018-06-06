<%@ page language="java" contentType="text/html; charset=utf-8"

	pageEncoding="utf-8"%>

<%@ page import="java.util.*,java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

</head>

<body>

	<%

		String userName = request.getParameter("userName");

		String password = request.getParameter("password");

		String recoverPassword = request.getParameter("recoverPassword");

		boolean successFlag = true;

		String regex="^([a-zA-Z0-9]+[-|\\.]?)";

		try {

			Scanner sc = new Scanner(new File("userlist.txt"));

			while (sc.hasNextLine()) {

				String line = sc.nextLine();

				String ss[] = line.split("\\s+");

				if (ss[0].equals(userName)) {

					successFlag = false;

					break;

				}

			}

			sc.close();

		} catch (Exception e) {

		}



		if (successFlag) {

			if(userName.matches(regex)){

				try {

					PrintWriter pw = new PrintWriter(

							new FileWriter("userlist.txt", true));

					pw.println(userName+ " " + password + " " + userName);

					pw.close();

					%>

					<script> 

					alert("注册成功，返回登陆界面");

					window.location.href="login.html";

					</script>

					<%

				} catch (Exception e) {

				}

			}

			else{

				%>

					<script> 

						alert("请输入正确的用户名");

						window.location.href="register.html";

					</script>

				<%

			}

		} else {

		%>

			<script> 

				alert("此用户名已经被注册，返回登陆界面");

				window.location.href="login.html";

			</script>

		<%

		}

	%>

</body>

</html>
