import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")
require("flatpickr/dist/themes/dark.css");


document.addEventListener("turbolinks:load", function() {
  flatpickr("[data-behavior='flatpickr']", {
    enableTime: true,
    dateFormat: "d-m-Y H:i"
  });
})

window.render_calendar = function(events) {
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, timeGridPlugin, listPlugin ],
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'listYear,dayGridMonth,listWeek,listDay'
    },
    views: {
      listYear: {
        type: 'listYear',
        buttonText: 'Year'
      },
      listWeek: {
        type: 'listWeek',
        buttonText: 'Week'
      },
      listDay: {
        type: 'listDay',
        buttonText: 'Day'
      }
    },
    events: events
  });

  calendar.setOption('locale', 'en');
  calendar.render();
}