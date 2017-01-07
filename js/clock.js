$(document).ready(function () {

    function displayTime() {

        //Creates the moment instance to UTC time
        var time = moment.utc();

        time = moment.tz("America/Caracas");


        //Displays a formatted version of time inside the clock division
        document.getElementById('clock').innerHTML = time.format("h:mm:ss A") + "<br/><small style='font-size:15px'>" + time.format("ddd, DD MMMM YYYY")+"</small>";
    }



    // Runs the displayTime function the first time
    displayTime();

    // Runs the displayTime function every second.
    setInterval(displayTime, 500);
});
