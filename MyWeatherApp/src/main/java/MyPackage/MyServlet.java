package MyPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.TimeZone;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class MyServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public MyServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// API SetUp
		String apiKey = "9804ce8213ee8a934cca9415507910bc";
		// Get the city from the form input
        String city = request.getParameter("city"); 

        // Create the URL for the OpenWeatherMap API request
        String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey;
        
        try {
        //API Integeration
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        
        // Reading the data from Network
        InputStream inputStream = connection.getInputStream();
        InputStreamReader reader = new InputStreamReader(inputStream);
        
        //Want to store in string
        StringBuilder responseContent = new StringBuilder();   // because String in immutable
        
        // Input from Reader
        Scanner scanner = new Scanner(reader);
        
	        while(scanner.hasNext())
	        {
	        	responseContent.append(scanner.nextLine());
	        }
	        scanner.close();
	        
	        // TypeCasting = Passing the data into JSON
	        Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(responseContent.toString(), JsonObject.class);
            
            //Date & Time
            long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;
            String date = new Date(dateTimestamp).toString();
            
            // Feels_like
            double FeelstemperatureKelvin = jsonObject.getAsJsonObject("main").get("feels_like").getAsDouble();
            int FeelstemperatureCelsius = (int) (FeelstemperatureKelvin - 273.15);
            
            // Humidity
            int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
            
            // Max_temp
            double MaxtemperatureKelvin = jsonObject.getAsJsonObject("main").get("temp_max").getAsDouble();
            int MaxtemperatureCelsius = (int) (MaxtemperatureKelvin - 273.15);
            
            // Min_temp
            double MintemperatureKelvin = jsonObject.getAsJsonObject("main").get("temp_min").getAsDouble();
            int MintemperatureCelsius = (int) (MintemperatureKelvin - 273.15);
            
            // Sunrice
//	        long sunriseUnixTimestamp = jsonObject.getAsJsonObject("main").get("sunrise").getAsLong();;
//	        long javaTimestamp = sunriseUnixTimestamp * 1000L;
//	        Date date1 = new Date(javaTimestamp);  
//	        String sunrise = new SimpleDateFormat("hh:mm").format(date);
	            

            // Sunset
            
            //pressure
            long pressure = jsonObject.getAsJsonObject("main").get("pressure").getAsLong();
            
            
            //Temp
            double temperatureKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
            int temperatureCelsius = (int) (temperatureKelvin - 273.15);
           
            //Wind_degrees
            int winddeg= jsonObject.getAsJsonObject("wind").get("deg").getAsInt();
            
            
            //Wind Speed
            double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
            
            //Weather Condition
            String weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
            
            // Set the data as request attributes (for sending to the jsp page)
            request.setAttribute("date", date);
            request.setAttribute("city", city);
            request.setAttribute("pressure", pressure);
            request.setAttribute("temp", temperatureCelsius);
            request.setAttribute("weatherCondition", weatherCondition);
            request.setAttribute("feelslike", FeelstemperatureCelsius);
            request.setAttribute("humidity", humidity);
            request.setAttribute("maxtemp", MaxtemperatureCelsius);
            request.setAttribute("mintemp", MintemperatureCelsius);
            request.setAttribute("windSpeed", windSpeed);
            request.setAttribute("winddeg", winddeg);
            request.setAttribute("weatherData", responseContent.toString());
           
            
            connection.disconnect();
        
        }
        catch (IOException e) {
        	e.printStackTrace();
		}
        
        // Forward the request to the weather.jsp page for rendering
        request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

}
