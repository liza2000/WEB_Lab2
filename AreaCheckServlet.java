package lab2;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AreaCheckServlet  extends HttpServlet {
int k=0;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                resp.setContentType("text/html");
int k=1;
        String Oy = req.getParameter("y");
        String NumR = req.getParameter("r");
        Data data = new Data();
        data.setOy(Oy.replace(",","."));
        data.setNumR(NumR);
        String[] xKinds = { "x-3", "x-2", "x-1", "x0", "x1", "x2", "x3", "x4", "x5", "x6"};
        for (int i = 0; i < xKinds.length; i++) {
            if(req.getParameter(xKinds[i]) != null) {
            data.putX(req.getParameter(xKinds[i]));
            }
        }

        String ans="<p align=\"right\" ><a href=\"index.jsp\">Вернуться"+this.k+"</a>  <br></p>";
        final ServletContext context = req.getServletContext();
        final HttpSession sssn = req.getSession();
        final List<Map<String, String>> queriesList = data.getSessionQueries(context, sssn);
        Map<String, String> queryMap;

        OutputStream outStream = resp.getOutputStream();
        outStream.flush();
        for(int i = 0; i < data.ox.size(); i++) {
            queryMap = new HashMap<String, String>();
            queryMap.put("X", data.ox.get(i));
            queryMap.put("Y",data.getOy());
            queryMap.put("R", data.getNumR());
            queryMap.put("A", (data.validate(data.ox.get(i))?"Да":"Нет"));
            queriesList.add(queryMap);
        }
        outStream.write(ans.getBytes("UTF-8"));
        for (int i=0;i<data.ox.size();i++)
        outStream.write((data.validate(data.ox.get(i))?"Точка ("+data.ox.get(i)+","+data.getOy()+") входит в область<br>":"Точка ("+data.ox.get(i)+","+data.getOy()+") не входит в область"+" c радиусом "+data.getNumR()+"<br>").getBytes("UTF-8"));
        outStream.write(("<br>"+data.formResultTable(req)).getBytes("UTF-8"));
        outStream.close();
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
/*
                "    <title>response page</title>\n" +
                "    <meta charset=\"utf-8\">\n" +
                "    <style type=\"text/css\">\n" +
                "        body {\n" +
                "            color: #fff;\n" +
                "            font-family: \"Andale Mono\", monospace;\n" +
                "        }\n" +
                "        span {\n" +
                "            font-size: 120%;\n" +
                "        }\n" +
                "        table {\n" +
                "            border-collapse: collapse;\n" +
                "            width: 70%;\n" +
                "            border:  solid black ;\n" +
                "            text-align: center;\n" +
                "            background-color: #4875e7;\n" +
                "            color: black;\n" +
                "        }\n" +
                "        td{\n" +
                "            border: thin solid;\n" +
                "        }\n" +
                "        thead{\n" +
                "            background-color: rgba(38, 81, 150, 0.94);\n" +
                "            padding: 12px ;\n" +
                "            font-family: \"Andale Mono\", monospace;\n" +
                "            color: white;\n" +
                "            border-radius: 30%;\n" +
                "        }\n" +
                "    </style>\n" +
                "\n" +*/