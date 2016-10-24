# Weather to Water

Weather to Water is a Ruby web application written in Sinatra that allows users 
to log and receive reminders for when they should water their gardens based on 
local weather data predictions, courtesy of data from Wunderground's API. In order
to use this feature, you will need an [API key from Wunderground.] 
(https://www.wunderground.com/weather/api/)

The user may input the types of plants that they plan on maintaining, based on the
average amount of water that the plants require during a regular growing season. 
Users may create categories of plants so that they may receive reminders only for 
the neccessary types of plants to water on any given day (as to avoid over or underwatering).
The models in the application calculate the extent to which the user my prolong 
their  time between waterings, as to optimize the amount of time spent in the garden.

To use this application, fork and clone the repository, then run bundle to update the gem
dependencies. Then, start your postgres database, and start logging your gardening entries!

Contributions are welcome at [https://github.com/eyeyellow/weather_to_water/issues] 
(https://github.com/eyeyellow/weather_to_water/issues) 
