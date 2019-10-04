<%@ page contentType="text/html;charset=UTF-8"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lab 1</title>
    <link rel="stylesheet" type="text/css" >
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    <style type="text/css">

        body {
            background-color: #5bc9f3;
            color: white;
            width: 100%;
        }

        div{
            background-color: #5b80e7;
            min-height: 500px;
            top: 150px;
            width: 550px;
            position: absolute;
            border: thick solid #e743ce;
            right: 52%;
            height: auto;

        }
        span {
                    font-size: 120%;
                }
                #table_on {
                    border-collapse: collapse;
                    width: 70%;
                    border:  solid black ;
                    text-align: center;
                    background-color: #4875e7;
                    color: black;
                }
        #table_on >  td{
                    border: thin solid;
                }
        #table_on >  thead{
                    background-color: rgba(38, 81, 150, 0.94);
                    padding: 12px ;
                    font-family: \"Andale Mono\", monospace;
                    color: white;
                    border-radius: 30%;}
        #int{
            left: 52%;

        }
        header
        {   color: #ff92ef;
            background-color: rgba(38, 81, 150, 0.94);
            padding: 12px 0;
            font-family: FreeMo,  monospace;
            height: 10%;
            width: 100%;
        }
        div>header{
            height: 50px;
        }


        h1{
            font-size: 150%;
        }

        button, input[type="text"], select{
            width: 40%;
            border-radius: 5px;

        }
        button{
            width: 50%
        }

        table{
            width: 60%;
        }

        label{
            font-size: 120%;
        }
        iframe{
            display: none;
        }


    </style>

</head>
<body >

<header align="center">
    <h1 >
        Проверка попадания точки в заданную область
    </h1>
    Медведева Елизавета Игоревна  P3200
    <br>Вариант - 200001
</header>
<div   align="center" id="form_and_answer" >
<form id="form"  target="form_and_answer" novalidate>

        <header align="center" >
            <h1 >
                Выберите координаты точки и радиус
            </h1>

        </header>
        <br>
        <label> Координата X
            <br>
            <table>
                <%int i=0; %><%!int i=1;%><%=this.i%>
                <tr>
                    <td align="center"><input type="checkbox" name="x-3" id="x-3" value="-3" >-3</td>
                    <td align="center"><input type="checkbox" name="x0" id="x0" value="0"> 0</td>
                    <td align="center"><input type="checkbox" name="x3" id="x3" value="3"> 3</td>
                </tr>
                 <tr>
                    <td align="center"><input type="checkbox" name="x-2" id="x-2" value="-2">-2</td>
                    <td align="center"><input type="checkbox" name="x1" id="x1" value="1"> 1</td>
                    <td align="center"><input type="checkbox" name="x4" id="x4" value="4"> 4</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" name="x-1" id="x-1" value="-1">-1</td>
                    <td align="center"><input type="checkbox" name="x2" id="x2" value="2"> 2</td>
                    <td align="center"><input type="checkbox" name="x5" id="x5" value="5"> 5</td>
                </tr>
            </table></label>
        <br>
        <label> Координата Y
            <br>
            <input type="text"  id="y"  size="6" name="y" placeholder=" от -3 до 3">
        </label>
        <br><br><br>
        <label> Радиус R
            <br>
            <select name="r"  id="r">
                <option selected value="no"> Не выбрано </option>
                <option  value="1"> 1 </option>
                <option  value="1.5"> 1.5 </option>
                <option  value="2"> 2 </option>
                <option  value="2.5"> 2.5 </option>
                <option  value="3"> 3 </option>

            </select >
        </label><br>
    <span id="messageX"></span><br>
    <span id="messageY"></span><br>
    <span id="messageR"></span><br>

    <br><br>

        <button name="Отправить" type="submit" align="center" >
            Отправить
        </button>
</form>

</div>

<div id="int" align="center" >
    <header align="center">
        <h1 >
            Выберите радиус и точку на графике
        </h1>

    </header>
    <canvas id="paint" ></canvas>
    <label> Радиус R
        <br>
        <select name="r_int"  id="r_int">
            <option selected value="no"> Не выбрано </option>
            <option  value="1"> 1 </option>
            <option  value="1.5"> 1.5 </option>
            <option  value="2"> 2 </option>
            <option  value="2.5"> 2.5 </option>
            <option  value="3"> 3 </option>
        </select >
    </label><br>
    <span id="warning"></span>
</div>
<iframe name="form_and_answer"></iframe>
</body></html>
<script>

    $("#warning").text("");
    {
        var paint_canvas = document.getElementById("paint");
        var paint_context = paint_canvas.getContext("2d");
        paint_canvas.width = 550;
        paint_canvas.height = 350;
        var r = 100;
        var Cx = paint_canvas.width / 2, Cy = paint_canvas.height / 2;
        paint_context.beginPath();
        paint_context.arc(Cx, Cy, r / 2, Math.PI, 3 * Math.PI / 2);
        paint_context.lineTo(Cx, Cy);
        paint_context.moveTo(Cx - r / 2, Cy);
        paint_context.lineTo(Cx, Cy + r / 2);
        paint_context.lineTo(Cx, Cy);
        paint_context.rect(Cx, Cy, r / 2, r);
        paint_context.fillStyle = '#265196';
        paint_context.fill();
        paint_context.closePath();
        //Ox
        paint_context.beginPath();
        paint_context.moveTo(Cx - r - 30, Cy);
        paint_context.lineTo(Cx + r + 30, Cy);
        paint_context.lineTo(Cx + r + 15, Cy + 5);
        paint_context.moveTo(Cx + r + 30, Cy);
        paint_context.lineTo(Cx + r + 15, Cy - 5);
        //Oy
        paint_context.moveTo(Cx, Cy + r + 30);
        paint_context.lineTo(Cx, Cy - r - 30);
        paint_context.lineTo(Cx - 5, Cy - r - 15);
        paint_context.moveTo(Cx, Cy - r - 30);
        paint_context.lineTo(Cx + 5, Cy - r - 15);
        //метки
        paint_context.moveTo(Cx - 3, Cy - r);
        paint_context.lineTo(Cx + 3, Cy - r);
        paint_context.moveTo(Cx + r, Cy - 3);
        paint_context.lineTo(Cx + r, Cy + 3);
        paint_context.moveTo(Cx - 3, Cy + r);
        paint_context.lineTo(Cx + 3, Cy + r);
        paint_context.moveTo(Cx - r, Cy - 3);
        paint_context.lineTo(Cx - r, Cy + 3);
        paint_context.closePath();
        paint_context.stroke();
    }
    //r - параметр содержащий значение второго селектора

    var r_int = document.getElementById("r_int").value;
    document.getElementById("r_int").addEventListener("change",function() {
        r_int=document.getElementById("r_int").value;
        if (r_int!=="no") $("#warning").text("");
        },
        false);
    paint_canvas.addEventListener("click", request, false);
    var x,y;


    function request(e) {
        if (r_int==="no") { $("#warning").text("R не выбран!");
        return;
        }
        getCursorPosition(e);
        paint_context.beginPath();
        if (r_int!=="no")
        paint_context.arc(x,y,1.5,0,2*Math.PI);
        paint_context.fillStyle="red";
        paint_context.closePath();
        x=(x-Cx)*r_int/r;
        y=(y-Cy)*-1*r_int/r;


        $.ajax({
            type:'get',
            url:'controller',
            data:{'x6':x, 'y':y, 'r':r_int},
            response:'text',
            error: function (message) {
                alert("Error: " + message);
            },
            success:function (data) {
                //возвращаемый результат от сервера
                $("#form_and_answer").html(data);
                paint_context.fill();
            }
        });

    }

    $('#form').submit(function() {

            if(isOk())
            {
                $.get(
                "controller",
                $("#form").serialize(),
                function (msg) {
                    drawPointByForm();
                    //alert(document.getElementById("x1").checked()+" "+document.getElementById("y").value+" "+document.getElementById("r").value);
                    $("#form_and_answer").html(msg);
                }
            )}
    });
    function drawPointByForm() {
      var y_in=document.getElementById('y').value;
      var  r_sel=document.getElementById('r').value;
        paint_context.beginPath();
        paint_context.fillStyle='#821c76';
        var x_cb;
        for(var k=-3;k<6;k++){
            x_cb=document.getElementById('x'+k);
            if (x_cb.checked) {paint_context.moveTo(x_cb.value*100/r_sel+Cx,y_in*-100/r_sel+Cy);
            paint_context.arc(x_cb.value*100/r_sel+Cx,y_in*-100/r_sel+Cy,2,0,2*Math.PI);
            }
        }
        paint_context.closePath();
        paint_context.fill();
    }


    function getCursorPosition(e) {
        if (e.pageX != undefined && e.pageY != undefined) {
            x = e.pageX;
            y = e.pageY;
        }
        else {
            x = e.clientX + document.body.scrollLeft +
                document.documentElement.scrollLeft;
            y = e.clientY + document.body.scrollTop +
                document.documentElement.scrollTop;
        }
        x -= document.getElementById("int").offsetLeft+3 ;
        y -= paint_canvas.offsetTop+document.getElementById("int").offsetTop+2 ;
}


    function isOk() {
        $("#messageY").text("");
        $("#messageX").text("");
        $("#messageR").text("");
        if (!/^-?[0-2]([.,]\d+)?$/
            .test(document.forms['form'].elements['y'].value) || !isSthChecked() || document.getElementById("r").value === "no") {
            if (document.getElementById("y").value==='')  $("#messageY").text("Координата Y не введена\n");
            else
            if (!/^-?[0-9]\d*([.,]\d+)?$/.test(document.forms['form'].elements['y'].value))
                $("#messageY").text("Координата Y не должна содержать\n буквы и иные символы," +
                    " кроме цифр, \nдробных разделителей и знака минус в начале\n");
            else $("#messageY").text("Координата Y должна входить в пределы (-3;3)\n");
            if (!isSthChecked())
                $("#messageX").text('Координата Х не выбрана\n');
            if (document.getElementById("r").value === "no")
                $("#messageR").text($("#message").text() + 'Радиус не определен\n');
            return false;0.
        }
        document.getElementById("y").value=document.getElementById("y").value.replace(",",".");
        return true;

    }
    function isSthChecked() {
        for(var i=-3; i<=5; i++)
            if (document.getElementById("x" + i).checked) return true;
            return false
        }


</script>


