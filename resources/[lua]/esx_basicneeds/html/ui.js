$(document).ready(function () {
  // Other parts of your code...

  // Update the time every minute
  setInterval(() => {
    const d = new Date();
    $("#info").html(
      "ID Unique: " + ($("#info").data("uniqueId") || "Not Set") // + " " +
      // formatWithZero(d.getHours()) + ":" +
      // formatWithZero(d.getMinutes()) + " "
    );
  }, 1 * 1000); // Intervals of 60 seconds (1 minute)

  function formatWithZero(n) {
    return n < 10 ? "0" + n : n;
  }

  // Listen for NUI messages to update the unique ID
  window.addEventListener("message", function (event) {
    const data = event.data;

    if (data.type === "updateUniqueID") {
      // Store the unique ID in data attribute
      $("#info").data("uniqueId", data.uniqueID);
    }
  });
});
