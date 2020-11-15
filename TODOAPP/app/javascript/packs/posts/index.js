'use strict';

{

  let date = document.getElementById('day');
  let time = document.getElementById('time');

  function getDay() {
     let now = new Date();
     let year = now.getFullYear();
     let month = (now.getMonth()+1).toString().padStart(2, '0');
     let day = now.getDate().toString().padStart(2, '0');
     date.textContent  = `${year}.${month}.${day}`;
     setTimeout(()=>{
       getDay();
     },1000)
  }
  function getTime() {
    let now = new Date();
    let hour = now.getHours().toString().padStart(2, '0');
    let min = now.getMinutes().toString().padStart(2, '0');
    time.textContent = `${hour}:${min}`;
    setTimeout(()=>{
      getTime();
    },1000)
  }

  getTime();
  getDay();

}
