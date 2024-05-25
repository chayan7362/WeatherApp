<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WeatherApp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="images/cloudy.png">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
  
    <a class="navbar-brand" href="#">WeatherApp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.html">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="blog.html">Blog</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="guide.html">Guide</a>
        </li>
      </ul>
      <form class="d-flex" role="search" action="MyServlet" method="post">
        <input class="form-control me-2" type="search" placeholder="Weather in your city" id="city" aria-label="Search" name="city"></input>
        <button class="btn btn-outline-primary" type="submit" id="submit">Search</button>
      </form>
    </div>
  </div>
</nav>


<div class="container">
	<h1 class="my-4 text-center">Weather for <span id="cityName">${city}</span></h1>
<main>
    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-primary">
          <div class="card-header py-3 text-bg-primary border-primary">
            <h4 class="my-0 fw-normal">Temperature Info</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">${temp}<small class="text-body-secondary fw-light"> <span>&#8451;</span></small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Temperature is <span id="">${temp}</span><span>&#8451;</span></li>
              <li>Min Temperature is <span id="">${mintemp}</span><span>&#8451;</span></li>
              <li>Max Temperature is <span id="">${maxtemp}</span><span>&#8451;</span></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-primary">
          <div class="card-header py-3 text-bg-primary border-primary">
            <h4 class="my-0 fw-normal">Humidity Info</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title"><span id="">${humidity}</span><small class="text-body-secondary fw-light"> %</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Wind Degree is <span id="">${winddeg}</span></li>
              <li>Feels Like <span id="">${feelslike}</span><span>&#8451;</span></li>
              <li>Humidity is <span id="">${humidity}</span> %</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-primary">
          <div class="card-header py-3 text-bg-primary border-primary">
            <h4 class="my-0 fw-normal">Wind Info</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title"><span id="">${windSpeed}</span><small class="text-body-secondary fw-light"> Km/h</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Wind Speed is <span id="">${windSpeed}</span> Km/h</li>
              <li>Pressure is <span id="">${pressure}</span> mb</li>
              <li>Date & Time is <span id="">${date}</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <!-- <h2 class="display-6 text-center mb-4">Weather of other Common places</h2>

    <div class="table-responsive">
      <table class="table text-center">
        <thead>
          <tr>
            <th style="width: 34%;"></th>
            <th style="width: 22%;">Feels_like</th>
            <th style="width: 22%;">Humidity</th>
            <th style="width: 22%;">Max_temp</th>
            <th style="width: 22%;">Min_temp</th>
            <th style="width: 22%;">Sunrise</th>
            <th style="width: 22%;">Sunset</th>
            <th style="width: 22%;">Temp</th>
            <th style="width: 22%;">Wind_degrees</th>
            <th style="width: 22%;">Wind_speed</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" class="text-start">Kolkata</th>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            
          </tr>
          <tr>
            <th scope="row" class="text-start">Delhi</th>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
          </tr>
        
          <tr>
            <th scope="row" class="text-start">Bengalore</th>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Mumbai</th>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Chennai</th>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
          </tr>
          
        </tbody>
      </table>
    </div> -->
  </main>
</div>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707z"/>
</svg></a>
    </p>
    <sup><p class="mb-1">© 2024 WeatherApp, Inc. "WeatherApp" created and registered trademarks of WeatherApp, Inc. All Rights Reserved.</p></sup>
    <p class="mb-0">New to WeatherApp? <a href="">Visit the Users Guide</a> or read our <a href="blog.html">Blog</a>.</p>
  </div>
</footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>