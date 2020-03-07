# Aero-Design-1

The purpose of this project was to design a mission to  fly  a  tank  filled  with liquid nitrogen (LN2) on the Aft-Bulkhead Carrier (ABC) of a Centaur upperstage. This  tank  would  then  be  sent through a  series of maneuvers to induce liquid slosh in the tank and record the results in order to send the data back to Earth. The final design was modeled in SolidWorks and rendered below.

![Final Assembly Design](https://user-images.githubusercontent.com/61441385/76151401-d55edb80-6082-11ea-90cf-20c40e53c64f.PNG)


Several forms of insulation were utilized. The entirety of payload would be covered by BA 500BC beta cloth (space blanket). The LN2 tank is then completely surrounded by an aluminum extrusion, with space between the aluminum and the tank to create a vacuum that shields the tank from convective heat transfer. The bottom face of the LN2 tank will also be covered with 2 inches of Spray-On Foam Insulation (SOFI), since the vacuum jacket will not cover the bottom face. Below the SOFI is a cyrocooler which removes heat from the LN2 and will only be used on the ground, as there is not enough power on board to run the cryocooler after launch begins.

Thermal analysis was conducted to ensure that insulation of the LN2 tank was sufficient enough to sustain the LN2 at cryogenic temperatures throughout the duration of the mission. The payload was treated as a composite radial system with gaps in between the beta cloth and vacuum jacket, as well as between the vacuum jacket and the tank. A model of the system is show below. The necessary assumptions made were one-dimensional heat transfer and steady state. 

![Thermal System](https://user-images.githubusercontent.com/61441385/76151318-c0357d00-6081-11ea-8fad-504fd47435d7.PNG)

The thermal analysis was split into three parts of the mission: on the ground, during launch, and in space. The worst case scenario on the ground would be waiting three days. The LN2 would also have to survive the extreme conditions of launch, which would last 15 minutes. Once in space, it was determined to take 11.11 hours to gather all slosh data and transmit it back to Earth, thus completing the mission. 

The MATLAB scripts above were written by using fundamental convective and radiative heat transfer equations, with all thermal properties of the materials used being found from sources online. Initial temperatures were found by averaging the temperature at the launch site, the temperature of the nozzle of the rocket during launch gathered from the Atlas V user's guide, and the average temperature on the surface of beta cloth while in space, calculated by analyzing the orbit of the spacecraft in STK. The MATLAB scripts calculate the heat transfer rates as well as how long the LN2 will last before boiling off. Below are the slides that contain the results of this analysis, which were presented at our groups Critical Design Review.

![Steady State](https://user-images.githubusercontent.com/61441385/76151825-1eb12a00-6087-11ea-8677-86fdc0d4308f.PNG)

![Steady State during launch](https://user-images.githubusercontent.com/61441385/76151836-27a1fb80-6087-11ea-9e32-f65d602c1472.PNG)

![Steady State in Space](https://user-images.githubusercontent.com/61441385/76151849-41dbd980-6087-11ea-91ba-64bc7c0833e1.PNG)
