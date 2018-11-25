<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

    <title>Owners | Home</title>

    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/style.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="static/js/html5shiv.min.js"></script>
    <script src="static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="/" class="navbar-brand">Main page</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="new-owner">New Owner</a></li>
                <li><a href="all-owners">All Owners</a></li>
            </ul>
        </div>
    </div>
</div>

<c:choose>
    <c:when test="${mode == 'MODE_HOME'}">
        <div class="container" id="homeDiv">
            <div class="jumbotron text-center">
                <h1>Welcome to Mateusz Chodyna app</h1>
            </div>
        </div>
    </c:when>
    <c:when test="${mode == 'MODE_OWNERS'}">
        <div class="container text-center" id="tasksDiv">
            <h3>Owners</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Surname</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="owner" items="${owners}">
                        <tr>
                            <td>${owner.id}</td>
                            <td>${owner.name}</td>
                            <td>${owner.surname}</td>
                            <td>${owner.gender}</td>
                            <td>${owner.age}</td>
                            <td><a href="update-owner?id=${owner.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                            <td><a href="delete-owner?id=${owner.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>
    <c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
        <div class="container text-center">
            <h3>Owners</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="save-owner">
                <input type="hidden" name="id" value="${owner.id}"/>
                <div class="form-group">
                    <label class="control-label col-md-3">Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="name" value="${owner.name}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Surname</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="surname" value="${owner.surname}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Gender</label>
                    <div class="col-md-7">
                        <input type="radio" class="col-sm-1" name="gender" value="M"/>
                        <div class="col-sm-1">Male</div>
                        <input type="radio" class="col-sm-1" name="finished" value="F" checked/>
                        <div class="col-sm-1">Female</div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Age</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="age" value="${owner.age}"/>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Save"/>
                </div>
            </form>
        </div>
    </c:when>
</c:choose>

<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</body>
</html>