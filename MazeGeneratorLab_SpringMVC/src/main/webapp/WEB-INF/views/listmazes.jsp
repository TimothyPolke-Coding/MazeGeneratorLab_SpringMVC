<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Mazes List</title>
		<style><%@include file="/resources/css/listmazes_style.css"%></style>
	</head>
	<body>
		<p><a href="http://localhost:8080/MazeGeneratorLab/">Home</a></p>
		<h1>Mazes List</h1>
		<p><a href="add">Add New Maze</a></p>
		<table width="50%" border="1" cellspacing="1" cellpadding="10">
			<tr>
				<th>ID</th>
				<th>Creation/Edit Date</th>
				<th>Theme ID</th>
				<th>Theme Name</th>
				<th>Size ID</th> 
				<th>Size Name</th>
				<th>Unsolved Image</th>
				<th>Solved Image</th>
				<th>Action</th>				
			</tr>
			<c:forEach var="vmaze" items="${lstmazes}">
				<tr>
					<td>${vmaze.getMazeID()}</td>
					<td>${vmaze.getMazeDate()}</td>
					<td>${vmaze.getTheme().getThemeID()}</td>
					<td>${vmaze.getTheme().getThemeAlias()}</td>
					<td>${vmaze.getSize().getSizeID()}</td>
					<td>${vmaze.getSize().getSizeAlias()}</td>
					<td><img alt="${vmaze.getMazeID()}" src="data:image/jpg;base64,${vmaze.getUnsolvedImage()}" /></td>
					<td><img alt="${vmaze.getMazeID()}" src="data:image/jpg;base64,${vmaze.getSolvedImage()}" /></td>
					<td><a href="edit/${vmaze.getMazeID()}">Edit</a> | <a href="delete/${vmaze.getMazeID()}" onclick="return confirm('Are you Sure you want to delete this record?')">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>