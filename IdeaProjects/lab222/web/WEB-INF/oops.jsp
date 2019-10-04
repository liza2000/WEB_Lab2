<%@ page import="java.util.regex.Pattern" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page pageEncoding="utf-8"%>

<html>
<head>
    <title>response page</title>
    <meta charset="utf-8">
    <style type="text/css">
    </style>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
</head>
<body>
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
        <%
     boolean xOk=(Boolean) request.getAttribute("xOk");
     boolean isInt=(Boolean) request.getAttribute("isInt");
    String Oy=request.getParameter("y");
    String NumR=request.getParameter("r");

    out.flush();
    if (!isInt){
    if (!xOk) out.print("<span id=\"messageX\">Координата X не выбрана!</span><br>"); else out.print("<span id=\"messageX\"></span><br>");
    if (Oy==null||Oy.equals(""))
        out.print("<span id=\"messageY\">Координата Y не определена</span><br>"); else
            if (!Pattern.compile("^-?[0-2]([.,]\\d+)?$").matcher(Oy).matches())
                 if (!Pattern.compile("^-?[0-9]([.,]\\d+)?$").matcher(Oy).matches())
                 out.print("<span id=\"messageY\">Координата Y не должна содержать буквы и иные символы,\n" +
                    "   кроме цифр, \nдробных разделителей и знака минус в начале</span><br>"); else
                 out.print("<span id=\"messageY\">Координата Y не входит в диапазон</span><br>");
                    else out.print("<span id=\"messageY\"></span><br>");
    if (NumR==null||(!NumR.equals("1")&&!NumR.equals("1.5")&&!NumR.equals("2")&&!NumR.equals("2.5")&&!NumR.equals("3")))

        out.print(" <span id=\"messageR\">Радиус не определен или определен неверно</span><br>"); else
            out.print(" <span id=\"messageR\"></span><br>");
    } else out.print(" <span id=\"messageX\"></span><br>" +
     "<span id=\"messageY\"></span><br>" +
      "<span id=\"messageR\">Радиус не определен или определен неверно</span><br>");
        out.print(
"    <br><br>\n" +
"\n" +
"    <button name=\"Отправить\" type=\"submit\" align=\"center\" >\n" +
"        Отправить\n" +
"    </button>\n" +
"</form>");
out.print("</body>\n" +
"<script>\n" +
"\n" +
"    $('#form').submit(function() {\n" +
"        if(isOk()){\n" +
"            $.get(\n" +
"                \"controller\",\n" +
"                $(\"#form\").serialize(),\n" +
"                function (msg) {\n" +
"                    drawPointByForm();\n" +
"                    $(\"#form_and_answer\").html(msg);\n" +
"\n" +
"                }\n" +
"\n" +
"            )}\n" +
"\n" +
"    });\n" +
"    function drawPointByForm() {\n" +
"        var y_in=document.getElementById('y').value;\n" +
"        var  r_sel=document.getElementById('r').value;\n" +
"        paint_context.beginPath();\n" +
"        paint_context.fillStyle='#821c76';\n" +
"        var x_cb;\n" +
"        for(var k=-3;k<6;k++){\n" +
"            x_cb=document.getElementById('x'+k);\n" +
"            if (x_cb.checked) {paint_context.moveTo(x_cb.value*100/r_sel+Cx,y_in*-100/r_sel+Cy);\n" +
"                paint_context.arc(x_cb.value*100/r_sel+Cx,y_in*-100/r_sel+Cy,2,0,2*Math.PI);\n" +
"            }\n" +
"        }\n" +
"        paint_context.closePath();\n" +
"        paint_context.fill();\n" +
"    }\n" +
"\n" +
"\n" +
"    function isOk() {\n" +
"        $(\"#messageY\").text(\"\");\n" +
"        $(\"#messageX\").text(\"\");\n" +
"        $(\"#messageR\").text(\"\");\n" +
"        if (!/^-?[0-2]([.,]\\d+)?$/\n" +
"            .test(document.forms['form'].elements['y'].value) || !isSthChecked() || document.getElementById(\"r\").value === \"no\") {\n" +
"            if (document.getElementById(\"y\").value==='')  $(\"#messageY\").text(\"Координата Y не введена\\n\");\n" +
"            else\n" +
"            if (!/^-?[0-9]\\d*([.,]\\d+)?$/.test(document.forms['form'].elements['y'].value))\n" +
"                $(\"#messageY\").text(\"Координата Y не должна содержать\\n буквы и иные символы,\" +\n" +
"                    \" кроме цифр, \\nдробных разделителей и знака минус в начале\\n\");\n" +
"            else $(\"#messageY\").text(\"Координата Y должна входить в пределы (-3;3)\\n\");\n" +
"            if (!isSthChecked())\n" +
"                $(\"#messageX\").text('Координата Х не выбрана\\n');\n" +
"            if (document.getElementById(\"r\").value === \"no\")\n" +
"                $(\"#messageR\").text($(\"#message\").text() + 'Радиус не определен\\n');\n" +
"            return false;\n" +
"        }\n" +
"        document.getElementById(\"y\").value=document.getElementById(\"y\").value.replace(\",\",\".\");\n" +
"        return true;\n" +
"\n" +
"    }"+
"    function isSthChecked() {\n" +
"        for(var i=-3; i<=5; i++)\n" +
"            if (document.getElementById(\"x\" + i).checked) return true;\n" +
"\n" +
"        return false\n" +
"\n" +
"\n" +
"    }\n" +
"\n" +
"\n" +
"</script>\n" +
"\n" +
"</html>\n");
out.close();
%>

