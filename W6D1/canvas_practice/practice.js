document.addEventListener("DOMContentLoaded", function(){

  var canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(42, 56, 14)';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 250, 0, 2*Math.PI);
  ctx.strokeStyle = 'yellow';
  ctx.linewidth = 3;
  ctx.stroke();

  ctx.fillStyle = "gray";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(50, 200);
  ctx.lineTo(450, 200);
  ctx.arc(450, 200, 30, 0, Math.PI);
  ctx.arc(390, 200, 30, 0, Math.PI);
  ctx.arc(330, 200, 30, 0, Math.PI);
  ctx.arc(270, 200, 30, 0, Math.PI);
  ctx.arc(210, 200, 30, 0, Math.PI);
  ctx.arc(150, 200, 30, 0, Math.PI);
  ctx.arc(90, 200, 30, 0, Math.PI);
  ctx.arc(30, 200, 30, 0, Math.PI);
  ctx.strokeStyle = 'cyan';
  ctx.stroke();

  ctx.beginPath();
  ctx.arc(250, 400, 80, 0, 2*Math.PI);
  ctx.strokeStyle = 'red';
  ctx.stroke();
  
});
