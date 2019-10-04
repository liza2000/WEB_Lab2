package lab2;

import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class
ControllerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

             String Oy = request.getParameter("y");
             String NumR = request.getParameter("r");
             boolean xOk=false;
             boolean isInt=false;
             Pattern pattern=Pattern.compile("^-?[0-2]([.,]\\d+)?$");

        String[] xKinds = { "x-3", "x-2", "x-1", "x0", "x1", "x2", "x3", "x4", "x5","x6"};
        for (int i = 0; i < xKinds.length; i++)
            if (request.getParameter(xKinds[i]) != null&&((request.getParameter(xKinds[i]).equals(i-3+""))||(xKinds[i].equals("x6")&&!NumR.equals("no"))))
              xOk=true;
          request.setAttribute("xOk", new Boolean(xOk));
          if (request.getParameter("x6")!=null)  isInt=true;
        request.setAttribute("isInt", new Boolean(isInt));

                if ((xOk&&
                    Oy!=null
                    &&pattern.matcher(Oy).matches()
                    &&NumR!=null
                    &&(NumR.equals("1")||NumR.equals("1.5")||NumR.equals("2")||NumR.equals("2.5")||NumR.equals("3")))||(isInt&&NumR!=null&&(NumR.equals("1")||NumR.equals("1.5")||NumR.equals("2")||NumR.equals("2.5"))))
                request.getRequestDispatcher("/WEB-INF/areaCheck").forward(request,response);
               else
                    request.getRequestDispatcher("/WEB-INF/oops.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}  