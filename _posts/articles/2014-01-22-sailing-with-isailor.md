---
categories: articles
layout: post
comments: true
title: Sailing with iSailor
date: "2014-01-20"
description: null
author: xslim
tags: 
  - sailing
  - iSailor
  - apps
  - mobile
image_thumb: /images/isailor/isailor.jpg
image_feature: /images/isailor/isailor_feature.jpg
location: "52.9784158294106, 5.0262451171875 : 8"
published: true
---

As much as I appreciate traditional navigation practices, I like testing modern technologies and being mobile. That is why I prefer using digital charts, atlases and almanacs during my sailing trips and their planning stages. In this short post I will walk through how I use particular apps to plan my route and safely navigate.

* TOC
{:toc}

## Let's go sailing

I will describe an actual passage I recently made on the *Wadden* and *North Sea* in the Netherlands during November 2013. The passage began Friday night from port *Enkhuizen* and continued to *Kornwerderzand* lock; down to *Harlingen*; through the narrow channels in *Wadden Sea* around *Vlieland* and *Texel* island; to *Den Helder*, where we stopped for few hours during the storm; and back to *Enkhuizen* via the *Den Oever* lock. . It was a non-stop, 165-mile passage that took 2 days and included 27 night hours.

![](/images/isailor/isailor_p1.jpg)

## Planning the passage

### Charts
As I mentioned before, I prefer using digital charts. I tried different chart providers and found the Transas iSailor vector charts to be the most reliable and easy-to-use. The app [iSailor](https://itunes.apple.com/us/app/transas-isailor-marine-navigation/id398456162?mt=8) ([isailor.us](http://www.isailor.us)) is free, the charts are affordable and I only need to buy one set to navigate. When purchasing new ones, I have the ability to see what is included in detail by selecting a chart and toggling between the `Coastal` , `Approach` and `Harbor` views.

The first step for my sailing trip was to determine the sailing region and buy the needed folios:

![chart_store](/images/isailor/isailor_chart_store.png)

If you already own them, check if there are any updates available before planning a new passage

![chart_load](/images/isailor/isailor_chart_load.png)

### Route creation

The iSailor has an comprehensive manual on how to use the app and create routes, so I will just highlight a few points on how I do it:

![](/images/isailor/isailor_route.png)

1. Create a new route and give it an appropriate title
2. Create major waypoints
3. Zoom in, go along a route and determine turn points 

Add waypoint in between two major points & Drag the newly created where needed:

![](/images/isailor/isailor_route_add_middle_wp.png "Add waypoint in between two major points")
![](/images/isailor/isailor_route_move_middle_wp.png "Drag the newly created where needed")

And don't forget to note the info about the turning waypoints. Try to plan for day and night passage.
As example, double tap on the `Safe water buoy` to review its information and note the light characteristics: 

![](/images/isailor/isailor_buoy_sw_details.png)

Periodically check the ETA (Estimated Time of Arrival) and route distance in the route information otherwise, you might end up planning a passage that is not possible to do in your timeframe:

![](/images/isailor/isailor_route_eta.png)

A short tip on how to alter the average speed of the route - go to second waypoint, change the speed of the leg and click `Apply to all legs`.

### Collect information
You can’t fully rely on electronics, where a dead battery in your iPhone can cause problems if you don’t have a paper back-up of your passage plan. So printed information about the waypoints is a must on your passage. One can use a Google Spreadsheet to collect this information and then print it out so anyone on the watch or helming can understand what to do. It contains a waypoint list and recommended track as below:

![](/images/isailor/isailor_table.png)
 
So the information I'm looking for about the turn point is:

- What we will see there
- Type of object or buoy
- It's light characteristics
- Bearings to the object
- Possible lead line

Some of information can be obtained by tapping on the chart or objects:

Chart info & Recommended track:

![](/images/isailor/isailor_chart_info.png "Chart info:")
![](/images/isailor/isailor_recommended_track.png "Recommended track")

#### Post processing
I'm quite interested to look on "Next course" after reaching the waypoint and a distance between waypoints. Currently, the iSailor does not have ability to show the course between the waypoints; however it has a powerful ability to export your route in `.gpx` or `.kml` format, which then can be opened in 3-d party apps:

Export & Send to another app:

![](/images/isailor/isailor_route_export.png "Export")
![](/images/isailor/isailor_route_export_open_in.png "Send to another app")

I created a small app, *Waypoint*, to suit my needs. Opening the `.gpx` in it will clearly show the needed for me information:

![](/images/isailor/isailor_waypoints.png)

I hope the iSailor will implement showing this information in their app in near feature :)

### Have a Plan B
![](/images/isailor/isailor_route_plan_b.png)

No matter what you plan, have a *Plan B*. And *Plan C* - if needed. It's like planning ports of refugee. For the discussed passage, once we set off, the crew decided that *Plan B* was more practical and interesting passage to make. As there was a fully prepared passage plan for it, we could easily switch. 

### Tide and streams
The next big thing to think about - is tides and streams. Check if you have any *tidal gates* in your plan, as like passing under the bridge or over a drying area, they could impact the timing of a passage. The *tidal gate* in discussed passage was to cross the *Wadden Sea* on High Water and to sail from *Texel* island to *Den Helder* with a current. 

There are few digital sources where one can get tidal information, like web-sites or numerous apps. Some are free, some are cheap and some are quite expensive. For Netherlands there is a website [getij.nl](http://live.getij.nl), or an app [Marine TidesPlanner](https://itunes.apple.com/us/app/marine-tides-planner/id317900837?mt=8) that I use.

![](/images/isailor/isailor_tides.png)

But after stepping aboard, you should always check the calculations with official Almanac.

*Marine TidesPlanner* can also be used to check the streams:

![](/images/isailor/isailor_streams.png)

But I prefer looking on stream atlas (if you can find a scanned one for your region):

![](/images/isailor/isailor_stream_atlas.png)

### Weather
Last, but not least, is to know the weather and plan accordingly. Several sources of weather information are available,  one that I use is [Windfinder](http://windfinder.com). Windfinder app is also available for a mobile user as a [Free](https://itunes.apple.com/us/app/windfinder/id336829635?mt=8) or [Pro](https://itunes.apple.com/us/app/windfinder-pro/id336901296?mt=8) version.

For planning the non-stop passage, I prefer looking on *Superforecast* view (in a *Pro* version), which shows weather per hour, including night hours. In addition, I look on the *wind maps* and [GRIB](http://en.wikipedia.org/wiki/GRIB)s.

Weather:

![](/images/isailor/isailor_weather.png "Weather")

Wind map:

![](/images/isailor/isailor_weather_wind.png "Wind map")


## Pilotage
![](/images/isailor/isailor_p3.jpg)

So you made a plan, gathered a crew, set sails and... you can do the pilotage *old-way* by taking bearings to objects and running into the cabin to check the map, or the *modern-way* by checking your position and bearings using iSailor app. (If you do the latter, I still encourage you to maintain the log and plot the relevant position on a paper chart).

A pilotage is another big reason I choose iSailor as my main navigation software. I really like the *Night mode* it provides along with navigating to a waypoint ability: 

![](/images/isailor/isailor_pilotage_to_wp.png)

One can permanently mount iPhone or iPad to the console and enjoy the "always visible" navigation and even record a track. But I prefer keeping the iPhone in my pocket and take it once in a while to check the position or look what's that green buoy I see in a distance. And check the light characteristics if they match the one I see:

![](/images/isailor/isailor_pilotage_bearing.png)
![](/images/isailor/isailor_buoy_g_details.png)

Furthermore, I can create a new routes on the fly to check different options where to better navigate or what channel to take.

## Things to improve
![](/images/isailor/isailor_p2.jpg)

There are some things I would like to see improved in the app, and other features I would suggest to be added:

- Importing `.gpx` via AirShare
- Night mode in chart object details
- Undo, For example when accidentally moved a WP
- Augmented view
- Tides and currents
- Map compass variation
- Weather data and GRIB
- Objects along the route
- Instruments via NMEA

That's all the story for now.  Have a happy sailing with iSailor :)

## Usefull Links

### Websites
- [iSailor](http://www.isailor.us)
- [getij.nl](http://live.getij.nl)
- [Windfinder](http://windfinder.com)
- [Google Spreadsheet](https://docs.google.com/spreadsheet/)

### Apps
- [iSailor](https://itunes.apple.com/us/app/transas-isailor-marine-navigation/id398456162?mt=8)
- [Marine TidesPlanner](https://itunes.apple.com/us/app/marine-tides-planner/id317900837?mt=8)
- [Windfinder Free](https://itunes.apple.com/us/app/windfinder/id336829635?mt=8)
- [Windfinder Pro](https://itunes.apple.com/us/app/windfinder-pro/id336901296?mt=8)

### Places
- [Netherlands](http://en.wikipedia.org/wiki/Netherlands)
- [North Sea](http://en.wikipedia.org/wiki/North_Sea)
- [Wadden Sea](http://en.wikipedia.org/wiki/Wadden_Sea)
- [Enkhuizen](http://en.wikipedia.org/wiki/Enkhuizen)
- [Kornwerderzand](http://en.wikipedia.org/wiki/Kornwerderzand)
- [Harlingen](http://en.wikipedia.org/wiki/Harlingen,_Friesland)
- [Vlieland island](http://en.wikipedia.org/wiki/Vlieland)
- [Texel island](http://en.wikipedia.org/wiki/Texel)
- [Den Helder](http://en.wikipedia.org/wiki/Den_Helder)
- [Den Oever](http://en.wikipedia.org/wiki/Den_Oever)

### Wikipedia articles
- [GRIB](http://en.wikipedia.org/wiki/GRIB)
